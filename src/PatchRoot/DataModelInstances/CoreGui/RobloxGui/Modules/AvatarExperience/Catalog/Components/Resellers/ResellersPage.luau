local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Promise);
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(l_CorePackages_0.AvatarExperienceDeps);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.CenteredModalView);
local l_FitFrameVertical_0 = v7.RoactFitComponents.FitFrameVertical;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v12 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v16 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v16.Focusable;
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v21 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseFocusedScreen);
local v22 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v23 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v26 = require(l_Modules_0.AvatarExperience.Catalog.Components.Resellers.AssetResellerCard);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.Components.Resellers.CollectibleResellerCard);
local v28 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v31 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetResellers);
local v33 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances);
local v34 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResellerCursor);
local v35 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v36 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v36.Style.withStyle;
local l_DefaultMetricsGridView_0 = v36.App.Grid.DefaultMetricsGridView;
local l_GridMetrics_0 = v36.App.Grid.GridMetrics;
local l_LoadingStateContainer_0 = v36.App.Container.LoadingStateContainer;
local l_RetrievalStatus_1 = v36.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v36.App.Indicator.EmptyState;
local v43 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v44 = v3.PureComponent:extend("ResellersPage");
v44.init = function(v45)
    v45.nextPageCursor = nil;
    v45.gridViewRef = v3.createRef();
    v45.topBarRef = v3.createRef();
    v45.focusController = v45.props.focusController or v16.createFocusController();
    v45.fetchAssetResellers = function()
        local l_networking_0 = v45.props.networking;
        local l_itemId_0 = v45.props.itemId;
        local l_collectibleItemId_0 = v45.props.collectibleItemId;
        if not l_collectibleItemId_0 then
            return v45.props.fetchAssetResellers(l_networking_0, l_itemId_0);
        else
            return v45.props.fetchCollectibleResellers(l_networking_0, l_collectibleItemId_0, nil);
        end;
    end;
    v45.loadMoreItems = function()
        local l_networking_1 = v45.props.networking;
        local l_itemId_1 = v45.props.itemId;
        local l_collectibleItemId_1 = v45.props.collectibleItemId;
        local l_resellerCursor_0 = v45.props.resellerCursor;
        if v45.props.fetchingStatus == l_RetrievalStatus_0.Fetching then
            return v5.resolve("Currently fetching");
        elseif not l_collectibleItemId_1 then
            return v45.props.loadMoreItems(l_networking_1, l_itemId_1, l_resellerCursor_0);
        else
            return v45.props.fetchCollectibleResellers(l_networking_1, l_collectibleItemId_1, l_resellerCursor_0);
        end;
    end;
    v45.renderCard = function(v53, _, v55)
        return l_withStyle_0(function(v56)
            local l_Theme_0 = v56.Theme;
            return v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 8), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                BackgroundTransparency = 1, 
                LayoutOrder = v55
            }, {
                AssetResellerCard = v3.createElement(v26, {
                    LayoutOrder = 1, 
                    itemId = v45.props.itemId, 
                    itemType = v45.props.itemType, 
                    productId = v45.props.productId, 
                    userAssetId = v53, 
                    horizontalPadding = 24, 
                    focusController = v45.focusController
                }), 
                Divider = v3.createElement("Frame", {
                    BackgroundColor3 = l_Theme_0.Divider.Color, 
                    BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, -24, 0, 1)
                })
            });
        end);
    end;
    v45.renderCollectibleCard = function(v58, _, v60)
        local l_collectibleItemId_2 = v45.props.collectibleItemId;
        return l_withStyle_0(function(v62)
            local l_Theme_1 = v62.Theme;
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = v60, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0)
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 8)
                }), 
                CollectibleResellerCard = v3.createElement(v27, {
                    LayoutOrder = 1, 
                    itemId = v45.props.itemId, 
                    collectibleItemId = l_collectibleItemId_2, 
                    collectibleInstanceId = v58, 
                    itemType = v45.props.itemType, 
                    horizontalPadding = 24, 
                    focusController = v45.focusController
                }), 
                Divider = v3.createElement("Frame", {
                    BackgroundColor3 = l_Theme_1.Divider.Color, 
                    BackgroundTransparency = l_Theme_1.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 1)
                })
            });
        end);
    end;
    v45.goBack = function()
        v45.props.closeFocusedScreen(v45.props.navigation);
    end;
