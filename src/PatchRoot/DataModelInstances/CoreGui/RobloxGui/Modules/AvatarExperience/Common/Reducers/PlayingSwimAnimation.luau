return require(game:GetService("CorePackages").Rodux).createReducer(false, {
    [require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Actions.PlayingSwimAnimation).name] = function(_, v1)
        return v1.playingSwimAnimation;
    end
});
