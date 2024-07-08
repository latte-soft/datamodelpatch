local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local v9 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v9.Style.withStyle;
local v11 = require(l_CorePackages_0.AvatarExperienceDeps);
local l_EmptyState_0 = v9.App.Indicator.EmptyState;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.AvatarEditor.Reducers.UserInventoryRecommendations);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Models.SortResults);
local l_FitFrameVertical_0 = v11.RoactFitComponents.FitFrameVertical;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v18 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_GridMetrics_0 = v9.App.Grid.GridMetrics;
local _ = require(l_Modules_0.AvatarExperience.Common.CategoryTypes);
local v21 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v24 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EmptyPage);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.ItemCard);
local v27 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v28 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v30 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.RecommendedItems);
local v33 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v34 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v35 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetUserInventory);
local v36 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfits);
local v37 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v38 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectOwnedItemIdToIsWearing);
local v39 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendShopForMoreAnalytics);
local v40 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v41 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.FetchMultiItems);
local v42 = require(l_Modules_0.LuaApp.Components.SignalConnection);
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local v44 = require(l_Modules_0.AvatarExperience.Flags.ColorPickerSliderIXPTest);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v46 = require(l_Modules_0.AvatarExperience.Common.Context.withAdaptiveScrolling);
local v47 = require(l_CorePackages_0.Promise);
local v48 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.FetchUserInventoryRecommendations);
local v49 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectUserInventoryRecommendationsFetchStatus);
local v50 = require(l_Modules_0.AvatarExperience.Flags.AEInfiniteScrollRecommendationsIXPTest);
local v51 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v52 = require(l_Modules_0.AvatarExperience.Flags.FFlagXBoxCreateCostumeEnabled);
local v53 = require(l_Modules_0.AvatarExperience.Flags.FFlagShowCreateCostumeXBoxSignalR);
local v54 = l_GuiService_0:IsTenFootInterface();
local l_ShimmerCardsToDisplay_0 = v33.ShimmerCardsToDisplay;
local l_AddOutfitButton_0 = v34.AddOutfitButton;
local v57 = v5.PureComponent:extend("ItemsList");
v57.init = function(v58)
    v58.state = {
        listWidth = 0, 
        restorePreviousChildFocus = true, 
        ownedItemIdToIsWearing = {}, 
        hasItemFromCurrentPageEquipped = false, 
        loadableGridViewWidth = 0
    };
    v58.lastYPosition = 0;
    v58.isMounted = false;
    v58.listFrameRef = v58.props.forwardRef or v5.createRef();
    v58.scrollingFrameRef = v5.createRef();
    v58.loadableGridViewRef = v5.createRef();
    v58.recommendedItemsRef = v5.createRef();
    v58.emptyStateRef = v5.createRef();
    v58.itemDetailsPeekViewRefs = v7.createRefCache();
    v58.resultsListRef = v5.createRef();
    v58.onLoadableGridViewAbsoluteSizeChanged = function(v59)
        if v58.state.loadableGridViewWidth ~= v59.AbsoluteSize.X then
            v58:setState({
                loadableGridViewWidth = v59.AbsoluteSize.X
            });
        end;
    end;
    v58.checkSetListWidth = function(v60)
        if not (not v60 or not v60:IsDescendantOf(game)) then
            v58:setState({
                listWidth = v60.AbsoluteSize.X
            });
        end;
    end;
    v58.loadMoreUserInventoryItems = function()
        local l_categoryInfo_0 = v58.props.categoryInfo;
        local l_networking_0 = v58.props.networking;
        local l_isOutfitsPage_0 = v58.props.isOutfitsPage;
        local l_assetTypeKey_0 = v58.props.assetTypeKey;
        local l_subButtonIndex_0 = v58.props.subButtonIndex;
        if not l_categoryInfo_0.Sort then
            if not l_isOutfitsPage_0 then
                return v58.props.getUserInventory(l_categoryInfo_0);
            else
                local v66 = l_assetTypeKey_0 == v34.EditableCharacterKey;
                local l_OutfitType_0 = l_categoryInfo_0.OutfitType;
                return v58.props.getOutfits(l_networking_0, l_assetTypeKey_0, v66, l_assetTypeKey_0 .. (l_OutfitType_0 or ""), l_OutfitType_0);
            end;
        else
            return v58.props.fetchMultiItems(l_networking_0, l_categoryInfo_0, l_subButtonIndex_0);
        end;
    end;
    if v50.isEnabled() then
        v58.loadMoreRecommendedItems = function(v68)
            if v58.props.userInventoryRecommendationsFetchStatus == v24.Fetching then
                return v47.resolve("Currently fetching");
            else
                local l_recommendationData_0 = v58.props.recommendationData;
                return v58.props.dispatchLoadMoreRecommendedItems(v58.props.networking, v58.props.categoryInfo, if not l_recommendationData_0 or v68 then nil else l_recommendationData_0.nextPageCursor, v68);
            end;
        end;
    end;
    v58.onFocusGained = function()
        v58:setState({
            restorePreviousChildFocus = true
        });
    end;
    v58.setParentRestorePreviousChildFocus = function(v70)
        if v58.isMounted then
            v58:setState({
                restorePreviousChildFocus = v70
            });
            return ;
        else
            return ;
        end;
    end;
    v58.sendShopForMoreAnalytics = function()
        v58.props.sendShopForMoreAnalytics(v58.props.avatarEditorAnalytics);
    end;
    v58.scrollBackToTop = function()
        local l_current_0 = v58.scrollingFrameRef.current;
        if l_current_0 then
            l_current_0:ScrollToTop();
        end;
    end;
