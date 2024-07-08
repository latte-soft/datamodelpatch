local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v4.Focusable;
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.UIBlox);
local v8 = require(l_CorePackages_0.AvatarExperienceDeps);
local v9 = require(l_CorePackages_0.Packages.t);
local l_FitFrameHorizontal_0 = v8.RoactFitComponents.FitFrameHorizontal;
local l_withStyle_0 = v7.Style.withStyle;
local v12 = require(l_Modules_0.LuaApp.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.DEPRECATED_CategoryButton);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.IconCategoryButton);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NavHighlight);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.ScrollingListWithArrowsAndGradient);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v23 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSearchResultsCategories);
local v24 = v3.PureComponent:extend("MainNavigation");
v24.validateProps = v9.strictInterface({
    layoutOrder = v9.number, 
    navHeight = v9.number, 
    zIndex = v9.number, 
    categories = v9.table, 
    selectedCategoryIndex = v9.number, 
    selectCategory = v9.callback, 
    subcategorySelected = v9.boolean, 
    mainNavigationRef = v9.table, 
    NextSelectionDown = v9.optional(v9.table), 
    NextSelectionUp = v9.optional(v9.table), 
    lastInputGroup = v9.string, 
    newItemNotifications = v9.table
});
v24.init = function(v25)
    v25.navButtonRefs = v4.createRefCache();
    v25.categoryButtonRefs = {};
    v25.scrollingFrameRef = v3.createRef();
    v25:setState({
        selectedCategoryPositionX = if v23() then nil else 0, 
        selectedCategoryWidth = if v23() then nil else 0, 
        selectedCategoryButtonRef = nil
    });
    v25.onNavFrameSizeChanged = function(v26)
        if v25.scrollingFrameRef.current then
            v25.scrollingFrameRef.current.CanvasSize = UDim2.new(0, v26.AbsoluteSize.X, 1, 0);
        end;
    end;
end;
v24.getCategoryButtonRef = function(v27, v28)
    if not v27.categoryButtonRefs[v28] then
        v27.categoryButtonRefs[v28] = v3.createRef();
    end;
    return v27.categoryButtonRefs[v28];
end;
v24.tryUpdateScrollingFramePosition = function(v29, v30, v31)
    local v32 = v29.scrollingFrameRef and v29.scrollingFrameRef:getValue();
    local v33 = (v30 or 0) - 50;
    if v32 then
        local l_X_0 = v32.AbsoluteWindowSize.X;
        if not l_X_0 or l_X_0 == 0 then
            return ;
        else
            local v35 = false;
            if v30 + v31 > 0 then
                v35 = v30 + v31 < l_X_0;
            end;
            local v36 = false;
            if v30 > 0 then
                v36 = v30 < l_X_0;
            end;
            if not (v36 or v35) then
                v32.CanvasPosition = Vector2.new(v33, v32.CanvasPosition.Y);
            end;
        end;
    end;
end;
v24.setCategoryPositionAndWidthState = function(v37)
    if not (not v37.categoryButtonRefs or not v37.props.selectedCategoryIndex) and v37.categoryButtonRefs[v37.props.selectedCategoryIndex] then
        local v38 = v37.categoryButtonRefs[v37.props.selectedCategoryIndex];
        local v39 = v38:getValue();
        if v39 == nil then
            return false;
        else
            if not v23() then
                v37:setState({
                    selectedCategoryPositionX = v39.AbsolutePosition.X, 
                    selectedCategoryWidth = v39.AbsoluteSize.X
                });
            else
                v37:tryUpdateScrollingFramePosition(v39.AbsolutePosition.X, v39.AbsoluteSize.X);
                v37:setState({
                    selectedCategoryButtonRef = v38
                });
            end;
            return true;
        end;
    else
        return false;
    end;
end;
v24.didMount = function(v40)
    v40:setCategoryPositionAndWidthState();
    if not (not v23() or not v40.scrollingFrameRef.current) then
        v40.scrollingFrameRef.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Once(function()
            v40:setCategoryPositionAndWidthState();
        end);
    end;
