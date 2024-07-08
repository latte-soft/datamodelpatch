local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Cryo);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v7 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v8 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v10 = require(l_Modules_0.AvatarExperience.Flags.ColorPickerSliderIXPTest);
local v11 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagFixCharacterManagerValueConversionWarning);
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagUnequipAccessoriesBeforeLookTryOn);
local v14 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarWidgetTryOn);
local v15 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixOrderFieldUnlayeredItems);
local v16 = {};
local function _(v17, v18)
    return v11.createAssetIdToOrderMapping(v17.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList)[v18], v17.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList[v18];
end;
local function v33(v20, v21, v22, v23, v24)
    local l_itemSubType_0 = v21.itemSubType;
    if v22 and l_itemSubType_0 ~= v5.AssetTypeIdStrings.Gear then
        local v26 = v5.AssetTypeIdStringToHumanoidDescriptionProp[l_itemSubType_0];
        if not v5.AssetTypeIdToAccessoryTypeEnum[l_itemSubType_0] then
            if v26 then
                v24[v26] = v22;
            end;
        else
            local v27 = v8.createDefaultHumanoidDescriptionAccessoryInfo(l_itemSubType_0, v22);
            if not (not (v21.order ~= nil) or v15() and not v27.IsLayered) then
                v27.Order = v21.order;
            end;
            local l_OrderedList_0 = v20.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList;
            local l_RemovedList_0 = v20.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
            local v30 = v11.createAssetIdToOrderMapping(l_OrderedList_0)[v22];
            local v31 = l_RemovedList_0[v22];
            local _ = v30;
            if not v31 then
                table.insert(v23, v27);
                return ;
            end;
        end;
    end;
end;
local function v52(v34, v35, v36, v37, v38)
    for v39, v40 in v35.assets, nil, nil do
        local v41 = v5.AssetTypeIdStringToHumanoidDescriptionProp[v39];
        local v42 = v41 and v39 ~= v5.AssetTypeIdStrings.Gear;
        if not v5.AssetTypeIdToAccessoryTypeEnum[v39] then
            if v42 then
                v38[v41] = table.concat(v1.Dictionary.keys(v40), ",");
            end;
        else
            for v43, v44 in v40, nil, nil do
                local v45 = v8.createHumanoidDescriptionAccessoryInfo(v39, v43, v44);
                local l_bundleInfo_0 = v36.bundleInfo;
                if not (not (not (not l_bundleInfo_0 or not l_bundleInfo_0[v43]) and l_bundleInfo_0[v43].order ~= nil) or v15() and not v45.IsLayered) then
                    v45.Order = l_bundleInfo_0[v43].order;
                end;
                local l_OrderedList_1 = v34.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList;
                local l_RemovedList_1 = v34.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
                local v49 = v11.createAssetIdToOrderMapping(l_OrderedList_1)[v43];
                local v50 = l_RemovedList_1[v43];
                local _ = v49;
                if not v50 then
                    table.insert(v37, v45);
                end;
            end;
        end;
    end;
