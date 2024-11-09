local config = {}

function config.get_ltn(name)
    return settings.global["ltn-dispatcher-" .. name].value
end

function config.get_me(name)
    return settings.global["ltn-cleanup-" .. name].value
end

function config.stop_timeout()
    return config.get_ltn("stop-timeout") * 60
end

function config.failed_trains()
    return config.get_me("failed-trains")
end

return config
