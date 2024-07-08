local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_CorePackages_0.UIBlox);
local v8 = require(l_CorePackages_0.Packages.t);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v10 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v12 = require(l_Modules_0.LuaApp.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Common.NamedRefConstants);
local l_withStyle_0 = v7.Style.withStyle;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.ResultsList);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveSearchInCatalog);
local v19 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v20 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v21 = require(l_Modules_0.AvatarExperience.Common.withContextValue);
local v22 = require(l_Modules_0.AvatarExperience.Common.Context.PageObjectManagerContext);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v26 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearSelectedTopics);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCatalogSearchWithSponsoredItems);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchWidgetInfo);
local v30 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v31 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v33 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v34 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v35 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v36 = require(l_Modules_0.AvatarExperience.Flags.SponsoredItemsIXPTest);
local v37 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXRemoveDupSearchCall);
local v38 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagRefreshWidgets);
local v39 = game:DefineFastInt("AXGetWidgetsExpirationSeconds", 3600);
local v40 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXWidgetsByContext);
local v41 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXCatalogRefreshCounter);
local v42 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixSearchTimeStaleResults);
local v43 = v3.PureComponent:extend("NavigationItemsView");
local v44 = require(l_Modules_0.AvatarExperience.Flags.AXCatalogRefreshIXPTest);
local v45 = require(l_Modules_0.AvatarExperience.Experiments.AXPersistentCatalogFiltersIXPTest);
local v46 = if not v45.isEnabled() then nil else v35.readTestVariable(v45.EnablePersistentCatalogFilters);
local v47 = {
    [v24.AvatarEditor] = true, 
    [v24.ProfilePictureEditorEmotes] = true
};
v43.validateProps = v8.strictInterface({
    defaultChildRef = v8.optional(v8.table), 
    NextSelectionUp = v8.optional(v8.table), 
    NextSelectionRight = v8.optional(v8.table), 
    multiTryOnBottomBarRef = v8.optional(v8.table), 
    categoryIndex = v8.number, 
    subcategoryIndex = v8.optional(v8.number), 
    minPrice = v8.number, 
    maxPrice = v8.number, 
    selectedTopics = v8.optional(v8.table), 
    catalogSort = v8.string, 
    catalogSortAggregation = v8.string, 
    searchParameters = v8.optional(v8.table), 
    searchTime = v8.optional(v8.number), 
    searchUuid = v8.string, 
    categoryInfo = v8.table, 
    creatorFilter = v8.string, 
    salesTypeFilter = v8.string, 
    unavailableItemFilter = v8.string, 
    widgetFetchTime = if not v38() then nil else v8.optional(v8.number), 
    setSearchType = v8.callback, 
    setSearchParameters = v8.callback, 
    dispatchSearch = v8.callback, 
    fetchWidgetInfo = v8.callback, 
    dispatchRemoveSearch = v8.callback, 
    clearSelectedTopics = v8.callback, 
    resetSortAndFilters = v8.callback, 
    pageObjectManager = v8.optional(v8.table), 
    avatarRoute = v16.Interface, 
    namedRefs = v8.table, 
    networking = v8.callback, 
    catalogAnalytics = if not v41() then nil else v8.table, 
    sponsoredItemsEnabled = v8.optional(v8.boolean), 
    enableCatalogRefreshEverywhere = if not v44.isEnabled() then nil else v8.optional(v8.boolean)
});
local function _(v48)
    return v48.avatarRoute.opaque.name == v24.Catalog;
