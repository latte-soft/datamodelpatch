local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnMostRecentAssetId);
return function(v4)
    return (v3(v4, v2.AssetTypeIdStrings.Head));
end;
