local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(game:GetService("CorePackages").Rodux).createReducer(false, {
    [require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.LockCharacterUpdates).name] = function(_, _)
        return true;
    end, 
    [require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.UnlockCharacterUpdates).name] = function(_, _)
        return false;
    end
});
