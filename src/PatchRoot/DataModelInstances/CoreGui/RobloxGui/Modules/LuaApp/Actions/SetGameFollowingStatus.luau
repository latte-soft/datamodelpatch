return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(v0, v1, v2)
    assert(type(v0) == "string", "SetGameFollowingStatus: universeId must be a string");
    assert(type(v1) == "boolean", "SetGameFollowingStatus: canFollow must be a boolean");
    assert(type(v2) == "boolean", "SetGameFollowingStatus: isFollowed must be a boolean");
    return {
        universeId = v0, 
        canFollow = v1, 
        isFollowed = v2
    };
end);