end;
v24.didUpdate = function(v41, v42)
    if v41.props.selectedCategoryIndex ~= v42.selectedCategoryIndex then
        v41:setCategoryPositionAndWidthState();
    end;
end;
v24.hasNewItemNotification = function(v43, v44)
    if v43.props.categories ~= v15() then
        return false;
    else
        local l_newItemNotifications_0 = v43.props.newItemNotifications;
        local v46 = v43.props.categories[v44];
        if v46.Name == v14.CharacterKey then
            return l_newItemNotifications_0[v13.NewOutfitNotificationKey];
        elseif not (v46.Name == v14.HeadAndBody) or not l_newItemNotifications_0[v13.NewDHOutfitNotificationKey] then
            local l_Subcategories_0 = v46.Subcategories;
            if not l_Subcategories_0 then
                local l_AssetTypeIdStrings_0 = v46.AssetTypeIdStrings;
                if not (not l_AssetTypeIdStrings_0 or not v16.shouldNotifyAssetTypes(l_AssetTypeIdStrings_0, l_newItemNotifications_0)) then
                    return true;
                end;
            else
                for _, v50 in l_Subcategories_0, nil, nil do
                    local l_AssetTypeIdStrings_1 = v50.AssetTypeIdStrings;
                    if not (not l_AssetTypeIdStrings_1 or not v16.shouldNotifyAssetTypes(l_AssetTypeIdStrings_1, l_newItemNotifications_0)) then
                        return true;
                    end;
                end;
            end;
            return false;
        else
            return true;
        end;
    end;
end;
v24.renderIconCategoryButton = function(v52, v53, v54, v55, v56)
    local v57 = v54 == v55;
    local l_selectCategory_0 = v52.props.selectCategory;
    local l_categories_0 = v52.props.categories;
    return v3.createElement(l_Focusable_0[v18], {
        categoryTitle = v56.Title, 
        iconOn = v56.IconOn, 
        iconOff = v56.IconOff, 
        navHeight = v52.props.navHeight, 
        isSubNavigationButton = false, 
        layoutOrder = v55, 
        isSelected = v57, 
        hasNewItemNotification = v52:hasNewItemNotification(v55), 
        frameRef = v52:getCategoryButtonRef(v55), 
        onActivate = function()
            l_selectCategory_0(v55);
        end, 
        [v3.Ref] = v52.navButtonRefs[v55], 
        NextSelectionLeft = v55 > 1 and v52.navButtonRefs[v55 - 1] or nil, 
        NextSelectionRight = v55 < #l_categories_0 and v52.navButtonRefs[v55 + 1] or nil, 
        inputBindings = v53 ~= nil and {
            ShiftLeft = v4.Input.onBegin(Enum.KeyCode.ButtonL1, function()
                if v55 > 1 then
                    v53.moveFocusLeft();
                end;
            end), 
            ShiftRight = v4.Input.onBegin(Enum.KeyCode.ButtonR1, function()
                if v55 < #l_categories_0 then
                    v53.moveFocusRight();
                end;
            end)
        } or nil
    });
end;
v24.renderCategoryButton = function(v60, v61, v62, v63, v64)
    local v65 = v62 == v63;
    local l_selectCategory_1 = v60.props.selectCategory;
    local l_categories_1 = v60.props.categories;
    return v3.createElement(l_Focusable_0[v17], {
        categoryIndex = v63, 
        categoryTitle = v64.Title, 
        layoutOrder = v63, 
        isSelected = v65, 
        hasNewItemNotification = v60:hasNewItemNotification(v63), 
        frameRef = v60:getCategoryButtonRef(v63), 
        onActivate = function()
            l_selectCategory_1(v63);
        end, 
        [v3.Ref] = v60.navButtonRefs[v63], 
        NextSelectionLeft = v63 > 1 and v60.navButtonRefs[v63 - 1] or nil, 
        NextSelectionRight = v63 < #l_categories_1 and v60.navButtonRefs[v63 + 1] or nil, 
        inputBindings = v61 ~= nil and {
            ShiftLeft = v4.Input.onBegin(Enum.KeyCode.ButtonL1, function()
                if v63 > 1 then
                    v61.moveFocusLeft();
                end;
            end), 
            ShiftRight = v4.Input.onBegin(Enum.KeyCode.ButtonR1, function()
                if v63 < #l_categories_1 then
                    v61.moveFocusRight();
                end;
            end)
        } or nil
    });
