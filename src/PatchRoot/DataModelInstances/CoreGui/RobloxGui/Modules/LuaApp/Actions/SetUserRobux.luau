return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(v0, v1)
    assert(type(v0) == "string", "SetUserRobux: universeId must be a string");
    assert(type(v1) == "number", "SetUserRobux: robux must be a number");
    return {
        userId = v0, 
        robux = v1
    };
end);
