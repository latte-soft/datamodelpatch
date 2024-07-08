local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Cryo);
local _ = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.RoactNavigation);
local v8 = require(l_CorePackages_0.RoactRodux);
local v9 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v9.Focusable;
local v11 = require(l_CorePackages_0.UIBlox);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v14 = require(l_Modules_0.LuaApp.Constants);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_SpringAnimatedItem_0 = v11.Utility.SpringAnimatedItem;
local l_withStyle_0 = v11.Style.withStyle;
local v19 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local v20 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v21 = require(l_Modules_0.AvatarExperience.Common.NamedRefConstants);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.VRAvatarRotateHandler);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.AvatarLoadingSpinner);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneUIContainer);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.SceneButtons);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.BottomInsetBackground);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.VRAvatarEditorNavBar);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarVRPanelWrapper);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.AdaptiveScrollingView);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.MultiTryOnBottomBar);
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.QuickButtons);
local v37 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v39 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAllowAvatarLandingPageSearch);
local v40 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v41 = game:DefineFastFlag("RobuxCounterVRFix", false);
local v42 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v43 = (v20.PeekHeaderHeight + v20.MainNavHeight) + v20.SubNavHeight;
local v44 = l_GuiService_0:IsTenFootInterface();
local v45 = v6.PureComponent:extend("AvatarExperienceView");
v45.defaultProps = {
    bottomBarEnabled = false, 
    isDisabled = false, 
    showRobuxBalance = true
};
local function v48(v46, v47)
    return {
        globalGuiInset = v46.GlobalGuiInset, 
        isPortrait = v46.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        screenSize = v46.ScreenSize, 
        topBarHeight = not not v47.topBar and v46.TopBar.topBarHeight or 0, 
        tryOnItems = v46.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        lookId = v46.AvatarExperience.AvatarScene.OutfitTryOn.LookId
    };
end;
local function v50(v49)
    return {
        Size = UDim2.new(0, v49.width, 0, v49.height)
    };
end;
v45.init = function(v51)
    local v52, v53 = v51:calculateSceneSize();
    v51.state = {
        sceneShowing = true, 
        isVerticallyOffscreen = false, 
        animatedValues = {
            height = v52, 
            width = v53
        }
    };
    v51.navItemsFrameRef = v6.createRef();
    v51.sceneFrameRef = v6.createRef();
    v51.onTransitionComplete = function(v54)
        local l_props_0 = v51.props;
        local l_name_0 = l_props_0.avatarRoute.current.name;
        local l_isPortrait_0 = l_props_0.isPortrait;
        local l_isSceneFullView_0 = l_props_0.isSceneFullView;
        local l_isUIFullView_0 = l_props_0.isUIFullView;
        local l_sceneShowing_0 = v51.state.sceneShowing;
        if not ((not l_isUIFullView_0 or not l_isPortrait_0) or not l_sceneShowing_0) then
            v51:setState({
                sceneShowing = false
            });
        end;
        if not (l_isPortrait_0 or not l_isSceneFullView_0) and l_name_0 == v13.AvatarExperienceLandingPage then
            if not v51.state.isVerticallyOffscreen then
                v51:setState({
                    isVerticallyOffscreen = true
                });
            end;
        elseif v51.state.isVerticallyOffscreen then
            v51:setState({
                isVerticallyOffscreen = false
            });
        end;
        local l_routeName_0 = l_props_0.navigation.state.routeName;
        local v62 = false;
        if l_routeName_0 == l_name_0 then
            v62 = not l_props_0.avatarRoute.isOverlayVisible;
        end;
        if not (not (not (not v54 or not v62) and l_props_0.lastInputGroup == v14.InputType.Gamepad) or l_isSceneFullView_0) then
            v54.captureFocus();
        end;
    end;
    v51.onNavItemsFrameResized = function(_)
        if v51.sceneFrameRef.current then
            v51.onSceneResized(v51.sceneFrameRef.current);
        end;
    end;
    v51.onSceneResized = function(v64)
        local l_current_0 = v51.navItemsFrameRef.current;
        if l_current_0 then
            local l_props_1 = v51.props;
            local l_name_1 = l_props_1.avatarRoute.current.name;
            local l_isDisabled_0 = l_props_1.isDisabled;
            local l_isPortrait_1 = l_props_1.isPortrait;
            local l_screenSize_0 = l_props_1.screenSize;
            local l_allowAdaptiveScrolling_0 = l_props_1.allowAdaptiveScrolling;
            local v72 = v51:getTopBarHeight();
            local v73 = v51.state.isVerticallyOffscreen or l_name_1 == v13.AvatarExperienceLandingPage;
            if not l_isPortrait_1 then
                l_current_0.Size = UDim2.fromScale(if not l_isDisabled_0 then v20.LandscapeNavWidth else 1, 1);
                local l_X_0 = l_current_0.AbsoluteSize.X;
                local v75 = l_screenSize_0.X - v64.AbsoluteSize.X;
                local v76 = 0;
                if v75 < l_X_0 then
                    v76 = v75 - l_X_0;
                end;
                if not v73 then
                    l_current_0.Position = UDim2.fromOffset(v76, 0);
                    return ;
                else
                    l_current_0.Position = UDim2.fromOffset(0, l_screenSize_0.Y * (-v76 / l_X_0));
                    return ;
                end;
            elseif not l_allowAdaptiveScrolling_0 then
                l_current_0.Position = UDim2.new(0, 0, 0, v64.AbsoluteSize.Y + v72);
                l_current_0.Size = UDim2.new(1, 0, 1, -v64.AbsoluteSize.Y - v72);
                return ;
            else
                l_current_0.Position = UDim2.new(0, 0, 0, v72);
                l_current_0.Size = UDim2.new(1, 0, 1, -v72);
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v45.getTopBarHeight = function(v77)
    return v77.props.topBarHeight;
