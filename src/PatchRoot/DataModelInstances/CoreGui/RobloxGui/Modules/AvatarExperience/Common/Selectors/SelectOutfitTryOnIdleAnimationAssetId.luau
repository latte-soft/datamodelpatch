local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnMostRecentAssetId);
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
return function(v4)
    return v1(v4, v2.AssetTypeIdStrings.IdleAnimation);
end;
