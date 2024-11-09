using System;
using System.Formats.Tar;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.NetworkInformation;
using System.Threading;
using System.Threading.Tasks;
using Nuke.Common;
using Nuke.Common.IO;
using Serilog;
using SharpCompress.Compressors.Xz;
using Process = System.Diagnostics.Process;
using ProcessStartInfo = System.Diagnostics.ProcessStartInfo;

public static class FactorioLauncher
{
    public static async Task<AbsolutePath> DownloadFactorioIfRequired(AbsolutePath path, Version factorioVersion,
        string factorioDistribution, string factorioOs)
    {
        var headlessPath = path / factorioVersion.ToString(3);
        if (Directory.Exists(headlessPath))
        {
            Log.Information("Factorio found. Checking vanilla launchability");
            if (await EnsureFactorioServerCanLaunch(headlessPath))
            {
                return headlessPath;
            }

            Log.Information("Vanilla server failed to launch. Deleting");
        }

        if (Directory.Exists(headlessPath))
        {
            Directory.Delete(headlessPath, true);
        }

        headlessPath = await DownloadFactorio(path, factorioVersion, factorioDistribution, factorioOs);

        Log.Information("Checking downloaded factorio launchability");
        if (await EnsureFactorioServerCanLaunch(headlessPath)) return headlessPath;
        headlessPath.DeleteDirectory();
        throw new Exception("Failed to check launchability. See log for details");
    }

    public static async Task<AbsolutePath> DownloadFactorio(AbsolutePath path, Version factorioVersion,
        string factorioDistribution, string factorioOs)
    {
        var factorioVersionString = factorioVersion.ToString(3);
        var downloadPath = path / factorioVersionString;
        downloadPath.CreateOrCleanDirectory();

        var factorioDownloadLink = Utils.GetFactorioDownloadLinkForCurrentOs(factorioVersionString,
            factorioDistribution, factorioOs);
        Log.Information("Downloading and extracting Factorio archive from {Url}", factorioDownloadLink);

        using var responseMessage = await Utils.HttpClient.GetAsync(factorioDownloadLink,
            HttpCompletionOption.ResponseHeadersRead);
        await using var responseStream = await responseMessage.Content.ReadAsStreamAsync();

        await using var xzStream = new XZStream(responseStream);
        await using var reader = new TarReader(xzStream, true);
        while (await reader.GetNextEntryAsync() is { } entry)
        {
            if (entry.EntryType is TarEntryType.GlobalExtendedAttributes or TarEntryType.Directory) continue;
            var filePath = downloadPath / entry.Name.Replace("factorio/", "");
            filePath.CreateDirectoryForFile();
            await entry.ExtractToFileAsync(filePath, true);
        }

        Log.Information("Factorio downloaded");
        return downloadPath;
    }

    public static async Task<bool> EnsureFactorioServerCanLaunch(AbsolutePath factorioServerLocation,
        string? modsPath = null)
    {
        var serverFile = factorioServerLocation / "bin/x64/factorio";
        if (!serverFile.Exists())
            return false;
        
        Assert.True(OperatingSystem.IsLinux(), "Factorio can be started only on linux");
        (factorioServerLocation / "saves").DeleteDirectory();
        (factorioServerLocation / ".lock").DeleteFile();
        
        var port = 34197;
        var arguments = $"--start-server-load-scenario base/freeplay --bind 0.0.0.0:{port}";
        if (modsPath is not null)
        {
            arguments += $" --mod-directory \"{modsPath}\"";
        }

        Log.Information("Starting Factorio server on port {Port}", port);
        var processStartInfo = new ProcessStartInfo
        {
            UseShellExecute = false,
            FileName = serverFile,
            Arguments = arguments,
            RedirectStandardOutput = true,
        };
        Utils.Chmod(serverFile);
        using var process = Process.Start(processStartInfo).NotNull("Process.Start(processStartInfo) != null")!;
        process.BeginOutputReadLine();

        Log.Debug("Redirection Factorio output:");
        process.OutputDataReceived += (_, args) =>
        {
            if (args.Data == null) return;
            Log.Debug("{FactorioLogEntry}", args.Data);
        };


        var cancellationTokenSource = new CancellationTokenSource(TimeSpan.FromMinutes(15));
        try
        {
            var processExitedTask = process.WaitForExitAsync(cancellationTokenSource.Token);
            var portIsBusyTask = CheckUntilPortIsBusy(port, cancellationTokenSource.Token);
            var completedTask = await Task.WhenAny(processExitedTask, portIsBusyTask);
            process.Kill(true);
            if (completedTask == portIsBusyTask)
            {
                Log.Information("Port {Port} acquired by launched Factorio", port);
                return true;
            }
        }
        catch (TaskCanceledException)
        {
            Log.Error("Process hasn't started in 15 minutes. Aborting");
            process.Kill(true);
            return false;
        }

        return false;
    }

    static async Task CheckUntilPortIsBusy(int port, CancellationToken token)
    {
        await Task.Delay(TimeSpan.FromSeconds(5), token);
        var ipGlobalProperties = IPGlobalProperties.GetIPGlobalProperties();
        while (!token.IsCancellationRequested)
        {
            var tcpConnInfoArray = ipGlobalProperties.GetActiveUdpListeners();
            if (tcpConnInfoArray.Any(info => info.Port == port))
            {
                return;
            }

            await Task.Delay(TimeSpan.FromSeconds(5), token);
        }
    }
}