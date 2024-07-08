local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.Logging);
local l_ParticleUtility_0 = require(l_CorePackages_0.Thumbnailing).ParticleUtility;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v9 = require(l_Modules_0.LuaApp.mutedError);
local v10 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.SetCurrentCharacter);
local v12 = require(l_Modules_0.AvatarExperience.Common.Actions.IncrementCharacterVersion);
local v13 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.IncrementCharacterModelVersion);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Actions.IncrementTryOnCharacterModelVersion);
local v16 = require(l_Modules_0.AvatarExperience.Common.Actions.FinishedWaitingOnLCUpdate);
local v17 = require(l_Modules_0.AvatarExperience.Common.Managers.AnimationManager);
local v18 = require(l_Modules_0.AvatarExperience.Common.Managers.ToolManager);
local v19 = require(l_Modules_0.AvatarExperience.Common.Managers.CharacterModelPool);
local v20 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectHasAvatarData);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v22 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v23 = require(l_Modules_0.AvatarExperience.Common.Util.CharacterManagerUtils);
local v24 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v25 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils);
local v26 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v31 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v32 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v33 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local v34 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v35 = require(l_Modules_0.AvatarExperience.Flags.ColorPickerSliderIXPTest);
local v36 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagFixCharacterManagerValueConversionWarning);
local v37 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagUnequipAccessoriesBeforeLookTryOn);
local l_GetFFlagColorPickerSliderOptimization_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagColorPickerSliderOptimization;
local v39 = game:DefineFastFlag("ColorPickerApplyDefaultClothing", false);
local v40 = game:DefineFastFlag("AXColorPickerErrorAnalytics", false);
local v41 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixOrderFieldUnlayeredItems);
local v42 = settings():GetFVariable("LuaAppsDiagLoadTimeAvatarModel") .. "_" .. v24.getDeviceType();
local v43 = {};
v43.__index = v43;
local l_AssetTypeIdStringToHumanoidDescriptionProp_0 = v22.AssetTypeIdStringToHumanoidDescriptionProp;
local l_HumanoidDescriptionScaleToName_0 = v22.HumanoidDescriptionScaleToName;
local l_AssetTypeIdStrings_0 = v22.AssetTypeIdStrings;
local v47 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.loadtime");
local v48 = {
    toastMessage = "Feature.Avatar.Message.FaceNotVisible", 
    isLocalized = false, 
    toastType = v26.InformationMessage
};
local function _(v49, v50)
    return v25.createAssetIdToOrderMapping(v49.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList)[v50], v49.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList[v50];
end;
local function _(v52)
    local v53 = true;
    if v52 ~= "" then
        v53 = v52 == 0;
    end;
    return v53;
end;
local function v60(v55)
    for _, v57 in l_AssetTypeIdStringToHumanoidDescriptionProp_0, nil, nil do
        local v58 = v55[v57];
        local v59 = true;
        if v58 ~= "" then
            v59 = v58 == 0;
        end;
        if not v59 then
            return false;
        end;
    end;
    if #v55:GetAccessories(true) > 0 then
        return false;
    else
        return true;
    end;
end;
v43.new = function(v61, v62, v63, v64, v65, v66)
    local v67 = {};
    setmetatable(v67, v43);
    v67.startAvatarModelLoadTime = tick();
    v67.connections = {};
    v67.store = v61;
    v67.networking = v62;
    v67.analytics = v63;
    if l_GetFFlagColorPickerSliderOptimization_0() then
        v67.bodyColorsChangedEvent = v66;
    end;
    v67.characterModelPool = v19.new(v61, v63, v65);
    v67._currentCharacter = v67.characterModelPool:getCurrentCharacter();
    v67.store:dispatch(v11(v67._currentCharacter));
    v67.store:dispatch(v12());
    v67.characterRoot = Instance.new("Folder");
    v67.characterRoot.Name = "CharacterRoot";
    v67.characterRoot.Parent = game.Workspace;
    v67.needsToEquipBundleTryOn = false;
    v67.initialHumanoidDescriptionApplied = false;
    v67.initialTryOnApplied = false;
    v67.destroyed = false;
    v67.checkBodyColors = true;
    v67.modelInitialized = false;
    v67.firstCallinPPE = true;
    if v37() then
        v67.shouldUnequipAccessoriesBeforeTryOn = false;
    end;
    v67.animationManager = v17.new(v61, v67, v64);
    v67.toolManager = v18.new(v61, v67.animationManager, v67);
    v67.humanoidDescriptionCurrentlyEquipped = Instance.new("HumanoidDescription");
    v67.humanoidDescriptionTryOn = Instance.new("HumanoidDescription");
    v67.lastHumanoidDescriptionApplied = Instance.new("HumanoidDescription");
    if not l_IsVRAppBuild_0() then
        v67:maybeInitializeModel(v67.store:getState());
    end;
    v67.cachedRoduxState = v67.store:getState();
    return v67;