end;
v45.instantResize = function(v78)
    local l_current_1 = v78.sceneFrameRef.current;
    if l_current_1 then
        local v80, v81 = v78:calculateSceneSize();
        l_current_1.Size = UDim2.new(0, v81, 0, v80);
        v78.onSceneResized(l_current_1);
        return ;
    else
        return ;
    end;
end;
v45.calculatePortraitSceneHeight = function(v82)
    local l_props_2 = v82.props;
    local l_globalGuiInset_0 = l_props_2.globalGuiInset;
    local l_screenSize_1 = l_props_2.screenSize;
    local l_isLandingPage_0 = l_props_2.isLandingPage;
    local l_Offset_0 = l_getSafeAreaSize_0(l_screenSize_1, l_globalGuiInset_0).Y.Offset;
    local v88 = l_Offset_0 * v20.PortraitSceneHeight;
    if l_isLandingPage_0 then
        v88 = l_Offset_0 * v20.LandingPagePortraitSceneHeight;
        if l_Offset_0 - v88 < v20.LandingPagePortraitMinItemsHeightPix then
            v88 = l_Offset_0 - v20.LandingPagePortraitMinItemsHeightPix;
        end;
    end;
    return v88;
end;
v45.calculateFullHeight = function(v89)
    local l_props_3 = v89.props;
    return (l_props_3.screenSize.Y - l_props_3.globalGuiInset.bottom) - (not not l_props_3.isPortrait and v89:getTopBarHeight() or 0);
end;
v45.calculateSceneSize = function(v91)
    local l_props_4 = v91.props;
    local l_globalGuiInset_1 = l_props_4.globalGuiInset;
    local l_isDisabled_1 = l_props_4.isDisabled;
    local l_isSceneFullView_1 = l_props_4.isSceneFullView;
    local l_isPortrait_2 = l_props_4.isPortrait;
    local l_isUIFullView_1 = l_props_4.isUIFullView;
    local l_screenSize_2 = l_props_4.screenSize;
    local v99 = v91:getTopBarHeight();
    local l_bottom_0 = l_globalGuiInset_1.bottom;
    local v101 = not not l_isPortrait_2 and v99 or 0;
    local v102 = l_screenSize_2.Y - l_bottom_0;
    local v103 = l_screenSize_2.X * v20.LandscapeSceneWidth;
    local v104 = not not l_isPortrait_2 and v91:calculatePortraitSceneHeight() or v102;
    local v105 = not not l_isPortrait_2 and l_screenSize_2.X or v103;
    if not l_isUIFullView_1 or not l_isPortrait_2 then
        if l_isSceneFullView_1 then
            v105 = l_screenSize_2.X;
            v104 = (l_screenSize_2.Y - l_bottom_0) - v101;
        end;
    else
        v104 = 0;
    end;
    if l_isDisabled_1 then
        v104 = 0;
        v105 = 0;
    end;
    return v104, v105;
end;
v45.isConsoleWithGamepad = function(v106)
    return v44 and v106.props.lastInputGroup == v14.InputType.Gamepad;