end;
v57.renderNonOutfitItemCard = function(v72, v73, v74, v75)
    return v5.createElement(v26, {
        itemId = v73, 
        DEPRECATED_isOutfit = not not v51 and nil, 
        itemType = if not v51 then nil else v33.ItemType.Asset, 
        focusController = v74, 
        isWearingAssetOrOutfit = v72.props.ownedItemIdToIsWearing[v73], 
        titleFontStyle = v75, 
        itemDetailsPeekViewRefs = v72.itemDetailsPeekViewRefs, 
        resultsListRef = v72.resultsListRef
    });
end;
v57.getShowAddOutfitButton = function(v76)
    return ((v53 or v52) or not v54) and v76.props.assetTypeKey == v34.EditableCharacterKey;
end;
v57.renderNonOutfitItemCardWithOverlay = function(v77, v78, v79, v80, v81)
    if typeof(v81) == "table" then
        v81 = nil;
    end;
    if not v77.props.darkenItemsGrid then
        return v77:renderNonOutfitItemCard(v81, v78, v80);
    else
        return v5.createFragment({
            GamepadDarkOverlay = v5.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = v79.Theme.Overlay.Transparency, 
                BackgroundColor3 = v79.Theme.Overlay.Color
            }, {
                UICorner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                })
            }), 
            ItemCard = v77:renderNonOutfitItemCard(v81, v78, v80)
        });
    end;
end;
v57.renderGenericItemCard = function(v82, v83, v84, v85, v86)
    if v82.props.outfitOrAsset[v86] == v34.OutfitOrAsset.Outfit then
        return v82:renderOutfitItemCard(v86, v85);
    else
        return v82:renderNonOutfitItemCardWithOverlay(v83, v84, v85, v86);
    end;
end;
v57.renderOutfitItemCard = function(v87, v88, v89)
    if typeof(v88) == "table" then
        v88 = nil;
    end;
    return v5.createElement(v26, {
        itemId = v88, 
        DEPRECATED_isOutfit = not v51 and true or nil, 
        itemType = if not v51 then nil else v33.ItemType.Outfit, 
        isWearingAssetOrOutfit = v87.props.ownedItemIdToIsWearing[v88], 
        hasItemFromCurrentPageEquipped = v87.props.hasItemFromCurrentPageEquipped, 
        titleFontStyle = v89, 
        itemDetailsPeekViewRefs = v87.itemDetailsPeekViewRefs, 
        resultsListRef = v87.resultsListRef
    });
