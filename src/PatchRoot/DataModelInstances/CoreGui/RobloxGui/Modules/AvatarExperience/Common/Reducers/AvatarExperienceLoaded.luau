return require(game:GetService("CorePackages").Rodux).createReducer(false, {
    [require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Actions.AvatarExperienceLoaded).name] = function(_, _)
        return true;
    end
});