end;
v43.maybeInitializeModel = function(v68, v69)
    if not (v68.modelInitialized or not v20(v69)) then
        v68.modelInitialized = true;
        v68:initializeModel(v69);
    end;
end;
v43.setupAnimations = function(v70, v71, v72)
    v70.characterModelPool:setupAnimations(v71, v72);
end;
v43.initializeModel = function(v73, v74)
    local l_AvatarType_0 = v74.AvatarExperience.AvatarEditor.Character.AvatarType;
    if l_AvatarType_0 == v21.AvatarType.R6 then
        v73:switchAvatarType(l_AvatarType_0);
    end;
    v73._currentCharacter.Parent = v73.characterRoot;
    v73:updateHumanoidDescriptionCurrentlyEquipped(v74);
    v73:applyHumanoidDescription(true);
    v73.toolManager:update(v74);
end;
v43.start = function(v76)
    v76:maybeInitializeModel(v76.store:getState());
    v76._currentCharacter.Parent = v76.characterRoot;
    table.insert(v76.connections, (v76.store.changed:connect(function(v77, v78)
        v76:update(v77, v78);
    end)));
    if l_GetFFlagColorPickerSliderOptimization_0() then
        table.insert(v76.connections, (v76.bodyColorsChangedEvent:Connect(function(v79)
            if v79 then
                local l_bodyPartForSkinColoringIds_0 = v21.BodyPartButtonData[v76.store:getState().AvatarExperience.AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex].bodyPartForSkinColoringIds;
                local v81 = {};
                for _, v83 in l_bodyPartForSkinColoringIds_0, nil, nil do
                    v81[v83] = v79;
                end;
                if not v39 then
                    v27.setHumanoidDescriptionColorsFromBodyColor3s(v76.humanoidDescriptionCurrentlyEquipped, v81);
                    v76.overrideBodyColor3s = v81;
                    v76.characterModelPool:maybeUpdateCharacter(v76.humanoidDescriptionCurrentlyEquipped);
                    return ;
                else
                    local v84 = v76.humanoidDescriptionCurrentlyEquipped:Clone();
                    v27.setHumanoidDescriptionColorsFromBodyColor3s(v84, v81);
                    local v85 = nil;
                    if not v40 or not v33() then
                        v85 = l_AvatarEditorService_0:CheckApplyDefaultClothing(v84);
                    else
                        local l_status_0, l_result_0 = pcall(function()
                            return l_AvatarEditorService_0:CheckApplyDefaultClothing(v84);
                        end);
                        if not l_status_0 then
                            v31(v32.Counter.AvatarEditorServiceErrors.CheckApplyDefaultClothing);
                            error(l_result_0);
                        else
                            v85 = l_result_0;
                        end;
                    end;
                    v76.overrideBodyColor3s = v81;
                    v76.characterModelPool:maybeUpdateCharacter(v85 or v84);
                    return ;
                end;
            else
                v76.overrideBodyColor3s = nil;
                return ;
            end;
        end)));
    end;
    v76.characterModelPool:start();
    v76.animationManager:start();
    v76.toolManager:start();
    v76:updateHumanoidDescriptionCurrentlyEquipped(v76.store:getState());
    v76:applyHumanoidDescription(true);
    v76.toolManager:update(v76.store:getState());
    v76:update(v76.store:getState(), v76.cachedRoduxState);
