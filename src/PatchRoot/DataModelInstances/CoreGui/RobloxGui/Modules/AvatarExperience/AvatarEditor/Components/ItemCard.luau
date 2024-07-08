local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local l_ItemTile_0 = v2.Tile.ItemTile;
local l_ItemTileEnums_0 = v2.Tile.ItemTileEnums;
local l_SaveTile_0 = v2.Tile.SaveTile;
local l_withStyle_0 = v2.Style.withStyle;
local v7 = require(l_CorePackages_0.Roact);
local v8 = require(l_CorePackages_0.RoactRodux);
local v9 = require(l_CorePackages_0.Packages.RoactGamepad);
local v10 = require(l_CorePackages_0.Packages.t);
local l_Focusable_0 = v9.Focusable;
local v12 = require(l_CorePackages_0.Cryo);
local v13 = require(l_CorePackages_0.Logging);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v17 = require(l_CorePackages_0.RoactNavigation);
local l_withNavigation_0 = v17.withNavigation;
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v24 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.ItemTileDetailButton);
local v26 = require(l_Modules_0.LuaApp.Constants);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.EquipOutfit);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local v30 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v31 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v33 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v34 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v35 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v36 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v37 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v38 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v39 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v40 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v41 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v42 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v43 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v45 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v45.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v45.Utils.getRbxthumbWithTypeSizeAndOptions;
local v48 = require(l_Modules_0.AvatarExperience.Common.Models.ItemInfo);
local v49 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v50 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectHasAvatarData);
local v51 = require(l_Modules_0.AvatarExperience.Flags.FFlagTempHackFixItemThumbnailsNotVisible);
local v52 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v53 = require(l_Modules_0.AvatarExperience.Flags.GetAXDisableBundleIcon);
local v54 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableOutfitAttribution);
local v55 = game:DefineFastFlag("FixItemsListToAssetDetailsGamepad", false);
local l_AddOutfitButton_0 = v36.AddOutfitButton;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v58 = v7.PureComponent:extend("ItemCard");
v58.validateProps = v10.strictInterface({
    itemId = v10.optional(v10.string), 
    DEPRECATED_isOutfit = if not v52 then v10.boolean else nil, 
    isWearingAssetOrOutfit = v10.optional(v10.boolean), 
    titleFontStyle = v10.optional(v10.table), 
    hasItemFromCurrentPageEquipped = v10.optional(v10.boolean), 
    itemDetailsPeekViewRefs = v10.table, 
    resultsListRef = v10.table, 
    itemType = if not v52 then nil else v10.string, 
    DEPRECATED_assetTypeId = if not v52 then v10.optional(v10.string) else nil, 
    name = v10.optional(v10.string), 
    thumbnail = v10.optional(v10.string), 
    isUIFullView = v10.boolean, 
    DEPRECATED_outfitInfo = if not v52 then v10.optional(v10.table) else nil, 
    categoryInfo = v10.table, 
    lastInputGroup = v10.string, 
    avatarType = v10.string, 
    hasAvatarData = v10.boolean, 
    DEPRECATED_itemData = v10.optional(v10.table), 
    itemInfo = v10.optional(v48.Validator), 
    DEPRECATED_itemType = if not v52 then v10.optional(v10.string) else nil, 
    isEditable = v10.optional(v10.boolean), 
    isPortrait = if not v54 then nil else v10.boolean, 
    fetchItemInfo = v10.callback, 
    toggleEquipAsset = v10.callback, 
    equipOutfitThunk = v10.callback, 
    sendAnalytics = v10.callback, 
    setFullView = v10.callback, 
    navigateWithLock = v10.callback, 
    openItemDetails = v10.callback, 
    appAnalytics = v10.table, 
    analytics = v10.table, 
    avatarExperienceAnalytics = v10.table, 
    networking = v10.callback, 
    catalogAnalytics = v10.table, 
    navigation = v10.table, 
    avatarRoute = v10.table, 
    focusController = v10.optional(v10.table)
});
v58.shouldShowConfirmationDialog = function(v59)
    local v60 = not v59.props.hasItemFromCurrentPageEquipped;
    if not v52 then
        if not (not (v59.props.DEPRECATED_outfitInfo.outfitType == v35.OutfitTypes.DynamicHead) or v59.props.DEPRECATED_outfitInfo.isEditable) then
            v60 = false;
        end;
    elseif not (not (v59.props.itemInfo.itemSubtype == v35.OutfitTypes.DynamicHead) or v59.props.itemInfo.isEditable) then
        return false;
    end;
    return v60;
