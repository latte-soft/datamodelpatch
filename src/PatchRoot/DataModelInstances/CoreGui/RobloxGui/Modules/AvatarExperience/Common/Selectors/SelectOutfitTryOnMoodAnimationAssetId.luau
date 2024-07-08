local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnMostRecentAssetId);
return function(v4)
    local _, v6, v7 = v3(v4, v2.AssetTypeIdStrings.DynamicHead);
    local _, _, v10 = v3(v4, v2.AssetTypeIdStrings.Head);
    if v10 and (not v7 or v7 < v10) then
        return nil;
    elseif v6 then
        assert(v6, "tryOnBundleInfo is non-nil. Silence type checker");
        for v11, v12 in v6, nil, nil do
            if v12.assetType == v2.AssetTypeIdStrings.MoodAnimation then
                return v11;
            end;
        end;
        return nil;
    else
        return nil;
    end;
end;
