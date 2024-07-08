local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Otter);
local l_CameraUtility_0 = require(l_CorePackages_0.Thumbnailing).CameraUtility;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v11 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v14 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v14.Focusable;
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v18 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.PeekabooWidget);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v21 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.ProfilePictureEditorBottomBar);
local v22 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v23 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v24 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
local v25 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Thunks.WritePPEConfig);
local v26 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetFinalPageViewMode);
local v27 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Services.Analytics);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.BottomInsetBackground);
local v30 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v31 = require(l_Modules_0.AvatarExperience.Flags.AXAlternateLandingPageIXP);
local v32 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXF10ftFixPeekabooWidget);
local v33 = require(l_CorePackages_0.UIBlox);
local l_ImageSetLabel_0 = v33.Core.ImageSet.ImageSetLabel;
local l_ButtonStack_0 = v33.App.Button.ButtonStack;
local l_ButtonType_0 = v33.App.Button.Enum.ButtonType;
local l_withStyle_0 = v33.Style.withStyle;
local v38 = {
    frequency = 1 / v22.FullscreenTweenTimeSeconds, 
    dampingRatio = 1
};
local v39 = v3.PureComponent:extend("ProfilePictureEditorFinalPage");
v39.validateProps = v5.strictInterface({
    focusController = v5.optional(v5.table), 
    avatarRoute = v5.table, 
    globalGuiInset = v5.strictInterface({
        left = v5.integer, 
        top = v5.integer, 
        right = v5.integer, 
        bottom = v5.integer
    }), 
    screenSize = v5.Vector2, 
    fieldOfViewDeg = v5.optional(v5.number), 
    zoomSliderValue = v5.number, 
    rotateSliderValue = v5.number, 
    emoteAssetId = v5.optional(v5.string), 
    finalPageViewMode = v5.userdata, 
    currentCharacter = v5.optional(v5.instanceIsA("Model", nil)), 
    equippedAssets = v5.optional(v5.table), 
    isPortrait = v5.boolean, 
    writePPEConfig = v5.callback, 
    setFinalPageViewMode = v5.callback, 
    navigation = v5.table, 
    networking = v5.callback, 
    profilePictureEditorAnalytics = v5.table, 
    alternateAvatarLandingScreenEnabled = v5.optional(v5.boolean), 
    shouldSkipLandingPage = v5.boolean
});
v39.init = function(v40)
    v40.focusController = v40.props.focusController or v14.createFocusController();
    v40.topBarRef = v3.createRef();
    v40.bottomBarRef = v3.createRef();
    v40.toggleFullViewButtonRef = v3.createRef();
    v40.goBack = function()
        v40.props.navigation.goBack();
    end;
    v40.onSave = function()
        v40:writePPEConfig();
        local _ = nil;
        v40.props.navigation.navigate(if not v40.props.shouldSkipLandingPage then if v40.props.alternateAvatarLandingScreenEnabled then v20.Catalog else v20.AvatarExperienceLandingPage else v20.Catalog);
    end;
    v40.toggleFinalPageViewMode = function()
        v40.props.setFinalPageViewMode(if v40.props.finalPageViewMode == v23.Closeup then v23.FullBody else v23.Closeup);
    end;
    v40:setState({
        isAnimating = false
    });
    local v42, v43 = v3.createBinding(0);
    v40.animationBinding = v42;
    v40.animationBindingUpdate = v43;
    v40.sizeBinding = v40.animationBinding:map(function(v44)
        return UDim2.fromScale(1 + v44, 1 + v44);
    end);
    v40.motor = v6.createSingleMotor(0);
    v40.motor:onStep(v40.animationBindingUpdate);
    v40.motor:onComplete(function()
        v40:setState({
            isAnimating = false
        });
    end);
end;
v39.writePPEConfig = function(v45)
    v45.props.writePPEConfig(v45.props.networking, v45.props.profilePictureEditorAnalytics, v45.props.emoteAssetId, v24.getCameraDistanceScaleFromSliderValue(v45.props.zoomSliderValue), v24.getYRotDegFromSliderValue(v45.props.rotateSliderValue), v45.props.fieldOfViewDeg);