end;
v58.getItemIconType = function(v61)
    local v62 = nil;
    if not v52 then
        local l_DEPRECATED_isOutfit_0 = v61.props.DEPRECATED_isOutfit;
        local l_DEPRECATED_outfitInfo_0 = v61.props.DEPRECATED_outfitInfo;
        v62 = if not not l_DEPRECATED_isOutfit_0 and l_DEPRECATED_outfitInfo_0 then v31.getItemIconTypeFromOutfit(l_DEPRECATED_outfitInfo_0) else not not l_DEPRECATED_isOutfit_0 and l_ItemTileEnums_0.ItemIconType.Bundle or nil;
    else
        v62 = if not v61.props.itemInfo then nil else v61.props.itemInfo.itemIconType;
    end;
    if v53() and v62 == l_ItemTileEnums_0.ItemIconType.Bundle then
        return nil;
    else
        return v62;
    end;
end;
v58.init = function(v65)
    v65.addOutfitButtonRef = v7.createRef();
    v65.thumbnailRef = v7.createRef();
    v65.activateDetailsButton = function()
        if not v54 or not v65:isOutfit() then
            local v66 = nil;
            local v67 = nil;
            if not v52 then
                v66 = v32.DEPRECATED_GetItemSubType(v65.props.DEPRECATED_itemType, v65.props.DEPRECATED_itemData);
                v67 = if not v65.props.DEPRECATED_itemData then nil else v65.props.DEPRECATED_itemData.priceInRobux;
            else
                v66 = v65.props.itemInfo.itemSubType;
                v67 = v65.props.itemInfo.priceInRobux;
            end;
            local v68 = if not v52 then v65.props.DEPRECATED_itemType else v65.props.itemType;
            if v52 then
                assert(v68, "itemType should be defined for activate details button");
            end;
            v65.props.openItemDetails({
                itemId = v65.props.itemId, 
                itemType = v68, 
                itemSubType = v66, 
                priceInRobux = v67, 
                catalogAnalytics = v65.props.catalogAnalytics, 
                avatarRoute = v65.props.avatarRoute, 
                navigation = v65.props.navigation, 
                itemDetailsPeekViewRefs = if not v55 then v65.itemDetailsPeekViewRefs else v65.props.itemDetailsPeekViewRefs, 
                resultsListRef = v65.props.resultsListRef, 
                mountAsFullView = true, 
                closePreviousItemDetails = true
            });
            return ;
        else
            local l_navigation_0 = v65.props.navigation;
            local v70 = {
                outfitId = v65.props.itemId, 
                ZIndex = 2, 
                showFullWithNoPeekView = not v65.props.isPortrait, 
                renderBottomBar = false, 
                NextSelectionLeft = not v65.props.isPortrait and v65.props.resultsListRef or nil, 
                outfitDetailsPeekViewRefs = v65.props.itemDetailsPeekViewRefs
            };
            v65.props.navigateWithLock(function()
                v40.closeFiltersAndItemDetails(l_navigation_0);
                v40.closeTryOnManager(l_navigation_0);
                l_navigation_0.navigate(v37.OutfitDetails, v70);
            end);
            return ;
        end;
    end;
    v65.onOverlayClosed = function()
        local v71 = v65.props.lastInputGroup == v26.InputType.Gamepad;
        v21("ItemCard", v71);
        if v71 then
            v65.props.focusController.captureFocus();
        end;
    end;
    v65.maybeShowNonBlockingR15Prompt = function()
        if v65.props.avatarType ~= v35.AvatarType.R6 then
            return ;
        else
            local v72 = false;
            local v73 = nil;
            if v65.props.categoryInfo.PageType == v35.PageType.Animation then
                v72 = true;
                v73 = "Feature.Avatar.Message.R15AnimationsPrompt";
            elseif v65.props.categoryInfo.PageType == v35.PageType.Emotes then
                v72 = true;
                v73 = "Feature.Avatar.Message.R15EmotesPrompt";
            end;
            if v72 then
                v65.props.navigateWithLock(function()
                    v65.props.navigation.navigate(v37.R15UpgradePrompt, {
                        onOverlayClosed = v65.onOverlayClosed, 
                        bodyTextKey = v73
                    });
                end);
            end;
            return ;
        end;
    end;
    v65.toggleEquip = function()
        local l_itemId_0 = v65.props.itemId;
        if l_itemId_0 then
            if v65.props.hasAvatarData then
                local l_isWearingAssetOrOutfit_0 = v65.props.isWearingAssetOrOutfit;
                local l_toggleEquipAsset_0 = v65.props.toggleEquipAsset;
                local l_sendAnalytics_0 = v65.props.sendAnalytics;
                local l_analytics_0 = v65.props.analytics;
                local l_equipOutfitThunk_0 = v65.props.equipOutfitThunk;
                local l_isUIFullView_0 = v65.props.isUIFullView;
                local l_navigation_1 = v65.props.navigation;
                local v82 = nil;
                v82 = if not v52 then not not v65:isOutfit() and v36.Outfits or v65.props.DEPRECATED_assetTypeId else if v65.props.itemType == v35.ItemType.Outfit then v36.Outfits else v65.props.itemInfo.itemSubType;
                local function v83()
                    l_toggleEquipAsset_0(v82, l_itemId_0, l_navigation_1);
                end;
                v65.maybeShowNonBlockingR15Prompt();
                local v84 = v65.props.avatarType == v35.AvatarType.R6;
                local v85 = v82 == v35.AssetTypeIdStrings.HairAccessory;
                local v86 = false;
                if v35.LayeredAssetTypes[v82] ~= nil then
                    v86 = not v85;
                end;
                if (not v84 or l_isWearingAssetOrOutfit_0) or not v86 then
                    if not v65:isOutfit() then
                        if l_isWearingAssetOrOutfit_0 then
                            l_sendAnalytics_0(l_analytics_0.unequipAsset, l_itemId_0, v82);
                        else
                            l_sendAnalytics_0(l_analytics_0.equipAsset, l_itemId_0, v82);
                        end;
                        l_toggleEquipAsset_0(v82, l_itemId_0, l_navigation_1);
                    else
                        local v87 = nil;
                        v87 = if not v52 then v65.props.DEPRECATED_outfitInfo else v65.props.itemInfo.outfitInfo;
                        do
                            local l_v87_0 = v87;
                            if not l_v87_0 then
                                v13.warn("Tried equipping a costume without any costume data");
                            elseif not v65:shouldShowConfirmationDialog() then
                                l_equipOutfitThunk_0(l_v87_0, l_analytics_0, l_navigation_1, l_isWearingAssetOrOutfit_0);
                            else
                                v65.props.navigateWithLock(function()
                                    v65.props.navigation.navigate(v37.EquipOutfitConfirmation, {
                                        onOverlayClosed = v65.onOverlayClosed, 
                                        outfitInfo = l_v87_0
                                    });
                                end);
                            end;
                        end;
                    end;
                    if not (l_isWearingAssetOrOutfit_0 or not l_isUIFullView_0) then
                        v65.props.setFullView(v65.props.avatarExperienceAnalytics, v37.AvatarEditor, v39.None);
                    end;
                    return ;
                else
                    v65.props.navigateWithLock(function()
                        v65.props.navigation.navigate(v37.R15UpgradePrompt, {
                            onOverlayClosed = v65.onOverlayClosed, 
                            bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning", 
                            onSwitchSelected = v83
                        });
                    end);
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    if v51 then
        v65.onWillFocus = function()
            v31.hackGetAbsoluteSzieOfDescendants(v65.thumbnailRef);
        end;
    end;
