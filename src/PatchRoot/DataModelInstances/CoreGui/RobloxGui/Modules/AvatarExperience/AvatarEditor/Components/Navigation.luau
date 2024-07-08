local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.RoactNavigation);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(l_CorePackages_0.Packages.t);
local l_withNavigation_0 = v4.withNavigation;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v12 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveNewAssetNotification);
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveNewOutfitNotification);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NavigationFrame);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withOpaqueAvatarRoute);
local v19 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v25 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local v26 = v2.PureComponent:extend("Navigation");
v26.validateProps = v7.strictInterface({
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
    avatarType = v7.string, 
    selectedCategoryIndex = v7.number, 
    selectedSubcategoryIndex = v7.number, 
    newItemNotifications = v7.table, 
    exit3DFullView = v7.callback, 
    setCategoryAndSubcategory = v7.callback, 
    clearTryOns = v7.callback, 
    removeNewAssetNotification = v7.callback, 
    removeNewOutfitNotification = v7.callback, 
    focusController = v7.table, 
    navigation = v7.table, 
    opaqueRoute = v7.table, 
    networking = v7.callback
});
v26.removeNewItemNotificationIfNeeded = function(v27, v28, v29)
    local v30 = v15();
    local l_Subcategories_0 = v30[v28].Subcategories;
    local v32 = (not not l_Subcategories_0 and l_Subcategories_0[v29]) and l_Subcategories_0[v29].AssetTypeIdStrings or v30[v28].AssetTypeIdStrings;
    if not v32 then
        if not v27.props.newItemNotifications[v19.NewOutfitNotificationKey] then
            if not ((not v27.props.newItemNotifications[v19.NewDHOutfitNotificationKey] or not l_Subcategories_0) or not l_Subcategories_0[v29]) and l_Subcategories_0[v29].Name == "Style" then
                v27.props.removeNewOutfitNotification(v19.OutfitTypes.DynamicHead);
            end;
        elseif not (not l_Subcategories_0 or not l_Subcategories_0[v29]) and l_Subcategories_0[v29].SearchUuid == v22.PurchasedCharacterKey then
            v27.props.removeNewOutfitNotification(v19.OutfitTypes.Avatar);
            return ;
        end;
        return ;
    else
        for _, v34 in v32, nil, nil do
            if v27.props.newItemNotifications[v34] then
                v27.props.removeNewAssetNotification(v34);
            end;
        end;
        return ;
    end;
end;
v26.setCategoryAndSubcategory = function(v35, v36, v37)
    local l_analytics_0 = v35.props.analytics;
    local l_axAnalytics_0 = v35.props.axAnalytics;
    local l_navigation_0 = v35.props.navigation;
    local l_backToTopSignal_0 = v35.props.backToTopSignal;
    if (l_backToTopSignal_0 and (not (v36 ~= nil) or v36 == v35.props.selectedCategoryIndex)) and (not (v37 ~= nil) or v37 == v35.props.selectedSubcategoryIndex) then
        l_backToTopSignal_0:fire();
    end;
    v35.props.setCategoryAndSubcategory(v36, v37, l_analytics_0);
    v35.props.exit3DFullView(l_axAnalytics_0, l_navigation_0.state.routeName);
end;
v26.init = function(v42)
    local function v45(v43)
        local v44 = ({
            [v19.PageType.Animation] = "Feature.Avatar.Message.R15AnimationsPrompt", 
            [v19.PageType.Emotes] = "Feature.Avatar.Message.R15EmotesPrompt", 
            [v19.PageType.BodyStyle] = "Feature.Avatar.Message.R15StylesPrompt"
        })[v43];
        if v44 ~= nil then
            v42.props.navigation.navigate(v20.R15UpgradePrompt, {
                onOverlayClosed = v42.onR15PromptClosed, 
                bodyTextKey = v44
            });
        end;
    end;
    v42.selectCategory = function(v46)
        v42:removeNewItemNotificationIfNeeded(v46, 1);
        v42:setCategoryAndSubcategory(v46, nil);
        if v42.props.avatarType == v19.AvatarType.R6 then
            v45(v15()[v46].PageType);
        end;
    end;
    v42.onR15PromptClosed = function()
        local v47 = l_wasLastInputGamepad_0();
        v24("Navigation", v47);
        if v47 then
            v42.props.focusController.captureFocus();
        end;
    end;
    v42.selectSubcategory = function(v48, v49)
        v42:removeNewItemNotificationIfNeeded(v48, v49);
        if v42.props.avatarType == v19.AvatarType.R6 then
            local v50 = v15()[v48];
            if v50 then
                local v51 = v50.Subcategories[v49];
                if v51 then
                    v45(v51.PageType);
                end;
            end;
        end;
        v42:setCategoryAndSubcategory(nil, v49);
    end;
