local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.CenteredModalView);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.AvailableToSellList);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.CurrentlySellingList);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v19 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseFocusedScreen);
local v20 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSellPageData);
local v23 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v25 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v25.Style.withStyle;
local l_VerticalScrollViewWithMargin_0 = v25.App.Container.VerticalScrollViewWithMargin;
local l_LoadingStateContainer_0 = v25.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v25.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v25.App.Indicator.EmptyState;
local v31 = v3.PureComponent:extend("SellPage");
v31.init = function(v32)
    v32.state = {
        isWearAfterPurchaseChecked = false, 
        canvasSizeY = 0, 
        lastInputType = l_UserInputService_0:GetLastInputType()
    };
    v32.fetchSellPageData = function()
        return v32.props.fetchSellPageData(v32.props.networking, v32.props.itemId, v32.props.localUserId);
    end;
    v32.onContentSizeChanged = function(v33)
        v32:setState({
            canvasSizeY = v33.AbsoluteContentSize.Y + 48
        });
    end;
    v32.focusController = v32.props.focusController or v7.createFocusController();
    v32.currentlySellingListRef = v3.createRef();
    v32.availableToSellListRef = v3.createRef();
    v32.topBarRef = v3.createRef();
    v32.emptyStateRef = v3.createRef();
    v32.onOverlayClosed = function()
        local v34 = l_isGamepadInput_0(v32.state.lastInputType);
        v11("SellPage", v34);
        if v34 then
            v32.focusController.captureFocus();
        end;
    end;
    v32.goBack = function()
        v32.props.closeFocusedScreen(v32.props.navigation);
    end;
end;
v31.didMount = function(v35)
    v35.fetchSellPageData();
    if l_isGamepadInput_0(v35.state.lastInputType) then
        v35.focusController.captureFocus();
    end;
end;
v31.didUpdate = function(v36, v37)
    local l_fetchingStatus_0 = v36.props.fetchingStatus;
    if (not ((((not l_isGamepadInput_0(v36.state.lastInputType) or not v37.currentlySellingListData) or not v36.props.currentlySellingListData) or not v37.availableItemsToSell) or not v36.props.availableItemsToSell) and l_fetchingStatus_0 == v23.Done) and #v37.currentlySellingListData ~= #v36.props.currentlySellingListData then
        if #v36.props.currentlySellingListData == 0 then
            v36.focusController.moveFocusTo(v36.availableToSellListRef);
            return ;
        else
            v36.focusController.moveFocusTo(v36.currentlySellingListRef);
        end;
    end;
end;
v31.renderOnLoaded = function(v39, _)
    return v3.createElement(v20.PageContent, {
        ZIndex = 2
    }, {
        ScrollingView = v39:renderScrollingView()
    });
end;
v31.renderScrollingView = function(v41)
    local l_itemId_0 = v41.props.itemId;
    return v3.createElement(l_VerticalScrollViewWithMargin_0, {
        size = UDim2.fromScale(1, 1), 
        canvasSizeY = UDim.new(0, v41.state.canvasSizeY)
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 24), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v3.Change.AbsoluteContentSize] = v41.onContentSizeChanged
        }), 
        PagePadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 24), 
            PaddingBottom = UDim.new(0, 24)
        }), 
        CurrentlySellingList = v3.createElement(v13, {
            itemId = l_itemId_0, 
            LayoutOrder = 2, 
            [v3.Ref] = v41.currentlySellingListRef, 
            NextSelectionUp = v41.topBarRef, 
            NextSelectionDown = if v41.props.availableItemsToSell ~= nil and #v41.props.availableItemsToSell > 0 then v41.availableToSellListRef else nil, 
            onOverlayClosed = v41.onOverlayClosed
        }), 
        AvailableToSellList = v3.createElement(v12, {
            itemId = l_itemId_0, 
            itemType = v41.props.itemType, 
            LayoutOrder = 3, 
            [v3.Ref] = v41.availableToSellListRef, 
            NextSelectionUp = if v41.props.currentlySellingListData ~= nil and #v41.props.currentlySellingListData > 0 then v41.currentlySellingListRef else v41.topBarRef, 
            onOverlayClosed = v41.onOverlayClosed
        })
    });
