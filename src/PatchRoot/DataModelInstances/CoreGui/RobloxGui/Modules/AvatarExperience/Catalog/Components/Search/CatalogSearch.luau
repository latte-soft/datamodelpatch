local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = v5.Focusable;
local v8 = require(l_CorePackages_0.RoactNavigation);
local l_withNavigation_0 = v8.withNavigation;
local v10 = require(l_CorePackages_0.RoactRodux);
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_CorePackages_0.Cryo);
local v13 = require(l_CorePackages_0.Packages.Dash);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v17 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v20 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v21 = require(l_Modules_0.LuaApp.Constants);
local v22 = require(l_Modules_0.LuaApp.SearchUuid);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v24 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v25 = require(l_Modules_0.LuaApp.Components.SearchBar);
local v26 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v27 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v28 = require(l_Modules_0.LuaApp.Analytics.Events.catalogSearchEvent);
local l_HorizontalPageMargin_0 = require(l_CorePackages_0.UIBlox).App.Container.HorizontalPageMargin;
local _ = require(l_Modules_0.AvatarExperience.Common.CategoryTypes);
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local _ = require(l_Common_0.AvatarExperienceState);
local v33 = require(l_Common_0.Components.RoactNavigation.NavigationUtils);
local v34 = require(l_Common_0.withContextValue);
local v35 = require(l_Common_0.Context.PageObjectManagerContext);
local v36 = require(l_Common_0.Utils);
local v37 = require(l_Common_0.NamedRefConstants);
local v38 = require(l_Common_0.Components.RoactNavigation.AvatarScreen);
local v39 = require(l_Common_0.Components.RoactNavigation.AvatarScreenProperties);
local v40 = require(l_Common_0.Components.RoactNavigation.withAvatarRoute);
local v41 = require(l_Common_0.Context.withNamedRefs);
local v42 = require(l_Common_0.Components.RoactNavigation.AvatarRoute);
local v43 = require(l_Common_0.Services.Analytics);
local v44 = require(l_Common_0.Components.AvatarExperienceView);
local v45 = require(l_Common_0.Components.BoundInputsUpdater);
local v46 = require(l_Common_0.Components.GamepadFocusHandlerForPage);
local v47 = require(l_Common_0.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v48 = require(l_Common_0.Selectors.selectIsFullView);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v50 = require(l_Common_0.Actions.SetItemDetailsPeekViewState);
local v51 = require(l_Common_0.Thunks.OpenItemPrompt);
local v52 = require(l_Common_0.Thunks.OpenQuickMenu);
local v53 = require(l_Common_0.Thunks.SetFullView);
local v54 = require(l_Common_0.Enum.FullView);
local v55 = require(l_Common_0.Hooks.useAvatarExperienceFocusNavigationBindings);
local v56 = require(l_Common_0.Hooks.useOverlayClosedCallback);
local v57 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local l_Catalog_0 = l_Modules_0.AvatarExperience.Catalog;
local v59 = require(l_Catalog_0.Services.Analytics);
local v60 = require(l_Catalog_0.CatalogConstants);
local v61 = require(l_Catalog_0.Components.Search.ResultsList);
local v62 = require(l_Catalog_0.CatalogUtils);
local v63 = require(l_Catalog_0.Actions.RemoveSearchInCatalog);
local v64 = require(l_Catalog_0.Actions.SetSortAndFilters);
local v65 = require(l_Catalog_0.Actions.ResetSortAndFilters);
local v66 = require(l_Catalog_0.Actions.SetTryOnManagerPeekViewState);
local v67 = require(l_Catalog_0.Thunks.FetchWidgetInfo);
local v68 = require(l_Catalog_0.Thunks.ApiFetchCatalogSearch);
local v69 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll);
local v70 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSearchResultsCategories);
local v71 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRemoveYButtonCatalogPage);
local v72 = require(l_Modules_0.AvatarExperience.Flags.AXSearchResultsCategoriesIXPTest);
local v73 = v4.PureComponent:extend("CatalogSearch");
v73.validateProps = v11.strictInterface({
    searchUuid = v11.string, 
    searchParameters = v11.table, 
    isVisible = v11.optional(v11.boolean), 
    fullView = v11.optional(v11.userdata), 
    topBarHeight = v11.number, 
    dataStatus = v11.string, 
    hasEntries = v11.boolean, 
    itemDetailsExpanded = v11.optional(v11.boolean), 
    isPortrait = v11.boolean, 
    tryOnManagerPeekViewState = v11.optional(v11.valueOf(l_PeekViewState_0)), 
    tryOnItems = v11.optional(v11.table), 
    categoryInfo = if not v70() then nil else v11.optional(v11.table), 
    dispatchSearch = v11.callback, 
    dispatchRemoveSearch = v11.callback, 
    setSearchType = v11.callback, 
    setSearchParameters = v11.callback, 
    setSortAndFilters = v11.callback, 
    openItemPrompt = v11.callback, 
    setItemDetailsPeekViewState = v11.callback, 
    setFullView = v11.callback, 
    navigateIntoQuickMenu = v11.callback, 
    resetSortAndFilters = v11.callback, 
    setTryOnManagerPeekViewState = v11.callback, 
    fetchWidgetInfo = v11.callback, 
    pageObjectManager = v11.optional(v11.table), 
    namedRefs = v11.table, 
    navigation = v11.table, 
    avatarRoute = v42.Interface, 
    analytics = v11.table, 
    avatarExperienceAnalytics = v11.table, 
    catalogAnalytics = v11.table, 
    networking = v11.callback, 
    eventIngest = v11.table, 
    overlayClosedCallback = v11.callback, 
    focusController = v11.table, 
    localized = v11.table, 
    enableSearchResultsCategories = if not v70() then nil else v11.optional(v11.boolean)
});
v73.init = function(v74)
    local v75, v76 = v4.createBinding(0);
    v74.pillBarScrollOffset = v75;
    v74.updatePillBarScrollOffset = v76;
    v74.searchBarRef = v4.createRef();
    v74.sceneUIContainerRef = v4.createRef();
    v74.resultsListRef = v74.props.namedRefs[v38.CatalogSearch .. v37.ItemsList];
    v74.refinementButtonsRef = v4.createRef();
    v74.multiTryOnBottomBarRef = v4.createRef();
    v74.isMounted = false;
    v74:setState({
        isSearching = false
    });
    v74.onNavBarSizeChanged = function(v77)
        if v74.resultsListRef.current then
            v74.resultsListRef.current.Size = UDim2.new(1, 0, 1, -v77.Y);
        end;
    end;
    v74.dispatchInitialSearch = function()
        local l_searchUuid_0 = v74.props.searchUuid;
        local l_searchParameters_0 = v74.props.searchParameters;
        local l_dispatchSearch_0 = v74.props.dispatchSearch;
        local v81 = v74.props.fullView == v54.SceneFullView;
        local l_avatarExperienceAnalytics_0 = v74.props.avatarExperienceAnalytics;
        if v81 then
            v74.props.setFullView(l_avatarExperienceAnalytics_0, v74.props.avatarRoute.opaque.name, v54.None);
        end;
        local l_fetchWidgetInfo_0 = v74.props.fetchWidgetInfo;
        local l_networking_0 = v74.props.networking;
        local v85 = v62.getQueryStringForSearchWidgets(l_searchParameters_0);
        if v85 then
            l_fetchWidgetInfo_0(l_networking_0, v85);
        end;
        if not (not v70() or not v74.props.enableSearchResultsCategories) then
            local l_categoryInfo_0 = v74.props.categoryInfo;
            if not l_searchParameters_0.categoryInfo then
                l_searchParameters_0 = v13.join(l_searchParameters_0, {
                    categoryInfo = l_categoryInfo_0
                });
                v74.props.setSearchParameters(l_searchUuid_0, l_searchParameters_0);
            end;
        end;
        return l_dispatchSearch_0(l_searchParameters_0.searchKeyword, l_searchUuid_0, if not not v70() and v74.props.enableSearchResultsCategories then v74.props.categoryInfo else nil);
    end;
    v74.setUIFullView = function()
        v74.props.setFullView(v74.props.avatarExperienceAnalytics, v74.props.avatarRoute.opaque.name, v54.UIFullView);
    end;
    v74.confirmSearchCallback = function(v87, v88, v89)
        local v90 = v22();
        local v91 = if not not v70() and v74.props.enableSearchResultsCategories then v74.props.categoryInfo else nil;
        local v92 = nil;
        v92 = v13.join(v74.props.navigation.getParam("searchParams") or {}, {
            searchKeyword = v87, 
            isKeywordSuggestionEnabled = true, 
            categoryInfo = if not not v70() and v74.props.enableSearchResultsCategories then v91 else nil
        });
        v74.props.setSearchType(v90, v21.SearchTypes.Catalog);
        v74.props.setSearchParameters(v90, v92);
        if v69() then
            if v74.props.isPortrait then
                v74.setUIFullView();
            end;
            v28(v74.props.eventIngest, "catalog", v87, v88, v38.CatalogSearch, v89);
        end;
        v33.navigateToSearch(v74.props.navigation, v90, v92);
    end;
    v74.cancelSearchCallback = function()
        v74.props.navigation.navigate(v38.Catalog);
        if v74.isMounted then
            v74:setState({
                isSearching = false
            });
        end;
    end;
    v74.onSearchBarFocused = function()
        if v74.isMounted then
            v74:setState({
                isSearching = true
            });
            return ;
        else
            return ;
        end;
    end;
    v74.changeView = function()
        v74.props.setFullView(v74.props.avatarExperienceAnalytics, v74.props.avatarRoute.opaque.name, (v36.getNewFullViewEnum(v74.props.fullView)));
    end;
    v74.clearSearchState = if not v70() then nil else function(v93)
        v74.props.dispatchRemoveSearch(v93);
        v74.props.pageObjectManager:storePageObject(v93, nil);
    end;
    v74.dispatchWidgetSearch = if not v70() then nil else function()
        local l_searchParameters_1 = v74.props.searchParameters;
        local l_fetchWidgetInfo_1 = v74.props.fetchWidgetInfo;
        local l_networking_1 = v74.props.networking;
        local v97 = v62.getQueryStringForSearchWidgets(l_searchParameters_1);
        if v97 then
            l_fetchWidgetInfo_1(l_networking_1, v97);
        end;
    end;
    v74.onCategoryOrSubcategoryChange = if not v70() then nil else function(v98, v99)
        local v100 = v36.getCatalogCategoryInfo(v98, v99);
        if v100 ~= v74.props.categoryInfo then
            v74.dispatchSearchOnCategoryOrSubcategoryChange(v100);
        end;
    end;
    v74.dispatchSearchOnCategoryOrSubcategoryChange = if not v70() then nil else function(v101)
        local l_searchUuid_1 = v74.props.searchUuid;
        local l_searchParameters_2 = v74.props.searchParameters;
        local l_dispatchSearch_1 = v74.props.dispatchSearch;
        v74.props.setSearchParameters(l_searchUuid_1, (v13.join(l_searchParameters_2, {
            categoryInfo = v13.join({}, v101)
        })));
        v74.clearSearchState(l_searchUuid_1);
        if not (not v101 or not v101.ShowWidgets) then
            v74.dispatchWidgetSearch();
        end;
        return l_dispatchSearch_1(l_searchParameters_2.searchKeyword, l_searchUuid_1, v101);
    end;
