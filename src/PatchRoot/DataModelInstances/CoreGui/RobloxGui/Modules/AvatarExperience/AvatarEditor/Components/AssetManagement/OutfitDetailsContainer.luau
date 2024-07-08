local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_CorePackages_0.FitFrame);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoList);
local v13 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v15.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v15.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_withStyle_0 = v6.Style.withStyle;
local l_getPageMargin_0 = v6.App.Container.getPageMargin;
local l_ShimmerPanel_0 = v6.App.Loading.ShimmerPanel;
local l_LoadableImage_0 = v6.App.Loading.LoadableImage;
local l_GridMetrics_0 = v6.App.Grid.GridMetrics;
local l_ItemTile_0 = v6.Tile.ItemTile;
local l_FitFrameVertical_0 = v7.FitFrameVertical;
local l_FitTextLabel_0 = v7.FitTextLabel;
local v26 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableOutfitAttribution);
local v27 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableAttributionItemRow);
local v28 = l_GridMetrics_0.makeCustomMetricsGetter({
    minimumItemsPerRow = 3, 
    minimumItemWidth = 110
});
local v29 = v2.PureComponent:extend("OutfitDetailsContainer");
v29.validateProps = v5.strictInterface({
    outfitId = v5.string, 
    itemType = if not v26 then nil else v5.optional(v5.string), 
    itemsGridRef = if not v26 then nil else v5.optional(v5.table), 
    NextSelectionUp = if not v26 then nil else v5.optional(v5.table), 
    showCustomOutfitNames = v5.boolean, 
    outfitInfo = if not v26 then nil else v5.optional(v5.table), 
    outfitName = v5.optional(v5.string), 
    itemsList = v5.optional(v5.array(v5.string)), 
    screenSize = v5.Vector2, 
    assetInfos = v5.table
});
v29.init = function(v30)
    v30.attributionRef = v2.createRef();
    v30.itemsGridRef = v30.props.itemsGridRef or v2.createRef();
    v30:setState({
        margin = l_getPageMargin_0(v30.props.screenSize.X)
    });
    v30.containerSizeChanged = function(v31)
        local v32 = l_getPageMargin_0(v31.AbsoluteSize.X);
        if v32 ~= v30.state.margin then
            v30:setState({
                margin = v32
            });
        end;
    end;
end;
v29.renderOutfitName = function(v33, v34)
    local l_Theme_0 = v34.Theme;
    local l_Font_0 = v34.Font;
    if not v33.props.outfitName then
        return v2.createElement(l_ShimmerPanel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, l_Font_0.Header1.RelativeSize * l_Font_0.BaseSize)
        });
    else
        return v2.createElement(l_FitTextLabel_0, {
            width = UDim.new(1, 0), 
            BackgroundTransparency = 1, 
            Text = v33.props.outfitName, 
            LayoutOrder = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, l_Font_0.Header1.RelativeSize * l_Font_0.BaseSize), 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextWrapped = true, 
            Font = l_Font_0.Header1.Font, 
            TextSize = l_Font_0.Header1.RelativeSize * l_Font_0.BaseSize
        });
    end;
end;
v29.renderOutfitThumbnail = function(v37)
    return v2.createElement("Frame", {
        LayoutOrder = 2, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, -24, 0, 300)
    }, {
        AspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1, 
            AspectType = Enum.AspectType.FitWithinMaxSize, 
            DominantAxis = Enum.DominantAxis.Width
        }), 
        MaxSize = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(math.huge, 300)
        }), 
        LoadableImage = v2.createElement(l_LoadableImage_0, {
            BackgroundTransparency = 1, 
            Image = l_getRbxthumbWithTypeSizeAndOptions_0(v37.props.outfitId, l_Constants_0.RbxthumbTypes.Outfit, 420), 
            Size = UDim2.fromScale(1, 1), 
            useShimmerAnimationWhileLoading = true
        })
    });
end;
v29.renderItem = function(v38, v39)
    local v40 = nil;
    local v41 = nil;
    if typeof(v39) ~= "table" then
        v41 = l_getRbxthumbWithTypeSizeAndOptions_0(v39, l_Constants_0.RbxthumbTypes.Asset, 150);
        local v42 = v38.props.assetInfos[v39];
        v40 = v42 and v42.name;
    end;
    return v2.createElement(l_ItemTile_0, {
        name = v40, 
        titleTextLineCount = v14.ItemTileTitleMaxLines, 
        thumbnail = v41
    });
