local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.CategoryContent);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Navigation);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectHasOwnedOrRecommendedAssetsData);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.GetDataStatusForCategory);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v17 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v20 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local v21 = require(l_CorePackages_0.RoactNavigation);
local v22 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v23 = v2.PureComponent:extend("NavigationItemsView");
local v24 = {
    [v9.Catalog] = true, 
    [v9.ProfilePictureEditorEmotes] = true
};
v23.defaultProps = {
    swipeNavigationEnabled = false
};
v23.init = function(v25)
    v25.navBarRef = v2.createRef();
    v25.contentRef = v2.createRef();
    v25.backToTopSignal = l_Signal_0.new();
    v25:setState({
        restorePreviousChildFocus = true
    });
    v25.setCategory = function(v26)
        v25.props.setCategoryAndSubcategory(v26, nil, v25.props.analytics);
        v25.props.exit3DFullView(v25.props.axAnalytics, v25.props.navigation.state.routeName);
    end;
    v25.setSubcategory = function(v27)
        v25.props.setCategoryAndSubcategory(nil, v27, v25.props.analytics);
        v25.props.exit3DFullView(v25.props.axAnalytics, v25.props.navigation.state.routeName);
    end;
    v25.navigate = function(v28)
        if v25.props.swipeNavigationEnabled then
            local v29 = v11();
            local l_categoryIndex_0 = v25.props.categoryIndex;
            local l_subcategoryIndex_0 = v25.props.subcategoryIndex;
            local l_Subcategories_0 = v29[l_categoryIndex_0].Subcategories;
            if l_Subcategories_0 and l_subcategoryIndex_0 ~= 0 then
                local v33 = l_subcategoryIndex_0 + v28;
                if v33 > 0 and v33 <= #l_Subcategories_0 then
                    v25.setSubcategory(v33);
                    return ;
                end;
            end;
            local v34 = l_categoryIndex_0 + v28;
            if v34 > 0 and v34 <= #v29 then
                v25.setCategory(v34);
            end;
            return ;
        else
            return ;
        end;
    end;
    v25.onNavBarSizeChanged = function(v35)
        if v25.contentRef.current then
            v25.contentRef.current.Size = UDim2.new(1, 0, 1, -v35.Y);
        end;
    end;
    v25.navigateLeft = function()
        v25.navigate(-1);
    end;
    v25.navigateRight = function()
        v25.navigate(1);
    end;
end;
v23.render = function(v36)
    local l_analytics_0 = v36.props.analytics;
    local l_axAnalytics_0 = v36.props.axAnalytics;
    local v39 = v36.props.hasOwnedOrRecommendedAssets or v36.props.dataStatus == v17.Failed;
    return l_withStyle_0(function(v40)
        local l_Theme_0 = v40.Theme;
        return v2.createElement(v4.Focusable.Frame, {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v2.Ref] = v36.props.defaultChildRef, 
            restorePreviousChildFocus = v36.state.restorePreviousChildFocus, 
            defaultChild = v36.navBarRef, 
            NextSelectionRight = v36.props.NextSelectionRight
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 0)
            }), 
            NavBar = v2.createElement(v13, {
                analytics = l_analytics_0, 
                axAnalytics = l_axAnalytics_0, 
                layoutOrderMain = 1, 
                layoutOrderSub = 2, 
                navHeightMain = v8.MainNavHeight, 
                navHeightSub = v8.SubNavHeight, 
                absoluteSizeChanged = v36.onNavBarSizeChanged, 
                backToTopSignal = v36.backToTopSignal, 
                navBarRef = v36.navBarRef, 
                NextSelectionDown = not not v39 and v36.contentRef or nil, 
                NextSelectionUp = v36.props.NextSelectionUp
            }), 
            CategoryContent = v2.createElement(v12, {
                Size = UDim2.new(1, 0, 1, 0), 
                LayoutOrder = 2, 
                frameRef = v36.contentRef, 
                backToTopSignal = v36.backToTopSignal, 
                navigateLeft = v36.navigateLeft, 
                navigateRight = v36.navigateRight, 
                NextSelectionUp = v36.navBarRef, 
                restorePreviousChildFocus = v36.state.restorePreviousChildFocus
            })
        });
    end);
end;
v23.didUpdate = function(v42, v43)
    local l_name_0 = v42.props.avatarRoute.current.name;
    local l_name_1 = v43.avatarRoute.current.name;
    if l_name_0 == v9.AvatarEditor then
        if not v42.state.restorePreviousChildFocus then
            v42:setState({
                restorePreviousChildFocus = true
            });
            return ;
        end;
    elseif not (not (v24[l_name_0] and l_name_1 == v9.AvatarEditor) or not v42.state.restorePreviousChildFocus) then
        v42:setState({
            restorePreviousChildFocus = false
        });
    end;
end;
return v3.connect(function(v46)
    return {
        categoryIndex = v46.AvatarExperience.AvatarEditor.Categories.category, 
        subcategoryIndex = v46.AvatarExperience.AvatarEditor.Categories.subcategory, 
        hasOwnedOrRecommendedAssets = v14(v46), 
        dataStatus = v15(v46)
    };
end, function(v47)
    return {
        setCategoryAndSubcategory = function(v48, v49, v50)
            v47(v16(v48, v49, v50));
        end, 
        exit3DFullView = function(v51, v52)
            v47(v20(v51, v52));
        end
    };
end)((v21.withNavigation((v10((l_RoactServices_0.connect({
    analytics = v7, 
    axAnalytics = v22
})(v23)))))));
