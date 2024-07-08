local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Stats_0 = game:GetService("Stats");
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.avatarEditorPropertyChanged);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.equippedEmote);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.selectedBodyColorRangeWithId);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.clickNavigationTab);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.clickSubButton);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.openedEmotesPage);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.clickShopForMore);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.avatarEditorOpenedFromLandingPage);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.catalogToAvatarBackButton);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Analytics.catalogToAvatarButton);
local v15 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v16 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v18 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounter);
local v19 = {};
local function v101(v20)
    local v21 = {};
    local function _(v22, v23, v24, v25, v26, v27)
        v5(v20.EventStream, v22, v26, v23, v24, v25, v27);
    end;
    v21.equipAsset = function(v29, v30, v31, v32, v33, v34)
        local v35 = v16.AssetTypeIdStringToName[v32];
        if v16.AssetTypeIdStrings.EmoteAnimation == v32 then
            v6(v20.EventStream, v33, l_Stats_0:GetBrowserTrackerId(), v29, v31);
        end;
        v5(v20.EventStream, "EquipAsset", v35 or "UnknownAssetTypeId: " .. v32, v29, v30, v31, v34);
        v18(v20, "AXEquipAsset");
    end;
    v21.unequipAsset = function(v36, v37, v38, v39, _, v41)
        v5(v20.EventStream, "UnequipAsset", v16.AssetTypeIdStringToName[v39] or "UnknownAssetTypeId: " .. v39, v36, v37, v38, v41);
        v18(v20, "AXUnequipAsset");
    end;
    v21.clickNavigationTab = function(v42, v43)
        local v44 = v17()[v42];
        if v44 then
            local v45 = v44.Subcategories and v44.Subcategories[v43];
            v8(v20.EventStream, "clickNavigationTab", not not v44 and v44.Name or "", not not v45 and v45.Name or "");
        end;
    end;
    v21.clickSubButton = function(v46, v47, v48)
        local v49 = v17()[v46];
        if v49 then
            local v50 = v49.Subcategories and v49.Subcategories[v47];
            local v51 = nil;
            if not ((not v50 or not v50.SubButtons) or not v50.SubButtons[v48]) then
                v51 = v50.SubButtons[v48];
            end;
            v9(v20.EventStream, "clickSubButton", not not v49 and v49.Name or "", not not v50 and v50.Name or "", not not v51 and v51.Name or "");
        end;
    end;
    v21.setAvatarHeadSize = function(v52, v53, v54)
        v5(v20.EventStream, "SetHeadSize", "HeadSize", v52, v53, v54, nil);
    end;
    v21.setAvatarHeight = function(v55, v56, v57)
        v5(v20.EventStream, "SetHeight", "Height", v55, v56, v57, nil);
    end;
    v21.setAvatarWidth = function(v58, v59, v60)
        v5(v20.EventStream, "SetWidth", "Width", v58, v59, v60, nil);
    end;
    v21.setAvatarBodyType = function(v61, v62, v63)
        v5(v20.EventStream, "SetBodyType", "BodyType", v61, v62, v63, nil);
    end;
    v21.setAvatarProportion = function(v64, v65, v66)
        v5(v20.EventStream, "SetProportion", "Proportion", v64, v65, v66, nil);
    end;
    v21.toggleAvatarType = function(v67, v68, v69)
        v5(v20.EventStream, "SetAvatarType", "AvatarType", v67, v68, v69, nil);
    end;
    v21.setBodyColors = function(v70, v71, v72)
        local v73 = v70[next(v70)] or "empty";
        for _, v75 in v70, nil, nil do
            v73 = v75 == v73 and v73 or "mixed";
        end;
        v5(v20.EventStream, "SetBodyColors", "BodyColors", v73, v71, v72, nil);
    end;
    v21.setBodyColor3s = function(v76, v77, v78)
        local v79 = v76[next(v76)]:ToHex() or "empty";
        for _, v81 in v76, nil, nil do
            v79 = v81:ToHex() == v79 and v79 or "mixed";
        end;
        v5(v20.EventStream, "SetBodyColor3s", "BodyColor3s", v79, v77, v78, nil);
    end;
    v21.selectedBodyColorRangeWithId = function(v82, v83)
        v7(v20.EventStream, v83, l_Stats_0:GetBrowserTrackerId(), v82);
    end;
    v21.clickShopForMore = function(v84, v85)
        local v86 = v17()[v84];
        if v86 then
            local v87 = v86.Subcategories and v86.Subcategories[v85];
            v11(v20.EventStream, "ClickShopForMore", not not v86 and v86.Name or "", not not v87 and v87.Name or "");
        end;
    end;
    v21.openedEmotesPage = function(v88)
        v10(v20.EventStream, v88, (l_Stats_0:GetBrowserTrackerId()));
    end;
    v21.catalogToAvatarBackButton = function()
        v13(v20.EventStream, "ClickCatalogToAvatarBackButton");
    end;
    v21.catalogToAvatarButton = function()
        v14(v20.EventStream, "ClickCatalogToAvatarButton");
    end;
    v21.avatarEditorOpenedFromLandingPage = function()
        v12(v20.EventStream, "AvatarEditorLandingPageButtonClicked");
    end;
    v21.managePageOpened = function()
        v20.EventStream:setRBXEventStream("AEAssetManagement", "managePageOpened", {
            feature = v16.AnalyticsTag
        });
    end;
    v21.viewOutfitDetails = function(v89)
        v3.isType(v89, "string", "AvatarEditorAnalytics.viewOutfitDetails expects outfitId to be a string");
        v20.EventStream:setRBXEventStream("AEAssetManagement", "viewCostumeDetails", {
            feature = v16.AnalyticsTag, 
            costumeId = v89
        });
    end;
    v21.outfitDeleted = function(v90, v91)
        v3.isType(v90, "string", "AvatarEditorAnalytics.outfitDeleted expects outfitId to be a string");
        v3.isType(v91, "boolean", "AvatarEditorAnalytics.outfitDeleted expects isMultiDelete to be a boolean");
        v20.EventStream:setRBXEventStream("AEAssetManagement", "costumeDeleted", {
            feature = v16.AnalyticsTag, 
            costumeId = v90, 
            isMultiDelete = tostring(v91)
        });
    end;
    v21.outfitRenamed = function(v92, v93)
        v3.isType(v92, "string", "AvatarEditorAnalytics.outfitRenamed expects outfitId to be a string");
        v3.isType(v93, "string", "AvatarEditorAnalytics.outfitRenamed expects newOutfitName to be a string");
        v20.EventStream:setRBXEventStream("AEAssetManagement", "costumeRenamed", {
            feature = v16.AnalyticsTag, 
            costumeId = v92, 
            newCostumeName = v93
        });
    end;
    v21.managePageMultiSelectActivated = function()
        v20.EventStream:setRBXEventStream("AEAssetManagement", "managePageMultiSelectActivated", {
            feature = v16.AnalyticsTag
        });
    end;
    v21.outfitCreated = function(v94)
        v3.isTypeOrNil(v94, "string", "AvatarEditorAnalytics.outfitCreated expects outfitName to be a string");
        v20.EventStream:setRBXEventStream("AEAssetManagement", "costumeCreated", {
            feature = v16.AnalyticsTag, 
            costumeName = v94
        });
        v18(v20, "AXCreateCostume");
    end;
    v21.outfitUpdated = function(v95)
        v3.isTypeOrNil(v95, "string", "AvatarEditorAnalytics.outfitUpdated expects outfitId to be a string");
        v20.EventStream:setRBXEventStream("AEAssetManagement", "costumeUpdated", {
            feature = v16.AnalyticsTag, 
            costumeId = v95
        });
    end;
    v21.outfitClicked = function(v96, v97)
        v20.EventStream:setRBXEventStream("clickToWearOutfit", "clickToWearOutfit", {
            feature = v16.AnalyticsTag, 
            userOutfitId = v96, 
            outfitType = v97
        });
    end;
    v21.colorPickerChanged = function(v98, v99, v100)
        v20.EventStream:sendEventDeferred("colorPickerSliderMovedDragEnd", "colorPickerSliderDragEnd", {
            feature = v16.AnalyticsTag, 
            colorSwatchHex = v98, 
            color3 = tostring(v99), 
            selectedBodyPartIndex = v100
        });
        v18(v20, "AXColorPickerChanged");
    end;
    return v21;
end;
v19.mock = function(v102)
    return (v101(v102));
end;
v19.get = function(v103)
    return (v101((v15.get(v103))));
end;
return v19;