end;
v39.renderBottomContents = function(v46, v47, v48)
    local l_Theme_0 = v48.Theme;
    local l_Font_0 = v48.Font;
    local l_BaseSize_0 = l_Font_0.BaseSize;
    local v52 = l_Font_0.Header1.RelativeSize * l_BaseSize_0;
    local l_Font_1 = l_Font_0.Header1.Font;
    local v54 = l_getSafeAreaSize_0(v46.props.screenSize, v46.props.globalGuiInset);
    local v55 = l_Font_0.Header2.RelativeSize * l_BaseSize_0;
    local l_Font_2 = l_Font_0.Header2.Font;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v47.finalContent, v55, l_Font_2, Vector2.new(v54.X.Offset * 0.9, 10000));
    local v58 = nil;
    v58 = if v46.props.finalPageViewMode == v23.Closeup then v47.switchToFullBody else v47.switchToCloseup;
    local l_l_TextService_0_TextSize_1 = l_TextService_0:GetTextSize(v58, v55, l_Font_2, Vector2.new((v54.X.Offset - 20) - 20, 10000));
    return v3.createFragment({
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0.0625, 0)
        }), 
        ContentTopPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0.0625, 0)
        }), 
        ButtonFrame = v3.createElement(l_Focusable_0.Frame, {
            Size = UDim2.new(0, l_l_TextService_0_TextSize_1.X + 20, 0, l_l_TextService_0_TextSize_1.Y + 17), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            [v3.Ref] = v46.toggleFullViewButtonRef, 
            NextSelectionUp = v46.topBarRef, 
            NextSelectionDown = v46.bottomBarRef
        }, {
            ButtonStack = v3.createElement(l_ButtonStack_0, {
                buttonHeight = l_l_TextService_0_TextSize_1.Y + 17, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v46.toggleFinalPageViewMode, 
                            text = v58
                        }
                    }
                }
            })
        }), 
        Header1TextLabel = v3.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v52), 
            BackgroundTransparency = 1, 
            Font = l_Font_1, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            Text = v47.finalHeader, 
            TextSize = v52, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            LayoutOrder = 2
        }), 
        Header2TextLabel = v3.createElement("TextLabel", {
            Size = UDim2.new(0.9, 0, 0, l_l_TextService_0_TextSize_0.Y), 
            BackgroundTransparency = 1, 
            Font = l_Font_2, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            Text = v47.finalContent, 
            TextSize = v55, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            RichText = true, 
            TextWrapped = true, 
            LayoutOrder = 3
        })
    });
end;
v39.renderMiddleContents = function(v60, v61)
    local l_Theme_1 = v61.Theme;
    if v60.props.finalPageViewMode ~= v23.Closeup and not v60.state.isAnimating then
        return nil;
    else
        return v3.createElement(l_ImageSetLabel_0, {
            Size = v60.sizeBinding, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Image = v22.CircleCutoutAsset, 
            ImageColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = 1, 
            ZIndex = 4
        });
    end;
