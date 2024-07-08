return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(v0, v1)
    assert(type(v0) == "string", string.format("SetGameSocialLinks action expects universeId to be a string, was %s", (type(v0))));
    assert(type(v1) == "table", string.format("SetGameSocialLinks action expects socialLinks to be a table, was %s", (type(v1))));
    return {
        universeId = v0, 
        socialLinks = v1
    };
end);
