local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.AvatarExperience);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v4 = require(l_Modules_0.AvatarExperience.Common.Models.ItemInfo);
return function(v5, v6, v7)
    local l_Common_0 = v5.Common;
    local l_AvatarEditor_0 = v5.AvatarEditor;
    if v7 == v1.ItemType.Asset then
        if l_Common_0 then
            local v10 = l_Common_0.AssetInfos[v6];
            if v10 then
                return v4.fromAssetInfo(v10);
            end;
        end;
    elseif v7 == v1.ItemType.Bundle then
        if l_Common_0 then
            local v11 = l_Common_0.BundleInfos[v6];
            if v11 then
                return v4.fromBundleInfo(v11);
            end;
        end;
    elseif not (not (v7 == v1.ItemType.Outfit) or not l_AvatarEditor_0) then
        local v12 = l_AvatarEditor_0.OutfitInfos[v6];
        if v12 then
            return v4.fromOutfitInfo(v12);
        end;
    end;
    return nil;
end;