end;
v57.renderRecommendedItems = function(v90, v91, v92, v93)
    local l_RecommendationsType_0 = v91.RecommendationsType;
    if l_RecommendationsType_0 then
        l_RecommendationsType_0 = false;
        if v91.RecommendationsType ~= v34.RecommendationsType.None then
            l_RecommendationsType_0 = v90.props.pageFinished;
        end;
    end;
    if l_RecommendationsType_0 then
        local l_sendShopForMoreAnalytics_0 = v90.sendShopForMoreAnalytics;
        local v96 = nil;
        if v90.props.infiniteScrollRecommendationsEnabledForUser then
            v96 = if not v90.props.recommendationData then {} else v90.props.recommendationData.items;
        end;
        return v5.createElement(v32, {
            LayoutOrder = 2, 
            categoryInfo = v91, 
            sendShopForMoreAnalytics = l_sendShopForMoreAnalytics_0, 
            baseRef = v90.recommendedItemsRef, 
            NextSelectionUp = if v90.props.darkenItemsGrid then nil else v92 and v90.loadableGridViewRef or v90.props.NextSelectionUp, 
            itemDetailsPeekViewRefs = v90.itemDetailsPeekViewRefs, 
            listFrameRef = v93 or v90.listFrameRef, 
            itemsOverride = v96
        });
    else
        return nil;
    end;
