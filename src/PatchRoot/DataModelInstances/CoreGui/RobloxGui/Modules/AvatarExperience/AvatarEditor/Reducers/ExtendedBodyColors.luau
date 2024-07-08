return (require(game:GetService("CorePackages").Rodux).createReducer({}, {
    [require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarEditor.Actions.SetExtendedBodyColors).name] = function(_, v1)
        return v1.extendedBodyColors;
    end
}));
