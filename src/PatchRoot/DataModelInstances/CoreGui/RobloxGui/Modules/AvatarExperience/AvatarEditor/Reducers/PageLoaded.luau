return require(game:GetService("CorePackages").Rodux).createReducer(false, {
    [require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarEditor.Actions.SetPageLoaded).name] = function(_, v1)
        return v1.value;
    end
});
