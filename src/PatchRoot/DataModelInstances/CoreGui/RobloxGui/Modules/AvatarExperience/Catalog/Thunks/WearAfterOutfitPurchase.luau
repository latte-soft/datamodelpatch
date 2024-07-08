local v0 = require(game:GetService("CorePackages").Cryo);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.EquipOutfit);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v8 = require(l_Modules_0.AvatarExperience.Common.Actions.AddSaveDelay);
local v9 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagUnequipAccessoriesBeforeLookTryOn);
local v10 = {
    v3.AssetTypeIdStrings.Torso, 
    v3.AssetTypeIdStrings.RightArm, 
    v3.AssetTypeIdStrings.LeftArm, 
    v3.AssetTypeIdStrings.LeftLeg, 
    v3.AssetTypeIdStrings.RightLeg
};
local _ = function(v11)
    for _, v13 in v10, nil, nil do
        if not v11[v13] then
            return false;
        end;
    end;
    return true;
end;
return function(v15, v16, v17)
    return function(v18)
        local v19 = v18:getState();
        local l_AssetInfos_0 = v19.AvatarExperience.Common.AssetInfos;
        if v9() then
            local l_EquippedAssets_0 = v19.AvatarExperience.AvatarEditor.Character.EquippedAssets;
            local l_LookId_0 = v19.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
            if not (not l_EquippedAssets_0 or not l_LookId_0) then
                for v23, v24 in l_EquippedAssets_0, nil, nil do
                    local v25 = v3.AssetTypeIdToCategory[v23];
                    if not (v25 ~= v3.AssetCategories.Accessory) or v25 == v3.AssetCategories.Clothing then
                        for v26, _ in v24, nil, nil do
                            v18:dispatch(v5(v23, v26, v16, true));
                        end;
                    end;
                end;
            end;
        end;
        local v28 = {};
        if not (v0.isEmpty(v15) or v19.AvatarExperience.AvatarScene.Character.ShouldDelaySaveManager) then
            v18:dispatch(v8());
        end;
        for _, v30 in v15, nil, nil do
            if not ((not v30.purchased and not v30.owned or v30.assetIsWearable) or not v30.bundleId) then
                local v31 = v2.getOutfitInfoFromBundleId(v19, v30.bundleId);
                if v31 then
                    local l_assets_0 = v31.assets;
                    local v33;
                    for _, v35 in v10, nil, nil do
                        if not l_assets_0[v35] then
                            v33 = false;
                            goto label0 --[[  true, false  ]];
                        end;
                    end;
                    v33 = true;
                    ::label0::;
                    if v33 then
                        v18:dispatch(v4({
                            outfitInfo = v31, 
                            analytics = v17, 
                            navigation = v16, 
                            isSelected = false, 
                            fromOutfitPurchase = true, 
                            tryOnBundleInfo = v30.tryOnBundleInfo, 
                            blockFullReset = true
                        }));
                        v28[v30.bundleId] = true;
                    end;
                end;
            end;
        end;
        for _, v37 in v15, nil, nil do
            local v38 = if not v37.assetIsWearable then v37.bundleId else v37.assetId;
            if not (not v37.purchased and not v37.owned or not v38) then
                if v37.assetType == v3.ItemType.Bundle then
                    if v28[v38] == nil then
                        local v39 = v2.getOutfitInfoFromBundleId(v19, v38);
                        local v40 = v2.getBundleInfoFromState(v19, v38);
                        if not v39 then
                            if v40 then
                                assert(v40, "");
                                for _, v42 in v40.items, nil, nil do
                                    local v43 = l_AssetInfos_0[v42.id];
                                    if not (not v43 or not v43.assetType) then
                                        v18:dispatch(v5(v43.assetType, v42.id, v16, true, (v37.tryOnBundleInfo and v37.tryOnBundleInfo[v42.id]) and v37.tryOnBundleInfo[v42.id].order));
                                    end;
                                end;
                            end;
                        else
                            v18:dispatch(v4({
                                outfitInfo = v39, 
                                analytics = v17, 
                                navigation = v16, 
                                isSelected = false, 
                                fromOutfitPurchase = true, 
                                tryOnBundleInfo = v37.tryOnBundleInfo
                            }));
                        end;
                    end;
                elseif v37.itemSubType and tostring(v37.itemSubType) ~= v3.AssetTypeIdStrings.EmoteAnimation then
                    v18:dispatch(v5(tostring(v37.itemSubType), tostring(v38), v16, true, v37.overrideOrder));
                end;
            end;
        end;
    end;
end;