end;
local function v67(v53, v54, v55, v56)
    if v14() then
        assert(v54.bundleInfo, "tryOnBundleItem.bundleInfo is non-nil. Silence type checker.");
        for v57, v58 in v54.bundleInfo, nil, nil do
            local v59 = v5.AssetTypeIdStringToHumanoidDescriptionProp[v58.assetType];
            local v60 = v59 and v58.assetType ~= v5.AssetTypeIdStrings.Gear;
            if not v5.AssetTypeIdToAccessoryTypeEnum[v58.assetType] then
                if v60 then
                    v56[v59] = v57;
                end;
            else
                local v61 = v8.createDefaultHumanoidDescriptionAccessoryInfo(v58.assetType, v57);
                if v58.order ~= nil then
                    v61.Order = v58.order;
                end;
                local l_OrderedList_2 = v53.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList;
                local l_RemovedList_2 = v53.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
                local v64 = v11.createAssetIdToOrderMapping(l_OrderedList_2)[v57];
                local v65 = l_RemovedList_2[v57];
                local _ = v64;
                if not v65 then
                    table.insert(v55, v61);
                end;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function v87(v68, v69, v70, v71)
    local l_AssetInfos_0 = v68.AvatarExperience.Common.AssetInfos;
    local v73 = false;
    if v70.items == nil then
        return ;
    else
        assert(v70.items, "bundleInfo.items is non-nil. Silence type checker.");
        for _, v75 in v70.items, nil, nil do
            local v76 = l_AssetInfos_0[v75.id];
            if not (v76 and v76.assetType) then
                v73 = true;
            end;
        end;
        if not v73 then
            for _, v78 in v70.items, nil, nil do
                local v79 = v8.createDefaultHumanoidDescriptionAccessoryInfo(l_AssetInfos_0[v78.id].assetType, v78.id);
                local l_bundleInfo_1 = v69.bundleInfo;
                if not (not (not (not l_bundleInfo_1 or not l_bundleInfo_1[v78.id]) and l_bundleInfo_1[v78.id].order ~= nil) or v15() and not v79.IsLayered) then
                    v79.Order = l_bundleInfo_1[v78.id].order;
                end;
                local l_id_0 = v78.id;
                local l_OrderedList_3 = v68.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList;
                local l_RemovedList_3 = v68.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
                local v84 = v11.createAssetIdToOrderMapping(l_OrderedList_3)[l_id_0];
                local v85 = l_RemovedList_3[l_id_0];
                local _ = v84;
                if not v85 then
                    table.insert(v71, v79);
                end;
            end;
        end;
        return ;
    end;
end;
local function _(v88)
    local v89 = true;
    if v88 ~= "" then
        v89 = v88 == 0;
    end;
    return v89;
end;
v16.isDHBundle = function(v91)
    local v92 = false;
    if v91.itemType == v5.ItemType.Bundle then
        v92 = true;
        if v91.itemSubType ~= Enum.BundleType.DynamicHead.Name then
            v92 = v91.itemSubType == v5.BundleTypeIdStrings.DynamicHead;
        end;
    end;
    return v92;
end;
v16.isDHBundleTryOn = function(v93)
    for _, v95 in v93.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, nil, nil do
        if v16.isDHBundle(v95) then
            return true;
        end;
    end;
    return false;
end;
local function v116(v96, v97, v98)
    local l_v97_Accessories_0 = v97:GetAccessories(true);
    local l_v98_Accessories_0 = v98:GetAccessories(true);
    local l_RemovedList_4 = v96.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
    local v102 = {};
    local v103 = {};
    for _, v105 in l_v98_Accessories_0, nil, nil do
        local v106 = v5.AssetTypeToAssetCategory[v5.AccessoryTypeEnumToAssetTypeId[v105.AccessoryType]];
        v102[v105.AccessoryType] = true;
        if v106 then
            v103[v106] = true;
        end;
    end;
    for _, v108 in l_RemovedList_4, nil, nil do
        local v109 = v5.AssetTypeIdToAccessoryTypeEnum[v108];
        local v110 = v5.AssetTypeToAssetCategory[v108];
        v102[v109] = true;
        if v110 then
            v103[v110] = true;
        end;
    end;
    for _, v112 in l_v97_Accessories_0, nil, nil do
        local v113 = v5.AccessoryTypeEnumToAssetTypeId[v112.AccessoryType];
        local v114 = not v102[v112.AccessoryType];
        local v115 = v5.AssetTypeToAssetCategory[v113];
        if v115 then
            v114 = not v103[v115];
        end;
        if not (not v16.isDHBundleTryOn(v96) or not v5.DynamicHeadAssetTypes[v113]) then
            v114 = false;
        end;
        if v114 then
            table.insert(l_v98_Accessories_0, v112);
        end;
    end;
    v97:SetAccessories(l_v98_Accessories_0, true);
