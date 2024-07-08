local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.mutedError);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v10 = require(l_Modules_0.AvatarExperience.ColorPicker.ColorPickerUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v12 = require(l_Modules_0.AvatarExperience.Flags.ColorPickerSliderIXPTest);
local v13 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.AvatarExperience);
local l_game_EngineFeature_0 = game:GetEngineFeature("ClientAvatarUsesColor3sForBodyParts");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarEditorServiceCreateOutfitSupportsGears);
local v18 = {};
local v19 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v20 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v21 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local v22 = require(l_Modules_0.AvatarExperience.Flags.FFlagColorPickerSliderEpsilon);
v18.isWearingDynamicHeadOutfit = function(v23, v24)
    local v25 = v18.getEquippedAssetIds(v23.assets);
    if v24 then
        for v26, _ in v23.assets, nil, nil do
            if v24[v26] then
                local v28 = next(v24[v26]);
                if next(v23.assets[v26]) then
                    local v29 = false;
                    for _, v31 in v25, nil, nil do
                        if v31 == v28 then
                            v29 = true;
                        end;
                    end;
                    if not v29 then
                        return false;
                    end;
                end;
            else
                return false;
            end;
        end;
        if v23.assets[v8.AssetTypeIdStrings.DynamicHead] then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v18.isWearingOutfitNoState = function(v32, v33, v34, v35, v36, v37)
    local v38 = v18.removeEmoteAnimationAsset(v32.assets);
    if v32.outfitType == v8.OutfitTypes.DynamicHead then
        return v18.isWearingDynamicHeadOutfit(v32, v36);
    else
        local v39 = v18.getEquippedAssetIds(v38);
        local v40 = v18.getEquippedAssetIds(v36);
        if #v39 ~= #v40 then
            return false;
        else
            for _, v42 in v39, nil, nil do
                local v43 = false;
                for _, v45 in v40, nil, nil do
                    if v42 == v45 then
                        v43 = true;
                    end;
                end;
                if not v43 then
                    return false;
                end;
            end;
            if not v18.isPresetOutfit(v32) then
                if not v13.readTestVariable(v12.EnabledForUser) then
                    for v46, v47 in v34, nil, nil do
                        if v32.bodyColors[v46] ~= v47 then
                            return false;
                        end;
                    end;
                else
                    for v48, v49 in v35, nil, nil do
                        if v32.bodyColor3s then
                            if v32.bodyColor3s[v48]:ToHex() ~= v49:ToHex() then
                                return false;
                            end;
                        else
                            return false;
                        end;
                    end;
                end;
            end;
            for v50, v51 in v37, nil, nil do
                if v32.scales[v50] ~= v51 then
                    return false;
                end;
            end;
            if v32.avatarType ~= v33 then
                return false;
            else
                return true;
            end;
        end;
    end;
end;
v18.removeEmoteAnimationAsset = function(v52)
    if v52[v8.AssetTypeIdStrings.EmoteAnimation] then
        return v2.Dictionary.join(v52, {
            [v8.AssetTypeIdStrings.EmoteAnimation] = v2.None
        });
    else
        return v52;
    end;
end;
v18.getEquippedAssetIds = function(v53)
    local v54 = {};
    if v53 then
        for _, v56 in v8.AssetTypeIdStrings, nil, nil do
            local v57 = v53[v56];
            if v57 then
                for v58, _ in v57, nil, nil do
                    table.insert(v54, v58);
                end;
            end;
        end;
        return v54;
    else
        return v54;
    end;
end;
v18.getEquippedAssetIdsForType = function(v60, v61)
    local v62 = {};
    if v60 then
        local v63 = v60[v61];
        if v63 then
            for v64, _ in v63, nil, nil do
                table.insert(v62, v64);
            end;
        end;
        return v62;
    else
        return v62;
    end;
