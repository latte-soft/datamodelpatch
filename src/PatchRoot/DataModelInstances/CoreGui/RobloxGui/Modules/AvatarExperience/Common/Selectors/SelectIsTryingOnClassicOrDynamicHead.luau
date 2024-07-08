local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v14 = l_memoize_0(function(v6, v7, v8)
    local v9 = false;
    local v10 = false;
    for v11, v12 in v8, nil, nil do
        if v12.itemType == v2.ItemType.Asset and v12.itemSubType == v2.AssetTypeIdStrings.Head then
            v9 = true;
        elseif v12.itemType == v2.ItemType.Bundle then
            if v12.itemSubType == v2.BundleTypeIdStrings.DynamicHead then
                v10 = true;
            elseif v12.itemSubType == v2.BundleTypeIdStrings.BodyParts then
                local v13 = v3.getOutfitInfoFromBundleIdNoState(v3.getBundleInfo(v6, v11), v7);
                if v12.receivedBundleInfo and v13 ~= nil then
                    if not not v13 and v13.containsDynamicHead then
                        v10 = true;
                    else
                        v9 = true;
                    end;
                else
                    return v9, v10, false;
                end;
            end;
        end;
    end;
    return v9, v10, true;
end);
return function(v15)
    return v14(v15.AvatarExperience.Common.BundleInfos, v15.AvatarExperience.AvatarEditor.OutfitInfos, v15.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems);
end;