end;
v57.renderItemsList = function(v97, v98)
    local l_categoryInfo_1 = v97.props.categoryInfo;
    local l_dataStatus_0 = v97.props.dataStatus;
    local l_hasMoreUserInventoryItems_0 = v97.props.hasMoreUserInventoryItems;
    local l_screenSize_0 = v97.props.screenSize;
    local l_ownedItemIds_0 = v97.state.ownedItemIds;
    local l_itemsContainsOutfits_0 = v97.state.itemsContainsOutfits;
    local l_listWidth_0 = v97.state.listWidth;
    local v106;
    if l_ownedItemIds_0 then
        v106 = true;
        if not (#l_ownedItemIds_0 <= 0) then
            goto label0;
        end;
    end;
    v106 = false;
    ::label0::;
    local v107 = false;
    if l_dataStatus_0 == v24.Fetching then
        v107 = not v106;
    end;
    local v108 = true;
    if l_dataStatus_0 ~= v24.NotStarted then
        v108 = v107;
    end;
    local v109 = if v34.ItemsGridSidePadding < l_listWidth_0 then v34.ItemsGridSidePadding else 0;
    local l_l_ownedItemIds_0_0 = l_ownedItemIds_0;
    if not (not (not (not l_ownedItemIds_0 or not l_itemsContainsOutfits_0) and l_ownedItemIds_0[1] ~= l_AddOutfitButton_0) or not v97:getShowAddOutfitButton()) then
        l_l_ownedItemIds_0_0 = v4.List.join({
            l_AddOutfitButton_0
        }, l_ownedItemIds_0);
        v106 = true;
    end;
    local v111 = not not l_l_ownedItemIds_0_0 and #l_l_ownedItemIds_0_0 or l_ShimmerCardsToDisplay_0;
    local v112 = false;
    if v97.props.ownedItemIdsBySubtype[v97.props.assetTypeKey] ~= nil then
        v112 = #v97.props.ownedItemIdsBySubtype[v97.props.assetTypeKey] > 0;
    end;
    if not v108 then
        if not (l_l_ownedItemIds_0_0 or not v112) then
            v111 = l_ShimmerCardsToDisplay_0;
        end;
    else
        l_l_ownedItemIds_0_0 = nil;
        v111 = l_ShimmerCardsToDisplay_0;
    end;
    local v113 = (v106 or v108) or v112;
    local v114 = v97.props.adaptiveScrolling or {};
    return l_withStyle_0(function(v115)
        local v116 = nil;
        local v117 = nil;
        local l_Font_0 = v115.Font;
        v116 = l_Font_0.Header2;
        v117 = v116.RelativeSize * l_Font_0.BaseSize;
        if l_GridMetrics_0.makeCustomMetricsGetter(v34.ItemsGridMetrics)(v97.state.loadableGridViewWidth, v33.LoadableGridViewCellPadding).itemWidth / v117 < v33.MinTileWidthToFontHeightRatio then
            v116 = l_Font_0.CaptionBody;
            v117 = v116.RelativeSize * l_Font_0.BaseSize;
        end;
        local v119 = nil;
        if not v51 then
            v119 = not l_itemsContainsOutfits_0 and function(v120)
                return v97:renderNonOutfitItemCardWithOverlay(v98, v115, v116, v120);
            end or function(v121)
                return v97:renderOutfitItemCard(v121, v116);
            end;
            if l_categoryInfo_1.Sort then
                v119 = function(v122)
                    return v97:renderGenericItemCard(v98, v115, v116, v122);
                end;
            end;
        else
            v119 = if not l_categoryInfo_1.Sort then l_itemsContainsOutfits_0 and function(v123)
                return v97:renderOutfitItemCard(v123, v116);
            end or function(v124)
                return v97:renderNonOutfitItemCardWithOverlay(v98, v115, v116, v124);
            end else function(v125)
                return v97:renderGenericItemCard(v98, v115, v116, v125);
            end;
        end;
        local l_forwardRef_0 = v97.props.forwardRef;
        local l_key_0 = v97.props.avatarRoute.current.key;
        local l_recommendedItemsRef_0 = v97.recommendedItemsRef;
        local v129 = nil;
        v129 = if not v97.props.categoryInfo.HideTextUnderTile then v27.GridItemHeightGetter(v33.ItemTileType.AvatarEditorTile, v117) else v27.GridItemHeightGetter(v33.ItemTileType.AvatarEditorTile);
        local v130 = false;
        local v131 = nil;
        if not v97.props.infiniteScrollRecommendationsEnabledForUser then
            v130 = l_hasMoreUserInventoryItems_0;
            v131 = v130 and v97.loadMoreUserInventoryItems;
        else
            local l_recommendationData_1 = v97.props.recommendationData;
            local v133 = if not l_recommendationData_1 then nil else l_recommendationData_1.items;
            local v134 = v133 and #v133 ~= 0;
            local v135 = if not l_recommendationData_1 then nil else l_recommendationData_1.nextPageCursor;
            local v136 = (v134 and v135) and v135 ~= "";
            v131 = nil;
            v130 = false;
            if not l_hasMoreUserInventoryItems_0 then
                if v136 then
                    v131 = v97.loadMoreRecommendedItems;
                    v130 = true;
                end;
            else
                v131 = v97.loadMoreUserInventoryItems;
                v130 = true;
            end;
        end;
        local l_backToTopSignal_0 = v97.props.backToTopSignal;
        return v5.createElement(v28, {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            onLoadMore = v131, 
            hasMoreRows = v130, 
            createEndOfScrollElement = false, 
            parentAppPage = v22.AvatarEditor, 
            initializing = v107 or v108, 
            ScrollingEnabled = v114.scrollingEnabled, 
            onCanvasPositionChangedCallback = v114.onCanvasYChanged, 
            [v5.Ref] = v97.scrollingFrameRef
        }, {
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            BackToTopSignal = if not l_backToTopSignal_0 then nil else v5.createElement(v42, {
                signal = l_backToTopSignal_0, 
                callback = v97.scrollBackToTop
            }), 
            ListWrapper = v5.createElement(l_Focusable_0[l_FitFrameVertical_0], {
                width = UDim.new(1, 0), 
                LayoutOrder = 1, 
                BackgroundTransparency = not not v97.props.darkenItemsGrid and v115.Theme.Overlay.Transparency or 1, 
                BackgroundColor3 = not not v97.props.darkenItemsGrid and v115.Theme.Overlay.Color or nil, 
                margin = {
                    top = v34.ItemsGridTopPadding, 
                    bottom = v34.ItemsGridBottomPadding, 
                    left = v109 / 2, 
                    right = v109 / 2
                }, 
                [v5.Ref] = v97.loadableGridViewRef
            }, {
                LoadableGridView = not not v113 and v5.createElement(v31, {
                    getItemMetrics = l_GridMetrics_0.makeCustomMetricsGetter(v34.ItemsGridMetrics), 
                    items = l_l_ownedItemIds_0_0, 
                    totalNumItems = v111, 
                    renderItem = v119, 
                    getItemHeight = v129, 
                    windowHeight = l_screenSize_0.Y, 
                    NextSelectionDown = l_recommendedItemsRef_0, 
                    NextSelectionUp = v97.props.NextSelectionUp, 
                    NextSelectionRight = l_key_0 and v97.itemDetailsPeekViewRefs[l_key_0], 
                    onFocusGained = not v97.state.restorePreviousChildFocus and v97.onFocusGained or nil, 
                    restorePreviousChildFocus = v97.state.restorePreviousChildFocus, 
                    onAbsoluteSizeChanged = v97.onLoadableGridViewAbsoluteSizeChanged, 
                    [v5.Ref] = v97.resultsListRef
                }) or v5.createElement(v25, {
                    page = l_categoryInfo_1, 
                    NextSelectionUp = v97.props.NextSelectionUp, 
                    NextSelectionDown = l_recommendedItemsRef_0
                })
            }), 
            RecommendedItems = v97:renderRecommendedItems(l_categoryInfo_1, v106, l_forwardRef_0)
        });
    end);
end;
v57.render = function(v138)
    return v7.withFocusController(function(v139)
        return v138:renderWithProviders(v139);
    end);
end;
v57.renderWithProviders = function(v140, v141)
    local v142 = v140.props.dataStatus == v24.Failed;
    local v144 = l_withLocalization_0({
        noItemsFound = "Feature.Catalog.Response.NoItemsFound"
    })(function(v143)
        return v5.createElement(l_EmptyState_0, {
            onActivated = function()
                v140.loadMoreUserInventoryItems();
                if l_wasLastInputGamepad_0() then
                    v140:setState({
                        restorePreviousChildFocus = false
                    });
                    v141.moveFocusTo(v140.props.NextSelectionUp);
                end;
            end or v140.loadMoreUserInventoryItems, 
            text = v143.noItemsFound, 
            [v5.Ref] = v140.emptyStateRef, 
            NextSelectionUp = v140.props.NextSelectionUp
        });
    end);
    local v145 = false;
    if v140.props.ownedItemIdsBySubtype[v140.props.assetTypeKey] ~= nil then
        v145 = #v140.props.ownedItemIdsBySubtype[v140.props.assetTypeKey] > 0;
    end;
    local v146 = v140:getShowAddOutfitButton();
    local _ = nil;
    return v5.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v5.Change.AbsoluteSize] = v140.checkSetListWidth, 
        [v5.Event.AncestryChanged] = v140.checkSetListWidth, 
        [v5.Ref] = v140.props.forwardRef or v140.listFrameRef, 
        defaultChild = if not v142 then if v145 or v146 then v140.loadableGridViewRef else v140.recommendedItemsRef else v140.emptyStateRef, 
        restorePreviousChildFocus = v140.state.restorePreviousChildFocus, 
        inputBindings = v140.props.avatarRoute.current.name ~= v22.ItemDetails and {
            NavUp = v7.Input.onBegin(Enum.KeyCode.ButtonB, function()
                if not v140.props.NextSelectionUp then
                    if v140.props.buttonBInputRef then
                        v141.moveFocusTo(v140.props.buttonBInputRef);
                    end;
                    return ;
                else
                    v141.moveFocusTo(v140.props.NextSelectionUp);
                    return ;
                end;
            end)
        } or nil, 
        onFocusChanged = v140.props.onFocusChanged
    }, {
        FailedState = v142 and v144, 
        ItemsList = not v142 and v140:renderItemsList(v141)
    });
