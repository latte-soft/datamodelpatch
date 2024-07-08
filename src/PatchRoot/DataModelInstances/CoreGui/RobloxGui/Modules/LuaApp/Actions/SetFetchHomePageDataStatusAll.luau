return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(v0)
    assert(type(v0) == "string", string.format("SetFetchHomePageDataStatusAll action expects status to be an string, was %s", (type(v0))));
    return {
        status = v0
    };
end);