end;
v45.renderSceneFrame = function(v107)
    local l_props_5 = v107.props;
    local l_isDisabled_2 = l_props_5.isDisabled;
    local l_isSceneFullView_2 = l_props_5.isSceneFullView;
    local l_isUIFullView_2 = l_props_5.isUIFullView;
    local l_isPortrait_3 = l_props_5.isPortrait;
    local v113 = v107:getTopBarHeight();
    local l_name_2 = l_props_5.avatarRoute.opaque.name;
    local v115 = v107.state.sceneShowing or not l_isPortrait_3;
    if l_isDisabled_2 then
        v115 = false;
    end;
    return v9.withFocusController(function(v116)
        local l_forwardRef_0 = l_props_5.forwardRef;
        local v118 = not l_isSceneFullView_2 and not l_isUIFullView_2;
        if v39() then
            v118 = not not v118 and (l_props_5.showRobuxBalance or false);
        end;
        if l_IsVRAppBuild_0() then
            v118 = if not v41 then v118 and l_name_2 == v13.Catalog else v118 and l_name_2 ~= v13.LayeredClothingSort;
        end;
        return v6.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, 0, 0, not not l_isPortrait_3 and v113 or 0), 
                ZIndex = -1, 
                [v6.Change.AbsoluteSize] = v107.onSceneResized, 
                [v6.Event.AncestryChanged] = v107.onSceneResized, 
                [v6.Ref] = v107.sceneFrameRef
            }, 
            animatedValues = v107.state.animatedValues, 
            mapValuesToProps = v50, 
            springOptions = v42, 
            onComplete = function()
                v107.onTransitionComplete(v116);
            end
        }, {
            SceneUIContainer = v6.createElement(l_Focusable_0[v26], {
                changeViewFunction = l_props_5.changeViewFunction, 
                isVisible = v115, 
                row1ChildrenVisible = v118, 
                [v6.Ref] = l_forwardRef_0, 
                NextSelectionDown = l_props_5.NextSelectionDown, 
                NextSelectionLeft = l_props_5.NextSelectionLeft, 
                NextSelectionUp = l_props_5.NextSelectionUp
            }), 
            SceneInteractionFrame = if not l_IsVRAppBuild_0() then v6.createElement(v24) else nil, 
            AvatarLoadingSpinner = if not l_IsVRAppBuild_0() then v6.createElement(v25) else nil, 
            VRAvatarEditorNavBar = if not l_IsVRAppBuild_0() then nil else v6.createElement(v30, {
                currentPage = l_name_2, 
                navigation = l_props_5.navigation
            })
        });
    end);
