task.spawn(function()
    local hwidtest = gethwid and gethwid() or "couldnt find users hwid"
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local HttpService = game:GetService("HttpService")
    local player = game.Players.LocalPlayer
    local http = (http_request or request or syn.request or fluxus and fluxus.request)
    if http then
        local embed = {
            ["title"] = "Using script",
            ["color"] = 0x1cff14,
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            ["fields"] = {
                {
                    ["name"] = "Player",
                    ["value"] = player.DisplayName .. " (@" .. player.Name .. ")",
                    ["inline"] = false
                },
                {
                    ["name"] = "Injector/Executor",
                    ["value"] = identifyexecutor(),
                    ["inline"] = false
                },
                {
                    ["name"] = "HWID",
                    ["value"] = hwidtest,
                    ["inline"] = false
                },
                {
                    ["name"] = "Teleport to player",
                    ["value"] = 'game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "' .. game.JobId .. '", game:GetService("Players").LocalPlayer)',
                    ["inline"] = false
                },
            }
        }

        local data = {
            ["username"] = "Using script",
            ["avatar"] = "05f9df97ae0ca74f3aadd9094aaabb60",
            ["embeds"] = {embed}
        }

        http({
            Url = "https://discord.com/api/webhooks/1404107454572396724/VfuPM0ZFhiicQxrvxDVhu4pMPExByYsNNrQcxPSsKRepS2lIvLq8l_6T-qQiFUTzltZQ",
            Method = "POST",
            Headers = headers,
            Body = HttpService:JSONEncode(data)
        })
    end
end)