end;
v58.isOutfit = function(v89)
    if not v52 then
        return v89.props.DEPRECATED_isOutfit;
    else
        return v89.props.itemType == v35.ItemType.Outfit;
    end;
end;
v58.shouldProvideControlsToViewItemDetails = function(v90)
    if not v54 then
        if not v90.props.isEditable then
            if v90:isOutfit() then
                return false;
            end;
        else
            return false;
        end;
    end;
    if v90.props.isWearingAssetOrOutfit then
        return true;
    else
        return false;
    end;
end;
v58.renderDetailsButton = function(v91, _, _)
    if v91:shouldProvideControlsToViewItemDetails() then
        if not (v91.props.lastInputGroup == v26.InputType.Gamepad) then
            return v7.createElement(v25, {
                activateButton = v91.activateDetailsButton
            });
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v58.render = function(v94)
    return l_withLocalization_0({
        more = "CommonUI.Features.Label.More"
    })(function(v95)
        return l_withStyle_0(function(v96)
            return v94:renderWithProviders(v95, v96);
        end);
    end);
end;
v58.renderWithProviders = function(v97, v98, v99)
    local l_itemId_1 = v97.props.itemId;
    local l_name_0 = v97.props.name;
    local l_thumbnail_0 = v97.props.thumbnail;
    local l_isWearingAssetOrOutfit_1 = v97.props.isWearingAssetOrOutfit;
    return v9.withFocusController(function(v104)
        if l_itemId_1 == l_AddOutfitButton_0 then
            return v7.createElement(l_SaveTile_0, {
                onActivated = function()
                    v97:openCreateOrUpdateCostumeMenu(function()
                        if v97.props.lastInputGroup == v26.InputType.Gamepad then
                            v104.captureFocus();
                        end;
                    end);
                end, 
                thumbnailTransparency = 0, 
                [v7.Ref] = v97.addOutfitButtonRef
            });
        else
            local v105 = {
                SelectSlot = v9.Input.onBegin(Enum.KeyCode.ButtonA, v97.toggleEquip, {
                    key = if v97.props.categoryInfo.PageType == v35.PageType.Emotes then l_isWearingAssetOrOutfit_1 and "Feature.Avatar.Action.UnslotEmote" or "Feature.Avatar.Action.SlotEmote" else nil
                }), 
                MoreDetails = if not v97:shouldProvideControlsToViewItemDetails() then nil else v9.Input.onBegin(Enum.KeyCode.ButtonX, v97.activateDetailsButton, {
                    key = "CommonUI.Features.Label.More"
                })
            };
            local v106 = 0;
            local v107 = nil;
            if not v97.props.categoryInfo.HideTextUnderTile then
                v106 = v35.ItemTileTitleMaxLines;
                v107 = v97.props.titleFontStyle;
            end;
            if not v51 then
                return v7.createElement(l_Focusable_0[l_ItemTile_0], {
                    LayoutOrder = v97.props.layoutOrder, 
                    isSelected = l_isWearingAssetOrOutfit_1, 
                    itemIconType = v97:getItemIconType(), 
                    onActivated = v97.toggleEquip, 
                    name = l_name_0, 
                    titleTextLineCount = v106, 
                    titleFontStyle = v97.props.titleFontStyle, 
                    thumbnail = l_thumbnail_0, 
                    renderTileInset = function()
                        return v97:renderDetailsButton(v98, v99);
                    end, 
                    inputBindings = v105
                });
            else
                return v7.createFragment({
                    NavigationEvents = if not v51 then nil else v7.createElement(v17.NavigationEvents, {
                        onWillFocus = v97.onWillFocus
                    }), 
                    ItemTile = v7.createElement(l_Focusable_0[l_ItemTile_0], {
                        LayoutOrder = v97.props.layoutOrder, 
                        isSelected = l_isWearingAssetOrOutfit_1, 
                        itemIconType = v97:getItemIconType(), 
                        onActivated = v97.toggleEquip, 
                        name = l_name_0, 
                        titleTextLineCount = v106, 
                        titleFontStyle = v107, 
                        thumbnail = l_thumbnail_0, 
                        renderTileInset = function()
                            return v97:renderDetailsButton(v98, v99);
                        end, 
                        inputBindings = v105, 
                        [v7.Ref] = if not v51 then nil else v97.thumbnailRef
                    })
                });
            end;
        end;
    end);
