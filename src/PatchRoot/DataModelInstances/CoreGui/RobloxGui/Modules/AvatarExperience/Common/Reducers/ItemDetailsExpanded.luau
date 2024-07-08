return require(game:GetService("CorePackages").Rodux).createReducer(false, {
    [require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Actions.SetItemDetailsExpanded).name] = function(_, v1)
        return v1.itemDetailsExpanded;
    end
});