end;
v73.getInputBindings = function(v105)
    local l_avatarRoute_0 = v105.props.avatarRoute;
    local l_name_0 = l_avatarRoute_0.current.name;
    local l_isMultiTryOn_0 = v39[l_avatarRoute_0.opaque.name].isMultiTryOn;
    local v109 = {
        NavigateBack = v5.Input.onBegin(Enum.KeyCode.ButtonB, function()
            v33.closeFocusedScreen(v105.props.navigation);
        end), 
        OpenTryOnManager = if (l_name_0 ~= v38.TryOnManager and l_isMultiTryOn_0) and #v12.Dictionary.values(v105.props.tryOnItems) > 1 then v5.Input.onBegin(Enum.KeyCode.ButtonY, function()
            v33.closeFiltersAndItemDetails(v105.props.navigation);
            v105.props.navigation.navigate(v38.TryOnManager);
        end, {
            key = "Feature.Catalog.Label.TryOns"
        }) else nil
    };
    if l_name_0 == v38.ItemDetails then
        return (v12.Dictionary.join(v109, {
            OpenItemPrompt = v5.Input.onBegin(Enum.KeyCode.ButtonX, function()
                v105.props.openItemPrompt(v105.props.networking, v105.props.catalogAnalytics, v105.props.overlayClosedCallback, v105.props.navigation, l_avatarRoute_0);
            end, {
                key = "Feature.Catalog.Action.Buy"
            }), 
            OpenClosePeekView = if l_isMultiTryOn_0 or v71() then nil else v5.Input.onBegin(Enum.KeyCode.ButtonY, function()
                if not v105.props.itemDetailsExpanded then
                    v105.props.setItemDetailsPeekViewState(l_PeekViewState_0.Full);
                    return ;
                else
                    v105.props.setItemDetailsPeekViewState(l_PeekViewState_0.Brief);
                    return ;
                end;
            end, {
                key = not v105.props.itemDetailsExpanded and "Feature.Catalog.Action.OpenDetails" or "Feature.Catalog.Action.CloseDetails"
            }), 
            OpenCatalogContextMenu = v5.Input.onBegin(Enum.KeyCode.ButtonL3, function()
                v105.props.navigation.navigate(v38.CatalogContextMenu, {
                    itemId = l_avatarRoute_0.current.params.itemId, 
                    itemType = l_avatarRoute_0.current.params.itemType, 
                    onOverlayClosed = v105.props.overlayClosedCallback
                });
            end, {
                key = "Feature.Catalog.Action.ItemOptions"
            })
        }));
    else
        if l_name_0 == v38.TryOnManager then
            v109 = v12.Dictionary.join(v109, {
                OpenCloseTryOnManager = v5.Input.onBegin(Enum.KeyCode.ButtonY, function()
                    local l_tryOnManagerPeekViewState_0 = v105.props.tryOnManagerPeekViewState;
                    if not (l_tryOnManagerPeekViewState_0 ~= l_PeekViewState_0.Full) or l_tryOnManagerPeekViewState_0 == l_PeekViewState_0.Extended then
                        v105.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                        return ;
                    else
                        v105.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                        return ;
                    end;
                end, {
                    key = "Feature.Catalog.Label.TryOns"
                })
            });
        end;
        return v109;
    end;