end;
v29.renderItemsGrid = function(v43, v44)
    local l_itemsList_0 = v43.props.itemsList;
    local v46 = not not l_itemsList_0 and #l_itemsList_0 or v14.ShimmerCardsToDisplay;
    local l_Font_1 = v44.Font;
    local v48 = v13.GridItemHeightGetter(v14.ItemTileType.BundleItemTile, l_Font_1.BaseSize * l_Font_1.Header2.RelativeSize);
    local l_l_FitFrameVertical_0_0 = l_FitFrameVertical_0;
    if v26 then
        l_l_FitFrameVertical_0_0 = l_Focusable_0[l_FitFrameVertical_0];
    end;
    return v2.createElement(l_l_FitFrameVertical_0_0, {
        width = UDim.new(1, 0), 
        LayoutOrder = 3, 
        BackgroundTransparency = 1, 
        [v2.Ref] = if not v26 then nil else v43.itemsGridRef, 
        NextSelectionDown = if not v26 then nil else v43.attributionRef, 
        NextSelectionUp = if not v26 then nil else v43.props.NextSelectionUp
    }, {
        LoadableGridView = v2.createElement(v10, {
            getItemMetrics = v28, 
            items = l_itemsList_0, 
            totalNumItems = v46, 
            renderItem = function(v50)
                return v43:renderItem(v50);
            end, 
            getItemHeight = v48, 
            windowHeight = v43.props.screenSize.Y
        })
    });
end;
v29.renderWithProviders = function(v51, v52)
    local v53 = nil;
    local v54 = nil;
    if v26 then
        local l_outfitInfo_0 = v51.props.outfitInfo;
        v53 = not not l_outfitInfo_0 and l_outfitInfo_0.creatingUniverseId or nil;
        v54 = v52.Theme;
    end;
    local _ = nil;
    return v2.createElement(l_FitFrameVertical_0, {
        BackgroundColor3 = if not v26 then nil else v54.BackgroundDefault.Color, 
        BackgroundTransparency = not v26 and 1 or v54.BackgroundDefault.Transparency, 
        BorderSizePixel = if not v26 then nil else 0, 
        width = UDim.new(1, 0), 
        contentPadding = UDim.new(0, 24), 
        margin = if not v26 then v7.Rect.rectangle(v51.state.margin, 0) else v7.Rect.square(v51.state.margin), 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        [v2.Change.AbsoluteSize] = v51.containerSizeChanged
    }, {
        ItemName = v51.props.showCustomOutfitNames and v51:renderOutfitName(v52), 
        ItemThumbnail = v51:renderOutfitThumbnail(), 
        ItemsGrid = v51:renderItemsGrid(v52), 
        ItemInfoList = if not ((v26 and v27) and v53) then nil else v2.createElement(v12, {
            itemId = v51.props.outfitId, 
            outfitInfo = v51.props.outfitInfo, 
            itemType = v51.props.itemType, 
            LayoutOrder = 4, 
            attributionRef = v51.attributionRef, 
            NextSelectionUp = v51.itemsGridRef
        })
    });
end;
v29.render = function(v57)
    return l_withStyle_0(function(v58)
        return v57:renderWithProviders(v58);
    end);
end;
v29 = l_RoactAppPolicy_0.connect(function(v59, _)
    return {
        showCustomOutfitNames = v59.getCustomOutfitNames()
    };
end)(v29);
local v67 = l_memoize_0(function(v61)
    local v62 = {};
    for _, v64 in v61, nil, nil do
        for v65, _ in v64, nil, nil do
            table.insert(v62, v65);
        end;
    end;
    return v62;
end);
return v3.connect(function(v68, v69)
    local l_OutfitInfos_0 = v68.AvatarExperience.AvatarEditor.OutfitInfos;
    local v71 = nil;
    local v72 = nil;
    if l_OutfitInfos_0[v69.outfitId] then
        v71 = l_OutfitInfos_0[v69.outfitId].name;
        v72 = v67(l_OutfitInfos_0[v69.outfitId].assets);
    end;
    return {
        outfitInfo = if not v26 then nil else l_OutfitInfos_0[v69.outfitId], 
        outfitName = v71, 
        itemsList = v72, 
        screenSize = v68.ScreenSize, 
        assetInfos = v68.AvatarExperience.Common.AssetInfos
    };
end, nil)(v29);