end;
local function v159(v148, v149, v150)
    local v151 = {};
    if v150 then
        local v152 = v148[v150];
        if v152 then
            if not v149 or #v149 == 0 then
                return v152;
            else
                local v153 = {};
                local v154 = 0;
                for v155 = 1, #v149 do
                    local v156 = v149[v155];
                    v153[v156] = true;
                    v151[v155] = v156;
                    v154 = v155;
                end;
                for v157 = 1, #v152 do
                    local v158 = v152[v157];
                    if not v153[v158] then
                        v154 = v154 + 1;
                        v151[v154] = v158;
                    end;
                end;
                return v151;
            end;
        else
            return v151;
        end;
    else
        return v151;
    end;
end;
v57.getEquippedOutfit = function(v160, v161)
    local l_outfitInfos_0 = v160.props.outfitInfos;
    local l_ownedItemIdsBySubtype_0 = v160.props.ownedItemIdsBySubtype;
    local l_avatarType_0 = v160.props.avatarType;
    local l_bodyColors_0 = v160.props.bodyColors;
    local l_bodyColor3s_0 = v160.props.bodyColor3s;
    local l_equippedAssets_0 = v160.props.equippedAssets;
    local l_scales_0 = v160.props.scales;
    local v169 = l_ownedItemIdsBySubtype_0[v161];
    if v169 then
        for _, v171 in v169, nil, nil do
            local v172 = l_outfitInfos_0[tostring(v171)];
            if not (not v172 or not v30.isWearingOutfitNoState(v172, l_avatarType_0, l_bodyColors_0, l_bodyColor3s_0, l_equippedAssets_0, l_scales_0)) then
                return v171;
            end;
        end;
        return nil;
    else
        return nil;
    end;