end;
v73.renderSearchBar = function(v111)
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v111.props.topBarHeight), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = if not v69() then nil else 3
    }, {
        PaddedFrame = v4.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 1, -20)
        }, {
            SearchBar = v4.createElement(l_HorizontalPageMargin_0, {
                backgroundTransparency = 1, 
                backgroundColor3 = Color3.fromRGB(0, 0, 0)
            }, {
                v4.createElement(v25, {
                    cancelSearch = v111.cancelSearchCallback, 
                    confirmSearch = v111.confirmSearchCallback, 
                    onFocused = v111.onSearchBarFocused, 
                    placeholderText = v111.props.localized.searchPlaceholder, 
                    isCompactView = true, 
                    modernUI = true, 
                    autocomplete = v69(), 
                    isSearching = v111.state.isSearching, 
                    searchType = v21.SearchTypes.Catalog, 
                    initialSearchText = v111.props.searchParameters.searchKeyword, 
                    [v4.Ref] = v111.searchBarRef, 
                    NextSelectionDown = v111.resultsListRef, 
                    focusController = v111.props.focusController, 
                    forceShowCancelButton = v69()
                })
            })
        })
    });
end;
v73.render = function(v112)
    local l_hasEntries_0 = v112.props.hasEntries;
    local v114 = v112.props.fullView == v54.SceneFullView;
    local v115 = v112.props.fullView == v54.UIFullView;
    local l_searchUuid_2 = v112.props.searchUuid;
    local l_refinementButtonsRef_0 = v112.refinementButtonsRef;
    if v112.props.avatarRoute.current.name == v38.TryOnManager then
        l_refinementButtonsRef_0 = v112.props.namedRefs[v38.TryOnManager];
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        focusController = v112.props.focusController, 
        defaultChild = not not l_hasEntries_0 and v112.resultsListRef or v112.searchBarRef, 
        inputBindings = v112:getInputBindings()
    }, {
        BoundInputsUpdater = v4.createElement(v45), 
        NavigationEvents = v4.createElement(v8.NavigationEvents, {
            onDidFocus = function()
                local l_sortAndFilters_0 = (v112.props.navigation.getParam("searchParams") or {}).sortAndFilters;
                if not l_sortAndFilters_0 then
                    v112.props.resetSortAndFilters();
                    return ;
                else
                    v112.props.setSortAndFilters(l_sortAndFilters_0);
                    return ;
                end;
            end
        }), 
        NavigationEventsLogger = v4.createElement(v47, {
            pageName = "CatalogSearch"
        }), 
        AvatarExperienceView = v4.createElement(v44, {
            changeViewFunction = v112.changeView, 
            allowAdaptiveScrolling = true, 
            isSceneFullView = v114, 
            isUIFullView = v115, 
            topBar = v112:renderSearchBar(), 
            [v4.Ref] = v112.sceneUIContainerRef, 
            NextSelectionLeft = v112.searchBarRef, 
            refinementButtonsRef = v112.refinementButtonsRef, 
            defaultChildRef = not not l_hasEntries_0 and v112.resultsListRef or v112.searchBarRef, 
            multiTryOnBottomBarRef = v112.multiTryOnBottomBarRef
        }, {
            GamepadFocusHandlerForPage = v4.createElement(v46, {
                focusController = v112.props.focusController
            }), 
            ResultsList = v4.createElement(v61, {
                analyticsContext = v60.AnalyticsContext.CatalogSearch, 
                fromSearch = true, 
                searchUuid = l_searchUuid_2, 
                onRetry = v112.dispatchInitialSearch, 
                frameRef = v112.resultsListRef, 
                NextSelectionUp = v112.searchBarRef, 
                NextSelectionRight = l_refinementButtonsRef_0, 
                multiTryOnBottomBarRef = v112.multiTryOnBottomBarRef, 
                onCategoryOrSubcategoryChange = if not not v70() and v112.props.enableSearchResultsCategories then v112.onCategoryOrSubcategoryChange else nil, 
                categoryInfo = if not not v70() and v112.props.enableSearchResultsCategories then v112.props.categoryInfo else nil, 
                enableSearchResultsCategories = if not v70() then nil else v112.props.enableSearchResultsCategories
            })
        })
    });
