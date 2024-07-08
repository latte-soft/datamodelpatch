return require(game:GetService("CorePackages").Rodux).createReducer({}, {
    [require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.LayeredClothingSort.Actions.SetLastSavedSort).name] = function(_, v1)
        return v1.savedAccessories;
    end
});