end;
v57.updateItems = function(v173, v174)
    local l_assetTypeKey_1 = v173.props.assetTypeKey;
    local l_categoryInfo_2 = v173.props.categoryInfo;
    local l_equippedEmote_0 = v173.props.equippedEmote;
    local l_equippedAssets_1 = v173.props.equippedAssets;
    local l_isOutfitsPage_1 = v173.props.isOutfitsPage;
    local l_initialEquippedAssets_0 = v173.state.initialEquippedAssets;
    local l_ownedItemIdsBySubtype_1 = v173.props.ownedItemIdsBySubtype;
    local v182 = l_categoryInfo_2.PageType == v33.PageType.Emotes;
    if v174 then
        local v183 = nil;
        if not v182 then
            if not l_isOutfitsPage_1 then
                v183 = v30.getEquippedAssetIdsForCategory(l_equippedAssets_1, l_categoryInfo_2);
            else
                local v184 = v173:getEquippedOutfit(l_assetTypeKey_1);
                v183 = not not v184 and {
                    [v184] = {}
                } or {};
            end;
        else
            v183 = not not l_equippedEmote_0 and {
                [l_equippedEmote_0.assetId] = {}
            } or {};
        end;
        l_initialEquippedAssets_0 = v183;
        v173:setState({
            initialEquippedAssets = v183
        });
    end;
    local v185;
    v185 = v159(l_ownedItemIdsBySubtype_1, l_initialEquippedAssets_0, l_assetTypeKey_1) and (((l_isOutfitsPage_1 and v185[1] ~= l_AddOutfitButton_0) and v173:getShowAddOutfitButton()) and v4.List.join({
        l_AddOutfitButton_0
    }, v185));
    v173:setState({
        ownedItemIds = v185, 
        itemsContainsOutfits = l_isOutfitsPage_1
    });
end;
v57.didMount = function(v186)
    v186.isMounted = true;
    v186.checkSetListWidth((v186.props.forwardRef or v186.listFrameRef).current);
    if v186.props.dataStatus == v24.NotStarted then
        v186.loadMoreUserInventoryItems();
    else
        v186:updateItems(true);
    end;
    if v186.props.infiniteScrollRecommendationsEnabledForUser then
        local l_recommendationData_2 = v186.props.recommendationData;
        local v188 = if not l_recommendationData_2 then nil else l_recommendationData_2.items;
        local v189 = v188 and #v188 ~= 0;
        if not (v186.props.userInventoryRecommendationsFetchStatus ~= v24.NotStarted and v189) then
            v186.loadMoreRecommendedItems();
        end;
    end;
end;
v57.willUnmount = function(v190)
    v190.isMounted = false;
