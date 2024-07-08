local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactNavigation);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SetCategoryAndSubcategory);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSearchCategoryAndSubcategory);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NavigationFrame);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v15 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSearchResultsCategories);
local v16 = v3.PureComponent:extend("CatalogNavigation");
v16.validateProps = v7.strictInterface({
    analytics = v7.table, 
    axAnalytics = v7.table, 
    layoutOrderMain = v7.number, 
    layoutOrderSub = v7.number, 
    navHeightMain = v7.number, 
    navHeightSub = v7.number, 
    absoluteSizeChanged = v7.callback, 
    navBarRef = v7.table, 
    NextSelectionDown = v7.optional(v7.table), 
    NextSelectionUp = v7.optional(v7.table), 
    backToTopSignal = v7.optional(v7.table), 
    showingTopics = v7.optional(v7.boolean), 
    fromSearch = if not v15() then nil else v7.optional(v7.boolean), 
    onCategoryOrSubcategoryChange = if not v15() then nil else v7.optional(v7.callback), 
    selectedCategoryIndex = v7.number, 
    selectedSubcategoryIndex = v7.number, 
    setCategoryAndSubcategory = v7.callback, 
    setSearchCategoryAndSubcategory = if not v15() then nil else v7.callback, 
    exit3DFullView = v7.callback, 
    hideCommunityCategory = v7.boolean, 
    hidePremiumCategory = v7.boolean, 
    navigation = v7.table, 
    enableSearchResultsCategories = if not v15() then nil else v7.optional(v7.boolean)
});
v16.init = function(v17)
    v17.selectCategory = function(v18)
        if not (not v15() or not v17.props.enableSearchResultsCategories) then
            if v18 == v17.props.selectedCategoryIndex then
                return ;
            else
                local l_onCategoryOrSubcategoryChange_0 = v17.props.onCategoryOrSubcategoryChange;
                if l_onCategoryOrSubcategoryChange_0 then
                    l_onCategoryOrSubcategoryChange_0(v18, 0);
                end;
            end;
        end;
        v17:setCategoryAndSubcategory(v18, nil);
    end;
    v17.selectSubcategory = function(_, v21)
        if not (not v15() or not v17.props.enableSearchResultsCategories) then
            if v21 == v17.props.selectedSubcategoryIndex then
                return ;
            else
                local l_onCategoryOrSubcategoryChange_1 = v17.props.onCategoryOrSubcategoryChange;
                if l_onCategoryOrSubcategoryChange_1 then
                    l_onCategoryOrSubcategoryChange_1(v17.props.selectedCategoryIndex, v21);
                end;
            end;
        end;
        v17:setCategoryAndSubcategory(nil, v21);
    end;
    v17.onSubNavigationPropsDidUpdate = function(v23, v24)
        if not (not (v17.props.selectedCategoryIndex ~= v23.selectedCategoryIndex) or not v24.current) then
            v24.current.CanvasPosition = Vector2.new();
        end;
    end;
end;
v16.setCategoryAndSubcategory = function(v25, v26, v27)
    local l_analytics_0 = v25.props.analytics;
    local l_axAnalytics_0 = v25.props.axAnalytics;
    local l_navigation_0 = v25.props.navigation;
    local l_backToTopSignal_0 = v25.props.backToTopSignal;
    if (l_backToTopSignal_0 and (not (v26 ~= nil) or v26 == v25.props.selectedCategoryIndex)) and (not (v27 ~= nil) or v27 == v25.props.selectedSubcategoryIndex) then
        l_backToTopSignal_0:fire();
    end;
    if ((not v15() or not v25.props.enableSearchResultsCategories) or not v25.props.fromSearch) or not v25.props.setSearchCategoryAndSubcategory then
        v25.props.setCategoryAndSubcategory(v26, v27, l_analytics_0);
    else
        v25.props.setSearchCategoryAndSubcategory(v26, v27);
    end;
    v25.props.exit3DFullView(l_axAnalytics_0, l_navigation_0.state.routeName);
end;
v16.render = function(v32)
    local l_layoutOrderMain_0 = v32.props.layoutOrderMain;
    local l_layoutOrderSub_0 = v32.props.layoutOrderSub;
    local l_navHeightMain_0 = v32.props.navHeightMain;
    local l_navHeightSub_0 = v32.props.navHeightSub;
    local l_selectedCategoryIndex_0 = v32.props.selectedCategoryIndex;
    local l_selectedSubcategoryIndex_0 = v32.props.selectedSubcategoryIndex;
    local l_absoluteSizeChanged_0 = v32.props.absoluteSizeChanged;
    local l_showingTopics_0 = v32.props.showingTopics;
    local l_hideCommunityCategory_0 = v32.props.hideCommunityCategory;
    local l_hidePremiumCategory_0 = v32.props.hidePremiumCategory;
    local l_selectCategory_0 = v32.selectCategory;
    local l_selectSubcategory_0 = v32.selectSubcategory;
    local v45 = v9.filterCategories(v10(), l_hideCommunityCategory_0, l_hidePremiumCategory_0);
    return v3.createElement(v13, {
        layoutOrderMain = l_layoutOrderMain_0, 
        navHeightMain = l_navHeightMain_0, 
        layoutOrderSub = l_layoutOrderSub_0, 
        navHeightSub = l_navHeightSub_0, 
        categoryTable = v45, 
        selectedCategoryIndex = l_selectedCategoryIndex_0, 
        selectCategory = l_selectCategory_0, 
        selectedSubcategoryIndex = l_selectedSubcategoryIndex_0, 
        subcategoryTable = v45[l_selectedCategoryIndex_0].Subcategories, 
        onSubNavigationPropsDidUpdate = v32.onSubNavigationPropsDidUpdate, 
        selectSubcategory = l_selectSubcategory_0, 
        absoluteSizeChanged = l_absoluteSizeChanged_0, 
        showingTopics = l_showingTopics_0, 
        navigationFrameRef = v32.props.navBarRef, 
        NextSelectionUp = v32.props.NextSelectionUp, 
        NextSelectionDown = v32.props.NextSelectionDown
    });
end;
return v5.connect(function(v46, v47)
    local v48 = nil;
    local v49 = nil;
    if ((not v15() or not v47.enableSearchResultsCategories) or not v47.fromSearch) or not v46.AvatarExperience.Catalog.SearchCategories then
        v48 = v46.AvatarExperience.Catalog.Categories.category;
        v49 = v46.AvatarExperience.Catalog.Categories.subcategory;
    else
        v48 = v46.AvatarExperience.Catalog.SearchCategories.category;
        v49 = v46.AvatarExperience.Catalog.SearchCategories.subcategory;
    end;
    return {
        selectedCategoryIndex = v48, 
        selectedSubcategoryIndex = v49
    };
end, function(v50)
    return {
        setCategoryAndSubcategory = function(v51, v52, v53)
            v50(v11(v51, v52, v53));
        end, 
        setSearchCategoryAndSubcategory = if not v15() then nil else function(v54, v55)
            v50(v12(v54, v55));
        end, 
        exit3DFullView = function(v56, v57)
            v50(v8(v56, v57));
        end
    };
end)((v4.withNavigation((l_RoactAppPolicy_0.connect(function(v58, _)
    return {
        hideCommunityCategory = not v58.getCatalogCommunityCreations(), 
        hidePremiumCategory = not v58.getCatalogPremiumCategory()
    };
end)(v16)))));