end;
v43.init = function(v50)
    v50.itemsListRef = v50.props.namedRefs[v24.Catalog .. v13.ItemsList];
    v50.scrollingFrameRef = v3.createRef();
    v50.navBarRef = v3.createRef();
    v50.backToTopSignal = l_Signal_0.new();
    v50:setState({
        restorePreviousChildFocus = true
    });
    v50.dispatchInitialSearch = function()
        local l_dispatchSearch_0 = v50.props.dispatchSearch;
        local l_setSearchParameters_0 = v50.props.setSearchParameters;
        local l_categoryInfo_0 = v50.props.categoryInfo;
        local l_searchUuid_0 = v50.props.searchUuid;
        v50.props.setSearchType(l_searchUuid_0, v12.SearchTypes.Catalog);
        l_setSearchParameters_0(l_searchUuid_0, l_categoryInfo_0, v50.props.catalogSort, v50.props.catalogSortAggregation, v50.props.minPrice, v50.props.maxPrice, v50.props.selectedTopics);
        return l_dispatchSearch_0(v50.props.networking, v50.props.sponsoredItemsEnabled, l_searchUuid_0, l_categoryInfo_0);
    end;
    v50.fetchWidgetInfo = function(v55, v56)
        local v57 = v55 or v50.props.categoryIndex;
        local v58 = v56 or v50.props.subcategoryIndex;
        if not (not v38() or v40()) then
            local l_widgetFetchTime_0 = v50.props.widgetFetchTime;
            local v60 = if not l_widgetFetchTime_0 then nil else tick() - l_widgetFetchTime_0;
            if v60 and v60 < v39 then
                return nil;
            end;
        end;
        local v61 = nil;
        if not (not v40() or not v57) then
            v61 = v11.getContextForWidgets(v50.props.avatarRoute.current.name, v57, v58);
        end;
        return v50.props.fetchWidgetInfo(v50.props.networking, nil, v61);
    end;
end;
v43.didMount = function(v62)
    v62.dispatchInitialSearch();
    v62.fetchWidgetInfo();
end;
v43.searchResultsAreOld = function(v63, _, v65, v66)
    local l_searchTime_0 = v63.props.searchTime;
    if not (not v42() or not v66) then
        l_searchTime_0 = v66.searchTime;
    end;
    if (v65.TimeToRefresh and v65.TimeToRefresh >= 0) and l_searchTime_0 then
        return v65.TimeToRefresh < tick() - l_searchTime_0;
    else
        return false;
    end;
end;
v43.updateSearchParams = function(v68, v69)
    local l_categoryInfo_1 = v69.categoryInfo;
    local l_searchUuid_1 = v69.searchUuid;
    local l_dispatchSearch_1 = v68.props.dispatchSearch;
    local l_setSearchParameters_1 = v68.props.setSearchParameters;
    local l_fetchWidgetInfo_0 = v68.fetchWidgetInfo;
    local v75 = true;
    if v69.categoryIndex == v68.props.categoryIndex then
        v75 = v69.subcategoryIndex ~= v68.props.subcategoryIndex;
    end;
    if not (((((((not v75 and v69.catalogSort == v68.props.catalogSort) and v69.catalogSortAggregation == v68.props.catalogSortAggregation) and v69.minPrice == v68.props.minPrice) and v69.maxPrice == v68.props.maxPrice) and v69.selectedTopics == v68.props.selectedTopics) and v69.creatorFilter == v68.props.creatorFilter) and v69.salesTypeFilter == v68.props.salesTypeFilter) or v69.unavailableItemFilter ~= v68.props.unavailableItemFilter then
        if not v75 then
            v68.props.pageObjectManager:storePageObject(l_searchUuid_1, nil);
            v68.props.dispatchRemoveSearch(l_searchUuid_1);
            l_setSearchParameters_1(l_searchUuid_1, l_categoryInfo_1, v69.catalogSort, v69.catalogSortAggregation, v69.minPrice, v69.maxPrice, v69.selectedTopics, v69.creatorFilter, v69.salesTypeFilter, v69.unavailableItemFilter);
            l_dispatchSearch_1(v68.props.networking, v68.props.sponsoredItemsEnabled, l_searchUuid_1, l_categoryInfo_1);
        else
            v68.props.clearSelectedTopics();
            if not v46 then
                v68.props.resetSortAndFilters();
            end;
            local v76 = v68.props.searchParameters[l_searchUuid_1];
            if v76 == nil then
                l_setSearchParameters_1(l_searchUuid_1, l_categoryInfo_1, v69.catalogSort, v69.catalogSortAggregation, v69.minPrice, v69.maxPrice, v69.selectedTopics, v69.creatorFilter, v69.salesTypeFilter, v69.unavailableItemFilter);
                l_dispatchSearch_1(v68.props.networking, v68.props.sponsoredItemsEnabled, l_searchUuid_1, l_categoryInfo_1);
                if v40() then
                    l_fetchWidgetInfo_0(v69.categoryIndex, v69.subcategoryIndex);
                end;
            elseif not (((((((not v68:searchResultsAreOld(l_searchUuid_1, l_categoryInfo_1, if not v42() then nil else v69) and v76.catalogSort == v69.catalogSort) and v76.catalogSortAggregation == v69.catalogSortAggregation) and v76.minPrice == v69.minPrice) and v76.maxPrice == v69.maxPrice) and v76.selectedTopics == v69.selectedTopics) and v76.creatorFilter == v69.creatorFilter) and v76.salesTypeFilter == v69.salesTypeFilter) or v76.unavailableItemFilter ~= v69.unavailableItemFilter then
                if not (not v41() or not v68:searchResultsAreOld(l_searchUuid_1, l_categoryInfo_1, if not v42() then nil else v69)) then
                    v68.props.catalogAnalytics.sendAXCounter(v34.Counter.CatalogRefresh.StaleResults);
                end;
                v68.props.pageObjectManager:storePageObject(l_searchUuid_1, nil);
                v68.props.dispatchRemoveSearch(l_searchUuid_1);
                l_setSearchParameters_1(l_searchUuid_1, l_categoryInfo_1, v69.catalogSort, v69.catalogSortAggregation, v69.minPrice, v69.maxPrice, v69.selectedTopics, v69.creatorFilter, v69.salesTypeFilter, v69.unavailableItemFilter);
                l_dispatchSearch_1(v68.props.networking, v68.props.sponsoredItemsEnabled, l_searchUuid_1, l_categoryInfo_1);
                if v40() then
                    l_fetchWidgetInfo_0(v69.categoryIndex, v69.subcategoryIndex);
                end;
            end;
        end;
        if v68.scrollingFrameRef.current then
            v68.scrollingFrameRef.current.CanvasPosition = Vector2.new();
        end;
    end;