end;
v58.openCreateOrUpdateCostumeMenu = function(v108, v109)
    local v110 = v108.addOutfitButtonRef:getValue();
    if v110 then
        local v111 = v110.AbsolutePosition + v110.AbsoluteSize * Vector2.new(0.5, 0.5);
        v108.props.navigateWithLock(function()
            v108.props.navigation.navigate(v37.CreateOrUpdateOutfitMenu, {
                saveTilePosition = v111, 
                onOverlayClosed = v109
            });
        end);
        return ;
    else
        return ;
    end;
end;
v58.checkFetchInfo = function(v112)
    if not v112:isOutfit() then
        local l_itemId_2 = v112.props.itemId;
        if l_itemId_2 == l_AddOutfitButton_0 then
            return ;
        else
            if not (not l_itemId_2 or v112.props.name) then
                v112.props.fetchItemInfo(v112.props.networking, v112.props.appAnalytics, l_itemId_2, v35.ItemType.Asset);
            end;
            return ;
        end;
    else
        return ;
    end;
end;
v58.didUpdate = function(v114, v115)
    if not v52 then
        if v115.itemId == v114.props.itemId then
            return ;
        end;
    else
        local l_itemId_3 = v115.itemId;
        local l_itemType_0 = v115.itemType;
        local l_itemId_4 = v114.props.itemId;
        local l_itemType_1 = v114.props.itemType;
        if l_itemId_3 == l_itemId_4 and l_itemType_0 == l_itemType_1 then
            return ;
        end;
    end;
    v114:checkFetchInfo();
