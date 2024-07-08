return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(v0)
    assert(type(v0) == "table", string.format("AddGames action expects games to be a table, was %s", (type(v0))));
    return {
        games = v0
    };
end);
