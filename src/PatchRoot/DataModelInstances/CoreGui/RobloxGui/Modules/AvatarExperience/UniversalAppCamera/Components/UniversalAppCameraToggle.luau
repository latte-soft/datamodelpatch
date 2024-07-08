local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = v4.Style.withStyle;
local l_IconSize_0 = v4.App.Constant.IconSize;
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v12 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v13 = require(l_Modules_0.AvatarExperience.Common.Managers.AnimationUtils);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v15 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v16 = require(l_Modules_0.AvatarExperience.Common.Actions.SetCameraButtonStatus);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local v19 = require(l_Modules_0.LuaApp.mutedError);
local v20 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnEmoteAnimationAssetId);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v23 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local l_withNavigationFocus_0 = require(l_CorePackages_0.RoactNavigation).withNavigationFocus;
local v25 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_getCameraOptIn_0 = require(l_CorePackages_0.Workspace.Packages.CameraOptIn).getCameraOptIn;
local l_getCameraDevicePermission_0 = require(l_CorePackages_0.Workspace.Packages.CameraOptIn).getCameraDevicePermission;
local v28 = game:DefineFastFlag("UpdateR6CameraWarning", false);
local v29 = require(l_Modules_0.AvatarExperience.Flags.FFlagUniversalAppCameraWindowsPermsFix);
local v30 = l_Images_0["icons/controls/videoOff"];
local v31 = l_Images_0["icons/controls/video"];
local v32 = Vector2.new(1, 0);
local v33 = UDim2.new(1, -4, 0, 3);
local v34 = UDim2.fromOffset(5, 5);
local v35 = Color3.new(0, 1, 0);
local v36 = v2.PureComponent:extend("UniversalAppCameraToggle");
local v37 = {
    toastMessage = not v28 and "Feature.Avatar.Message.TryOnCameraHeadWarning" or "Feature.Avatar.Message.ClassicHeadAndR6CameraWarning", 
    isLocalized = false, 
    toastType = v12.InformationMessage
};
local v38 = {
    toastMessage = "Feature.Avatar.Message.CameraFacialAnimationPaused", 
    isLocalized = false, 
    toastType = v12.InformationMessage
};
local v39 = {
    toastMessage = "Feature.FaceChat.Subtitle.UnableToAccessCamera", 
    isLocalized = false, 
    toastType = v12.InformationMessage
};
local v40 = {
    toastMessage = "Feature.FaceChat.Subtitle.FeatureDisabled", 
    isLocalized = false, 
    toastType = v12.InformationMessage
};
v36.validateProps = v5.strictInterface({
    isUIFullView = v5.optional(v5.boolean), 
    isSceneFullView = v5.optional(v5.boolean), 
    layoutOrder = v5.optional(v5.number), 
    isDebug = v5.optional(v5.boolean), 
    hasEmoteTryOn = v5.boolean, 
    ableToAnimateHead = v5.boolean, 
    receivedOutfitInfo = v5.boolean, 
    canPlayAnimation = v5.boolean, 
    pageCanAnimateCameraBasedMood = v5.boolean, 
    isPortrait = v5.boolean, 
    topBarHeight = v5.number, 
    buttonEnabled = v5.boolean, 
    errorOccurred = if not v29 then nil else v5.boolean, 
    analytics = v5.table, 
    networking = v5.callback, 
    avatarRoute = v5.table, 
    navigation = v5.table, 
    isFocused = v5.boolean, 
    setCurrentToastMessage = v5.callback, 
    setCameraButtonStatus = v5.callback
});
v36.setCameraButtonStatusWithAnalytics = function(v41, v42)
    v41.props.setCameraButtonStatus(v42);
    v41.props.analytics.toggleCameraInEditorAndShop(v42, v41.props.avatarRoute.opaque.name);
end;
v36.init = function(v43)
    v43.isMounted = false;
    v43:setState({
        isCameraOptIn = false, 
        hasDeviceCameraPermissions = false
    });
    v43.toggleCamera = function()
        if v43.props.ableToAnimateHead or not v43.props.receivedOutfitInfo then
            local l_buttonEnabled_0 = v43.props.buttonEnabled;
            if not v29 or not v43.props.errorOccurred then
                if not v43.state.hasDeviceCameraPermissions then
                    l_getCameraDevicePermission_0():andThen(function(v45)
                        if not v45 then
                            v43.props.setCurrentToastMessage(v39);
                            return ;
                        else
                            if v43.isMounted then
                                v43:setState({
                                    hasDeviceCameraPermissions = true
                                });
                            end;
                            v43:setCameraButtonStatusWithAnalytics(true);
                            return ;
                        end;
                    end):catch(function(v46)
                        v19(string.format("Universal App Camera Hardware Check error: %s", (tostring(v46))));
                        v43.props.setCameraButtonStatus(false);
                    end);
                    return ;
                else
                    if not (l_buttonEnabled_0 or v43.props.pageCanAnimateCameraBasedMood) then
                        v43.props.setCurrentToastMessage(v38);
                    end;
                    v43:setCameraButtonStatusWithAnalytics(not l_buttonEnabled_0);
                    return ;
                end;
            else
                v43.props.setCameraButtonStatus(false);
                v43.props.setCurrentToastMessage(v40);
                return ;
            end;
        else
            v43.props.setCurrentToastMessage(v37);
            return ;
        end;
    end;
