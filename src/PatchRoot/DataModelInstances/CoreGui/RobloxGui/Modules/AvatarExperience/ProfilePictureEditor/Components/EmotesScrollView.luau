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
local v10 = require(l_CorePackages_0.RoactNavigation);
local _ = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_Focusable_0 = v7.Focusable;
local l_FitFrameVertical_0 = v8.FitFrameVertical;
local l_GridMetrics_0 = v6.App.Grid.GridMetrics;
local l_withStyle_0 = v6.Style.withStyle;
local v18 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v20 = require(l_Modules_0.AvatarExperience.Common.Context.withAdaptiveScrolling);
local l_withNavigation_0 = v10.withNavigation;
local v22 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v23 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v25 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetUserInventory);
local v28 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Services.Analytics);
local v29 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Thunks.SetEmoteAssetId);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v33 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.PPEEmoteItemTile);
local v34 = require(l_Modules_0.AvatarExperience.Common.Components.RecommendedItems);
local v35 = v3.PureComponent:extend("EmotesScrollView");
local v36 = {
    [v32.Catalog] = true, 
    [v32.AvatarEditor] = true
};
v35.validateProps = v5.strictInterface({
    bottomBarHeight = v5.number, 
    NextSelectionLeft = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table), 
    baseRef = v5.table, 
    profilePictureEditorAnalytics = v5.table, 
    navigation = v5.table, 
    items = v5.array(v5.string), 
    screenSize = v5.Vector2, 
    hasMoreItems = v5.boolean, 
    emoteAssetId = v5.optional(v5.string), 
    avatarType = v5.string, 
    getUserInventory = v5.callback, 
    setEmoteAssetId = v5.callback, 
    focusController = v5.table, 
    avatarRoute = v31.Interface, 
    adaptiveScrolling = v5.optional(v5.any)
});
v35.init = function(v37)
    v37:setState({
        restorePreviousChildFocus = true, 
        loadableGridViewWidth = 0, 
        totalHeaderHeight = 0
    });
    v37.resultsListRef = v3.createRef();
    v37.absoluteSizeChanged = function(v38)
        v37:setState({
            totalHeaderHeight = v38.AbsoluteSize.Y
        });
    end;
    v37.onFocusGained = function()
        v37:setState({
            restorePreviousChildFocus = true
        });
    end;
    v37.onLoadableGridViewAbsoluteSizeChanged = function(v39)
        if v37.state.loadableGridViewWidth ~= v39.AbsoluteSize.X then
            v37:setState({
                loadableGridViewWidth = v39.AbsoluteSize.X
            });
        end;
    end;
    local v40, v41, v42 = v23.getEmotesCategorySubcategoryAndInfo();
    v37.categoryIndex = v40;
    v37.subcategoryIndex = v41;
    v37.categoryInfo = v42;
    v37.assetTypeKey = v37.categoryInfo.SearchUuid;
    v37.loadableGridViewRef = v3.createRef();
    v37.recommendedItemsRef = v3.createRef();
    v37.emptyStateRef = v3.createRef();
    v37.itemDetailsPeekViewRefs = v7.createRefCache();
    v37.loadMoreItems = function()
        return v37.props.getUserInventory(v37.categoryInfo);
    end;
    v37.sendShopForMoreAnalytics = function()
        v37.props.profilePictureEditorAnalytics.clickShopForMore(v37.categoryIndex, v37.subcategoryIndex);
    end;
end;
v35.renderItem = function(v43, v44, v45)
    if typeof(v44) == "table" then
        v44 = nil;
    end;
    return v3.createElement(v33, {
        itemId = v44, 
        isSelected = v44 == v43.props.emoteAssetId, 
        titleFontStyle = v45, 
        itemDetailsPeekViewRefs = v43.itemDetailsPeekViewRefs, 
        resultsListRef = v43.resultsListRef
    });
