return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(v0, v1)
    assert(type(v0) == "string", "SetGamePrivateServersEnabled: universeId must be a string");
    assert(type(v1) == "boolean", "SetGamePrivateServersEnabled: isFavorited must be a boolean");
    return {
        universeId = v0, 
        privateServersEnabled = v1
    };
end);