end;
v36.render = function(v47)
    return l_withStyle_0(function(v48)
        return l_withSelectionCursorProvider_0(function(v49)
            return v47:renderWithProviders(v48, v49);
        end);
    end);
end;
v36.isVisible = function(v50)
    if not v50.props.isDebug then
        return (v11.isUserCameraEligible() and v50.state.isCameraOptIn) and v11.isAvatarSceneButtonsVisible(v50.props.avatarRoute, v50.props.isFocused, v50.props.isUIFullView, v50.props.isSceneFullView, v50.props.navigation);
    else
        return true;
    end;
end;
v36.getIcon = function(v51)
    if not v51.props.buttonEnabled then
        return v30;
    else
        return v31;
    end;
end;
v36.setCameraOptIn = function(v52)
    l_getCameraOptIn_0(v52.props.networking, false):andThen(function(v53)
        if v52.isMounted then
            if v53 ~= v52.state.isCameraOptIn then
                v52:setState({
                    isCameraOptIn = v53
                });
            end;
            return ;
        else
            return ;
        end;
    end);
end;
v36.didMount = function(v54)
    v54.isMounted = true;
    v54:setCameraOptIn();
end;
v36.willUnmount = function(v55)
    v55.isMounted = false;
end;
v36.didUpdate = function(v56, v57)
    local l_name_0 = v56.props.avatarRoute.opaque.name;
    v56:setCameraOptIn();
    if ((v56.props.buttonEnabled and l_name_0 ~= v14.CatalogSearch) and l_name_0 ~= v14.Catalog) and l_name_0 ~= v14.AvatarEditor then
        v56.props.setCameraButtonStatus(false);
        return ;
    elseif v56:isVisible() then
        if not ((not v56.props.buttonEnabled or v56.props.ableToAnimateHead) or not v56.props.receivedOutfitInfo) then
            v56.props.setCameraButtonStatus(false);
        end;
        local v59 = v57.pageCanAnimateCameraBasedMood and not v56.props.pageCanAnimateCameraBasedMood;
        local v60 = not v57.hasEmoteTryOn and v56.props.hasEmoteTryOn;
        if not (not v56.props.buttonEnabled or not v59 and not v60) then
            v56.props.setCurrentToastMessage(v38);
        end;
        return ;
    else
        return ;
    end;
end;
v36.renderWithProviders = function(v61, v62)
    local l_Theme_0 = v62.Theme;
    local l_SceneButtonSize_0 = v10.SceneButtonSize;
    local v65 = not v61.props.canPlayAnimation;
    return v2.createElement("Frame", {
        Size = UDim2.fromOffset(l_SceneButtonSize_0, l_SceneButtonSize_0), 
        Visible = v61:isVisible(), 
        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
        LayoutOrder = v61.props.layoutOrder
    }, {
        Corner = v2.createElement("UICorner", {
            CornerRadius = v10.SceneButtonCornerRadius
        }); 
        v2.createElement(l_ImageSetButton_0, {
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(l_IconSize_0.Regular, l_IconSize_0.Regular), 
            BackgroundTransparency = 1, 
            Image = v61:getIcon(), 
            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
            ImageTransparency = (not v65 or v61.props.buttonEnabled) and 0 or 0.5, 
            ZIndex = 2, 
            [v2.Event.Activated] = v61.toggleCamera
        }, {
            Dot = v2.createElement("Frame", {
                AnchorPoint = v32, 
                Position = v33, 
                BackgroundColor3 = v35, 
                Size = v34, 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                Visible = not v65 and v61.props.buttonEnabled, 
                LayoutOrder = 2
            }, {
                Corner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            })
        })
    });
end;
return (l_RoactServices_0.connect({
    analytics = v23, 
    networking = v25
})((l_withNavigationFocus_0((v17((v3.connect(function(v66, v67)
    local l_topBarHeight_0 = v66.TopBar.topBarHeight;
    local v69 = v11.getCategoryInfoFromState(v66, v67.avatarRoute).CanAnimateCameraBasedMood == true;
    local v70, _ = v13.getAllowsTryingEmotesOrAnimations(v66, v67.avatarRoute);
    local v72 = v13.canPlayCameraBasedMoodAnimation(v66, v69, v70);
    local v73 = v20(v66) ~= nil;
    local v74, v75 = v13.ableToAnimateHead(v66);
    return {
        hasEmoteTryOn = v73, 
        pageCanAnimateCameraBasedMood = v69, 
        ableToAnimateHead = v74, 
        receivedOutfitInfo = v75, 
        canPlayAnimation = v72, 
        isPortrait = v66.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        topBarHeight = l_topBarHeight_0, 
        buttonEnabled = v66.AvatarExperience.CameraButton.enabled, 
        errorOccurred = if not v29 then nil else v66.AvatarExperience.CameraButton.errorOccurred
    };
end, function(v76)
    return {
        setCurrentToastMessage = function(v77)
            v76(v15(v77));
        end, 
        setCameraButtonStatus = function(v78)
            v76(v16(v78));
        end
    };
end)(v36))))))));
