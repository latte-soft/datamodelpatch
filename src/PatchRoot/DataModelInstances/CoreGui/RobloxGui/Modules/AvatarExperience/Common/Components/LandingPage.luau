local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Otter);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local v9 = require(l_CorePackages_0.RoactRodux);
local v10 = require(l_CorePackages_0.RoactNavigation);
local v11 = require(l_CorePackages_0.UIBlox);
local v12 = require(l_CorePackages_0.Packages.t);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v15 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Services.Analytics);
local v16 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v22 = require(l_Modules_0.LuaApp.LuaAppEvents);
local v23 = require(l_Modules_0.LuaApp.AppPage);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceView);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.Landing.AvatarPageButton);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.Landing.CatalogPageButton);
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.Landing.ProfilePictureEditorPageButton);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v30 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v31 = require(l_Modules_0.LuaApp.Constants);
local v32 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v34 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v35 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.Xbox.withAppShellContext);
local v37 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v38 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v41 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v42 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SetCategoryAndSubcategory);
local v43 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v43.FocusNavigableSurfaceIdentifierEnum;
local l_useRegistryEntry_0 = v43.FocusNavigableSurfaceRegistry.useRegistryEntry;
local l_useFirstFocusableDescendantRef_0 = v43.useFirstFocusableDescendantRef;
local l_useDescendantHasFocus_0 = v43.useDescendantHasFocus;
local v48 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings);
local v49 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOverlayClosedCallback);
local l_SpringAnimatedItem_0 = v11.Utility.SpringAnimatedItem;
local v51 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarLandingReloadEvent);
local v52 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll);
local v53 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAllowAvatarLandingPageSearch);
local v54 = require(l_Modules_0.AvatarExperience.Flags.GetAXFixNavReloadWrongLanding);
local v55 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v56 = require(l_Modules_0.AvatarExperience.Flags.AXAlternateLandingPageIXP);
local v57 = {
    dampingRatio = 0.8, 
    frequency = 4
};
local function v59(v58)
    return {
        Position = UDim2.new(0.5, -13, v58.yPosition, 0)
    };
end;
local function v61(v60)
    return {
        Position = UDim2.new(0.5, 13, v60.yPosition, 0)
    };
end;
local function v63(v62)
    return {
        Position = UDim2.new(0.5, 0, v62.yPosition, 13)
    };