end;
v57.didUpdate = function(v191, v192, _)
    local l_name_0 = v191.props.avatarRoute.current.name;
    local l_name_1 = v191.props.avatarRoute.opaque.name;
    local l_name_2 = v192.avatarRoute.opaque.name;
    local l_categoryInfo_3 = v191.props.categoryInfo;
    local l_dataStatus_1 = v191.props.dataStatus;
    local l_dataStatus_2 = v192.dataStatus;
    local l_ownedItemIdsBySubtype_2 = v191.props.ownedItemIdsBySubtype;
    local v201 = v191.props.emoteSlot ~= v192.emoteSlot;
    local v202 = v191.props.assetTypeKey ~= v192.assetTypeKey;
    local v203 = v191.props.categoryIndex ~= v192.categoryIndex;
    local v204 = v191.props.subcategoryIndex ~= v192.subcategoryIndex;
    local v205 = l_ownedItemIdsBySubtype_2 ~= v192.ownedItemIdsBySubtype;
    local v206 = v203 or v204;
    if not ((not (l_name_0 == v22.AvatarEditor) or not v206) or not l_categoryInfo_3.RenderItemTiles) and l_dataStatus_1 == v24.NotStarted then
        v191.loadMoreUserInventoryItems();
    end;
    if v191.props.infiniteScrollRecommendationsEnabledForUser then
        local l_recommendationData_3 = v191.props.recommendationData;
        local v208 = if not l_recommendationData_3 then nil else l_recommendationData_3.items;
        local v209 = v208 and #v208 ~= 0;
        local v210 = false;
        if not (not v206 or not v209) and v34.RecommendationsExpirationTime < tick() - l_recommendationData_3.initialStorageTime then
            v210 = true;
        end;
        local v211 = v206 and not v209;
        if not (not (not (v191.props.userInventoryRecommendationsFetchStatus ~= v24.NotStarted) or v211) and not v210) then
            v191.loadMoreRecommendedItems(v210);
        end;
    end;
    if not (not v203 and not v204) then
        local l_current_1 = v191.scrollingFrameRef.current;
        if l_current_1 then
            l_current_1.CanvasPosition = Vector2.new(0, 0);
        end;
        v191:setState({
            restorePreviousChildFocus = false
        });
    end;
    local v213 = false;
    if l_dataStatus_1 == v24.Done then
        v213 = l_dataStatus_2 == v24.Fetching;
    end;
    if not (not ((v202 or v201) or v205) and not v213) then
        v191:updateItems((v202 or v201) or v213);
    end;
    if l_name_1 ~= l_name_2 and l_name_1 == v22.AvatarEditor then
        local v214 = v191.scrollingFrameRef:getValue();
        if v214 then
            v214.CanvasPosition = Vector2.new(0, 0);
            v191.setParentRestorePreviousChildFocus(false);
        end;
    end;
end;
local function v235(v215, v216)
    local l_category_0 = v215.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v215.AvatarExperience.AvatarEditor.Categories.subcategory;
    local l_selectedSlot_0 = v215.AvatarExperience.AvatarEditor.EquippedEmotes.selectedSlot;
    local l_slotInfo_0 = v215.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo;
    local v221 = v27.getAvatarEditorCategoryInfoFromState(v215);
    local v222 = v221.RenderOutfitItemTiles == true;
    local v223 = v30.selectAssetTypeKey(v215);
    local l_Failed_0 = v24.Failed;
    local v225 = false;
    if v223 then
        l_Failed_0 = if not v222 then l_PerformFetch_0.GetStatus(v215, (v27.getPerformFetchKey(v223, v222, v221.OutfitType))) else l_PerformFetch_0.GetStatus(v215, (v27.getPerformFetchKey(v223, v222, v221.OutfitType)));
        local v226, _ = v30.getSearchUuidAndAssetTypes(v221, v215.AvatarExperience.AvatarEditor.Categories.subButton);
        if v221.Sort then
            l_Failed_0 = l_PerformFetch_0.GetStatus(v215, v226);
        end;
        v225 = not v215.AvatarExperience.AvatarEditor.PageFinished[v223];
    end;
    local v228, v229 = v38(v215, v223);
    local v230 = nil;
    local v231 = nil;
    if v216.infiniteScrollRecommendationsEnabledForUser then
        if not (not v221.SearchUuid or not v215.AvatarExperience.AvatarEditor.UserInventoryRecommendations) then
            v230 = v215.AvatarExperience.AvatarEditor.UserInventoryRecommendations[v221.SearchUuid];
        end;
        v231 = v49(v215, v221.SearchUuid);
    end;
    local v232 = v27.getNextPageCursorKey(v223, v222, v221.OutfitType);
    local v233 = nil;
    local v234 = nil;
    if not v216.colorPickerSliderEnabled then
        v233 = v215.AvatarExperience.AvatarEditor.Character.BodyColors;
    else
        v234 = v215.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    end;
    return {
        pageFinished = v215.AvatarExperience.AvatarEditor.PageFinished[v232], 
        categoryInfo = v221, 
        dataStatus = l_Failed_0, 
        hasMoreUserInventoryItems = v225, 
        assetTypeKey = v223, 
        categoryIndex = l_category_0, 
        subcategoryIndex = l_subcategory_0, 
        emoteSlot = l_selectedSlot_0, 
        equippedEmote = l_slotInfo_0[l_selectedSlot_0], 
        isOutfitsPage = v222, 
        ownedItemIdToIsWearing = v228, 
        hasItemFromCurrentPageEquipped = v229, 
        outfitInfos = v215.AvatarExperience.AvatarEditor.OutfitInfos, 
        avatarType = v215.AvatarExperience.AvatarEditor.Character.AvatarType, 
        bodyColors = v233, 
        bodyColor3s = v234, 
        scales = v215.AvatarExperience.AvatarEditor.Character.AvatarScales, 
        equippedAssets = v215.AvatarExperience.AvatarEditor.Character.EquippedAssets, 
        outfitOrAsset = v215.AvatarExperience.AvatarEditor.Character.OutfitOrAsset, 
        ownedItemIdsBySubtype = v215.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype, 
        screenSize = v215.ScreenSize, 
        recommendationData = v230, 
        userInventoryRecommendationsFetchStatus = v231
    };