end;
v39.renderWithProviders = function(v63, v64, v65)
    local l_screenSize_0 = v63.props.screenSize;
    local l_globalGuiInset_0 = v63.props.globalGuiInset;
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = if not v32 then l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0) else UDim2.fromScale(1, 1), 
        Position = UDim2.new(0, 0, 0, 0), 
        Active = true, 
        focusController = v63.focusController, 
        defaultChild = v63.bottomBarRef, 
        [v3.Ref] = v63.props[v3.Ref], 
        inputBindings = {
            NavUp = v14.Input.onBegin(Enum.KeyCode.ButtonB, function()
                v63.focusController.moveFocusTo(v63.topBarRef);
            end)
        }
    }, {
        GamepadFocusHandlerForPage = v3.createElement(v17, {
            focusController = v63.focusController, 
            captureFocusOnMount = true
        }), 
        SimpleTopBar = v3.createElement(v11.Container, {
            titleText = v64.title, 
            [v3.Ref] = v63.topBarRef, 
            NextSelectionDown = v63.toggleFullViewButtonRef, 
            transparentBackground = true, 
            hideSiteMessageBanner = v63.props.isPortrait, 
            leftItem = v11.BackButton
        }), 
        PeekabooWidget = v3.createElement(v18, {
            viewportYScale = 0.375, 
            viewportXScale = 0.8, 
            topMarginYScale = 0.2, 
            renderBottomContents = function()
                return v63:renderBottomContents(v64, v65);
            end, 
            renderMiddleContents = function()
                return v63:renderMiddleContents(v65);
            end
        }), 
        BottomBar = v3.createElement(v21, {
            baseRef = v63.bottomBarRef, 
            NextSelectionUp = v63.toggleFullViewButtonRef, 
            button1 = {
                textKey = "Authentication.CrossDevice.Action.GoBack", 
                onActivated = v63.goBack
            }, 
            button2 = {
                textKey = "Feature.Avatar.Action.Save", 
                isDisabled = v63.props.fieldOfViewDeg == nil, 
                onActivated = v63.onSave
            }
        }), 
        BottomInsetBackground = if not (l_globalGuiInset_0.bottom > 0) then nil else v3.createElement(v29, {
            globalGuiInset = l_globalGuiInset_0
        })
    });
end;
v39.render = function(v68)
    return l_withLocalization_0({
        title = "Feature.Avatar.Label.PPEFinalHeader", 
        finalHeader = "Feature.Avatar.Label.PPEFinalSubheader", 
        finalContent = "Feature.Avatar.Label.PPEFinalBody", 
        switchToFullBody = "Feature.Avatar.Label.PPEViewFullButton", 
        switchToCloseup = "Feature.Avatar.Label.PPEViewCloseupButton"
    })(function(v69)
        return l_withStyle_0(function(v70)
            return v68:renderWithProviders(v69, v70);
        end);
    end);
end;
v39.didUpdate = function(v71, v72, _)
    local v74 = nil;
    if v72.finalPageViewMode == v23.Closeup and v71.props.finalPageViewMode == v23.FullBody then
        v74 = 1;
    elseif v72.finalPageViewMode == v23.FullBody and v71.props.finalPageViewMode == v23.Closeup then
        v74 = 0;
    end;
    if v74 then
        v71.motor:stop();
        v71.motor:setGoal(v6.spring(v74, v38));
        v71.motor:start();
        v71:setState({
            isAnimating = true
        });
    end;
end;
v39.willUnmount = function(v75)
    if v75.motor then
        v75.motor:destroy();
        v75.motor = nil;
    end;
end;
return (v30.connectTestVariables({
    alternateAvatarLandingScreenEnabled = v31.EnabledForUser
})((v16((v19((l_RoactAppPolicy_0.connect(function(v76)
    return {
        shouldSkipLandingPage = v76.getShouldSkipAvatarLandingPage()
    };
end)((l_RoactServices_0.connect({
    profilePictureEditorAnalytics = v27, 
    networking = v9
})((v4.connect(function(v77, _)
    return {
        isPortrait = v77.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        globalGuiInset = v77.GlobalGuiInset, 
        screenSize = v77.ScreenSize, 
        fieldOfViewDeg = v77.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.fieldOfViewDeg, 
        zoomSliderValue = v77.AvatarExperience.ProfilePictureEditor.CameraSliders.zoomSliderValue, 
        rotateSliderValue = v77.AvatarExperience.ProfilePictureEditor.CameraSliders.rotateSliderValue, 
        emoteAssetId = v77.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId, 
        finalPageViewMode = v77.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode, 
        currentCharacter = v77.AvatarExperience.AvatarScene.Character.CurrentCharacter, 
        equippedAssets = v77.AvatarExperience.AvatarEditor.Character.EquippedAssets
    };
end, function(v79)
    return {
        writePPEConfig = function(_, v81, v82, v83, v84, v85)
            v79(v25(v81, v23.Closeup, v82, v83, v84, v85));
            v79(v25(v81, v23.FullBody, v82, l_CameraUtility_0.DistanceScaleForFullBody, v84, v85));
        end, 
        setFinalPageViewMode = function(v86)
            return v79(v26(v86));
        end
    };
end)(v39))))))))))));
