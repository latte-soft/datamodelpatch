local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(game:GetService("CorePackages").Rodux).createReducer(false, {
    [require(l_Modules_0.AvatarExperience.Common.Actions.AddSaveDelay).name] = function(_, _)
        return true;
    end, 
    [require(l_Modules_0.AvatarExperience.Common.Actions.RemoveSaveDelay).name] = function(_, _)
        return false;
    end
});
