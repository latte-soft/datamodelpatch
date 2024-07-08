return require(game:GetService("CorePackages").Rodux).createReducer(nil, {
    [require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AccessoryAdjustment.Actions.SetSelectedAccessory).name] = function(_, v1)
        return v1.selectedAccessory;
    end
});
