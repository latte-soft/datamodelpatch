local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Rodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(script.Parent.OutfitTryOn);
return v1.createReducer({}, {
    [require(l_Modules_0.AvatarExperience.Common.Actions.SetLastSavedTriedOnOutfit).name] = function(_, v5)
        return v5.savedOutfit;
    end
});
