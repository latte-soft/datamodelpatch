local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.PeekabooWidget);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v11 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v11.Focusable;
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.SliderWithLabelAndIcons);
local v19 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.ProfilePictureEditorBottomBar);
local v20 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderZoom);
local v21 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderRotate);
local v22 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetFinalPageViewMode);
local v23 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v24 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v26 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Services.Analytics);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.BottomInsetBackground);
local v28 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXF10ftFixPeekabooWidget);
local v29 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableRevertPpeCustomizationFlow);
local v30 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v30.Style.withStyle;
local l_ButtonStack_0 = v30.App.Button.ButtonStack;
local l_ButtonType_0 = v30.App.Button.Enum.ButtonType;
local l_Images_0 = v30.App.ImageSet.Images;
local l_ImageSetLabel_0 = v30.Core.ImageSet.ImageSetLabel;
local v36 = v3.PureComponent:extend("ProfilePictureEditorCameraPage");
local v37 = l_Images_0["icons/actions/zoomIn"];
local v38 = l_Images_0["icons/actions/zoomOut"];
local v39 = l_Images_0["icons/actions/cycleLeft"];
local v40 = l_Images_0["icons/actions/cycleRight"];
v36.validateProps = v5.strictInterface({
    focusController = v5.optional(v5.table), 
    avatarRoute = v5.table, 
    navigation = v5.table, 
    profilePictureEditorAnalytics = v5.table, 
    zoomSliderValue = v5.number, 
    rotateSliderValue = v5.number, 
    globalGuiInset = v5.strictInterface({
        left = v5.integer, 
        top = v5.integer, 
        right = v5.integer, 
        bottom = v5.integer
    }), 
    screenSize = if not v28 then v5.Vector2 else nil, 
    isPortrait = v5.boolean, 
    setCameraSliderZoom = v5.callback, 
    setCameraSliderRotate = v5.callback, 
    setFinalPageViewMode = v5.callback
});
v36.init = function(v41)
    v41.focusController = v41.props.focusController or v11.createFocusController();
    v41.topBarRef = v3.createRef();
    v41.bottomBarRef = v3.createRef();
    v41.defaultPositionRef = v3.createRef();
    v41.zoomSliderRef = v3.createRef();
    v41.rotateSliderRef = v3.createRef();
    v41.goBack = function()
        v41.props.navigation.goBack();
    end;
    v41.onNext = function()
        v41.props.profilePictureEditorAnalytics.clickNextFromCameraPage(v41.props.zoomSliderValue ~= 0, v41.props.rotateSliderValue ~= 0);
        v41.props.setFinalPageViewMode();
        v41.props.navigation.navigate(v17.ProfilePictureEditorFinal, {});
    end;
    v41.onDefaultPosition = function()
        v41.props.profilePictureEditorAnalytics.clickDefaultPositionsFromCameraPage();
        v41.props.setCameraSliderZoom(0);
        v41.props.setCameraSliderRotate(0);
    end;
    v41.onZoomChanged = function(v42)
        v41.props.setCameraSliderZoom(v42);
    end;
    v41.onRotateChanged = function(v43)
        v41.props.setCameraSliderRotate(v43);
    end;
    v41.zoomToPoint = function(v44, _)
        v41.props.setCameraSliderZoom((math.clamp(v41.props.zoomSliderValue + v44 * 2, -v23.SliderMax, v23.SliderMax)));
    end;
    v41.rotateByPixels = function(v46)
        v41.props.setCameraSliderRotate((math.clamp(v41.props.rotateSliderValue + v46 * 1, -v23.SliderMax, v23.SliderMax)));
    end;
end;
v36.renderMiddleContents = function(_, v48)
    return v3.createElement(l_ImageSetLabel_0, {
        Size = UDim2.fromScale(1, 1), 
        Position = UDim2.fromOffset(0, 0), 
        Image = v23.CircleCutoutAsset, 
        ImageColor3 = v48.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = 1, 
        ZIndex = 4
    });