end;
v24.renderNavButtonsFrameChildren = function(v68, v69)
    local l_categories_2 = v68.props.categories;
    local l_selectedCategoryIndex_0 = v68.props.selectedCategoryIndex;
    local v72 = {};
    for v73, v74 in l_categories_2, nil, nil do
        v72[v74.Name] = v68:renderCategoryButton(v69, l_selectedCategoryIndex_0, v73, v74);
    end;
    return v72;
end;
v24.getScrollingListChildren = function(v75)
    local l_subcategorySelected_0 = v75.props.subcategorySelected;
    return {
        NavFrame = v4.withFocusController(function(v77)
            return v3.createElement(l_Focusable_0[l_FitFrameHorizontal_0], {
                height = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Horizontal, 
                BackgroundTransparency = 1, 
                [v3.Change.AbsoluteSize] = v75.onNavFrameSizeChanged, 
                inputBindings = {
                    ToTopBar = v4.Input.onBegin(Enum.KeyCode.ButtonB, function()
                        v77.moveFocusUp();
                    end)
                }
            }, v75:renderNavButtonsFrameChildren(v77));
        end), 
        Highlight = (not (v75.props.lastInputGroup == v12.InputType.Gamepad) or l_subcategorySelected_0) and v3.createElement(v19, {
            scrollingFrameRef = v75.scrollingFrameRef, 
            useArrowHighlight = l_subcategorySelected_0, 
            selectedCategoryButtonPositionX = v75.state.selectedCategoryPositionX, 
            selectedCategoryButtonWidth = v75.state.selectedCategoryWidth, 
            selectedCategoryButtonRef = if not v23() then nil else v75.state.selectedCategoryButtonRef
        })
    };
end;
v24.getMainNavigationChildren = function(v78)
    return {
        ScrollingListWithArrowsAndGradient = v3.createElement(v21, {
            getScollingListContent = function()
                return v78:getScrollingListChildren();
            end, 
            listHeight = v78.props.navHeight, 
            scrollingFrameRef = v78.scrollingFrameRef, 
            buttonRefs = v78.categoryButtonRefs, 
            buttonPadding = 0
        })
    };
end;
v24.render = function(v79)
    local l_layoutOrder_0 = v79.props.layoutOrder;
    local l_navHeight_0 = v79.props.navHeight;
    local l_zIndex_0 = v79.props.zIndex;
    local l_selectedCategoryIndex_1 = v79.props.selectedCategoryIndex;
    return l_withStyle_0(function(v84)
        local l_Theme_0 = v84.Theme;
        return v3.createElement(l_Focusable_0.Frame, {
            ClipsDescendants = true, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(1, 0, 0, l_navHeight_0), 
            ZIndex = l_zIndex_0, 
            [v3.Ref] = v79.props.mainNavigationRef, 
            NextSelectionUp = v79.props.NextSelectionUp, 
            NextSelectionDown = v79.props.NextSelectionDown, 
            defaultChild = v79.navButtonRefs[l_selectedCategoryIndex_1]
        }, v79:getMainNavigationChildren());
    end);
end;
return (v22((v6.connect(function(v86, _)
    return {
        newItemNotifications = v86.AvatarExperience.AvatarEditor.NewItemNotifications
    };
end, nil)(v24))));