end;
v35.renderWithProviders = function(v46, v47, v48)
    local v49 = v46.props.hasMoreItems and #v46.props.items == 0;
    local l_categoryInfo_0 = v46.categoryInfo;
    local v51 = not v49 and v46.props.items or nil;
    local v52 = not not v51 and #v51 or v25.ShimmerCardsToDisplay;
    local v53 = v52 > 0;
    local l_bottomBarHeight_0 = v46.props.bottomBarHeight;
    local l_Font_0 = v47.Font;
    local l_Theme_0 = v47.Theme;
    local l_Font_1 = l_Font_0.Header2.Font;
    local v58 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local l_Header2_0 = l_Font_0.Header2;
    local v60 = l_Header2_0.RelativeSize * l_Font_0.BaseSize;
    if l_GridMetrics_0.makeCustomMetricsGetter(v24.ItemsGridMetrics)(v46.state.loadableGridViewWidth, v25.LoadableGridViewCellPadding).itemWidth / v60 < v25.MinTileWidthToFontHeightRatio then
        l_Header2_0 = l_Font_0.CaptionBody;
        v60 = l_Header2_0.RelativeSize * l_Font_0.BaseSize;
    end;
    local v61 = v22.GridItemHeightGetter(v25.ItemTileType.AvatarEditorTile, v60);
    local v62 = nil;
    v62 = if not v53 then v46.emptyStateRef else v46.loadableGridViewRef;
    local v63 = v48.noItemsLabel:gsub("({itemType})", v48.itemType);
    local v64 = v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        [v3.Change.AbsoluteSize] = v46.absoluteSizeChanged
    }, {
        SelectEmoteTextLabel = v3.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = l_Font_1, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            Text = v48.selectEmote, 
            TextSize = v58, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = true
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 18), 
                PaddingBottom = UDim.new(0, 18)
            })
        })
    });
    local l_totalHeaderHeight_0 = v46.state.totalHeaderHeight;
    local v66 = not v46.state.restorePreviousChildFocus and v46.onFocusGained or nil;
    local l_restorePreviousChildFocus_0 = v46.state.restorePreviousChildFocus;
    local l_key_0 = v46.props.avatarRoute.current.key;
    local v69 = l_key_0 and v46.itemDetailsPeekViewRefs[l_key_0];
    local v70 = v46.props.adaptiveScrolling or {};
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        Size = UDim2.new(1, 0, 1, -l_bottomBarHeight_0), 
        BorderSizePixel = 0, 
        NextSelectionLeft = v46.props.NextSelectionLeft, 
        NextSelectionRight = v46.props.NextSelectionRight, 
        NextSelectionDown = v46.props.NextSelectionDown, 
        NextSelectionUp = v46.props.NextSelectionUp, 
        [v3.Ref] = v46.props.baseRef, 
        defaultChild = v62, 
        restorePreviousChildFocus = v46.state.restorePreviousChildFocus
    }, {
        EmoteLabels = v64, 
        RefreshScrollingFrameWithLoadMore = if l_totalHeaderHeight_0 == 0 then nil else v3.createElement(v18, {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(0, l_totalHeaderHeight_0), 
            Size = UDim2.new(1, 0, 1, -l_totalHeaderHeight_0), 
            CanvasSize = UDim2.fromScale(1, 0), 
            onLoadMore = v46.props.hasMoreItems and v46.loadMoreItems, 
            hasMoreRows = v46.props.hasMoreItems, 
            createEndOfScrollElement = false, 
            parentAppPage = v32.ProfilePictureEditorEmotes, 
            initializing = v49, 
            onCanvasPositionChangedCallback = v70.onCanvasYChanged, 
            ScrollingEnabled = v70.scrollingEnabled
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            ListWrapper = v53 and v3.createElement(l_Focusable_0[l_FitFrameVertical_0], {
                width = UDim.new(1, 0), 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                margin = {
                    top = 0, 
                    bottom = v24.ItemsGridBottomPadding, 
                    left = v24.ItemsGridSidePadding / 2, 
                    right = v24.ItemsGridSidePadding / 2
                }, 
                NextSelectionDown = v46.recommendedItemsRef, 
                [v3.Ref] = v46.loadableGridViewRef
            }, {
                LoadableGridView = v3.createElement(v26, {
                    getItemMetrics = l_GridMetrics_0.makeCustomMetricsGetter(v24.ItemsGridMetrics), 
                    items = v51, 
                    totalNumItems = v52, 
                    renderItem = function(v71)
                        return v46:renderItem(v71, l_Header2_0);
                    end, 
                    getItemHeight = v61, 
                    windowHeight = v46.props.screenSize.Y, 
                    onAbsoluteSizeChanged = v46.onLoadableGridViewAbsoluteSizeChanged, 
                    onFocusGained = v66, 
                    restorePreviousChildFocus = l_restorePreviousChildFocus_0, 
                    NextSelectionRight = v69, 
                    [v3.Ref] = v46.resultsListRef
                })
            }), 
            NoEmotesLabel = not v53 and v3.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 48), 
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                Text = v63, 
                TextSize = v58, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            RecommendedItems = v3.createElement(v34, {
                LayoutOrder = 3, 
                categoryInfo = l_categoryInfo_0, 
                sendShopForMoreAnalytics = v46.sendShopForMoreAnalytics, 
                itemDetailsPeekViewRefs = v46.itemDetailsPeekViewRefs, 
                listFrameRef = v46.props.baseRef, 
                baseRef = v46.recommendedItemsRef, 
                NextSelectionUp = v46.loadableGridViewRef, 
                NextSelectionDown = v46.props.NextSelectionDown
            })
        })
    });
