local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local v8 = require(l_CorePackages_0.FitFrame);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_Focusable_0 = v7.Focusable;
local l_FitFrameVertical_0 = v8.FitFrameVertical;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_GridMetrics_0 = v6.App.Grid.GridMetrics;
local l_ItemTile_0 = v6.Tile.ItemTile;
local l_ItemTileEnums_0 = v6.Tile.ItemTileEnums;
local l_withStyle_0 = v6.Style.withStyle;
local l_EmptyState_0 = v6.App.Indicator.EmptyState;
local l_Images_0 = v6.App.ImageSet.Images;
local v20 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v22 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v24 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v26 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v28 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v28.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v28.Utils.getRbxthumbWithTypeSizeAndOptions;
local v31 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetEditableOutfits);
local v32 = require(l_Modules_0.AvatarExperience.Flags.GetAXDisableBundleIcon);
local v33 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableOutfitAttribution);
local v34 = l_Images_0["icons/navigation/pushBack"];
local v35 = l_GridMetrics_0.makeCustomMetricsGetter(v25.ItemsGridMetrics);
local v36 = v3.PureComponent:extend("OutfitSelectionGrid");
v36.validateProps = v5.strictInterface({
    onToggleOutfitCard = if not v33 then nil else v5.optional(v5.callback), 
    selectedOutfits = v5.array(v5.string), 
    selectionUpdated = v5.callback, 
    canScrollUpdated = v5.optional(v5.callback), 
    multiSelect = v5.optional(v5.boolean), 
    goBack = v5.callback, 
    pageOwner = v5.string, 
    NextSelectionLeft = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table), 
    forwardRef = v5.table, 
    networking = v5.callback, 
    showCustomOutfitNames = v5.boolean, 
    outfitInfos = v5.table, 
    editableOwnedOutfitIds = v5.array(v5.string), 
    screenSize = v5.Vector2, 
    hasMoreItems = v5.boolean, 
    getEditableOutfits = v5.callback
});
v36.defaultProps = {
    multiSelect = false
};
v36.getItemIconType = function(v37, v38)
    local l_outfitInfos_0 = v37.props.outfitInfos;
    local v40 = l_outfitInfos_0 and l_outfitInfos_0[v38];
    if not v40 then
        if not v32() then
            return l_ItemTileEnums_0.ItemIconType.Bundle;
        else
            return nil;
        end;
    else
        return v24.getItemIconTypeFromOutfit(v40);
    end;
end;
v36.init = function(v41)
    v41.loadableGridViewRef = v3.createRef();
    v41.emptyStateRef = v3.createRef();
    local v42 = 0;
    local v43 = 0;
    local function _()
        if v41.props.canScrollUpdated then
            v41.props.canScrollUpdated(v42 < v43 + (v25.ItemsGridTopPadding + v25.ItemsGridBottomPadding));
        end;
    end;
    v41.absoluteSizeChanged = function(v45)
        v42 = v45.AbsoluteSize.Y;
        if v41.props.canScrollUpdated then
            v41.props.canScrollUpdated(v42 < v43 + (v25.ItemsGridTopPadding + v25.ItemsGridBottomPadding));
        end;
    end;
    v41.contentSizeChanged = function(v46)
        v43 = v46.AbsoluteContentSize.Y;
        if v41.props.canScrollUpdated then
            v41.props.canScrollUpdated(v42 < v43 + (v25.ItemsGridTopPadding + v25.ItemsGridBottomPadding));
        end;
    end;
    v41.loadMoreItems = function()
        return v41.props.getEditableOutfits(v41.props.networking);
    end;
end;
v36.renderItem = function(v47, v48)
    if typeof(v48) == "table" then
        v48 = nil;
    end;
    local v49 = v2.List.find(v47.props.selectedOutfits, v48) ~= nil;
    local function v51()
        if not v47.props.multiSelect then
            if not v49 then
                v47.props.selectionUpdated({
                    v48
                });
                if not (not v33 or not v47.props.onToggleOutfitCard) then
                    v47.props.onToggleOutfitCard(true, v48);
                end;
            else
                v47.props.selectionUpdated({});
                if not (not v33 or not v47.props.onToggleOutfitCard) then
                    v47.props.onToggleOutfitCard(false);
                    return ;
                end;
            end;
            return ;
        else
            local _ = nil;
            v47.props.selectionUpdated(if not v49 then v2.List.join(v47.props.selectedOutfits, {
                v48
            }) else v2.List.removeValue(v47.props.selectedOutfits, v48));
            return ;
        end;
    end;
    local v52 = nil;
    local v53 = nil;
    if v48 then
        local v54 = v47.props.outfitInfos[tostring(v48)];
        v52 = not not v54 and v54.name or nil;
        v53 = l_getRbxthumbWithTypeSizeAndOptions_0(v48, l_Constants_0.RbxthumbTypes.Outfit, 150);
        if v54 then
            v53 = v53 .. "&filters=" .. v54.updateCounter;
        end;
    end;
    local l_ItemTileTitleMaxLines_0 = v26.ItemTileTitleMaxLines;
    if not v47.props.showCustomOutfitNames then
        l_ItemTileTitleMaxLines_0 = 0;
    end;
    return v3.createElement(l_Focusable_0[l_ItemTile_0], {
        isSelected = v49, 
        multiSelect = v47.props.multiSelect, 
        itemIconType = v47:getItemIconType(v48), 
        onActivated = v51, 
        name = v52, 
        titleTextLineCount = l_ItemTileTitleMaxLines_0, 
        thumbnail = v53, 
        inputBindings = {
            ToggleSelect = v7.Input.onBegin(Enum.KeyCode.ButtonA, v51, {
                key = not v49 and "Feature.Avatar.Action.Select" or "Feature.Avatar.Action.Unselect"
            })
        }
    });