end;
v58.didMount = function(v120)
    v120:checkFetchInfo();
end;
v58 = v20((v19((l_withNavigation_0(v8.connect(function(v121, v122)
    local l_itemId_5 = v122.itemId;
    local v124 = v31.getAvatarEditorCategoryInfoFromState(v121);
    if not v52 then
        local v125 = v121.AvatarExperience.AvatarEditor.OutfitInfos[l_itemId_5];
        local v126 = nil;
        local v127 = nil;
        local v128 = nil;
        local v129 = if not v122.DEPRECATED_isOutfit then v35.ItemType.Asset else v35.ItemType.Bundle;
        local v130 = v33(v121.AvatarExperience.Common, v122.itemId, v129);
        local v131 = not not v125 and v125.isEditable;
        if l_itemId_5 then
            if not v122.DEPRECATED_isOutfit then
                v126 = not not v130 and v130.assetType or nil;
                v127 = not not v130 and v130.name or nil;
                v128 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_5, l_Constants_0.RbxthumbTypes.Asset, 150);
            else
                v127 = not not v125 and v125.name or nil;
                v128 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_5, l_Constants_0.RbxthumbTypes.Outfit, 150);
                if v125 then
                    v128 = v128 .. "&filters=" .. v125.updateCounter;
                end;
            end;
        end;
        return {
            DEPRECATED_itemData = v130, 
            DEPRECATED_itemType = v129, 
            isEditable = v131, 
            DEPRECATED_assetTypeId = v126, 
            name = v127, 
            thumbnail = v128, 
            isUIFullView = v121.AvatarExperience.Common.FullView[v37.AvatarEditor] == v39.UIFullView, 
            DEPRECATED_outfitInfo = v125, 
            categoryInfo = v124, 
            avatarType = v121.AvatarExperience.AvatarEditor.Character.AvatarType, 
            hasAvatarData = v50(v121), 
            isPortrait = if not v54 then nil else v49(v121)
        };
    else
        local l_itemType_2 = v122.itemType;
        local v133 = v34(v121.AvatarExperience, l_itemId_5, l_itemType_2);
        local v134 = not not v133 and v133.isEditable;
        local v135 = if not v133 then nil else v133.name;
        local _ = nil;
        local v137 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_5, if l_itemType_2 == v35.ItemType.Outfit then l_Constants_0.RbxthumbTypes.Outfit else l_Constants_0.RbxthumbTypes.Asset, 150);
        if not (not v133 or not v133.updateCounter) then
            v137 = v137 .. "&filters=" .. v133.updateCounter;
        end;
        return {
            itemInfo = v133, 
            isEditable = v134, 
            name = v135, 
            thumbnail = v137, 
            isUIFullView = v121.AvatarExperience.Common.FullView[v37.AvatarEditor] == v39.UIFullView, 
            categoryInfo = v124, 
            avatarType = v121.AvatarExperience.AvatarEditor.Character.AvatarType, 
            hasAvatarData = v50(v121), 
            isPortrait = if not v54 then nil else v49(v121)
        };
    end;
end, function(v138)
    return {
        fetchItemInfo = function(v139, v140, v141, v142)
            return v138(v27(v139, v140, v141, v142));
        end, 
        toggleEquipAsset = function(v143, v144, v145)
            v138(v30(v143, v144, v145));
        end, 
        equipOutfitThunk = function(v146, v147, v148, v149)
            v138(v28({
                outfitInfo = v146, 
                analytics = v147, 
                navigation = v148, 
                isSelected = v149
            }));
        end, 
        sendAnalytics = function(v150, v151, v152)
            v138(v29(v150, v151, v152));
        end, 
        setFullView = function(v153, v154, v155)
            v138(v38(v153, v154, v155));
        end, 
        navigateWithLock = function(v156)
            v138(v41(v156));
        end, 
        openItemDetails = function(v157)
            v138(v42(v157));
        end
    };
end)((l_RoactServices_0.connect({
    appAnalytics = v15, 
    analytics = v23, 
    catalogAnalytics = v43, 
    avatarExperienceAnalytics = v24, 
    networking = v16
})(v58))), nil)))));
return function(v158)
    return v9.withFocusController(function(v159)
        return v7.createElement(v58, v12.Dictionary.join(v158, {
            focusController = v159
        }));
    end);
end;
