local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v5.Focusable;
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.UIBlox);
local v9 = require(l_CorePackages_0.AvatarExperienceDeps);
local v10 = require(l_CorePackages_0.RoactNavigation);
local l_RoactFitComponents_0 = v9.RoactFitComponents;
local l_FitFrameHorizontal_0 = l_RoactFitComponents_0.FitFrameHorizontal;
local l_withStyle_0 = v8.Style.withStyle;
local l_SpringAnimatedItem_0 = v8.Utility.SpringAnimatedItem;
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v16 = require(l_Modules_0.LuaApp.Constants);
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.DEPRECATED_CategoryButton);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.IconCategoryButton);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.TextCategoryButton);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NavHighlight);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.ScrollingListWithArrowsAndGradient);
local v27 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSearchResultsCategories);
local v28 = v4.PureComponent:extend("SubNavigation");
local v29 = {
    dampingRatio = 1, 
    frequency = 3.5
};
v28.validateProps = v3.strictInterface({
    layoutOrder = v3.number, 
    navHeight = v3.number, 
    selectedCategoryIndex = v3.number, 
    selectedSubcategoryIndex = v3.number, 
    subcategories = v3.optional(v3.table), 
    onSubNavigationPropsDidUpdate = v3.callback, 
    selectSubcategory = v3.callback, 
    NextSelectionUp = v3.optional(v3.table), 
    NextSelectionDown = v3.optional(v3.table), 
    subNavigationRef = v3.optional(v3.table), 
    lastInputGroup = v3.string, 
    newItemNotifications = v3.table, 
    navigation = v3.table
});
local function v31(v30)
    return {
        Size = UDim2.new(1, 0, 0, v30.height)
    };
end;
v28.init = function(v32)
    v32.scrollingFrameRef = v4.createRef();
    v32.navButtonRefs = v5.createRefCache();
    v32.categoryButtonRefs = {};
    v32:setState({
        selectedCategoryPositionX = if v27() then nil else 0, 
        selectedCategoryWidth = if v27() then nil else 0, 
        selectedCategoryButtonRef = nil, 
        renderHighlight = false
    });
    v32.onNavFrameSizeChanged = function(v33)
        if v32.scrollingFrameRef.current then
            v32.scrollingFrameRef.current.CanvasSize = UDim2.new(0, v33.AbsoluteSize.X, 1, 0);
        end;
    end;
end;
v28.getCategoryButtonRef = function(v34, v35)
    if not v34.categoryButtonRefs[v35] then
        v34.categoryButtonRefs[v35] = v4.createRef();
    end;
    return v34.categoryButtonRefs[v35];
end;
v28.tryUpdateScrollingFramePosition = function(v36, v37, v38)
    local v39 = v36.scrollingFrameRef and v36.scrollingFrameRef:getValue();
    local v40 = (v37 or 0) - 50;
    if v39 then
        local l_X_0 = v39.AbsoluteWindowSize.X;
        if not l_X_0 or l_X_0 == 0 then
            return ;
        else
            local v42 = false;
            if v37 + v38 > 0 then
                v42 = v37 + v38 < l_X_0;
            end;
            local v43 = false;
            if v37 > 0 then
                v43 = v37 < l_X_0;
            end;
            if not (v43 or v42) then
                v39.CanvasPosition = Vector2.new(v40, v39.CanvasPosition.Y);
            end;
        end;
    end;
end;
v28.setCategoryPositionAndWidthState = function(v44)
    if not (not v44.categoryButtonRefs or not v44.props.selectedSubcategoryIndex) and v44.categoryButtonRefs[v44.props.selectedSubcategoryIndex] then
        local v45 = v44.categoryButtonRefs[v44.props.selectedSubcategoryIndex];
        local v46 = v45:getValue();
        if v46 == nil then
            v44:setState({
                renderHighlight = false
            });
            return false;
        else
            if not v27() then
                v44:setState({
                    selectedCategoryPositionX = v46.AbsolutePosition.X, 
                    selectedCategoryWidth = v46.AbsoluteSize.X, 
                    renderHighlight = true
                });
            else
                v44:tryUpdateScrollingFramePosition(v46.AbsolutePosition.X, v46.AbsoluteSize.X);
                v44:setState({
                    selectedCategoryButtonRef = v45, 
                    renderHighlight = true
                });
            end;
            return true;
        end;
    else
        v44:setState({
            renderHighlight = false
        });
        return false;
    end;
end;
v28.didMount = function(v47)
    v47:setCategoryPositionAndWidthState();
    if not (not v27() or not v47.scrollingFrameRef.current) then
        v47.scrollingFrameRef.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Once(function()
            v47:setCategoryPositionAndWidthState();
        end);
    end;
end;
v28.didUpdate = function(v48, v49)
    v48.props.onSubNavigationPropsDidUpdate(v49, v48.scrollingFrameRef);
    if not (v48.props.selectedSubcategoryIndex == v49.selectedSubcategoryIndex) or v48.props.selectedCategoryIndex ~= v49.selectedCategoryIndex then
        v48:setCategoryPositionAndWidthState();
    end;
