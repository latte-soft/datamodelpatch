return require(game:GetService("CorePackages").Rodux).createReducer(false, {
    [require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData).name] = function(_, _)
        return true;
    end
});