end;
v44.didMount = function(v64)
    v64.fetchAssetResellers();
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    if l_l_UserInputService_0_LastInputType_0 then
        v64:setState({
            lastInputType = l_l_UserInputService_0_LastInputType_0
        });
    end;
    if l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0) then
        v64.focusController.captureFocus();
    end;
end;
v44.willUpdate = function(v66, v67, _)
    local v69 = v66.props.purchaseFetchingState == l_RetrievalStatus_0.Fetching;
    local v70 = true;
    if v67.purchaseFetchingState ~= l_RetrievalStatus_0.Done then
        v70 = v67.purchaseFetchingState == l_RetrievalStatus_0.Failed;
    end;
    if not (not v69 or not v70) then
        v66.fetchAssetResellers();
    end;
end;
v44.didUpdate = function(v71, v72)
    local l_fetchingStatus_0 = v71.props.fetchingStatus;
    if (l_isGamepadInput_0(v71.state.lastInputType) and l_fetchingStatus_0 == l_RetrievalStatus_0.Done) and v72.fetchingStatus ~= l_RetrievalStatus_0.Done then
        v71.focusController.captureFocus();
    end;
end;
v44.willUnmount = function(v74)
    v74.props.clearResellerCursor();
end;
v44.renderOnLoaded = function(v75)
    return v3.createElement(v12.PageContent, {}, {
        Content = v75:renderContent()
    });
end;
v44.renderContent = function(v76)
    local l_screenSize_0 = v76.props.screenSize;
    local l_globalGuiInset_0 = v76.props.globalGuiInset;
    local l_resellerUserAssetIds_0 = v76.props.resellerUserAssetIds;
    local l_hasMoreRows_0 = v76.props.hasMoreRows;
    local l_collectibleResellersInstancesIds_0 = v76.props.collectibleResellersInstancesIds;
    if l_resellerUserAssetIds_0 or l_collectibleResellersInstancesIds_0 then
        local v82 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
        return v3.createElement(v28, {
            Position = UDim2.fromScale(0, 0), 
            Size = UDim2.fromScale(1, 1), 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            refresh = v76.fetchAssetResellers, 
            onLoadMore = l_hasMoreRows_0 and v76.loadMoreItems, 
            createEndOfScrollElement = not l_hasMoreRows_0, 
            hasMoreRows = l_hasMoreRows_0
        }, {
            UIPadding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 24)
            }), 
            ResellerGridView = v3.createElement(l_Focusable_0[l_DefaultMetricsGridView_0], {
                renderItem = if not l_collectibleResellersInstancesIds_0 then v76.renderCard else v76.renderCollectibleCard, 
                windowHeight = v82.Y.Offset, 
                getItemHeight = function(_)
                    return 100;
                end, 
                getItemMetrics = l_GridMetrics_0.makeCustomMetricsGetter({
                    minimumItemsPerRow = 1, 
                    minimumItemWidth = v82.X.Offset
                }), 
                itemPadding = Vector2.new(0, 12), 
                items = l_collectibleResellersInstancesIds_0 or l_resellerUserAssetIds_0, 
                maxHeight = math.huge, 
                LayoutOrder = 1, 
                defaultChildIndex = 1, 
                inputBindings = {
                    NavigateBack = v16.Input.onBegin(Enum.KeyCode.ButtonB, v76.goBack)
                }, 
                [v3.Ref] = v76.gridViewRef, 
                NextSelectionUp = v76.topBarRef
            })
        });
    else
        return ;
    end;
end;
v44.renderOnFailed = function(v84, v85)
    return v3.createElement(l_EmptyState_0, {
        onActivated = v84.fetchAssetResellers, 
        text = v85.failedMessage
    });
end;
v44.render = function(v86)
    return v3.createElement(v8, {}, {
        Content = v86:renderContents()
    });