end;
v43.update = function(v88, v89, v90)
    local v91 = v88:shouldUpdateHumanoidDescriptionCurrentlyEquipped(v89, v90);
    if v91 then
        v88:updateHumanoidDescriptionCurrentlyEquipped(v89);
    end;
    local v92 = v88:shouldUpdateHumanoidDescriptionTryOnOutfit(v89, v90);
    if v92 then
        v23.updateHumanoidDescriptionUsingOutfitTryOn(v89, v88.humanoidDescriptionTryOn);
    end;
    local l_AvatarType_1 = v89.AvatarExperience.AvatarEditor.Character.AvatarType;
    local v94 = l_AvatarType_1 ~= v90.AvatarExperience.AvatarEditor.Character.AvatarType;
    if v94 then
        v88:switchAvatarType(l_AvatarType_1);
    end;
    if v37() then
        v88.shouldUnequipAccessoriesBeforeTryOn = v89.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil;
    end;
    local v95 = v90.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode ~= v89.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode;
    if not (not (v91 or v92) and not v94) then
        v88:applyHumanoidDescription(v91, v92);
    end;
    if not (not ((v95 or v91) or v92) and not v94) then
        v88.toolManager:update(v89);
    end;
end;
v43.updateNoFace = function(v96, v97)
    local l_Head_0 = v96._currentCharacter:FindFirstChild("Head");
    if l_Head_0 then
        local v99 = not l_Head_0:FindFirstChildWhichIsA("Decal");
        local v100 = l_AssetTypeIdStringToHumanoidDescriptionProp_0[l_AssetTypeIdStrings_0.Face];
        local v101 = v97[v100];
        local v102 = v96.lastHumanoidDescriptionApplied[v100];
        if (v99 and v101 ~= v102) and v102 ~= 0 then
            v96.store:dispatch(v13(v5.Dictionary.join(v48)));
        end;
        return ;
    else
        warn("No head was found on the character");
        return ;
    end;
end;
v43.shouldUpdateHumanoidDescriptionCurrentlyEquipped = function(_, v104, v105)
    local l_EquippedAssets_0 = v104.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_EquippedAssets_1 = v105.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_AvatarScales_0 = v104.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local l_AvatarScales_1 = v105.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local l_BodyColors_0 = v104.AvatarExperience.AvatarEditor.Character.BodyColors;
    local l_BodyColors_1 = v105.AvatarExperience.AvatarEditor.Character.BodyColors;
    local v112 = nil;
    local v113 = nil;
    if v34.readTestVariable(v35.EnabledForUser) then
        v112 = v104.AvatarExperience.AvatarEditor.Character.BodyColor3s;
        v113 = v105.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    end;
    return ((l_EquippedAssets_0 ~= l_EquippedAssets_1 or l_AvatarScales_0 ~= l_AvatarScales_1) or l_BodyColors_0 ~= l_BodyColors_1) or v112 ~= v113;