end;
v31.renderOnFailed = function(v43, v44)
    return v3.createElement(l_EmptyState_0, {
        onActivated = v43.fetchSellPageData, 
        text = v44.failedMessage, 
        [v3.Ref] = v43.emptyStateRef, 
        NextSelectionUp = v43.topBarRef
    });
end;
v31.render = function(v45)
    return v3.createElement(v9, {}, {
        Content = v45:renderContents()
    });
end;
v31.renderContents = function(v46)
    local l_globalGuiInset_0 = v46.props.globalGuiInset;
    local l_fetchingStatus_1 = v46.props.fetchingStatus;
    return l_withStyle_0(function(v49)
        return l_withLocalization_0({
            title = "Feature.Catalog.Heading.SellItem", 
            failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
        })(function(v50)
            local l_Theme_0 = v49.Theme;
            local v52 = nil;
            if l_fetchingStatus_1 == v23.Done then
                if v46.props.currentlySellingListData ~= nil and #v46.props.currentlySellingListData > 0 then
                    v52 = v46.currentlySellingListRef;
                elseif v46.props.availableItemsToSell ~= nil and #v46.props.availableItemsToSell > 0 then
                    v52 = v46.availableToSellListRef;
                elseif l_fetchingStatus_1 == v23.Failed then
                    v52 = v46.emptyStateRef;
                end;
            end;
            return v3.createElement(l_Focusable_0.Frame, {
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0, l_globalGuiInset_0.left, 0, l_globalGuiInset_0.top), 
                Size = UDim2.fromScale(1, 1), 
                defaultChild = v52, 
                restorePreviousChildFocus = true, 
                focusController = v46.focusController, 
                inputBindings = {
                    NavigateBack = v7.Input.onBegin(Enum.KeyCode.ButtonB, v46.goBack)
                }
            }, {
                TopBar = v3.createElement(v20.Container, {
                    ZIndex = 2, 
                    titleText = v50.title, 
                    [v3.Ref] = v46.topBarRef, 
                    NextSelectionDown = v52, 
                    leftItem = v20.BackButton
                }), 
                GamepadFocusHandlerForPage = v3.createElement(v10, {
                    focusController = v46.focusController
                }), 
                LoadingStateContainer = v3.createElement(l_LoadingStateContainer_0, {
                    dataStatus = l_RetrievalStatus_0.fromRawValue(l_fetchingStatus_1), 
                    renderOnLoaded = function()
                        return v46:renderOnLoaded(v49);
                    end, 
                    renderOnFailed = function()
                        return v46:renderOnFailed(v50);
                    end
                }), 
                LastInputChangedListener = v3.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.LastInputTypeChanged, 
                    callback = function(v53)
                        v46:setState({
                            lastInputType = v53
                        });
                    end
                })
            });
        end);
    end);
end;
return (v18((v17((l_RoactServices_0.connect({
    networking = v6
})((v4.connect(function(v54, v55)
    local l_LocalUserId_0 = v54.LocalUserId;
    local l_itemId_1 = v55.itemId;
    return {
        fetchingStatus = l_PerformFetch_0.GetStatus(v54, v14.GetSellPageDataKey .. tostring(l_itemId_1)), 
        globalGuiInset = v54.GlobalGuiInset, 
        localUserId = l_LocalUserId_0, 
        currentlySellingListData = v54.AvatarExperience.Catalog.Sell.CurrentlySellingAssets[l_itemId_1], 
        availableItemsToSell = v54.AvatarExperience.Catalog.Sell.AvailableToSellAssets[l_itemId_1]
    };
end, function(v58)
    return {
        fetchSellPageData = function(v59, v60, v61)
            v58(v22(v59, v60, v61));
        end, 
        closeFocusedScreen = function(v62)
            v58(v19(v62));
        end
    };
end)(v31))))))));