end;
v36.renderBottomContents = function(v49, v50, v51)
    local l_Font_0 = v51.Font;
    local v53 = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize;
    local l_Font_1 = l_Font_0.Header2.Font;
    local l_zoomSliderValue_0 = v49.props.zoomSliderValue;
    local l_rotateSliderValue_0 = v49.props.rotateSliderValue;
    local v57 = false;
    if l_zoomSliderValue_0 == 0 then
        v57 = l_rotateSliderValue_0 == 0;
    end;
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        NextSelectionUp = v49.topBarRef, 
        NextSelectionDown = v49.bottomBarRef
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        ButtonTopPadding = v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 0.05), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            uiSizeConstraint = v3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(math.huge, 50)
            })
        }), 
        ButtonFrame = v3.createElement(l_Focusable_0.Frame, {
            Size = UDim2.new(0, l_TextService_0:GetTextSize(v50.defaultPosition, v53, l_Font_1, Vector2.new(10000, 10000)).X + 20, 0, 36), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            [v3.Ref] = v49.defaultPositionRef, 
            NextSelectionUp = v49.topBarRef, 
            NextSelectionDown = v49.zoomSliderRef
        }, {
            ButtonStack = v3.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v49.onDefaultPosition, 
                            text = v50.defaultPosition, 
                            isDisabled = v57
                        }
                    }
                }
            })
        }), 
        AboveSliderPadding = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 10), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }), 
        ZoomSlider = v3.createElement(v18, {
            text = v50.zoom, 
            onSliderChanged = v49.onZoomChanged, 
            layoutOrder = 4, 
            value = l_zoomSliderValue_0, 
            leftIcon = v38, 
            rightIcon = v37, 
            min = -v23.SliderMax, 
            max = v23.SliderMax, 
            baseRef = v49.zoomSliderRef, 
            NextSelectionUp = v49.defaultPositionRef, 
            NextSelectionDown = v49.rotateSliderRef
        }), 
        BetweenSliderPadding = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 10), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 5
        }), 
        RotateSlider = v3.createElement(v18, {
            text = v50.rotate, 
            onSliderChanged = v49.onRotateChanged, 
            layoutOrder = 6, 
            value = l_rotateSliderValue_0, 
            leftIcon = v39, 
            rightIcon = v40, 
            min = -v23.SliderMax, 
            max = v23.SliderMax, 
            baseRef = v49.rotateSliderRef, 
            NextSelectionUp = v49.zoomSliderRef, 
            NextSelectionDown = v49.bottomBarRef
        })
    });
end;
v36.renderWithProviders = function(v58, v59, v60)
    local l_screenSize_0 = v58.props.screenSize;
    local l_globalGuiInset_0 = v58.props.globalGuiInset;
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = if not v28 then l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0) else UDim2.fromScale(1, 1), 
        Position = UDim2.new(0, 0, 0, 0), 
        Active = true, 
        focusController = v58.focusController, 
        defaultChild = v58.zoomSliderRef, 
        [v3.Ref] = v58.props[v3.Ref], 
        inputBindings = {
            NavUp = v11.Input.onBegin(Enum.KeyCode.ButtonB, function()
                v58.focusController.moveFocusTo(v58.topBarRef);
            end)
        }
    }, {
        GamepadFocusHandlerForPage = v3.createElement(v14, {
            focusController = v58.focusController, 
            captureFocusOnMount = true
        }), 
        SimpleTopBar = v3.createElement(v7.Container, {
            titleText = v59.title, 
            [v3.Ref] = v58.topBarRef, 
            NextSelectionDown = v58.defaultPositionRef, 
            transparentBackground = true, 
            hideSiteMessageBanner = v58.props.isPortrait, 
            leftItem = v7.BackButton
        }), 
        PeekabooWidget = v3.createElement(v8, {
            viewportYScale = 0.375, 
            viewportXScale = 0.6666666666666666, 
            topMarginYScale = 0.125, 
            renderBottomContents = function()
                return v58:renderBottomContents(v59, v60);
            end, 
            renderMiddleContents = function()
                return v58:renderMiddleContents(v60);
            end, 
            zoomToPoint = v58.zoomToPoint, 
            rotateByPixels = v58.rotateByPixels
        }), 
        BottomBar = v3.createElement(v19, {
            baseRef = v58.bottomBarRef, 
            NextSelectionUp = v58.rotateSliderRef, 
            button1 = {
                textKey = "Authentication.CrossDevice.Action.GoBack", 
                onActivated = v58.goBack
            }, 
            button2 = {
                textKey = "Authentication.CrossDevice.Action.Next", 
                onActivated = v58.onNext
            }
        }), 
        BottomInsetBackground = if not (l_globalGuiInset_0.bottom > 0) then nil else v3.createElement(v27, {
            globalGuiInset = l_globalGuiInset_0
        })
    });
end;
v36.render = function(v63)
    return l_withLocalization_0({
        title = "Feature.Avatar.Label.PPEPositionCameraHeader", 
        defaultPosition = not v29() and "Feature.Avatar.Action.Default" or "Feature.Avatar.Action.Reset", 
        zoom = "Feature.Avatar.Action.Zoom", 
        rotate = "Feature.Avatar.Action.Rotate"
    })(function(v64)
        return l_withStyle_0(function(v65)
            return v63:renderWithProviders(v64, v65);
        end);
    end);
end;
return (l_RoactServices_0.connect({
    profilePictureEditorAnalytics = v26
})((v13((v16((v4.connect(function(v66, _)
    return {
        isPortrait = v66.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        globalGuiInset = v66.GlobalGuiInset, 
        screenSize = if not v28 then v66.ScreenSize else nil, 
        zoomSliderValue = v66.AvatarExperience.ProfilePictureEditor.CameraSliders.zoomSliderValue, 
        rotateSliderValue = v66.AvatarExperience.ProfilePictureEditor.CameraSliders.rotateSliderValue
    };
end, function(v68)
    return {
        setCameraSliderZoom = function(v69)
            return v68(v20(v69));
        end, 
        setCameraSliderRotate = function(v70)
            return v68(v21(v70));
        end, 
        setFinalPageViewMode = function()
            return v68(v22(v24.Closeup));
        end
    };
end)(v36))))))));