end;
v28.getRouteName = function(v50)
    return v50.props.navigation.state.routeName;
end;
local function _(v51, v52)
    local v53 = false;
    if v51.SearchUuid == v18.PurchasedCharacterKey then
        v53 = v52[v17.NewOutfitNotificationKey];
    end;
    local v54 = false;
    if v51.OutfitType == v17.OutfitTypes.DynamicHead then
        v54 = v52[v17.NewDHOutfitNotificationKey];
    end;
    return v53 or v54;
end;
v28.hasNewItemNotification = function(v56, v57, v58)
    if v56:getRouteName() ~= v15.AvatarEditor then
        return false;
    else
        local l_newItemNotifications_0 = v56.props.newItemNotifications;
        local v60 = v58[v57];
        local l_AssetTypeIdStrings_0 = v60.AssetTypeIdStrings;
        if not l_AssetTypeIdStrings_0 or not v19.shouldNotifyAssetTypes(l_AssetTypeIdStrings_0, l_newItemNotifications_0) then
            local v62 = false;
            if v60.SearchUuid == v18.PurchasedCharacterKey then
                v62 = l_newItemNotifications_0[v17.NewOutfitNotificationKey];
            end;
            local v63 = false;
            if v60.OutfitType == v17.OutfitTypes.DynamicHead then
                v63 = l_newItemNotifications_0[v17.NewDHOutfitNotificationKey];
            end;
            if not (v62 or v63) then
                return false;
            else
                return true;
            end;
        else
            return true;
        end;
    end;
end;
v28.getNextSelectionLeft = function(v64, v65, _)
    return v65 > 1 and v64.navButtonRefs[v65 - 1] or nil;
end;
v28.getNextSelectionRight = function(v67, v68, v69)
    return v68 < #v69 and v67.navButtonRefs[v68 + 1] or nil;
end;
v28.renderIconCategoryButton = function(v70, v71, v72, v73, v74, v75)
    local v76 = v73 == v74;
    local l_subcategories_0 = v70.props.subcategories;
    local l_selectSubcategory_0 = v70.props.selectSubcategory;
    return (v4.createElement(l_Focusable_0[v21], {
        categoryTitle = v75.Title, 
        iconOn = v75.IconOn, 
        iconOff = v75.IconOff, 
        navHeight = v70.props.navHeight, 
        isSubNavigationButton = true, 
        layoutOrder = v74, 
        isSelected = v76, 
        hasNewItemNotification = v70:hasNewItemNotification(v74, l_subcategories_0), 
        frameRef = v70:getCategoryButtonRef(v74), 
        onActivate = function()
            l_selectSubcategory_0(v72, v74);
        end, 
        subButtons = v75.SubButtons, 
        subcatIndex = v74, 
        [v4.Ref] = v70.navButtonRefs[v74], 
        NextSelectionLeft = v70:getNextSelectionLeft(v74), 
        NextSelectionRight = v70:getNextSelectionRight(v74, l_subcategories_0), 
        inputBindings = v71 ~= nil and {
            ShiftLeft = v5.Input.onBegin(Enum.KeyCode.ButtonL1, function()
                if v74 > 1 then
                    v71.moveFocusLeft();
                end;
            end), 
            ShiftRight = v5.Input.onBegin(Enum.KeyCode.ButtonR1, function()
                if v74 < #l_subcategories_0 then
                    v71.moveFocusRight();
                end;
            end)
        } or nil
    }));
end;
v28.renderTextCategoryButton = function(v79, v80, v81, v82, v83, v84)
    local v85 = v82 == v83;
    local l_subcategories_1 = v79.props.subcategories;
    local l_selectSubcategory_1 = v79.props.selectSubcategory;
    return (v4.createElement(l_Focusable_0[v22], {
        categoryTitle = v84.Title, 
        layoutOrder = v83, 
        isSelected = v85, 
        hasNewItemNotification = v79:hasNewItemNotification(v83, l_subcategories_1), 
        frameRef = v79:getCategoryButtonRef(v83), 
        onActivate = function()
            l_selectSubcategory_1(v81, v83);
        end, 
        subButtons = v84.SubButtons, 
        subcatIndex = v83, 
        [v4.Ref] = v79.navButtonRefs[v83], 
        NextSelectionLeft = v79:getNextSelectionLeft(v83), 
        NextSelectionRight = v79:getNextSelectionRight(v83, l_subcategories_1), 
        inputBindings = v80 ~= nil and {
            ShiftLeft = v5.Input.onBegin(Enum.KeyCode.ButtonL1, function()
                if v83 > 1 then
                    v80.moveFocusLeft();
                end;
            end), 
            ShiftRight = v5.Input.onBegin(Enum.KeyCode.ButtonR1, function()
                if v83 < #l_subcategories_1 then
                    v80.moveFocusRight();
                end;
            end)
        } or nil
    }));