end;
local function _(v236)
    if v236.RecommendationsType ~= v34.RecommendationsType.Asset then
        return nil;
    else
        return v27.getRecommendedAssetTypeIdStringFromCategoryInfo(v236);
    end;
end;
local function v239(v238)
    if v238.RecommendationsType == v34.RecommendationsType.BodyParts then
        return v33.BundleTypeIdStrings.BodyParts;
    elseif v238.RecommendationsType == v34.RecommendationsType.AvatarAnimations then
        return v33.BundleTypeIdStrings.Animations;
    elseif v238.RecommendationsType == v34.RecommendationsType.Shoes then
        return v33.BundleTypeIdStrings.Shoes;
    elseif v238.RecommendationsType == v34.RecommendationsType.DynamicHeads then
        return v33.BundleTypeIdStrings.DynamicHead;
    else
        return nil;
    end;
end;
v57 = v46((v21.connectTestVariables({
    infiniteScrollRecommendationsEnabledForUser = v50.EnabledForUser, 
    colorPickerSliderEnabled = v44.EnabledForUser
})((v37((v6.connect(v235, function(v240)
    return {
        getUserInventory = function(v241)
            return v240(v35(v241));
        end, 
        getOutfits = function(v242, v243, v244, v245, v246)
            return v240(v36(v242, v243, v244, v245, v246));
        end, 
        sendShopForMoreAnalytics = function(v247)
            v240(v39(v247));
        end, 
        fetchMultiItems = function(v248, v249, v250)
            return v240(v41(v248, v249, v250));
        end, 
        dispatchLoadMoreRecommendedItems = function(v251, v252, v253, v254)
            local l_DefaultUserRecommendationsFetchSize_0 = v34.DefaultUserRecommendationsFetchSize;
            local v256 = if v252.RecommendationsType ~= v34.RecommendationsType.Asset then nil else v27.getRecommendedAssetTypeIdStringFromCategoryInfo(v252);
            local v257 = nil;
            if v256 == nil then
                v257 = v239(v252);
            end;
            if not (v256 == nil) or v257 ~= nil then
                return v240(v48(v251, v252.SearchUuid, v254, {
                    limit = l_DefaultUserRecommendationsFetchSize_0, 
                    assetTypeId = if not v256 then nil else tonumber(v256), 
                    bundleTypeId = if not v257 then nil else tonumber(v257), 
                    cursor = v253
                }));
            else
                return nil;
            end;
        end
    };
end)((l_RoactServices_0.connect({
    networking = v18, 
    avatarEditorAnalytics = v40
})(v57)))))))));
return v5.forwardRef(function(v258, v259)
    return v5.createElement(v57, v4.Dictionary.join(v258, {
        forwardRef = v259
    }));
end);