end;
local v64 = v5.PureComponent:extend("AvatarExperienceLandingPage");
v64.validateProps = v12.strictInterface({
    avatarCategory = v12.number, 
    avatarSubcategory = v12.number, 
    catalogCategory = v12.number, 
    catalogSubcategory = v12.number, 
    deviceOrientation = v12.string, 
    statusBarHeight = v12.number, 
    resetAvatarCategories = v12.callback, 
    resetCatalogCategories = v12.callback, 
    setFullView = v12.callback, 
    avatarAnalytics = v12.table, 
    catalogAnalytics = v12.table, 
    profilePictureEditorAnalytics = v12.table, 
    avatarExperienceAnalytics = v12.table, 
    lastInputGroup = v12.string, 
    navigation = v12.table, 
    avatarRoute = v34.Interface, 
    appShell = v12.optional(v12.strictInterface({
        returnToAppShell = v12.callback
    })), 
    NextSelectionUp = v12.optional(v12.any), 
    shouldCaptureFocus = v12.boolean, 
    alternateAvatarLandingScreenEnabled = v12.optional(v12.boolean), 
    focusNavigationBindingsRef = v12.callback, 
    focusController = v12.table
});
v64.init = function(v65)
    v65.robuxBalanceRef = v5.createRef();
    v65.quickMenuRef = v5.createRef();
    v65.state = {
        buttonsOffscreen = false, 
        buttonTransparencyModifier = 0
    };
    if v51() then
        v65.luaAppReloadPageEventConnection = v22.ReloadPage:connect(function(v66)
            if v66 == v23.AvatarExperienceRoot then
                if not v54() or not v65.props.alternateAvatarLandingScreenEnabled then
                    v65.props.navigation.navigate(v24.AvatarExperienceLandingPage);
                else
                    v65.props.navigation.navigate(v24.Catalog);
                    return ;
                end;
            end;
        end);
    end;
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v65.lastInputTypeChangedCallback = function(v68)
        local v69 = l_isGamepadInput_0(v68);
        if v69 ~= v65.state.lastInputIsGamepad then
            v65:setState({
                lastInputIsGamepad = v69
            });
        end;
    end;
    v65.state.lastInputIsGamepad = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0);
    v65.updateButtonPositions = function()
        v65:setState({
            buttonsOffscreen = true
        });
        if v65.motor then
            v65.motor:setGoal(v4.spring(1), {
                frequency = 3
            });
        end;
    end;
    v65.showProfilePictureEditorCallback = function()
        v65.props.profilePictureEditorAnalytics.profilePictureEditorOpenedFromLandingPage();
        v65.updateButtonPositions();
        delay(0.2, function()
            v65.props.navigation.navigate(v24.ProfilePictureEditorEmotes);
        end);
    end;
    v65.showAvatarEditorCallback = function()
        v65.props.avatarAnalytics.avatarEditorOpenedFromLandingPage();
        v65.updateButtonPositions();
        delay(0.2, function()
            if v65.isMounted then
                v65.props.navigation.navigate(v24.AvatarEditor);
            end;
        end);
    end;
    v65.showCatalogCallback = function()
        v65.props.catalogAnalytics.catalogOpenedFromLandingPage();
        v65.updateButtonPositions();
        delay(0.2, function()
            if v65.isMounted then
                v65.props.navigation.navigate(v24.Catalog);
            end;
        end);
    end;
    v65.transitionOnscreen = function()
        v65:setState({
            buttonsOffscreen = false
        });
        if v65.motor then
            v65.motor:setGoal(v4.spring(0), {
                frequency = 3
            });
        end;
    end;
    v65.pageButtonsRef = v5.createRef();
    v65.catalogPageButtonRef = v5.createRef();
    v65.avatarPageButtonRef = v5.createRef();
    v65.topFrameRef = v5.createRef();
    v65.topBarRef = v5.createRef();
    v65.robuxButtonRef = v5.createRef();
    v65.profilePictureEditorPageButtonRef = v5.createRef();
    v65.topFrameRef = v5.createRef();
    v65.sceneUIContainerRef = v5.createRef();
    v65.onComplete = function()
        local l_isFocused_0 = v65.isFocused;
        if l_isFocused_0 then
            l_isFocused_0 = false;
            if v65.props.lastInputGroup == v31.InputType.Gamepad then
                l_isFocused_0 = v65.props.avatarRoute.isVisible;
            end;
        end;
        if not ((not l_isFocused_0 or v65.state.buttonsOffscreen) or not v65.props.shouldCaptureFocus) then
            v65.props.focusController.captureFocus();
        end;
    end;
    v65.onWillFocus = function()
        if v65.isMounted then
            v65.isFocused = true;
            v65.motor = v4.createSingleMotor(v65.state.buttonTransparencyModifier);
            v65.motor:onStep(function(v71)
                if v65.isFocused or v65.isMounted then
                    v65:setState({
                        buttonTransparencyModifier = v71
                    });
                    return ;
                else
                    return ;
                end;
            end);
            v65.resetCategoryNavigation();
            v65.transitionOnscreen();
            local l_isFocused_1 = v65.isFocused;
            if l_isFocused_1 then
                l_isFocused_1 = false;
                if v65.props.lastInputGroup == v31.InputType.Gamepad then
                    l_isFocused_1 = v65.props.avatarRoute.isVisible;
                end;
            end;
            if not (not l_isFocused_1 or not v65.props.shouldCaptureFocus) then
                v65.props.focusController.captureFocus();
            end;
            return ;
        else
            return ;
        end;
    end;
    v65.onWillBlur = function()
        if v65.motor then
            v65.motor:destroy();
        end;
        v65.isFocused = false;
    end;
    v65.resetCategoryNavigation = function()
        local l_avatarCategory_0 = v65.props.avatarCategory;
        local l_avatarSubcategory_0 = v65.props.avatarSubcategory;
        local l_catalogCategory_0 = v65.props.catalogCategory;
        local l_catalogSubcategory_0 = v65.props.catalogSubcategory;
        if not (l_avatarCategory_0 == 1) or l_avatarSubcategory_0 ~= 1 then
            v65.props.resetAvatarCategories(v65.props.avatarAnalytics);
            return ;
        else
            if not (l_catalogCategory_0 == 1) or l_catalogSubcategory_0 ~= 1 then
                v65.props.resetCatalogCategories(v65.props.catalogAnalytics);
            end;
            return ;
        end;
    end;
    v65.setUIFullView = function()
        v65.props.setFullView(v65.props.avatarExperienceAnalytics, v24.CatalogSearch, v38.UIFullView);
    end;
end;
v64.renderTopBar = function(v77)
    local v78 = 0;
    if v53() then
        v78 = 2;
    end;
    return l_withLocalization_0({
        title = "CommonUI.Features.Label.Avatar"
    })(function(v79)
        return v5.createElement(l_Focusable_0[v30.Container], {
            titleText = v79.title, 
            searchType = not not v53() and v31.SearchTypes.Catalog or nil, 
            transparentBackground = true, 
            ZIndex = v78, 
            onConfirmSearchCallback = not not v52() and v77.setUIFullView or nil, 
            rightItems = if not v53() then {} else {
                v30.SearchButton
            }, 
            [v5.Ref] = v77.topBarRef, 
            NextSelectionDown = v77.catalogPageButtonRef, 
            NextSelectionRight = v77.sceneUIContainerRef, 
            NextSelectionUp = v77.props.NextSelectionUp
        });
    end);
