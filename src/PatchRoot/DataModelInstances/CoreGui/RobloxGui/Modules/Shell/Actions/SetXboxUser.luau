return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)("SetXboxUser", function(v0)
    v0 = v0 or {};
    return {
        gamertag = v0.gamertag, 
        xuid = v0.xuid
    };
end);