end;
v26.onSubNavigationPropsDidUpdate = function(v52)
    local l_selectedCategoryIndex_0 = v52.props.selectedCategoryIndex;
    local l_selectedSubcategoryIndex_0 = v52.props.selectedSubcategoryIndex;
    return function(v55, v56)
        local l_selectedCategoryIndex_1 = v55.selectedCategoryIndex;
        local l_selectedSubcategoryIndex_1 = v55.selectedSubcategoryIndex;
        local v59 = l_selectedCategoryIndex_0 ~= l_selectedCategoryIndex_1;
        local v60 = l_selectedSubcategoryIndex_0 ~= l_selectedSubcategoryIndex_1;
        if v59 or v60 then
            if not (not v59 or not v56.current) then
                v56.current.CanvasPosition = Vector2.new();
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v26.willUpdate = function(v61, v62)
    local v63 = true;
    if v62.selectedCategoryIndex == v61.props.selectedCategoryIndex then
        v63 = v62.selectedSubcategoryIndex ~= v61.props.selectedSubcategoryIndex;
    end;
    if v63 then
        v61.props.clearTryOns();
        v23.closeFiltersAndItemDetails(v61.props.navigation);
    end;
end;
v26.render = function(v64)
    local l_layoutOrderMain_0 = v64.props.layoutOrderMain;
    local l_layoutOrderSub_0 = v64.props.layoutOrderSub;
    local l_navHeightMain_0 = v64.props.navHeightMain;
    local l_navHeightSub_0 = v64.props.navHeightSub;
    local l_selectedCategoryIndex_2 = v64.props.selectedCategoryIndex;
    local l_selectedSubcategoryIndex_2 = v64.props.selectedSubcategoryIndex;
    local l_absoluteSizeChanged_0 = v64.props.absoluteSizeChanged;
    local v72 = v15();
    return v2.createElement(v17, {
        layoutOrderMain = l_layoutOrderMain_0, 
        navHeightMain = l_navHeightMain_0, 
        layoutOrderSub = l_layoutOrderSub_0, 
        navHeightSub = l_navHeightSub_0, 
        categoryTable = v72, 
        selectedCategoryIndex = l_selectedCategoryIndex_2, 
        selectCategory = v64.selectCategory, 
        selectedSubcategoryIndex = l_selectedSubcategoryIndex_2, 
        subcategoryTable = v72[l_selectedCategoryIndex_2].Subcategories, 
        onSubNavigationPropsDidUpdate = v64:onSubNavigationPropsDidUpdate(), 
        selectSubcategory = v64.selectSubcategory, 
        absoluteSizeChanged = l_absoluteSizeChanged_0, 
        navigationFrameRef = v64.props.navBarRef, 
        NextSelectionUp = v64.props.NextSelectionUp, 
        NextSelectionDown = v64.props.NextSelectionDown
    });
end;
v26.didUpdate = function(v73, v74)
    local l_name_0 = v73.props.opaqueRoute.name;
    local l_name_1 = v74.opaqueRoute.name;
    local v77 = false;
    if l_name_0 ~= l_name_1 then
        v77 = l_name_0 == v20.AvatarEditor;
    end;
    if v77 then
        v73:removeNewItemNotificationIfNeeded(v73.props.selectedCategoryIndex, v73.props.selectedSubcategoryIndex);
    end;
end;
v26 = v18((l_withNavigation_0((v3.connect(function(v78)
    return {
        avatarType = v78.AvatarExperience.AvatarEditor.Character.AvatarType, 
        selectedCategoryIndex = v78.AvatarExperience.AvatarEditor.Categories.category, 
        selectedSubcategoryIndex = v78.AvatarExperience.AvatarEditor.Categories.subcategory, 
        newItemNotifications = v78.AvatarExperience.AvatarEditor.NewItemNotifications
    };
end, function(v79)
    return {
        setCategoryAndSubcategory = function(v80, v81, v82)
            v79(v16(v80, v81, v82));
        end, 
        clearTryOns = function()
            v79(v12());
        end, 
        removeNewAssetNotification = function(v83)
            v79(v13(v83));
        end, 
        removeNewOutfitNotification = function(v84)
            v79(v14(v84));
        end, 
        exit3DFullView = function(v85, v86)
            v79(v25(v85, v86));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v10
})(v26)))))));
return function(v87)
    return v5.withFocusController(function(v88)
        return v2.createElement(v26, v6.Dictionary.join(v87, {
            focusController = v88
        }));
    end);
end;