end;
v64.makeLeftFrame = function(v80, v81, v82, v83)
    return v5.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
        regularProps = {
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(0.5, (-v82 * 3) / 4, v81, 0)
        }, 
        animatedValues = {
            xPosition = 0.5, 
            yPosition = not not v80.state.buttonsOffscreen and v83 or 0.5
        }, 
        mapValuesToProps = v59, 
        springOptions = v57, 
        onComplete = v80.onComplete
    }, {
        AvatarPageButton = v5.createElement(l_Focusable_0[v26], {
            onActivated = v80.showAvatarEditorCallback, 
            transparencyModifier = v80.state.buttonTransparencyModifier, 
            [v5.Ref] = v80.avatarPageButtonRef, 
            NextSelectionRight = v80.catalogPageButtonRef, 
            NextSelectionDown = v80.profilePictureEditorPageButtonRef, 
            NextSelectionUp = v80.topBarRef
        })
    });
end;
v64.makeRightFrame = function(v84, v85, v86, v87)
    return v5.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
        regularProps = {
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(0.5, (-v86 * 3) / 4, v85, 0)
        }, 
        animatedValues = {
            xPosition = 0.5, 
            yPosition = not not v84.state.buttonsOffscreen and v87 or 0.5
        }, 
        mapValuesToProps = v61, 
        springOptions = v57
    }, {
        CatalogPageButton = v5.createElement(l_Focusable_0[v27], {
            onActivated = v84.showCatalogCallback, 
            transparencyModifier = v84.state.buttonTransparencyModifier, 
            [v5.Ref] = v84.catalogPageButtonRef, 
            NextSelectionLeft = v84.avatarPageButtonRef, 
            NextSelectionRight = v84.sceneUIContainerRef, 
            NextSelectionDown = v84.profilePictureEditorPageButtonRef, 
            NextSelectionUp = v84.topBarRef
        })
    });
end;
v64.makeMiddleFrame = function(v88, v89, v90, v91)
    return v5.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
        regularProps = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, -v90, v89, -v90 / 2)
        }, 
        animatedValues = {
            xPosition = 0.5, 
            yPosition = not not v88.state.buttonsOffscreen and v91 or 0.5
        }, 
        mapValuesToProps = v63, 
        springOptions = v57, 
        onComplete = v88.onComplete
    }, {
        ProfilePictureEditorPageButton = v5.createElement(l_Focusable_0[v28], {
            onActivated = v88.showProfilePictureEditorCallback, 
            transparencyModifier = v88.state.buttonTransparencyModifier, 
            [v5.Ref] = v88.profilePictureEditorPageButtonRef, 
            NextSelectionUp = v88.topFrameRef
        })
    });
end;
v64.makeInputBindings = function(v92)
    return {
        ReturnToAppShell = v7.Input.onBegin(Enum.KeyCode.ButtonB, function()
            local l_appShell_0 = v92.props.appShell;
            local v94 = l_appShell_0 and l_appShell_0.returnToAppShell;
            if v94 then
                v94();
            end;
        end)
    };
