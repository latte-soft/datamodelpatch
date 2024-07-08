return require(game:GetService("CorePackages").Rodux).createReducer(nil, {
    [require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Actions.SetCurrentCharacter).name] = function(_, v1)
        return v1.currentCharacter;
    end
});