end;
v43.updateHumanoidDescriptionCurrentlyEquipped = function(v114, v115)
    local l_EquippedAssets_2 = v115.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_AvatarScales_2 = v115.AvatarExperience.AvatarEditor.Character.AvatarScales;
    if l_EquippedAssets_2 then
        if not v36() then
            for _, v119 in l_AssetTypeIdStringToHumanoidDescriptionProp_0, nil, nil do
                v114.humanoidDescriptionCurrentlyEquipped[v119] = "";
            end;
        else
            v23.resetHumanoidDescriptionProperties(v114.humanoidDescriptionCurrentlyEquipped);
        end;
        v114.humanoidDescriptionCurrentlyEquipped:SetAccessories({}, true);
        local v120 = {};
        local v121 = false;
        local v122 = false;
        if not l_EquippedAssets_2 or l_EquippedAssets_2[l_AssetTypeIdStrings_0.Head] and not v5.isEmpty(l_EquippedAssets_2[l_AssetTypeIdStrings_0.Head]) then
            if not (not l_EquippedAssets_2 or l_EquippedAssets_2[l_AssetTypeIdStrings_0.DynamicHead] and not v5.isEmpty(l_EquippedAssets_2[l_AssetTypeIdStrings_0.DynamicHead])) then
                v122 = true;
            end;
        else
            v121 = true;
        end;
        for v123, v124 in l_EquippedAssets_2, nil, nil do
            local v125 = l_AssetTypeIdStringToHumanoidDescriptionProp_0[v123];
            if v123 ~= l_AssetTypeIdStrings_0.Gear then
                if not v22.AssetTypeIdToAccessoryTypeEnum[v123] then
                    if not (not v125 or v123 == l_AssetTypeIdStrings_0.Head and v121) and (not (v123 == l_AssetTypeIdStrings_0.DynamicHead) or not v122) then
                        v114.humanoidDescriptionCurrentlyEquipped[v125] = table.concat(v5.Dictionary.keys(v124), ",");
                    end;
                else
                    for v126, v127 in v124, nil, nil do
                        table.insert(v120, v24.createHumanoidDescriptionAccessoryInfo(v123, v126, v127));
                    end;
                end;
            end;
        end;
        v114.humanoidDescriptionCurrentlyEquipped:SetAccessories(v120, true);
        for v128, v129 in l_AvatarScales_2, nil, nil do
            v114.humanoidDescriptionCurrentlyEquipped[l_HumanoidDescriptionScaleToName_0[v128]] = v129;
        end;
        v114.checkBodyColors = true;
        if not l_GetFFlagColorPickerSliderOptimization_0() or not v114.overrideBodyColor3s then
            v27.setHumanoidDescriptionColorsFromCharacter(v114.humanoidDescriptionCurrentlyEquipped, v115.AvatarExperience);
            return ;
        else
            v27.setHumanoidDescriptionColorsFromBodyColor3s(v114.humanoidDescriptionCurrentlyEquipped, v114.overrideBodyColor3s);
            return ;
        end;
    else
        v6.warn("CharacterManager: Equipped assets has not been initialized");
        return ;
    end;
end;
v43.shouldUpdateHumanoidDescriptionTryOnOutfit = function(v130, v131, v132)
    if v130.latestAvatarRoute then
        if not v24.routeIsProfilePictureEditor(v130.latestAvatarRoute) then
            v130.firstCallinPPE = true;
        elseif v130.firstCallinPPE then
            v130.firstCallinPPE = false;
        else
            return false;
        end;
    end;
    local v133 = v131.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems ~= v132.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v134 = v131.AvatarExperience.LayeredClothingSort.CurrentSort ~= v132.AvatarExperience.LayeredClothingSort.CurrentSort;
    if not v130.initialTryOnApplied then
        v133 = true;
        v130.initialTryOnApplied = true;
    end;
    if not v133 and not v134 then
        return false;
    else
        return true;
    end;
end;
v43.updateHumanoidDescriptionTryOnOutfitAsset = function(v135, v136, v137, v138)
    local l_itemSubType_0 = v136.itemSubType;
    if v137 and l_itemSubType_0 ~= l_AssetTypeIdStrings_0.Gear then
        local v140 = l_AssetTypeIdStringToHumanoidDescriptionProp_0[l_itemSubType_0];
        if not v22.AssetTypeIdToAccessoryTypeEnum[l_itemSubType_0] then
            if v140 then
                v135.humanoidDescriptionTryOn[v140] = v137;
            end;
        else
            local v141 = v24.createDefaultHumanoidDescriptionAccessoryInfo(l_itemSubType_0, v137);
            if not (not (v136.order ~= nil) or v41() and not v141.IsLayered) then
                v141.Order = v136.order;
            end;
            local v142 = v135.store:getState();
            local l_OrderedList_0 = v142.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList;
            local l_RemovedList_0 = v142.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
            local v145 = v25.createAssetIdToOrderMapping(l_OrderedList_0)[v137];
            local v146 = l_RemovedList_0[v137];
            local _ = v145;
            if not v146 then
                table.insert(v138, v141);
                return ;
            end;
        end;
    end;