end;
v28.renderCategoryButton = function(v88, v89, v90, v91, v92, v93)
    local v94 = v91 == v92;
    local l_subcategories_2 = v88.props.subcategories;
    local l_selectSubcategory_2 = v88.props.selectSubcategory;
    return v4.createElement(l_Focusable_0[v20], {
        categoryTitle = v93.Title, 
        layoutOrder = v92, 
        isSelected = v94, 
        hasNewItemNotification = v88:hasNewItemNotification(v92, l_subcategories_2), 
        frameRef = v88:getCategoryButtonRef(v92), 
        onActivate = function()
            l_selectSubcategory_2(v90, v92);
        end, 
        [v4.Ref] = v88.navButtonRefs[v92], 
        NextSelectionLeft = v92 > 1 and v88.navButtonRefs[v92 - 1] or nil, 
        NextSelectionRight = v92 < #l_subcategories_2 and v88.navButtonRefs[v92 + 1] or nil, 
        inputBindings = v89 ~= nil and {
            ShiftLeft = v5.Input.onBegin(Enum.KeyCode.ButtonL1, function()
                if v92 > 1 then
                    v89.moveFocusLeft();
                end;
            end), 
            ShiftRight = v5.Input.onBegin(Enum.KeyCode.ButtonR1, function()
                if v92 < #l_subcategories_2 then
                    v89.moveFocusRight();
                end;
            end)
        } or nil
    });
end;
v28.renderSubNavFrameChildren = function(v97, v98)
    local l_subcategories_3 = v97.props.subcategories;
    local l_selectedSubcategoryIndex_0 = v97.props.selectedSubcategoryIndex;
    local l_selectedCategoryIndex_0 = v97.props.selectedCategoryIndex;
    local v102 = {};
    if l_subcategories_3 then
        for v103, v104 in l_subcategories_3, nil, nil do
            v102[v104.Name] = v97:renderCategoryButton(v98, l_selectedCategoryIndex_0, l_selectedSubcategoryIndex_0, v103, v104);
        end;
    end;
    return v102;
end;
v28.getScrollingListChildren = function(v105)
    local l_subNavigationRef_0 = v105.props.subNavigationRef;
    local v107 = not (v105.props.lastInputGroup == v16.InputType.Gamepad) and v105.state.renderHighlight;
    local l_selectedSubcategoryIndex_1 = v105.props.selectedSubcategoryIndex;
    local v109 = UDim.new(0, 15);
    local v110 = l_RoactFitComponents_0.Rect.rectangle(10, 0);
    return {
        SubNavFrame = v5.withFocusController(function(v111)
            return v4.createElement(l_Focusable_0[l_FitFrameHorizontal_0], {
                height = UDim.new(1, 0), 
                contentPadding = v109, 
                margin = v110, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                BackgroundTransparency = 1, 
                [v4.Change.AbsoluteSize] = v105.onNavFrameSizeChanged, 
                [v4.Ref] = l_subNavigationRef_0, 
                NextSelectionUp = v105.props.NextSelectionUp, 
                NextSelectionDown = v105.props.NextSelectionDown, 
                defaultChild = v105.navButtonRefs[l_selectedSubcategoryIndex_1 == 0 and 1 or l_selectedSubcategoryIndex_1], 
                inputBindings = {
                    ToMainNav = v5.Input.onBegin(Enum.KeyCode.ButtonB, function()
                        v111.moveFocusUp();
                    end)
                }
            }, v105:renderSubNavFrameChildren(v111));
        end), 
        Highlight = v107 and v4.createElement(v23, {
            scrollingFrameRef = v105.scrollingFrameRef, 
            selectedCategoryButtonPositionX = v105.state.selectedCategoryPositionX, 
            selectedCategoryButtonWidth = v105.state.selectedCategoryWidth, 
            selectedCategoryButtonRef = if not v27() then nil else v105.state.selectedCategoryButtonRef
        })
    };
end;
v28.getSubNavigationChildren = function(v112, _, v114)
    return {
        ScrollingListWithArrowsAndGradient = v4.createElement(v26, {
            getScollingListContent = function()
                return v112:getScrollingListChildren();
            end, 
            listHeight = v114, 
            scrollingFrameRef = v112.scrollingFrameRef, 
            buttonRefs = v112.categoryButtonRefs, 
            childWidgetIndex = v112.props.selectedCategoryIndex, 
            useIntroScroll = true, 
            buttonPadding = 15
        })
    };
end;
v28.render = function(v115)
    local l_layoutOrder_0 = v115.props.layoutOrder;
    local l_navHeight_0 = v115.props.navHeight;
    if not v115.props.subcategories then
        l_navHeight_0 = 0;
    end;
    return (l_withStyle_0(function(v118)
        local l_Theme_0 = v118.Theme;
        return v4.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundColor3 = l_Theme_0.BackgroundContrast.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundContrast.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = l_layoutOrder_0, 
                ClipsDescendants = true
            }, 
            animatedValues = {
                height = l_navHeight_0
            }, 
            mapValuesToProps = v31, 
            springOptions = v29
        }, v115:getSubNavigationChildren(l_Theme_0, l_navHeight_0));
    end));
end;
return (v10.withNavigation((v25((v7.connect(function(v120, _)
    return {
        newItemNotifications = v120.AvatarExperience.AvatarEditor.NewItemNotifications
    };
end, nil)(v28))))));