end;
v35.render = function(v72)
    return l_withStyle_0(function(v73)
        return l_withLocalization_0({
            itemType = "Feature.Catalog.Label.Emotes", 
            noItemsLabel = "Feature.Avatar.Label.NoItems", 
            selectEmote = "Feature.Avatar.Message.SelectEmote"
        })(function(v74)
            return v72:renderWithProviders(v73, v74);
        end);
    end);
end;
v35.didUpdate = function(v75, v76)
    local l_name_0 = v75.props.avatarRoute.current.name;
    local l_name_1 = v76.avatarRoute.current.name;
    if l_name_0 == v32.ProfilePictureEditorEmotes then
        if not v75.state.restorePreviousChildFocus then
            v75:setState({
                restorePreviousChildFocus = true
            });
            return ;
        end;
    elseif not (not (v36[l_name_0] and l_name_1 == v32.ProfilePictureEditorEmotes) or not v75.state.restorePreviousChildFocus) then
        v75:setState({
            restorePreviousChildFocus = false
        });
    end;
end;
v35.didMount = function(v79)
    if v79.props.hasMoreItems then
        v79.props.getUserInventory(v79.categoryInfo);
    end;
end;
v35 = v20((v30((v4.connect(function(v80, _)
    local _, _, v84 = v23.getEmotesCategorySubcategoryAndInfo();
    assert(v84.SearchUuid, "categoryInfo.SearchUuid is not nil: silences type checker");
    local l_SearchUuid_0 = v84.SearchUuid;
    return {
        items = v80.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[l_SearchUuid_0] or {}, 
        screenSize = v80.ScreenSize, 
        hasMoreItems = not v80.AvatarExperience.AvatarEditor.PageFinished[l_SearchUuid_0], 
        emoteAssetId = v80.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId, 
        avatarType = v80.AvatarExperience.AvatarEditor.Character.AvatarType
    };
end, function(v86)
    return {
        getUserInventory = function(v87)
            return v86(v27(v87));
        end, 
        setEmoteAssetId = function(v88, v89)
            return v86(v29(v88, v89));
        end
    };
end)((l_withNavigation_0(l_RoactServices_0.connect({
    profilePictureEditorAnalytics = v28
})(v35), nil)))))));
return function(v90)
    return v7.withFocusController(function(v91)
        return v3.createElement(v35, v2.Dictionary.join(v90, {
            focusController = v91
        }));
    end);
end;