end;
v36.renderWithProviders = function(v56, v57, v58)
    local v59 = v56.props.hasMoreItems and #v56.props.editableOwnedOutfitIds == 0;
    local v60 = not v59 and v56.props.editableOwnedOutfitIds or nil;
    local v61 = not not v60 and #v60 or v26.ShimmerCardsToDisplay;
    local v62 = v61 > 0;
    local l_Font_0 = v57.Font;
    local v64 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v65 = nil;
    v65 = if not v56.props.showCustomOutfitNames then v24.GridItemHeightGetter(v26.ItemTileType.BundleItemTileNoText) else v24.GridItemHeightGetter(v26.ItemTileType.BundleItemTile, v64);
    local _ = nil;
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        [v3.Change.AbsoluteSize] = v56.absoluteSizeChanged, 
        NextSelectionLeft = v56.props.NextSelectionLeft, 
        NextSelectionRight = v56.props.NextSelectionRight, 
        NextSelectionDown = v56.props.NextSelectionDown, 
        NextSelectionUp = v56.props.NextSelectionUp, 
        [v3.Ref] = v56.props.forwardRef, 
        defaultChild = if not v62 then v56.emptyStateRef else v56.loadableGridViewRef, 
        restorePreviousChildFocus = true
    }, {
        RefreshScrollingFrameWithLoadMore = v62 and v3.createElement(v20, {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(0, 0), 
            Size = UDim2.fromScale(1, 1), 
            CanvasSize = UDim2.fromScale(1, 0), 
            onLoadMore = v56.props.hasMoreItems and v56.loadMoreItems, 
            hasMoreRows = v56.props.hasMoreItems, 
            createEndOfScrollElement = false, 
            parentAppPage = v56.props.pageOwner, 
            initializing = v59
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                [v3.Change.AbsoluteContentSize] = v56.contentSizeChanged
            }), 
            ListWrapper = v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                margin = {
                    top = v25.ItemsGridTopPadding, 
                    bottom = v25.ItemsGridBottomPadding, 
                    left = v25.ItemsGridSidePadding / 2, 
                    right = v25.ItemsGridSidePadding / 2
                }
            }, {
                LoadableGridView = v3.createElement(v27, {
                    getItemMetrics = v35, 
                    items = v60, 
                    totalNumItems = v61, 
                    renderItem = function(v67)
                        return v56:renderItem(v67);
                    end, 
                    getItemHeight = v65, 
                    windowHeight = v56.props.screenSize.Y, 
                    [v3.Ref] = v56.loadableGridViewRef
                })
            })
        }), 
        EmptyState = not v62 and v3.createElement(l_EmptyState_0, {
            buttonIcon = v34, 
            onActivated = v56.props.goBack, 
            text = v58.noItemsLabel:gsub("({itemType})", v58.itemType), 
            [v3.Ref] = v56.emptyStateRef
        })
    });
end;
v36.render = function(v68)
    return l_withStyle_0(function(v69)
        return l_withLocalization_0({
            itemType = "Feature.Catalog.Label.Characters", 
            noItemsLabel = "Feature.Avatar.Label.NoItems"
        })(function(v70)
            return v68:renderWithProviders(v69, v70);
        end);
    end);
end;
v36.didMount = function(v71)
    if v71.props.hasMoreItems then
        v71.props.getEditableOutfits(v71.props.networking);
    end;
end;
v36.didUpdate = function(v72, v73, _)
    if not (not (v72.props.multiSelect ~= v73.multiSelect) or v72.props.multiSelect) then
        v72.props.selectionUpdated({});
    end;
    local v75 = v72.props.editableOwnedOutfitIds ~= v73.editableOwnedOutfitIds;
    local v76 = v72.props.selectedOutfits ~= v73.selectedOutfits;
    if not (not v75 and not v76) then
        local v77 = {};
        local v78 = false;
        for _, v80 in v72.props.selectedOutfits, nil, nil do
            if not v2.List.find(v72.props.editableOwnedOutfitIds, v80) then
                v78 = true;
            else
                v77[#v77 + 1] = v80;
            end;
        end;
        if v78 then
            v72.props.selectionUpdated(v77);
        end;
    end;
end;
v36 = v4.connect(function(v81, _)
    return {
        editableOwnedOutfitIds = v81.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[v25.EditableCharacterKey] or {}, 
        outfitInfos = v81.AvatarExperience.AvatarEditor.OutfitInfos, 
        screenSize = v81.ScreenSize, 
        hasMoreItems = not v81.AvatarExperience.AvatarEditor.PageFinished[v25.EditableCharacterKey]
    };
end, function(v83)
    return {
        getEditableOutfits = function(v84)
            return v83(v31(v84));
        end
    };
end)((l_RoactAppPolicy_0.connect(function(v85, _)
    return {
        showCustomOutfitNames = v85.getCustomOutfitNames()
    };
end)((l_RoactServices_0.connect({
    networking = v22
})(v36)))));
return v3.forwardRef(function(v87, v88)
    return v3.createElement(v36, v2.Dictionary.join(v87, {
        forwardRef = v88
    }));
end);
