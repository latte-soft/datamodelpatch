return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(v0)
    assert(type(v0) == "number", "SetCanTurnOnExperienceNotificationsCount: count must be a number");
    return {
        count = v0
    };
end);