end;
v45.renderWithStyle = function(v119, _)
    local l_props_6 = v119.props;
    local l_allowAdaptiveScrolling_1 = l_props_6.allowAdaptiveScrolling;
    local l_bottomBarEnabled_0 = l_props_6.bottomBarEnabled;
    local l_globalGuiInset_2 = l_props_6.globalGuiInset;
    local l_isPortrait_4 = l_props_6.isPortrait;
    local v126 = v119:getTopBarHeight();
    local v127 = not l_bottomBarEnabled_0 and l_globalGuiInset_2.bottom > 0;
    local v128 = v119:calculateSceneSize();
    local l_avatarRoute_0 = l_props_6.avatarRoute;
    local v130 = not v4.isEmpty(l_props_6.tryOnItems) and (not l_props_6.isSceneFullView or false);
    if l_props_6.lookId ~= nil then
        v130 = false;
    end;
    local v131 = nil;
    local v132 = nil;
    if l_allowAdaptiveScrolling_1 then
        v131 = v119:calculateFullHeight();
        v132 = v131 - v119:calculatePortraitSceneHeight();
    end;
    local v133 = {
        TopBar = not l_isPortrait_4 and l_props_6.topBar, 
        Items = v6.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 1, if not l_isPortrait_4 then -v126 else 0), 
            ZIndex = 2
        }, if not not l_allowAdaptiveScrolling_1 and l_isPortrait_4 then {
            AdaptiveScrollingView = v6.createElement(v33, {
                fullHeight = v131, 
                midHeight = v132, 
                alwaysShowingHeight = v43
            }, l_props_6.children)
        } else l_props_6.children)
    };
    local v134 = v119:renderSceneFrame();
    local v135 = if not not l_allowAdaptiveScrolling_1 and l_isPortrait_4 then nil else v6.createElement(v28, {
        sceneHeight = v128, 
        isUIFullView = l_props_6.isUIFullView, 
        isSceneFullView = l_props_6.isSceneFullView, 
        changeViewFunction = l_props_6.changeViewFunction, 
        ZIndex = 3
    });
    local v136 = v6.createElement(v36, {
        isUIFullView = l_props_6.isUIFullView, 
        isSceneFullView = l_props_6.isSceneFullView, 
        ref = l_props_6.quickButtonsRef, 
        NextSelectionLeft = l_props_6.defaultChildRef
    });
    local _ = nil;
    return v6.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = l_props_6.ZIndex
    }, {
        TopBar = l_isPortrait_4 and l_props_6.topBar, 
        ItemsFrame = if not l_IsVRAppBuild_0() then v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            ZIndex = (not l_isPortrait_4 or l_allowAdaptiveScrolling_1) and 2 or nil, 
            [v6.Change.AbsoluteSize] = v119.onNavItemsFrameResized, 
            [v6.Ref] = v119.navItemsFrameRef
        }, v133) else v6.createElement(v32, {
            visible = l_avatarRoute_0.current.name ~= v13.LayeredClothingSort, 
            roundedCornersFrame = true, 
            panelPlacement = "Left"
        }, v133), 
        OverlayedUI = if not l_IsVRAppBuild_0() then v6.createFragment({
            SceneFrame = v134, 
            QuickButtons = v136, 
            SceneButtons = v135
        }) else v6.createElement(v32, {
            roundedCornersFrame = false, 
            panelPlacement = "Center"
        }, {
            SceneFrame = v134, 
            QuickButtons = v136, 
            SceneButtons = v135, 
            GamepadHandler = if l_avatarRoute_0.current.name ~= v13.LayeredClothingSort then v6.createElement(v23) else nil
        }), 
        BottomInsetBackground = if not v127 then nil else v6.createElement(v29, {
            globalGuiInset = l_globalGuiInset_2
        }), 
        MultiTryOnBottomBar = v6.createElement(v35, {
            bottomBarRef = l_props_6.multiTryOnBottomBarRef, 
            NextSelectionLeft = l_props_6.namedRefs[l_props_6.avatarRoute.opaque.name .. v21.ItemsList], 
            Visible = v130, 
            isConsoleWithGamepad = v119:isConsoleWithGamepad()
        })
    });
end;
v45.render = function(v138)
    return l_withStyle_0(function(v139)
        return v6.createElement(v22, nil, {
            AvatarExperienceView = v138:renderWithStyle(v139)
        });
    end);
end;
v45.didUpdate = function(v140, v141)
    local l_props_7 = v140.props;
    local l_isUIFullView_3 = l_props_7.isUIFullView;
    local l_sceneShowing_1 = v140.state.sceneShowing;
    if not (l_isUIFullView_3 or l_sceneShowing_1) then
        v140:setState({
            sceneShowing = true
        });
    end;
    local l_isPortrait_5 = v141.isPortrait;
    local l_isPortrait_6 = l_props_7.isPortrait;
    if l_isPortrait_6 ~= l_isPortrait_5 then
        if not l_isPortrait_6 or not l_isUIFullView_3 then
            if not (l_isPortrait_5 or not l_isUIFullView_3) then
                v140:setState({
                    sceneShowing = true
                });
            end;
        else
            v140:setState({
                sceneShowing = false
            });
        end;
        v140:instantResize();
    end;
    if l_props_7.isDisabled then
        v140:instantResize();
    end;
    if l_props_7.screenSize ~= v141.screenSize then
        v140:instantResize();
    end;
    if l_props_7.topBarHeight ~= v141.topBarHeight then
        v140:instantResize();
    end;
    local v147, v148 = v140:calculateSceneSize();
    if not (v147 == v140.state.animatedValues.height) or v148 ~= v140.state.animatedValues.width then
        v140:setState({
            animatedValues = {
                height = v147, 
                width = v148
            }
        });
    end;
end;
v45.didMount = function(v149)
    v149:instantResize();
    local v150, v151 = v149:calculateSceneSize();
    v149:setState({
        animatedValues = {
            height = v150, 
            width = v151
        }
    });
end;
v45 = v37.connectTestVariables({
    universalAppCameraEnabled = v40.EnabledForUser
})((v19((v27((v7.withNavigation((v31((v8.connect(v48, nil)(v45)))))))))));
return (v6.forwardRef(function(v152, v153)
    return v6.createElement(v45, v4.Dictionary.join(v152, {
        forwardRef = v153
    }));
end));
