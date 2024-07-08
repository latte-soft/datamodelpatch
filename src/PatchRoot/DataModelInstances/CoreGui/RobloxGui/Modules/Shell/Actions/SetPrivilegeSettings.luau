return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)("SetPrivilegeSettings", function(v0)
    v0 = v0 or {};
    return {
        Multiplayer = v0.Multiplayer, 
        SharedContent = v0.SharedContent, 
        timestamp = v0.timestamp
    };
end);
