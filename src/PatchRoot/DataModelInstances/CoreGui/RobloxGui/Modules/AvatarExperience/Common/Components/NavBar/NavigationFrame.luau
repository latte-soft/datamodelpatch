local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v4.Focusable;
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_CorePackages_0.Packages.t);
local l_FitFrameVertical_0 = require(l_CorePackages_0.AvatarExperienceDeps).RoactFitComponents.FitFrameVertical;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterButtonLayout);
local v10 = require(l_CorePackages_0.RoactNavigation);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_withStyle_0 = v6.Style.withStyle;
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.MainNavigation);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.SubNavigation);
local v15 = v3.PureComponent:extend("NavigationFrame");
v15.validateProps = v7.strictInterface({
    layoutOrderMain = v7.number, 
    navHeightMain = v7.number, 
    layoutOrderSub = v7.number, 
    navHeightSub = v7.number, 
    categoryTable = v7.table, 
    selectedCategoryIndex = v7.number, 
    selectCategory = v7.callback, 
    selectedSubcategoryIndex = v7.number, 
    subcategoryTable = v7.optional(v7.table), 
    onSubNavigationPropsDidUpdate = v7.callback, 
    selectSubcategory = v7.callback, 
    absoluteSizeChanged = v7.callback, 
    navigationFrameRef = v7.table, 
    NextSelectionUp = v7.optional(v7.table), 
    NextSelectionDown = v7.optional(v7.table), 
    showingTopics = v7.optional(v7.boolean), 
    navigation = v7.table
});
v15.init = function(v16)
    v16.mainNavRef = v3.createRef();
    v16.subNavRef = v3.createRef();
    v16.onAbsoluteSizeChanged = function(v17)
        local l_absoluteSizeChanged_0 = v16.props.absoluteSizeChanged;
        if l_absoluteSizeChanged_0 then
            l_absoluteSizeChanged_0(v17.AbsoluteSize);
        end;
    end;
end;
v15.render = function(v19)
    local l_layoutOrderMain_0 = v19.props.layoutOrderMain;
    local l_layoutOrderSub_0 = v19.props.layoutOrderSub;
    local l_navHeightMain_0 = v19.props.navHeightMain;
    local l_navHeightSub_0 = v19.props.navHeightSub;
    local l_categoryTable_0 = v19.props.categoryTable;
    local l_selectedCategoryIndex_0 = v19.props.selectedCategoryIndex;
    local l_subcategoryTable_0 = v19.props.subcategoryTable;
    local l_selectedSubcategoryIndex_0 = v19.props.selectedSubcategoryIndex;
    local l_selectCategory_0 = v19.props.selectCategory;
    local l_onSubNavigationPropsDidUpdate_0 = v19.props.onSubNavigationPropsDidUpdate;
    local l_selectSubcategory_0 = v19.props.selectSubcategory;
    local v31 = l_categoryTable_0[l_selectedCategoryIndex_0].Subcategories ~= nil;
    local l_showingTopics_0 = v19.props.showingTopics;
    local v33 = not l_showingTopics_0 and v19.props.navigation.state.routeName == v11.Catalog;
    return l_withStyle_0(function(v34)
        local l_Theme_0 = v34.Theme;
        local l_navigationFrameRef_0 = v19.props.navigationFrameRef;
        return v4.withFocusController(function(_)
            local l_createElement_0 = v3.createElement;
            local v39 = l_Focusable_0[l_FitFrameVertical_0];
            local v40 = {
                width = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                BackgroundColor3 = l_Theme_0.BackgroundContrast.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundContrast.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = l_layoutOrderMain_0, 
                ZIndex = 3, 
                [v3.Change.AbsoluteSize] = v19.onAbsoluteSizeChanged, 
                [v3.Ref] = l_navigationFrameRef_0, 
                defaultChild = v19.mainNavRef, 
                restorePreviousChildFocus = true
            };
            local v41 = {};
            local l_createElement_1 = v3.createElement;
            local l_v13_0 = v13;
            local v44 = {
                layoutOrder = l_layoutOrderMain_0, 
                navHeight = l_navHeightMain_0, 
                zIndex = 1, 
                categories = l_categoryTable_0, 
                selectedCategoryIndex = l_selectedCategoryIndex_0, 
                selectCategory = l_selectCategory_0
            };
            local v45 = false;
            if l_selectedSubcategoryIndex_0 ~= 0 then
                v45 = v31;
            end;
            v44.subcategorySelected = v45;
            v44.mainNavigationRef = v19.mainNavRef;
            v44.NextSelectionDown = if not v31 and l_showingTopics_0 then v19.props.NextSelectionDown else v19.subNavRef;
            v44.NextSelectionUp = v19.props.NextSelectionUp;
            v41.MainNavigation = l_createElement_1(l_v13_0, v44);
            v41.SubNavigation = v3.createElement(v9, {
                height = if v31 or v33 then l_navHeightSub_0 else 0, 
                isContentEmpty = not v31, 
                layoutOrder = l_layoutOrderSub_0, 
                showFilterButton = v33, 
                layoutRef = v19.subNavRef, 
                NextSelectionUp = v19.mainNavRef, 
                NextSelectionDown = v19.props.NextSelectionDown
            }, {
                SubNavigation = v3.createElement(v14, {
                    layoutOrder = 1, 
                    navHeight = l_navHeightSub_0, 
                    selectedCategoryIndex = l_selectedCategoryIndex_0, 
                    selectedSubcategoryIndex = l_selectedSubcategoryIndex_0, 
                    subcategories = l_subcategoryTable_0, 
                    onSubNavigationPropsDidUpdate = l_onSubNavigationPropsDidUpdate_0, 
                    selectSubcategory = l_selectSubcategory_0
                })
            });
            return l_createElement_0(v39, v40, v41);
        end);
    end);
end;
return (v10.withNavigation(v15));
