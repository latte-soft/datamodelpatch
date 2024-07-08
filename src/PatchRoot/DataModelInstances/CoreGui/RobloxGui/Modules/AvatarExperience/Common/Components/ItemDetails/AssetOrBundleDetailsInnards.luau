local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.AvatarExperienceDeps);
local v6 = require(l_CorePackages_0.Packages.Dash);
local v7 = require(l_CorePackages_0.UIBlox);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v11 = require(l_Modules_0.AvatarExperience.Common.Hooks.useItemInfo);
local l_Focusable_0 = v4.Focusable;
local v13 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v14 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_AvatarExperience_0 = l_Modules_0.AvatarExperience;
local l_Common_0 = l_AvatarExperience_0.Common;
local l_Catalog_0 = l_AvatarExperience_0.Catalog;
local _ = require(l_Common_0.Types);
local v19 = require(l_Common_0.Components.RoactNavigation.AvatarScreen);
local v20 = require(l_Common_0.Constants);
local v21 = require(l_Common_0.Components.ItemDetails.ItemDescription);
local v22 = require(l_Common_0.Components.ItemDetails.ItemStatistics);
local v23 = require(l_Common_0.Components.ItemDetails.ItemOwnershipButton);
local v24 = require(l_Common_0.Components.ItemDetails.ItemInfo.ItemInfoList);
local v25 = require(l_Common_0.Components.ItemDetails.RecommendedItemsGrid);
local v26 = require(l_Common_0.Components.ItemDetails.IncludedItemsGrid);
local v27 = require(l_Common_0.Components.ItemDetails.ItemImageAndName);
local v28 = require(l_Catalog_0.CatalogUtils);
local l_GetCanExpand_0 = v7.Core.Text.ExpandableText.GetCanExpand;
local l_useStyle_0 = v7.Core.Style.useStyle;
local l_Flags_0 = l_AvatarExperience_0.Flags;
local v32 = require(l_Flags_0.FFlagAXFixItemTypeHandling);
local v33 = require(l_Flags_0.FFlagAEShowPremiumPolicy);
local v34 = require(l_Flags_0.GetFFlagRestrictLimited2ToSoothsayers);
local v35 = require(l_Flags_0.GetFFlagL2ControllerSupport);
local v36 = require(l_Flags_0.FFlagEnableAttributionItemRow);
local v37 = require(l_Flags_0.GetAXInExperienceItemLinking);
local l_RoactFitComponents_0 = v5.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local v41 = {
    listPadding = 24
};
return function(v42)
    assert(v32, "Flag FFlagAXFixItemTypeHandling should be true");
    assert(v42.itemType ~= v20.ItemType.Outfit, "AssetOrBundleDetailsInnards does not support oufits");
    local v43 = v6.join(v41, v42);
    local v44 = v13({
        recommendedLabel = "Feature.Catalog.Label.Recommendations", 
        resellLabel = "Feature.Catalog.Heading.Sellers", 
        tryOn = "Feature.Avatar.Action.TryOn", 
        inMultipleExperiences = "Feature.Catalog.Label.InMultipleExperiences", 
        inSpecificExperience = "Feature.Catalog.Label.InSpecificExperience", 
        soldOut = "Feature.Catalog.Label.SoldOut"
    });
    local v45 = l_useStyle_0();
    local v46 = l_useNavigation_0();
    local v48 = v14(function(v47)
        return v47.getShowCatalogPremiumContent();
    end);
    local l_Theme_0 = v45.Theme;
    local l_Font_0 = v45.Font;
    local v51 = v11(v43.itemId, v43.itemType);
    local v53 = l_useSelector_0(function(v52)
        return v52.AvatarExperience.Common.ItemDetailsPeekView.viewState;
    end);
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    if v51 then
        v54 = v51.itemSubType;
        v55 = v51.name;
        v56 = if not v33 then v51.hasPremiumBenefits else v51.hasPremiumBenefits and v48;
        if v37() then
            v57 = v51.collectibleItemId;
        end;
    end;
    local v59 = l_useSelector_0((v3.useCallback(function(v58)
        if not v57 then
            return nil;
        else
            return v58.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v57];
        end;
    end, {
        v57
    })));
    local v61 = l_useSelector_0((v3.useCallback(function(v60)
        if not v34() then
            return false;
        else
            return v60.AvatarExperience.Catalog.Metadata.isCollectiblesEnabled;
        end;
    end, {})));
    local function _()
        if not v51 then
            return nil;
        else
            return v51.description;
        end;
    end;
    local function _()
        return v46.state.routeName == v19.TryOnItem;
    end;
    local function _()
        local v64 = true;
        if v53 ~= l_PeekViewState_0.Full then
            v64 = v53 == l_PeekViewState_0.Extended;
        end;
        return v64;
    end;
    local function _()
        if not v51 then
            return false;
        elseif not v51.isResellable then
            return false;
        else
            return true;
        end;
    end;
    local function _()
        if not v51 or not v51.isOwned then
            return false;
        elseif not v34() then
            if not v51 then
                return false;
            elseif not v51.isResellable then
                return false;
            else
                return true;
            end;
        else
            return (not not v51 and (v51.isResellable and true or false)) and v61;
        end;
    end;
    local function _()
        if not v51 then
            return false;
        elseif not v51.hasAttribution then
            return false;
        else
            return true;
        end;
    end;
    local function _()
        if not (v46.state.routeName == v19.TryOnItem) then
            if (not (v43.itemType == v20.ItemType.Asset) or not v54) or v28.doesAssetTypeHaveCatalogPage(v54) then
                if not (not v51 or not v51.receivedRecommendedData) and (not (v51.recommendedItemSummaries ~= nil) or #v51.recommendedItemSummaries == 0) then
                    return false;
                else
                    return true;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
    local function v71()
        local v70 = if not v51 then nil else v51.description;
        if v70 then
            return l_GetCanExpand_0(l_Font_0, v43.width - 48, v70, 3);
        else
            return false;
        end;
    end;
    local function v73()
        local v72 = true;
        if v53 ~= l_PeekViewState_0.Full then
            v72 = v53 == l_PeekViewState_0.Extended;
        end;
        if v72 then
            v72 = (not not v51 and if v51.isOwned then if v34() then (not not v51 and (v51.isResellable and true or false)) and v61 else if v51 then v51.isResellable and true or false else false else false) and v35();
        end;
        return v72;
    end;
    local function v76()
        local v74 = not not v51 and (v51.isResellable and true or false);
        local v75 = true;
        if v53 ~= l_PeekViewState_0.Full then
            v75 = v53 == l_PeekViewState_0.Extended;
        end;
        if v75 then
            v75 = v74 and not (v46.state.routeName == v19.TryOnItem);
        end;
        return v75;
    end;
    local function v79()
        local v77 = not not v51 and (v51.hasAttribution and true or false);
        local v78 = true;
        if v53 ~= l_PeekViewState_0.Full then
            v78 = v53 == l_PeekViewState_0.Extended;
        end;
        if v78 then
            v78 = (v77 and not (v46.state.routeName == v19.TryOnItem)) and v36;
        end;
        return v78;
    end;
    local function v80()
        if not (v46.state.routeName == v19.TryOnItem) then
            if (not (v43.itemType == v20.ItemType.Asset) or not v54) or v28.doesAssetTypeHaveCatalogPage(v54) then
                if not (not v51 or not v51.receivedRecommendedData) and (not (v51.recommendedItemSummaries ~= nil) or #v51.recommendedItemSummaries == 0) then
                    return false;
                else
                    return true;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
    local function _()
        if not (v46.state.routeName == v19.TryOnItem) then
            if v51 then
                assert(v51, "silence type checker");
                if v51.itemType ~= v20.ItemType.Bundle then
                    return false;
                else
                    return true;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
    local v82 = v3.useRef(nil);
    local v83 = if not v35() then nil else v3.useRef(nil);
    local v84 = v3.useRef(nil);
    local v85 = if not v36 then nil else v3.useRef(nil);
    local v86 = v3.useRef(nil);
    local v87 = {};
    table.insert(v87, {
        ref = v82, 
        shouldCareAboutRef = v71
    });
    if v83 then
        table.insert(v87, {
            ref = v83, 
            shouldCareAboutRef = v73
        });
    end;
    table.insert(v87, {
        ref = v84, 
        shouldCareAboutRef = v76
    });
    if v85 then
        table.insert(v87, {
            ref = v85, 
            shouldCareAboutRef = v79
        });
    end;
    table.insert(v87, {
        ref = v86, 
        shouldCareAboutRef = v80
    });
    local _ = function()
        for _, v89 in v87, nil, nil do
            if v89.shouldCareAboutRef() then
                return v89.ref;
            end;
        end;
        return nil;
    end;
    local function v95(v91)
        local v92 = false;
        for _, v94 in v87, nil, nil do
            if v94.ref == v91 then
                v92 = true;
            elseif not (not v92 or not v94.shouldCareAboutRef()) then
                return v94.ref;
            end;
        end;
        return v43.NextSelectionDown;
    end;
    local function v100(v96)
        local l_NextSelectionUp_0 = v43.NextSelectionUp;
        for _, v99 in v87, nil, nil do
            if v99.ref == v96 then
                return l_NextSelectionUp_0;
            elseif v99.shouldCareAboutRef() then
                l_NextSelectionUp_0 = v99.ref;
            end;
        end;
        return l_NextSelectionUp_0;
    end;
    local function v101()
        v46.navigate(v19.ItemOwnershipPage, {
            itemId = v43.itemId, 
            collectibleItemId = v57, 
            itemType = v43.itemType
        });
    end;
    local function _()
        if not v51 then
            return nil;
        else
            return v51.favoriteCount;
        end;
    end;
    local function _()
        return v43.showFullWithNoPeekView and v43.bottomDockedContainerHeight > 0;
    end;
    local function _()
        return l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    end;
    local l_listPadding_0 = v43.listPadding;
    local v106;
    for _, v108 in v87, nil, nil do
        if v108.shouldCareAboutRef() then
            v106 = v108.ref;
            goto label0 --[[  true, false  ]];
        end;
    end;
    v106 = nil;
    ::label0::;
    local v109 = if not v51 then nil else v51.description;
    local v110 = if not v51 then nil else v51.favoriteCount;
    local v111;
    if not (v46.state.routeName == v19.TryOnItem) then
        if v51 then
            assert(v51, "silence type checker");
            v111 = v51.itemType == v20.ItemType.Bundle;
        else
            v111 = false;
        end;
    else
        v111 = false;
    end;
    return v3.createElement(l_Focusable_0[l_FitFrameVertical_0], {
        width = UDim.new(1, 0), 
        contentPadding = UDim.new(0, l_listPadding_0), 
        margin = l_RoactFitComponents_0.Rect.square(24), 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 0, 0), 
        defaultChild = v106, 
        restorePreviousChildFocus = true, 
        inputBindings = {
            MoveToTop = v4.Input.onBegin(Enum.KeyCode.ButtonL2, function()
                v43.peekViewFocusController.moveFocusTo(v106);
            end), 
            MoveToRecItemsGrid = v4.Input.onBegin(Enum.KeyCode.ButtonR2, function()
                v43.peekViewFocusController.moveFocusTo(v86);
            end)
        }
    }, {
        ItemImageAndName = v2.createElement(v27, {
            name = v55, 
            showPremiumBenefits = v56, 
            actionBarHeaderRef = v43.actionBarHeaderRef, 
            collectibleInfo = v59, 
            width = v43.width, 
            itemType = v43.itemType, 
            itemId = v43.itemId, 
            itemSubType = v54, 
            itemDetailsPeekViewRefs = v43.itemDetailsPeekViewRefs, 
            resultsListRef = v43.resultsListRef
        }), 
        IncludedItems = if not v111 then nil else v2.createElement(v26, {
            itemId = v43.itemId, 
            itemType = v43.itemType, 
            LayoutOrder = 2
        }), 
        ItemDescription = v2.createElement(v21, {
            compactNumberOfLines = 3, 
            descriptionText = v109, 
            LayoutOrder = 3, 
            [v2.Ref] = v82, 
            NextSelectionUp = if not v35() then nil else v43.NextSelectionUp, 
            NextSelectionDown = v95(v82)
        }), 
        ItemStatistics = if v46.state.routeName == v19.TryOnItem then nil else v2.createElement(v22, {
            favoritesCount = v110, 
            LayoutOrder = 4, 
            listPadding = 10, 
            width = v43.width - 48
        }), 
        ItemOwnershipButton = if not (not not v51 and if v51.isOwned then if v34() then (not not v51 and (v51.isResellable and true or false)) and v61 else if v51 then v51.isResellable and true or false else false else false) then nil else v2.createElement(v23, {
            size = UDim2.new(1, 0, 0, 0), 
            automaticSize = Enum.AutomaticSize.Y, 
            layoutOrder = 5, 
            itemId = v43.itemId, 
            collectibleItemId = v57, 
            onActivated = v101, 
            ref = if not v35() then nil else v83, 
            NextSelectionUp = v100(v83), 
            NextSelectionDown = v95(v83)
        }), 
        ItemInfoList = if v46.state.routeName == v19.TryOnItem then nil else v2.createElement(v24, {
            itemId = v43.itemId, 
            itemType = v43.itemType, 
            LayoutOrder = 6, 
            ref = if not v36 then v84 else nil, 
            resellerRef = if not v36 then nil else v84, 
            attributionRef = if not v36 then nil else v85, 
            NextSelectionUp = v100(v84), 
            NextSelectionDown = v95(v85)
        }), 
        RecommendedLabel = if not if not (v46.state.routeName == v19.TryOnItem) then if not (v43.itemType == v20.ItemType.Asset and v54) or v28.doesAssetTypeHaveCatalogPage(v54) then (not v51 or not v51.receivedRecommendedData) or v51.recommendedItemSummaries ~= nil and #v51.recommendedItemSummaries ~= 0 else false else false then nil else v2.createElement(l_FitTextLabel_0, {
            width = l_FitTextLabel_0.Width.FitToText, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Font = l_Font_0.Header1.Font, 
            LayoutOrder = 8, 
            Position = UDim2.new(0, 0, 0, 0), 
            Text = v44.recommendedLabel, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize, 
            TextColor3 = l_Theme_0.TextEmphasis.Color
        }), 
        RecommendedItemsGrid = if not if not (v46.state.routeName == v19.TryOnItem) then if not (v43.itemType == v20.ItemType.Asset and v54) or v28.doesAssetTypeHaveCatalogPage(v54) then (not v51 or not v51.receivedRecommendedData) or v51.recommendedItemSummaries ~= nil and #v51.recommendedItemSummaries ~= 0 else false else false then nil else v2.createElement(v25, {
            itemId = v43.itemId, 
            itemSubType = v54, 
            itemType = v43.itemType, 
            LayoutOrder = 9, 
            [v2.Ref] = v86, 
            NextSelectionUp = v100(v86), 
            NextSelectionDown = v43.NextSelectionDown, 
            itemDetailsPeekViewRefs = v43.itemDetailsPeekViewRefs, 
            resultsListRef = v43.resultsListRef
        }), 
        BottomContainerPlaceHolder = if not (v43.showFullWithNoPeekView and v43.bottomDockedContainerHeight > 0) then nil else v2.createElement("Frame", {
            LayoutOrder = 10, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v43.bottomDockedContainerHeight), 
            Active = false
        })
    });
end;
