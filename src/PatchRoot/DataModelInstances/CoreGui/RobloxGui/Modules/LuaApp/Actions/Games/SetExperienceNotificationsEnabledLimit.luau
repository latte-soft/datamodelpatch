return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(v0)
    assert(type(v0) == "number", "SetCanTurnOnExperienceNotificationsLimit: limit must be a number");
    return {
        limit = v0
    };
end);