end;
v43.updateHumanoidDescriptionTryOnOutfitBundle = function(v148, v149, v150, v151)
    for v152, v153 in v149.assets, nil, nil do
        local v154 = l_AssetTypeIdStringToHumanoidDescriptionProp_0[v152];
        local v155 = v154 and v152 ~= l_AssetTypeIdStrings_0.Gear;
        if not v22.AssetTypeIdToAccessoryTypeEnum[v152] then
            if v155 then
                v148.humanoidDescriptionTryOn[v154] = table.concat(v5.Dictionary.keys(v153), ",");
            end;
        else
            for v156, v157 in v153, nil, nil do
                local v158 = v24.createHumanoidDescriptionAccessoryInfo(v152, v156, v157);
                local l_bundleInfo_0 = v150.bundleInfo;
                if not (not (not (not l_bundleInfo_0 or not l_bundleInfo_0[v156]) and l_bundleInfo_0[v156].order ~= nil) or v41() and not v158.IsLayered) then
                    v158.Order = l_bundleInfo_0[v156].order;
                end;
                local v160 = v148.store:getState();
                local l_OrderedList_1 = v160.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList;
                local l_RemovedList_1 = v160.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
                local v163 = v25.createAssetIdToOrderMapping(l_OrderedList_1)[v156];
                local v164 = l_RemovedList_1[v156];
                local _ = v163;
                if not v164 then
                    table.insert(v151, v158);
                end;
            end;
        end;
    end;
end;
v43.updateHumanoidDescriptionTryOnOutfitBundleNoUserOutfit = function(_, v167, v168, v169, v170)
    local l_AssetInfos_0 = v167.AvatarExperience.Common.AssetInfos;
    local v172 = false;
    if v169.items == nil then
        return ;
    else
        assert(v169.items, "bundleInfo.items is non-nil. Silence type checker.");
        for _, v174 in v169.items, nil, nil do
            local v175 = l_AssetInfos_0[v174.id];
            if not (v175 and v175.assetType) then
                v172 = true;
            end;
        end;
        if not v172 then
            for _, v177 in v169.items, nil, nil do
                local v178 = v24.createDefaultHumanoidDescriptionAccessoryInfo(l_AssetInfos_0[v177.id].assetType, v177.id);
                local l_bundleInfo_1 = v168.bundleInfo;
                if not (not (not (not l_bundleInfo_1 or not l_bundleInfo_1[v177.id]) and l_bundleInfo_1[v177.id].order ~= nil) or v41() and not v178.IsLayered) then
                    v178.Order = l_bundleInfo_1[v177.id].order;
                end;
                local l_id_0 = v177.id;
                local l_OrderedList_2 = v167.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList;
                local l_RemovedList_2 = v167.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
                local v183 = v25.createAssetIdToOrderMapping(l_OrderedList_2)[l_id_0];
                local v184 = l_RemovedList_2[l_id_0];
                local _ = v183;
                if not v184 then
                    table.insert(v170, v178);
                end;
            end;
        end;
        return ;
    end;
end;
v43.updateHumanoidDescriptionUsingOutfitTryOn = function(v186, v187)
    if not v36() then
        for _, v189 in l_AssetTypeIdStringToHumanoidDescriptionProp_0, nil, nil do
            v186.humanoidDescriptionTryOn[v189] = "";
        end;
    else
        v23.resetHumanoidDescriptionProperties(v186.humanoidDescriptionTryOn);
    end;
    v186.humanoidDescriptionTryOn:SetAccessories({}, true);
    local l_TryOnItems_0 = v187.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v191 = {};
    for _, v193 in (v24.sortOutfitTryOnItemsByRecency(l_TryOnItems_0, false)), nil, nil do
        if v193.selectedInTryOnManager then
            if v193.itemType == v22.ItemType.Asset then
                v186:updateHumanoidDescriptionTryOnOutfitAsset(v193, v193.itemId, v191);
            elseif v193.itemType == v22.ItemType.Bundle then
                local v194 = v24.getBundleInfoFromState(v187, v193.itemId);
                local v195 = v24.getOutfitInfoFromBundleId(v187, v193.itemId);
                if not v195 then
                    if v194 then
                        v186:updateHumanoidDescriptionTryOnOutfitBundleNoUserOutfit(v187, v193, v194, v191);
                    end;
                else
                    v186:updateHumanoidDescriptionTryOnOutfitBundle(v195, v193, v191);
                end;
            end;
        end;
    end;
    v186.humanoidDescriptionTryOn:SetAccessories(v191, true);