end;
v64.renderAvatarExperienceView = function(v95, v96)
    local v97 = v95.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local v98 = not v97 and 0.5 or 0.8;
    local v99 = not v97 and 48 or 52;
    local v100 = nil;
    local v101 = nil;
    local v102 = nil;
    local v103 = nil;
    local _ = nil;
    v100 = not v97 and 0.33 or 0.528;
    v101 = not v97 and 0.16999999999999998 or 0.27199999999999996;
    v102 = not v97 and 0.5 or 0.8;
    v98 = 1;
    v103 = 0.5 + (0.5 + 0.5 * v102) / v100;
    return v5.createElement(v25, {
        topBar = not not v96 and v95:renderTopBar() or nil, 
        ZIndex = 1, 
        bottomBarEnabled = true, 
        isSceneFullView = false, 
        isUIFullView = false, 
        isLandingPage = true, 
        [v5.Ref] = v95.sceneUIContainerRef, 
        NextSelectionLeft = if not v53() then nil else v95.topBarRef, 
        NextSelectionDown = v95.pageButtonsRef, 
        NextSelectionUp = v95.props.NextSelectionUp
    }, {
        NavigationEventsLogger = v5.createElement(v35, {
            pageName = "LandingPage"
        }), 
        navigationEvents = v5.createElement(v10.NavigationEvents, {
            onWillFocus = v95.onWillFocus, 
            onWillBlur = v95.onWillBlur
        }), 
        GamepadFocusHandlerForPage = if not v95.props.shouldCaptureFocus then nil else v5.createElement(v29, {
            focusController = v95.props.focusController
        }), 
        Buttons = v5.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v5.Ref] = v95.pageButtonsRef, 
            NextSelectionUp = v95.sceneUIContainerRef, 
            defaultChild = v95.topFrameRef, 
            restorePreviousChildFocus = true, 
            inputBindings = v95:makeInputBindings()
        }, {
            TopFrame = v5.createElement(l_Focusable_0.Frame, {
                Size = UDim2.new(1, 0, v100, 0), 
                Position = UDim2.new(0, 0, (v100 + 0.5) - v102 / 2, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                [v5.Ref] = v95.topFrameRef, 
                defaultChild = v95.avatarPageButtonRef, 
                restorePreviousChildFocus = true
            }, {
                LeftFrame = v95:makeLeftFrame(v98, v99, v103), 
                RightFrame = v95:makeRightFrame(v98, v99, v103), 
                uiSizeConstraint = v5.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, v32.LandingPageMinTopFrameHeightPix)
                })
            }), 
            BottomFrame = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, v101, 0), 
                Position = UDim2.new(0, 0, (0.5 - v102 / 2) + v100, 0), 
                BackgroundTransparency = 1
            }, {
                MiddleFrame = v95:makeMiddleFrame(v98, v99, 0.5 + (0.5 + 0.5 * v102) / v101), 
                uiSizeConstraint = v5.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, v32.LandingPageMinBottomFrameHeightPix)
                })
            })
        })
    });
end;
v64.renderMainView = function(v105)
    if v105.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait then
        return v105:renderAvatarExperienceView(true);
    else
        return v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            [v5.Ref] = v105.props.focusNavigationBindingsRef
        }, {
            LastInputTypeChangedConnection = v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = v105.lastInputTypeChangedCallback
            }), 
            TopBar = v105:renderTopBar(), 
            AEView = v105:renderAvatarExperienceView(false)
        });
    end;
end;
v64.render = function(v106)
    return v5.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = v106.props.focusController, 
        defaultChild = v106.pageButtonsRef
    }, {
        v106:renderMainView()
    });
end;
v64.didMount = function(v107)
    v107.isMounted = true;
end;
v64.willUnmount = function(v108)
    v108.isFocused = false;
    v108.isMounted = false;
    if v51() and v108.luaAppReloadPageEventConnection ~= nil then
        v108.luaAppReloadPageEventConnection:disconnect();
        v108.luaAppReloadPageEventConnection = nil;
    end;
end;
v64 = v55.connectTestVariables({
    alternateAvatarLandingScreenEnabled = v56.EnabledForUser
})((v36((v33((v9.connect(function(v109)
    return {
        avatarCategory = v109.AvatarExperience.AvatarEditor.Categories.category, 
        avatarSubcategory = v109.AvatarExperience.AvatarEditor.Categories.subcategory, 
        catalogCategory = v109.AvatarExperience.Catalog.Categories.category, 
        catalogSubcategory = v109.AvatarExperience.Catalog.Categories.subcategory, 
        deviceOrientation = v109.DeviceOrientation, 
        statusBarHeight = v109.TopBar.statusBarHeight
    };
end, function(v110)
    return {
        resetAvatarCategories = function(v111)
            v110(v41(1, nil, v111));
        end, 
        resetCatalogCategories = function(v112)
            v110(v42(1, nil, v112));
        end, 
        setFullView = function(v113, v114, v115)
            v110(v37(v113, v114, v115));
        end
    };
end)((l_RoactServices_0.connect({
    avatarAnalytics = v13, 
    catalogAnalytics = v14, 
    avatarExperienceAnalytics = v16, 
    profilePictureEditorAnalytics = v15
})((v21(v64)))))))))));
return function(v116)
    local v117 = l_useRegistryEntry_0(l_FocusNavigableSurfaceIdentifierEnum_0.NavBar);
    local v118 = l_useFirstFocusableDescendantRef_0(v117);
    local v119 = l_useDescendantHasFocus_0(v117);
    local v120 = table.clone(v116);
    v120.NextSelectionUp = if not v117 then nil else v118;
    v120.shouldCaptureFocus = not v119;
    local l_current_0 = v6.useRef(if not v116.focusController then v7.createFocusController() else v116.focusController).current;
    local v122 = v48({
        overlayClosedCallback = v49(l_current_0)
    });
    v120.focusController = l_current_0;
    v120.focusNavigationBindingsRef = v122;
    return v5.createElement(v64, v120);
end;
