using System;
using System.Diagnostics.CodeAnalysis;
using System.IO;
using System.Linq;
using System.Text.Json;
using FactorioParanoidal.ModSettingsDat;
using Microsoft.VisualBasic.CompilerServices;
using Nuke.Common;
using Nuke.Common.CI;
using Nuke.Common.Execution;
using Nuke.Common.Git;
using Nuke.Common.IO;
using Nuke.Common.ProjectModel;
using Nuke.Common.Tooling;
using Nuke.Common.Utilities.Collections;
using Serilog;
using static Nuke.Common.EnvironmentInfo;
using static Nuke.Common.IO.FileSystemTasks;
using static Nuke.Common.IO.PathConstruction;

[SuppressMessage("ReSharper", "AllUnderscoreLocalParameterName")]
partial class Build : NukeBuild
{
    /// Support plugins are available for:
    ///   - JetBrains ReSharper        https://nuke.build/resharper
    ///   - JetBrains Rider            https://nuke.build/rider
    ///   - Microsoft VisualStudio     https://nuke.build/visualstudio
    ///   - Microsoft VSCode           https://nuke.build/vscode
    public static int Main() => Execute<Build>(x => x.PrintInfo);

    [GitRepository] GitRepository GitRepo = null!;

    Target PrintInfo => _ => _
        .Executes(() =>
        {
            Log.Information("Root directory: {RootDirectory}", RootDirectory);
            Log.Information("Branch: {BranchName}", GitRepo.Branch);
            Log.Information("Commit: {CommitHash}", GitRepo.Commit);
        });

    Target ConvertModSettingsToJson => _ => _
        .Executes(async () =>
        {
            var modSettingsDatPath = RootDirectory / "mods" / "mod-settings.dat";
            var modSettingsJsonPath = RootDirectory / "mods" / "mod-settings.json";
            if (!File.Exists(modSettingsDatPath))
            {
                throw new FileNotFoundException("File mods/mod-settings.json not found. Ensure that this file exists");
            }

            Log.Information("Starting reading {Path}", modSettingsDatPath);
            await using var datFileStream = File.OpenRead(modSettingsDatPath);
            var modSettings = ModSettingsConverter.Deserialize(datFileStream);
            Log.Information("{Path} successfully parsed", modSettingsDatPath);

            Log.Information("Opening {Path} file to write JSON", modSettingsJsonPath);
            await using var jsonFileStream = File.Open(modSettingsJsonPath, FileMode.Create, FileAccess.Write);
            await JsonSerializer.SerializeAsync(jsonFileStream, modSettings, SerializerOptions);
            Log.Information("{Path} successfully written", modSettingsJsonPath);
        });
    
    Target ConvertModSettingsFromJson => _ => _
        .Executes(async () =>
        {
            var modSettingsDatPath = RootDirectory / "mods" / "mod-settings.dat";
            var modSettingsJsonPath = RootDirectory / "mods" / "mod-settings.json";
            if (!File.Exists(modSettingsJsonPath))
            {
                throw new FileNotFoundException("File mods/mod-settings.json not found. Ensure that this file exists");
            }

            Log.Information("Starting reading {Path}", modSettingsJsonPath);
            await using var jsonFileStream = File.OpenRead(modSettingsJsonPath);
            var modSettings = await JsonSerializer.DeserializeAsync<ModSettings>(jsonFileStream, SerializerOptions);
            Log.Information("{Path} successfully parsed", modSettingsJsonPath);

            Log.Information("Opening {Path} file to write JSON", modSettingsDatPath);
            await using var datFileStream = File.Open(modSettingsDatPath, FileMode.Create, FileAccess.Write);
            ModSettingsConverter.Serialize(modSettings, datFileStream);
            Log.Information("{Path} successfully written", modSettingsDatPath);
        });
}