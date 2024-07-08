local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v2 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnMoodAnimationAssetId);
local v3 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectShouldPlayMoodAnimationsEquipped);
return function(v4)
    if not v2(v4) then
        return v3(v4);
    else
        return true;
    end;
end;