end;
v43.willUpdate = function(v77, v78)
    if not (not (v77.props.avatarRoute.opaque.name == v24.Catalog) or v78.avatarRoute.opaque.name == v24.Catalog) then
        v77.props.clearSelectedTopics();
        v77.props.resetSortAndFilters();
    end;
    if not (v77.props.avatarRoute.opaque.name == v24.Catalog or not (v78.avatarRoute.opaque.name == v24.Catalog)) then
        v77.props.clearSelectedTopics();
    end;
    if not v37 or v78.avatarRoute.opaque.name == v24.Catalog then
        v77:updateSearchParams(v78);
        return ;
    else
        return ;
    end;
end;
v43.renderWithStyle = function(v79, v80)
    local l_Theme_0 = v80.Theme;
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency or 1, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v3.Ref] = v79.props.defaultChildRef, 
        restorePreviousChildFocus = v79.state.restorePreviousChildFocus, 
        defaultChild = v79.navBarRef, 
        NextSelectionRight = v79.props.NextSelectionRight
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        ResultsList = v3.createElement(v17, {
            frameRef = v79.itemsListRef, 
            navBarRef = v79.navBarRef, 
            analyticsContext = v10.AnalyticsContext.Catalog, 
            fromSearch = false, 
            searchUuid = v79.props.searchUuid, 
            layoutOrder = 2, 
            scrollingFrameRef = v79.scrollingFrameRef, 
            onRetry = v79.dispatchInitialSearch, 
            NextSelectionUp = v79.props.NextSelectionUp, 
            backToTopSignal = v79.backToTopSignal, 
            multiTryOnBottomBarRef = v79.props.multiTryOnBottomBarRef
        })
    });
end;
v43.render = function(v82)
    return l_withStyle_0(function(v83)
        return v82:renderWithStyle(v83);
    end);