end;
v43.isDHBundleTryOn = function(v196)
    return v23.isDHBundleTryOn(v196.store:getState());
end;
v43.setAccessoriesForTryOn = function(v197, v198)
    local l_v198_Accessories_0 = v198:GetAccessories(true);
    local l_Accessories_0 = v197.humanoidDescriptionTryOn:GetAccessories(true);
    local l_RemovedList_3 = v197.store:getState().AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList;
    local v202 = {};
    local v203 = {};
    for _, v205 in l_Accessories_0, nil, nil do
        local v206 = v22.AssetTypeToAssetCategory[v22.AccessoryTypeEnumToAssetTypeId[v205.AccessoryType]];
        v202[v205.AccessoryType] = true;
        if v206 then
            v203[v206] = true;
        end;
    end;
    for _, v208 in l_RemovedList_3, nil, nil do
        local v209 = v22.AssetTypeIdToAccessoryTypeEnum[v208];
        local v210 = v22.AssetTypeToAssetCategory[v208];
        v202[v209] = true;
        if v210 then
            v203[v210] = true;
        end;
    end;
    for _, v212 in l_v198_Accessories_0, nil, nil do
        local v213 = v22.AccessoryTypeEnumToAssetTypeId[v212.AccessoryType];
        local v214 = not v202[v212.AccessoryType];
        local v215 = v22.AssetTypeToAssetCategory[v213];
        if v215 then
            v214 = not v203[v215];
        end;
        if not (not v197:isDHBundleTryOn() or not v22.DynamicHeadAssetTypes[v213]) then
            v214 = false;
        end;
        if v214 then
            table.insert(l_Accessories_0, v212);
        end;
    end;
    v198:SetAccessories(l_Accessories_0, true);
end;
v43.getTryOnsBundleOutfitInfo = function(v216)
    local v217 = v216.store:getState();
    for v218, v219 in v217.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, nil, nil do
        if v219.itemType == v22.ItemType.Bundle and v219.itemSubType == v22.BundleTypeIdStrings.BodyParts then
            local v220 = v24.getOutfitInfoFromBundleId(v217, v218);
            if v220 then
                return v220;
            end;
        end;
    end;
    return nil;
end;
v43.combineOutfitTryOnAndEquippedHumanoidDescriptions = function(v221)
    local v222 = nil;
    local v223 = v221:getTryOnsBundleOutfitInfo();
    v222 = v221.humanoidDescriptionCurrentlyEquipped:Clone();
    if not (not v37() or not v221.shouldUnequipAccessoriesBeforeTryOn) then
        v222:SetAccessories({}, true);
        v222.GraphicTShirt = 0;
        v222.Shirt = 0;
        v222.Pants = 0;
    end;
    for v224, v225 in l_AssetTypeIdStringToHumanoidDescriptionProp_0, nil, nil do
        if not v22.AssetTypeIdToAccessoryTypeEnum[v224] then
            local v226 = v221.humanoidDescriptionTryOn[v225];
            local v227 = true;
            if v226 ~= "" then
                v227 = v226 == 0;
            end;
            if not v227 then
                v222[v225] = v221.humanoidDescriptionTryOn[v225];
            end;
        end;
    end;
    v221:setAccessoriesForTryOn(v222);
    local v228 = nil;
    if not v33() then
        v228 = l_AvatarEditorService_0:CheckApplyDefaultClothing(v222);
    else
        local l_status_1, l_result_1 = pcall(function()
            return l_AvatarEditorService_0:CheckApplyDefaultClothing(v222);
        end);
        if not l_status_1 then
            v31(v32.Counter.AvatarEditorServiceErrors.CheckApplyDefaultClothing);
            error(l_result_1);
        else
            v228 = l_result_1;
        end;
    end;
    v222 = v228 or v222;
    if v223 then
        for v231, v232 in v223.scales, nil, nil do
            v222[l_HumanoidDescriptionScaleToName_0[v231]] = v232;
        end;
        if not v34.readTestVariable(v35.EnabledForUser) then
            v27.setHumanoidDescriptionColorsFromBodyColors(v222, v223.bodyColors);
        else
            v27.setHumanoidDescriptionColorsFromBodyColor3s(v222, v223.bodyColor3s);
        end;
    end;
    return v222;