end;
v73.didMount = function(v119)
    v119.isMounted = true;
    v119.dispatchInitialSearch():catch(function(v120)
        if not _G.__TESTEZ_RUNNING_TEST__ then
            warn("Error fetching CatalogSearch results:\n" .. tostring(v120));
        end;
    end);
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    if l_l_UserInputService_0_LastInputType_0 and l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0) then
        v119.props.focusController.captureFocus();
    end;
end;
v73.willUnmount = function(v122)
    v122.isMounted = false;
    local l_searchUuid_3 = v122.props.searchUuid;
    v122.props.dispatchRemoveSearch(l_searchUuid_3);
    v122.props.pageObjectManager:storePageObject(l_searchUuid_3, nil);
    v122.props.resetSortAndFilters();
end;
v73.didUpdate = function(v124, v125)
    if v125.searchUuid ~= v124.props.searchUuid then
        if v125.searchUuid ~= nil then
            v124.props.dispatchRemoveSearch(v125.searchUuid);
            v124.props.pageObjectManager:storePageObject(v125.searchUuid, nil);
        end;
        v124.dispatchInitialSearch();
    end;
end;
v73 = v34(v41((v40((l_withNavigation_0((v10.connect(function(v126, v127)
    local v128 = v126.Search.SearchesInCatalog[v127.searchUuid];
    local v129 = not not v128 and v128.items or nil;
    local v130;
    if v129 then
        v130 = true;
        if not (#v129 == 0) then
            goto label0;
        end;
    end;
    v130 = false;
    ::label0::;
    local v131 = v36.getSearchKey(v126, v127.searchUuid);
    local v132 = v126.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local v133 = nil;
    if v70() then
        local l_SearchCategories_0 = v126.AvatarExperience.Catalog.SearchCategories;
        if l_SearchCategories_0 then
            v133 = v36.getCatalogCategoryInfo(l_SearchCategories_0.category, l_SearchCategories_0.subcategory);
        end;
    end;
    return {
        categoryInfo = if not v70() then nil else v133, 
        fullView = v48(v126, v38.CatalogSearch), 
        hasEntries = v130, 
        dataStatus = l_PerformFetch_0.GetStatus(v126, v131), 
        topBarHeight = v24.selectTopBarHeightNoBanners(v126), 
        itemDetailsExpanded = v126.AvatarExperience.Common.ItemDetailsExpanded, 
        isPortrait = v132, 
        tryOnManagerPeekViewState = v126.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState, 
        tryOnItems = v126.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
    };
end, function(v135)
    return {
        dispatchSearch = function(v136, v137, v138)
            return v135(v68({
                searchKeyword = v136, 
                searchUuid = v137, 
                categoryInfo = if not v70() then nil else v138
            }));
        end, 
        dispatchRemoveSearch = function(v139)
            v135(v63(v139));
        end, 
        setSearchType = function(v140, v141)
            return v135(v27(v140, v141));
        end, 
        setSearchParameters = function(v142, v143)
            return v135(v26(v142, v143));
        end, 
        setSortAndFilters = function(v144)
            return v135(v64(v144));
        end, 
        openItemPrompt = function(v145, v146, v147, v148, v149)
            v135(v51(v145, v146, v147, v148, v149));
        end, 
        setItemDetailsPeekViewState = function(v150)
            v135(v50(v150));
        end, 
        setFullView = function(v151, v152, v153)
            v135(v53(v151, v152, v153));
        end, 
        navigateIntoQuickMenu = function(v154, v155)
            v135(v52(v154, v155));
        end, 
        resetSortAndFilters = function()
            v135(v65());
        end, 
        setTryOnManagerPeekViewState = function(v156)
            v135(v66(v156));
        end, 
        fetchWidgetInfo = function(v157, v158)
            v135(v67(v157, v158));
        end
    };
end)(v73))))))), v35.Consumer, "pageObjectManager");
if v70() then
    v73 = v57.connectTestVariables({
        enableSearchResultsCategories = v72.EnableSearchResultsCategories
    })(v73);
end;
v73 = l_RoactServices_0.connect({
    analytics = v17, 
    catalogAnalytics = v59, 
    avatarExperienceAnalytics = v43, 
    networking = v19, 
    eventIngest = v20
})(v73);
return function(v159)
    local l_current_0 = v6.useRef(v5.createFocusController()).current;
    local v161 = v56(l_current_0);
    return v6.createElement("Frame", {
        ref = v55({
            overlayClosedCallback = v161
        }), 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, v6.createElement(v73, (v12.Dictionary.join(v159, {
        focusController = l_current_0, 
        overlayClosedCallback = v161, 
        localized = l_useLocalization_0({
            searchPlaceholder = "Search.GlobalSearch.Example.SearchCatalog"
        })
    }))));
end;
