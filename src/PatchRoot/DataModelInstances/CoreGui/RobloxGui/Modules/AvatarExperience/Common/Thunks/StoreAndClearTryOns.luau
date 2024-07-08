local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v2 = require(l_Modules_0.AvatarExperience.Common.Actions.SetLastSavedTriedOnOutfit);
return function()
    return function(v3)
        v3:dispatch(v2(v3:getState().AvatarExperience.AvatarScene.OutfitTryOn));
        v3:dispatch(v1());
    end;
end;