end;
v43.finishApplyDescription = function(v233, v234, v235, v236, v237)
    if not (not v233.initialHumanoidDescriptionApplied or v236) then
        v233:updateNoFace(v237);
    end;
    if not v233.initialHumanoidDescriptionApplied then
        local v238 = (tick() - v233.startAvatarModelLoadTime) * 1000;
        v47:info("Avatar model load time: {} ms", v238);
        v233.analytics.Diag:reportStats(v42, v238);
    end;
    if v233.characterModelPool:isR15() then
        v233:adjustHeightToStandOnPlatform(v233._currentCharacter);
    end;
    if not v234 then
        if v235 then
            v233.store:dispatch(v15());
        end;
    else
        v233.store:dispatch(v14());
    end;
    v233.initialHumanoidDescriptionApplied = true;
    if v233._currentCharacter then
        local l_BoundingBox_0, v240 = v233._currentCharacter:GetBoundingBox();
        if not (v24.isBoundingBoxVectorSane(v240) and v24.isBoundingBoxCFrameSane(l_BoundingBox_0)) then
            local v241 = v24.calculateNewAssetIdsWithGeometry(v237, v233.lastHumanoidDescriptionApplied);
            if #v241 > 0 then
                v9("(Avatar Experience) bad bounding box on adding assetIds: " .. table.concat(v241, ","));
            end;
        end;
    end;
end;
v43.getCurrentCharacter = function(v242)
    return v242._currentCharacter;
end;
v43.applyHumanoidDescription = function(v243, v244, v245)
    v10.assert(v243.modelInitialized, "applyHumanoidDescription called before initializeModel");
    task.spawn(function()
        if not v243.destroyed and v243._currentCharacter:IsDescendantOf(game) then
            local l_lastHumanoidDescriptionApplied_0 = v243.lastHumanoidDescriptionApplied;
            local v247 = v243:combineOutfitTryOnAndEquippedHumanoidDescriptions();
            v243.checkBodyColors = false;
            local v248 = v245 and v60(v243.humanoidDescriptionTryOn);
            v243.characterModelPool:maybeUpdateCharacter(v247):andThen(function(v249, v250)
                v243.store:dispatch(v12());
                if v249 ~= v243._currentCharacter then
                    v243.toolManager:unequipTool();
                    v243._currentCharacter = v249;
                    v243.store:dispatch(v11(v243._currentCharacter));
                    v243._currentCharacter.Parent = v243.characterRoot;
                    v243.toolManager:checkAndEquipTool();
                end;
                if not (v250 or not v243.store:getState().AvatarExperience.AvatarScene.Character.WaitingOnLayeredClothingUpdates) then
                    v243.store:dispatch(v16());
                end;
                v243.lastHumanoidDescriptionApplied = v247;
                v243:finishApplyDescription(v244, v245, v248, l_lastHumanoidDescriptionApplied_0);
            end);
            return ;
        else
            return ;
        end;
    end);
end;
v43.switchAvatarType = function(v251, v252)
    v251._currentCharacter = v251.characterModelPool:switchAvatarType(v252);
    v251.store:dispatch(v11(v251._currentCharacter));
    v251.store:dispatch(v12());
    v251._currentCharacter.Parent = v251.characterRoot;
    v251.toolManager:notifySwitchedAvatarType();
