return require(game:GetService("CorePackages").Rodux).createReducer(0, {
    [require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarEditor.Actions.IncrementCharacterModelVersion).name] = function(v0, _)
        return v0 + 1;
    end
});