end;
local function v121(v117)
    for v118, v119 in v117.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, nil, nil do
        if v119.itemType == v5.ItemType.Bundle and v119.itemSubType == v5.BundleTypeIdStrings.BodyParts then
            local v120 = v8.getOutfitInfoFromBundleId(v117, v118);
            if v120 then
                return v120;
            end;
        end;
    end;
    return nil;
end;
v16.resetHumanoidDescriptionProperties = function(v122)
    for _, v124 in v5.AssetTypeIdStringToHumanoidDescriptionProp, nil, nil do
        local v125 = typeof(v122[v124]);
        if v125 == "string" then
            v122[v124] = "";
        elseif v125 == "number" then
            v122[v124] = 0;
        end;
    end;
end;
v16.updateHumanoidDescriptionUsingOutfitTryOn = function(v126, v127)
    if not v12() then
        for _, v129 in v5.AssetTypeIdStringToHumanoidDescriptionProp, nil, nil do
            v127[v129] = "";
        end;
    else
        v16.resetHumanoidDescriptionProperties(v127);
    end;
    v127:SetAccessories({}, true);
    local l_TryOnItems_0 = v126.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v131 = if not v14() then nil else v126.AvatarExperience.AvatarScene.OutfitTryOn.LookType;
    local v132 = {};
    for _, v134 in (v8.sortOutfitTryOnItemsByRecency(l_TryOnItems_0, false)), nil, nil do
        if v134.selectedInTryOnManager then
            if v134.itemType == v5.ItemType.Asset then
                v33(v126, v134, v134.itemId, v132, v127);
            elseif v134.itemType == v5.ItemType.Bundle then
                local v135 = v8.getBundleInfoFromState(v126, v134.itemId);
                local v136 = v8.getOutfitInfoFromBundleId(v126, v134.itemId);
                if not v136 then
                    if (v14() and v134.bundleInfo ~= nil) and v131 == v5.LookType.Avatar then
                        v67(v126, v134, v132, v127);
                    elseif v135 then
                        v87(v126, v134, v135, v132);
                    end;
                else
                    v52(v126, v136, v134, v132, v127);
                end;
            end;
        end;
    end;
    v127:SetAccessories(v132, true);
end;
v16.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn = function(v137)
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    v16.updateHumanoidDescriptionUsingOutfitTryOn(v137, l_HumanoidDescription_0);
    local v139 = v3.getHumanoidDescriptionFromState(v137.AvatarExperience):Clone();
    if not (not v13() or not v137.AvatarExperience.AvatarScene.OutfitTryOn.LookId) then
        v139:SetAccessories({}, true);
        v139.GraphicTShirt = 0;
        v139.Shirt = 0;
        v139.Pants = 0;
    end;
    for v140, v141 in v5.AssetTypeIdStringToHumanoidDescriptionProp, nil, nil do
        if not v5.AssetTypeIdToAccessoryTypeEnum[v140] then
            local v142 = l_HumanoidDescription_0[v141];
            local v143 = true;
            if v142 ~= "" then
                v143 = v142 == 0;
            end;
            if not v143 then
                v139[v141] = l_HumanoidDescription_0[v141];
            end;
        end;
    end;
    v116(v137, v139, l_HumanoidDescription_0);
    local v144 = v121(v137);
    if v144 then
        for v145, v146 in v144.scales, nil, nil do
            v139[v5.HumanoidDescriptionScaleToName[v145]] = v146;
        end;
        if not v7.readTestVariable(v10.EnabledForUser) then
            v3.setHumanoidDescriptionColorsFromBodyColors(v139, v144.bodyColors);
        else
            v3.setHumanoidDescriptionColorsFromBodyColor3s(v139, v144.bodyColor3s);
            return v139;
        end;
    end;
    return v139;
end;
return v16;
