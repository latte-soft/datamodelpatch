return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(v0, v1)
    assert(type(v0) == "string", "SetGameFollow: universeId must be a string");
    assert(type(v1) == "boolean", "SetGameFollow: isFollowed must be a boolean");
    return {
        universeId = v0, 
        isFollowed = v1
    };
end);
