return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(v0)
    assert(type(v0) == "string", string.format("SetGamesPageDataStatus action expects status to be a string, was %s", (type(v0))));
    return {
        status = v0
    };
end);