end;
v18.getEquippedAssetIdsForCategory = function(v66, v67)
    local v68 = {};
    if v67.AssetTypeIdStrings then
        for _, v70 in v67.AssetTypeIdStrings, nil, nil do
            for _, v72 in (v18.getEquippedAssetIdsForType(v66, v70)), nil, nil do
                v68[#v68 + 1] = v72;
            end;
        end;
        return v68;
    else
        return v68;
    end;
end;
v18.isAssetEquipped = function(v73, v74, v75)
    if v75 then
        local v76 = v75[v74];
        if v76 ~= nil and next(v76) then
            if v76[v73] then
                return true;
            end;
        else
            return false;
        end;
    end;
    return false;
end;
v18.isWearingOutfit = function(v77, v78)
    return v18.isWearingOutfitNoState(v78, v77.AvatarExperience.AvatarEditor.Character.AvatarType, v77.AvatarExperience.AvatarEditor.Character.BodyColors, v77.AvatarExperience.AvatarEditor.Character.BodyColor3s, v77.AvatarExperience.AvatarEditor.Character.EquippedAssets, v77.AvatarExperience.AvatarEditor.Character.AvatarScales);
end;
v18.isPresetOutfit = function(v79)
    return not v79.isEditable;
end;
v18.isDuplicateOutfitName = function(v80, v81, v82)
    local v83 = string.lower(utf8.nfdnormalize(v82));
    local v84 = v80[v7.EditableCharacterKey] or {};
    for _, v86 in v84, nil, nil do
        local v87 = tostring(v86);
        if v81[v87] and string.lower(utf8.nfdnormalize(v81[v87].name)) == v83 then
            return true;
        end;
    end;
    return false;
end;
local _ = function(v88, v89)
    local v90 = v2.List.toSet(v89);
    return (v2.List.filter(v88, function(v91, _)
        return not v90[v91];
    end));
end;
v18.diffList = function(v94, v95)
    local v96 = v2.List.toSet(v95);
    local v99 = v2.List.filter(v94, function(v97, _)
        return not v96[v97];
    end);
    local v100 = v2.List.toSet(v94);
    return (v2.List.join(v99, (v2.List.filter(v95, function(v101, _)
        return not v100[v101];
    end))));
end;
v18.getEquippedDiffs = function(v103, v104)
    local v105 = {};
    for v106, _ in v104, nil, nil do
        local v108 = v18.getEquippedAssetIdsForType(v104, v106);
        local v109 = v18.getEquippedAssetIdsForType(v103, v106);
        if not next(v109) then
            if next(v108) then
                v105[v106] = v108;
            end;
        else
            local v110 = v18.diffList(v108, v109);
            if next(v110) ~= nil then
                v105[v106] = v110;
            end;
        end;
    end;
    for v111, _ in v103, nil, nil do
        local v113 = v18.getEquippedAssetIdsForType(v103, v111);
        local v114 = v18.getEquippedAssetIdsForType(v104, v111);
        if not next(v114) then
            if next(v113) then
                v105[v111] = v113;
            end;
        else
            local v115 = v18.diffList(v113, v114);
            if next(v115) ~= nil then
                v105[v111] = v115;
            end;
        end;
    end;
    return v105;
end;
v18.hasWrapLayer = function(v116)
    if v116 then
        return v116:FindFirstChildWhichIsA("WrapLayer", true) ~= nil;
    else
        return false;
    end;
end;
v18.hasLayeredAssetsEquipped = l_memoize_0(function(v117)
    if v117 then
        for _, v119 in v117, nil, nil do
            for _, v121 in v119, nil, nil do
                if v121.isLayered then
                    return true;
                end;
            end;
        end;
        return false;
    else
        return false;
    end;
end);
v18.setHumanoidDescriptionColorsFromBodyColors = function(v122, v123)
    if v123 then
        for v124, v125 in v123, nil, nil do
            v122[v8.HumanoidDescriptionBodyColorIdToName[v124]] = BrickColor.new(v125).Color;
        end;
    end;
end;
v18.setHumanoidDescriptionColorsFromBodyColor3s = function(v126, v127)
    if v127 then
        for v128, v129 in v127, nil, nil do
            v126[v8.BodyPartForSkinColoringIdToHumanoidDescription[v128]] = v129;
        end;
    end;
end;
v18.setHumanoidDescriptionColorsFromCharacter = function(v130, v131)
    if not v13.readTestVariable(v12.EnabledForUser) then
        v18.setHumanoidDescriptionColorsFromBodyColors(v130, v131.AvatarEditor.Character.BodyColors);
        return ;
    else
        v18.setHumanoidDescriptionColorsFromBodyColor3s(v130, v131.AvatarEditor.Character.BodyColor3s);
        return ;
    end;
end;
v18.getGearAssetIdFromState = function(v132)
    if v17() then
        local l_EquippedAssets_0 = v132.AvatarEditor.Character.EquippedAssets;
        if l_EquippedAssets_0 == nil then
            return 0;
        else
            local _, v135 = next((v18.getEquippedAssetIdsForType(l_EquippedAssets_0, v8.AssetTypeIdStrings.Gear)));
            if not v135 then
                return 0;
            else
                return (tonumber(v135));
            end;
        end;
    else
        return 0;
    end;
end;
v18.getHumanoidDescriptionFromState = function(v136)
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    local l_EquippedAssets_1 = v136.AvatarEditor.Character.EquippedAssets;
    local l_AvatarScales_0 = v136.AvatarEditor.Character.AvatarScales;
    if l_EquippedAssets_1 then
        local v140 = {};
        for v141, v142 in l_EquippedAssets_1, nil, nil do
            local v143 = {};
            local v144 = v8.AssetTypeIdToAccessoryTypeEnum[v141];
            for v145, v146 in v142, nil, nil do
                if not v144 then
                    table.insert(v143, v145);
                else
                    table.insert(v140, v9.createHumanoidDescriptionAccessoryInfo(v141, v145, v146));
                end;
            end;
            if v144 == nil and #v143 > 0 then
                local v147 = v8.AssetTypeIdStringToHumanoidDescriptionProp[v141];
                local v148 = table.concat(v143, ",");
                if not v147 then
                    if v141 ~= v8.AssetTypeIdStrings.Gear then
                        v5(string.format("assetTypeId: %s not recognized as member of humanoidDescription", (tostring(v141))));
                    end;
                else
                    l_HumanoidDescription_0[v147] = v148;
                end;
            end;
        end;
        l_HumanoidDescription_0:SetAccessories(v140, true);
    end;
    if l_AvatarScales_0 then
        for v149, v150 in l_AvatarScales_0, nil, nil do
            l_HumanoidDescription_0[v8.HumanoidDescriptionScaleToName[v149]] = v150;
        end;
    end;
    v18.setHumanoidDescriptionColorsFromCharacter(l_HumanoidDescription_0, v136);
    local v151 = {};
    local v152 = {};
    for _, v154 in v136.AvatarEditor.EquippedEmotes.slotInfo, nil, nil do
        v151[tostring(v154.assetId)] = {
            (tonumber(v154.assetId))
        };
        table.insert(v152, {
            Slot = v154.position, 
            Name = tostring(v154.assetId)
        });
    end;
    l_HumanoidDescription_0:SetEmotes(v151);
    l_HumanoidDescription_0:SetEquippedEmotes(v152);
    if not (not v13.readTestVariable(v12.EnabledForUser) or l_game_EngineFeature_0) then
        if not v21() then
            l_HumanoidDescription_0 = l_AvatarEditorService_0:ConformToAvatarRules(l_HumanoidDescription_0);
        else
            local l_status_0, l_result_0 = pcall(function()
                return l_AvatarEditorService_0:ConformToAvatarRules(l_HumanoidDescription_0);
            end);
            if not l_status_0 then
                v19(v20.Counter.AvatarEditorServiceErrors.ConformToAvatarRules);
                error(l_result_0);
            else
                l_HumanoidDescription_0 = l_result_0;
            end;
        end;
    end;
    return l_HumanoidDescription_0;
end;
v18.shouldNotifyAssetTypes = function(v157, v158)
    for _, v160 in v157, nil, nil do
        if v158[v160] == true then
            return true;
        end;
    end;
    return false;
end;
v18.doAESCallAndAwaitResult = function(v161, v162, v163, ...)
    local v164 = v162(v161, ...);
    while not v164 do
        v163:Wait();
        v164 = v162(v161, ...);
    end;
    return v163:Wait();
end;
v18.getColor3AtValueInRange = l_memoize_0(function(v165, v166)
    if not v22 then
        if not (v166 >= 0) or v166 > 1 then
            v5(string.format("getColor3AtValueInRange: value %s should be between 0 and 1 inclusive", (tostring(v166))));
            v166 = math.clamp(v166, 0, 1);
        end;
    else
        local v167, v168 = v10.clampBetween0And1(v166);
        if v168 then
            v5(string.format("getColor3AtValueInRange: value %s should be between 0 and 1 inclusive", (tostring(v166))));
        end;
        v166 = v167;
    end;
    if v166 == 0 then
        return v165[1];
    elseif v166 == 1 then
        return v165[#v165];
    else
        local v169 = v166 * (#v165 - 1);
        local v170 = math.floor(v169 + 1);
        return v165[v170]:Lerp(v165[v170 + 1], (v169 + 1) - v170);
    end;
end);
local function v180(v171, v172, v173)
    local v174 = Vector3.new(v171.R, v171.G, v171.B);
    local v175 = Vector3.new(v172.R, v172.G, v172.B);
    local v176 = Vector3.new(v173.R, v173.G, v173.B);
    local v177 = v175 - v174;
    local v178 = v176 - v174;
    if v178:Dot(v177) <= 0 then
        return v178.Magnitude, 0;
    else
        local v179 = v176 - v175;
        if v179:Dot(v177) >= 0 then
            return v179.Magnitude, 1;
        else
            return v177:Cross(v178).Magnitude / v178.Magnitude, v177.Unit:Dot(v178) / v177.Magnitude;
        end;
    end;
end;
local function v188(v181, v182)
    local v183 = 10;
    local v184 = 0;
    for v185 = 1, #v181 - 1 do
        local v186, v187 = v180(v181[v185], v181[v185 + 1], v182);
        if v186 < v183 then
            v183 = v186;
            v184 = ((v185 - 1) + v187) / (#v181 - 1);
        end;
    end;
    return v183, v184;
end;
v18.findRangeAndSliderValueForColor3 = function(v189, v190)
    local v191 = 10;
    local v192 = 0;
    local v193 = nil;
    for _, v195 in v190, nil, nil do
        local v196, v197 = v188(v195.range, v189);
        if v196 < v191 then
            v191 = v196;
            v192 = v197;
            v193 = v195.rangeId;
        end;
    end;
    return v193, v192;
end;
v18.getRangeStructForRangeId = l_memoize_0(function(v198, v199)
    for _, v201 in v199, nil, nil do
        if v201.rangeId == v198 then
            return v201;
        end;
    end;
    return nil;
end);
v18.getColor3AtValueForRangeId = l_memoize_0(function(v202, v203, v204)
    if not v22 then
        if not (v203 >= 0) or v203 > 1 then
            v5(string.format("getColor3AtValueForRangeId: value %s should be between 0 and 1 inclusive", (tostring(v203))));
            v203 = math.clamp(v203, 0, 1);
        end;
    else
        local v205, v206 = v10.clampBetween0And1(v203);
        if v206 then
            v5(string.format("getColor3AtValueInRange: value %s should be between 0 and 1 inclusive", (tostring(v203))));
        end;
        v203 = v205;
    end;
    local v207 = v18.getRangeStructForRangeId(v202, v204);
    if not v207 then
        return nil;
    else
        return v18.getColor3AtValueInRange(v207.range, v203);
    end;
end);
v18.getInfoForRangeIdAndBodyPartIndex = function(v208, v209, v210)
    v3.isNotNil(v208, "rangeId");
    v3.assert(v209 >= 1, "selectedBodyPartIndex too low");
    v3.assert(v209 <= #v7.BodyPartButtonData, "selectedBodyPartIndex too high");
    if not (v210 ~= nil) or v210[v208] == nil then
        return nil;
    else
        local v211 = v210[v208];
        local l_bodyPartForSkinColoringIds_0 = v7.BodyPartButtonData[v209].bodyPartForSkinColoringIds;
        local v213 = nil;
        for _, v215 in l_bodyPartForSkinColoringIds_0, nil, nil do
            if v211[v215] then
                if v213 == nil then
                    v213 = v211[v215];
                elseif v213.color3 ~= v211[v215].color3 then
                    return nil;
                end;
            end;
        end;
        return v213;
    end;
end;
v18.getColor3ForRangeIdAndBodyPartIndex = l_memoize_0(function(v216, v217, v218, v219)
    v3.isNotNil(v219, "defaultBodyColorRanges");
    local v220 = v18.getInfoForRangeIdAndBodyPartIndex(v216, v217, v218);
    if not v220 then
        return v18.getColor3AtValueForRangeId(v216, 0.5, v219);
    else
        return v220.color3;
    end;
end);
v18.getSliderValueForRangeIdAndBodyPartIndex = l_memoize_0(function(v221, v222, v223)
    local v224 = v18.getInfoForRangeIdAndBodyPartIndex(v221, v222, v223);
    if not v224 then
        return 0.5;
    else
        return v224.sliderValue;
    end;
end);
v18.getBodyColorsSliderFrameHeight = function(v225, v226, v227, v228)
    local v229 = v227 - math.max(v226, v228);
    if v225 < v229 then
        return v229;
    else
        return v225;
    end;
end;
v18.getSearchUuidAndAssetTypes = function(v230, v231)
    local _ = nil;
    local _ = nil;
    if not v230.SubButtons then
        return v230.SearchUuid, v230.AssetTypeIdStrings;
    else
        local v234 = v230.SubButtons[v231 or 1];
        return v234.SearchUuid, v234.AssetTypeIdStrings;
    end;
end;
v18.selectAssetTypeKey = function(v235)
    local l_category_0 = v235.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v235.AvatarExperience.AvatarEditor.Categories.subcategory;
    local l_subButton_0 = v235.AvatarExperience.AvatarEditor.Categories.subButton;
    local v239 = v9.getAvatarEditorCategoryInfo(l_category_0, l_subcategory_0);
    local v240, _ = v18.getSearchUuidAndAssetTypes(v239, l_subButton_0);
    return v240 or v239.Name;
end;
v18.getColor3SharedByBodyParts = l_memoize_0(function(v242, v243)
    local v244 = nil;
    for _, v246 in v242, nil, nil do
        local v247 = v243[v246];
        if v244 == nil then
            v244 = v247;
        elseif v247 and v244:ToHex() ~= v247:ToHex() then
            return nil;
        end;
    end;
    return v244;
end);
v18.getRangeIdSharedByBodyParts = l_memoize_0(function(v248, v249)
    local v250 = nil;
    for _, v252 in v248, nil, nil do
        local v253 = v249[v252];
        if v250 == nil then
            v250 = v253;
        elseif v250 ~= v253 then
            return nil;
        end;
    end;
    return v250;
end);
v18.ExponentialRepeat = function(v254, v255, v256)
    v256 = v256 or 6;
    local v257 = 1;
    while true do
        if not (v257 <= v256) or not v254() then
            return ;
        elseif not v255() then
            task.wait(v257 ^ 2);
            v257 = v257 + 1;
        else
            return ;
        end;
    end;
end;
return v18;
