return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(v0, v1)
    assert(type(v0) == "string", "SetGameFavorite: universeId must be a string");
    assert(type(v1) == "boolean", "SetGameFavorite: isFavorited must be a boolean");
    return {
        universeId = v0, 
        isFavorited = v1
    };
end);