end;
v43.adjustHeightToStandOnPlatform = function(_, v254)
    local l_HumanoidRootPart_0 = v254.HumanoidRootPart;
    local v256 = l_HumanoidRootPart_0.Size.y * 0.5 + v254.Humanoid.HipHeight;
    local v257, _, v259, v260, v261, v262, v263, v264, v265, v266, v267, v268 = l_HumanoidRootPart_0.CFrame:components();
    l_HumanoidRootPart_0.CFrame = CFrame.new(v257, v256, v259, v260, v261, v262, v263, v264, v265, v266, v267, v268);
end;
v43.stop = function(v269)
    v23.updateHumanoidDescriptionUsingOutfitTryOn(v269.store:getState(), v269.humanoidDescriptionTryOn);
    v269:applyHumanoidDescription(true);
    for _, v271 in v269.connections, nil, nil do
        v271:disconnect();
    end;
    v269.connections = {};
    v269.characterModelPool:stop();
    v269.animationManager:stop();
    v269.toolManager:stop();
    v269.initialTryOnApplied = false;
    v269.cachedRoduxState = v269.store:getState();
end;
v43.onDestroy = function(v272)
    v272.humanoidDescriptionCurrentlyEquipped:Destroy();
    v272.humanoidDescriptionTryOn:Destroy();
    v272.lastHumanoidDescriptionApplied:Destroy();
    v272.characterRoot:Destroy();
    v272.destroyed = true;
    v272.animationManager:onDestroy();
    v272.toolManager:onDestroy();
    v272.characterModelPool:onDestroy();
    v272.store:dispatch(v11(nil));
    v272.store:dispatch(v12());
end;
v43.updateAvatarRoute = function(v273, v274, v275)
    v273.animationManager:updateAvatarRoute(v274, v275);
    v273.toolManager:updateAvatarRoute(v274, v275);
    v273.latestAvatarRoute = v274;
    local v276 = v24.routeIsPPEStaticImagePage(v274);
    local v277 = v24.routeIsPPEStaticImagePage(v275);
    if not v276 or v277 then
        if not (not v277 or v276) then
            v273:stopWatchingCharacter();
            v273:unfreezeParticles();
        end;
        return ;
    else
        v273:freezeParticles();
        v273:watchCharacterToFreezeNewParticles();
        return ;
    end;
end;
v43.watchCharacterToFreezeNewParticles = function(v278)
    local l_CurrentCharacter_0 = v278.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if l_CurrentCharacter_0 then
        v278.freezeParticlesCharacterConnection = l_CurrentCharacter_0.DescendantAdded:Connect(function(v280)
            if v280:IsA("Tool") then
                l_RunService_0.Heartbeat:Wait();
                v278:recursiveFreezeParticles(v280);
                l_ParticleUtility_0.FastForwardParticles(v280);
            end;
        end);
    end;
end;
v43.stopWatchingCharacter = function(v281)
    if v281.freezeParticlesCharacterConnection then
        v281.freezeParticlesCharacterConnection:Disconnect();
        v281.freezeParticlesCharacterConnection = nil;
    end;
end;
v43.instanceIsAParticleEffect = function(_, v283)
    return ((v283:IsA("ParticleEmitter") or v283:IsA("Fire")) or v283:IsA("Smoke")) or v283:IsA("Sparkles");
end;
v43.recursiveFreezeParticles = function(v284, v285)
    if l_ParticleUtility_0.InstanceIsAParticleEffect(v285) then
        v284.frozenParticlesToTimeScale[v285] = v285.TimeScale;
        v285.TimeScale = 0;
    end;
    for _, v287 in (v285:GetChildren()), nil, nil do
        v284:recursiveFreezeParticles(v287);
    end;
end;
v43.freezeParticles = function(v288)
    v288.frozenParticlesToTimeScale = {};
    local l_CurrentCharacter_1 = v288.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if l_CurrentCharacter_1 then
        v288:recursiveFreezeParticles(l_CurrentCharacter_1);
    end;
end;
v43.unfreezeParticles = function(v290)
    if v290.frozenParticlesToTimeScale then
        for v291, v292 in v290.frozenParticlesToTimeScale, nil, nil do
            v291.TimeScale = v292;
        end;
        v290.frozenParticlesToTimeScale = {};
    end;
end;
return v43;