end;
v43.didUpdate = function(v84, v85)
    local l_name_0 = v84.props.avatarRoute.current.name;
    local l_name_1 = v85.avatarRoute.current.name;
    if l_name_0 == v24.Catalog then
        if not v84.state.restorePreviousChildFocus then
            v84:setState({
                restorePreviousChildFocus = true
            });
        end;
    elseif not (not (v47[l_name_0] and l_name_1 == v24.Catalog) or not v84.state.restorePreviousChildFocus) then
        v84:setState({
            restorePreviousChildFocus = false
        });
    end;
    if v38() then
        local v88 = (v84.props.categoryInfo and v84.props.categoryInfo.ShowWidgets) and not (v85.categoryInfo and v85.categoryInfo.ShowWidgets);
        local v89 = false;
        if l_name_0 == v24.Catalog then
            v89 = l_name_1 == v24.AvatarExperienceLandingPage;
        end;
        if not (not v88 and not v89) then
            v84.fetchWidgetInfo();
        end;
    end;
end;
v43 = v35.connectTestVariables({
    sponsoredItemsEnabled = v36.EnabledForUser
})((v31((v23((v21(v4.connect(function(v90, _)
    local l_category_0 = v90.AvatarExperience.Catalog.Categories.category;
    local l_subcategory_0 = v90.AvatarExperience.Catalog.Categories.subcategory;
    local v94 = v30.getCatalogCategoryInfoFromState(v90);
    local v95, _ = v25.getSearchUuidAndAssetTypes(v94, v90.AvatarExperience.AvatarEditor.Categories.subButton);
    return {
        categoryInfo = v94, 
        categoryIndex = l_category_0, 
        subcategoryIndex = l_subcategory_0, 
        minPrice = v90.AvatarExperience.Catalog.SortAndFilters.PriceRange.minPrice, 
        maxPrice = v90.AvatarExperience.Catalog.SortAndFilters.PriceRange.maxPrice, 
        selectedTopics = if not v94.ShowTopics then nil else v90.AvatarExperience.Catalog.SortAndFilters.SelectedTopics, 
        catalogSort = v90.AvatarExperience.Catalog.SortAndFilters.CatalogSort, 
        catalogSortAggregation = v90.AvatarExperience.Catalog.SortAndFilters.CatalogSortAggregation, 
        creatorFilter = v90.AvatarExperience.Catalog.SortAndFilters.CreatorFilter, 
        salesTypeFilter = v90.AvatarExperience.Catalog.SortAndFilters.SalesTypeFilter, 
        unavailableItemFilter = v90.AvatarExperience.Catalog.SortAndFilters.UnavailableItemFilter, 
        searchParameters = v90.SearchesParameters, 
        searchTime = not not v90.SearchTimes and v90.SearchTimes[v95] or nil, 
        searchUuid = v95, 
        widgetFetchTime = if not v38() then nil else v90.AvatarExperience.Common.Widgets.WidgetInfo.FetchTime
    };
end, function(v97)
    return {
        setSearchType = function(v98, v99)
            return v97(v20(v98, v99));
        end, 
        setSearchParameters = function(v100, v101, v102, v103, v104, v105, v106, v107, v108, v109)
            return v97(v19(v100, {
                categoryInfo = v101, 
                catalogSort = v102, 
                catalogSortAggregation = v103, 
                minPrice = v104, 
                maxPrice = v105, 
                selectedTopics = v106, 
                creatorFilter = v107, 
                salesTypeFilter = v108, 
                unavailableItemFilter = v109
            }));
        end, 
        dispatchSearch = function(v110, v111, v112, v113)
            return v97(v28(v110, v111, {
                searchUuid = v112, 
                categoryInfo = v113, 
                recordSearchTime = true
            }));
        end, 
        fetchWidgetInfo = function(v114, v115, v116)
            return v97(v29(v114, v115, v116));
        end, 
        dispatchRemoveSearch = function(v117)
            v97(v18(v117));
        end, 
        clearSelectedTopics = function()
            v97(v26());
        end, 
        resetSortAndFilters = function()
            v97(v32());
        end
    };
end)(v43), v22.Consumer, "pageObjectManager")))))));
if v44.isEnabled() then
    v43 = v35.connectTestVariables({
        enableCatalogRefreshEverywhere = v44.EnabledForUser
    })(v43);
end;
return l_RoactServices_0.connect({
    networking = v6, 
    catalogAnalytics = if not v41() then nil else v33
})(v43);