end;
v44.renderContents = function(v87)
    local l_globalGuiInset_1 = v87.props.globalGuiInset;
    local l_fetchingStatus_1 = v87.props.fetchingStatus;
    local v90 = not not v87.props.resellerUserAssetIds and not v6.isEmpty(v87.props.resellerUserAssetIds) or v87.props.collectibleResellersInstancesIds and not v6.isEmpty(v87.props.collectibleResellersInstancesIds);
    if not (not (l_fetchingStatus_1 == l_RetrievalStatus_0.Fetching) or not v90) then
        l_fetchingStatus_1 = l_RetrievalStatus_0.Done;
    end;
    return l_withStyle_0(function(v91)
        return l_withLocalization_0({
            title = "Feature.Catalog.Heading.Sellers", 
            failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
        })(function(v92)
            local l_Theme_2 = v91.Theme;
            return v3.createElement(l_Focusable_0.Frame, {
                BackgroundColor3 = l_Theme_2.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_2.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.new(0, l_globalGuiInset_1.left, 0, l_globalGuiInset_1.top), 
                Active = true, 
                focusController = v87.focusController
            }, {
                TopBar = v3.createElement(v12.Container, {
                    ZIndex = 2, 
                    titleText = v92.title, 
                    [v3.Ref] = v87.topBarRef, 
                    NextSelectionDown = l_fetchingStatus_1 == l_RetrievalStatus_0.Done and v87.gridViewRef or nil, 
                    leftItem = v12.BackButton
                }), 
                GamepadFocusHandlerForPage = v3.createElement(v18, {
                    focusController = v87.focusController
                }), 
                LastInputTypeChangedConnection = v3.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.LastInputTypeChanged, 
                    callback = function(v94)
                        if v94 then
                            v87:setState({
                                lastInputType = v94
                            });
                        end;
                    end
                }), 
                LoadingStateContainer = v3.createElement(l_LoadingStateContainer_0, {
                    dataStatus = l_RetrievalStatus_1.fromRawValue(l_fetchingStatus_1), 
                    renderOnLoaded = function()
                        return v87:renderOnLoaded();
                    end, 
                    renderOnFailed = function()
                        return v87:renderOnFailed(v92);
                    end
                })
            });
        end);
    end);
end;
return (v20((v30((l_RoactServices_0.connect({
    networking = v11
})((v4.connect(function(v95, v96)
    local l_itemId_2 = v96.itemId;
    local l_itemType_0 = v96.itemType;
    local v99 = nil;
    local v100 = nil;
    local v101 = nil;
    if not v43 then
        local v102 = v22(v95.AvatarExperience.Common, l_itemId_2, l_itemType_0);
        v99 = (v102 and v102.product) and v102.product.id;
        v100 = v102 and v102.resellerUserAssetIds;
        v101 = if not v35() then v96.collectibleItemId ~= nil else v31.DEPRECATED_isLimitedCollectible(v102);
    else
        local v103 = v23(v95.AvatarExperience, l_itemId_2, l_itemType_0);
        v99 = v103 and v103.productId;
        v100 = v103 and v103.resellerUserAssetIds;
        v101 = if not v35() then v96.collectibleItemId ~= nil else v103 and v103.isLimitedCollectible;
    end;
    local l_collectibleItemId_3 = v96.collectibleItemId;
    local v105 = nil;
    if not (not v101 or not l_collectibleItemId_3) then
        local l_CollectiblesResellersInstances_0 = v95.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances;
        v105 = if not v35() then l_CollectiblesResellersInstances_0[l_collectibleItemId_3].InstanceIdsList else (l_CollectiblesResellersInstances_0 and l_CollectiblesResellersInstances_0[l_collectibleItemId_3]) and l_CollectiblesResellersInstances_0[l_collectibleItemId_3].InstanceIdsList;
    end;
    return {
        globalGuiInset = v95.GlobalGuiInset, 
        hasMoreRows = v95.AvatarExperience.Catalog.ResellerCursor.hasMoreRows, 
        fetchingStatus = l_PerformFetch_0.GetStatus(v95, v24.GetResellersKey .. tostring(l_collectibleItemId_3 or l_itemId_2)), 
        productId = v99, 
        purchaseFetchingState = l_PerformFetch_0.GetStatus(v95, v24.PurchaseProductKey .. tostring(v99)), 
        resellerCursor = v95.AvatarExperience.Catalog.ResellerCursor.nextPageCursor, 
        resellerUserAssetIds = v100, 
        screenSize = v95.ScreenSize, 
        collectibleResellersInstancesIds = v105
    };
end, function(v107)
    return {
        fetchAssetResellers = function(v108, v109)
            return v107(v32(v108, v109, nil, v24.MaxResellersPerPage, true));
        end, 
        fetchCollectibleResellers = function(v110, v111, v112)
            return v107(v33(v110, v111, v112, v24.MaxResellersPerPage));
        end, 
        loadMoreItems = function(v113, v114, v115)
            return v107(v32(v113, v114, v115, v24.MaxResellersPerPage, false));
        end, 
        clearResellerCursor = function()
            return v107(v34(nil));
        end, 
        closeFocusedScreen = function(v116)
            v107(v21(v116));
        end
    };
end)(v44))))))));
