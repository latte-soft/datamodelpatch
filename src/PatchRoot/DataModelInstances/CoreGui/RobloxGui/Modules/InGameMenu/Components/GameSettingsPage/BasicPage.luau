local l_Players_0 = game:GetService("Players");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_VRService_0 = game:GetService("VRService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Platform_0 = game:GetService("UserInputService"):GetPlatform();
local v7 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v7.Roact;
local l_RoactRodux_0 = v7.RoactRodux;
local l_t_0 = v7.t;
local l_UIBlox_0 = v7.UIBlox;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_l_LocalPlayer_0_PropertyChangedSignal_0 = l_LocalPlayer_0:GetPropertyChangedSignal("DevEnableMouseLock");
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("IsUsingCameraYInverted");
local v15 = require(script.Parent.Parent.Connection.FocusHandler);
local l_Parent_0 = script.Parent.Parent.Parent;
local v17 = require(l_Parent_0.Components.Divider);
local v18 = require(l_Parent_0.Utility.ExternalEventConnection);
local v19 = require(l_Parent_0.Components.Page);
local v20 = require(l_Parent_0.Components.ThemedTextLabel);
local v21 = require(l_Parent_0.Localization.withLocalization);
local v22 = require(l_Parent_0.Resources.Assets);
local v23 = require(l_Parent_0.Actions.SetCurrentPage);
local v24 = require(script.Parent.AutoPropertyToggleEntry);
local v25 = require(script.Parent.SafetyBubbleModeEntry);
local v26 = nil;
if game:GetEngineFeature("VRMoreComfortSettings") then
    v26 = require(script.Parent.ComfortSettingsEntry);
end;
local v27 = require(script.Parent.CameraModeEntry);
local v28 = require(script.Parent.CameraSensitivityEntry);
local v29 = require(script.Parent.CategoryHeader);
local v30 = require(script.Parent.DeviceSelectionEntry);
local v31 = require(script.Parent.GraphicsQualityEntry);
local v32 = require(script.Parent.MovementModeEntry);
local v33 = require(script.Parent.ToggleEntry);
local v34 = require(script.Parent.VolumeEntry);
local v35 = require(l_Parent_0.Utility.SendAnalytics);
local v36 = require(l_Parent_0.Resources.Constants);
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v40 = require(l_Parent_0.Flags.GetFFlagIGMGamepadSelectionHistory);
local v41 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAlwaysShowVRToggle);
local l_game_EngineFeature_0 = game:GetEngineFeature("VRMoreComfortSettings");
local l_l_UserGameSettings_0_PropertyChangedSignal_1 = l_UserGameSettings_0:GetPropertyChangedSignal("VREnabled");
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v45 = l_Roact_0.PureComponent:extend("BasicPage");
v45.validateProps = l_t_0.strictInterface({
    switchToAdvancedPage = l_t_0.callback, 
    switchToVRComfortSettingsPage = l_t_0.callback, 
    pageTitle = l_t_0.string, 
    isMenuOpen = l_t_0.boolean, 
    currentPage = l_t_0.optional(l_t_0.string), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    canGamepadCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    vrService = l_t_0.optional(l_t_0.union(l_t_0.Instance, l_t_0.table)), 
    isVRAppBuild = l_t_0.optional(l_t_0.callback), 
    currentZone = not not v40() and l_t_0.optional(l_t_0.number) or nil
});
v45.defaultProps = {
    vrService = l_VRService_0, 
    isVRAppBuild = l_IsVRAppBuild_0
};
local l_VREnabled_0 = l_UserGameSettings_0.VREnabled;
v45.init = function(v47)
    v47:setState({
        shiftLockEnabled = l_LocalPlayer_0.DevEnableMouseLock, 
        fullScreenEnabled = l_UserGameSettings_0:InFullScreen(), 
        invertedCameraEnabled = l_UserGameSettings_0.IsUsingCameraYInverted, 
        vrActive = v47.props.vrService.VREnabled, 
        vrEnabled = l_UserGameSettings_0.VREnabled, 
        voiceChatEnabled = false
    });
    local v48, v49 = l_Roact_0.createBinding(UDim2.new(0, 0, 0, 0));
    v47.pageSize = v48;
    v47.setPageSize = v49;
    v47.cameraModeButton = l_Roact_0.createRef();
    v47.volumeButton = l_Roact_0.createRef();
end;
v45.didUpdate = function(v50, v51)
    if not (((v40() or not v50.props.canCaptureFocus) or not v50.props.canGamepadCaptureFocus) or v51.canCaptureFocus and v51.canGamepadCaptureFocus) then
        if v50.state.vrActive then
            l_GuiService_0.SelectedCoreObject = v50.volumeButton:getValue();
        else
            l_GuiService_0.SelectedCoreObject = v50.cameraModeButton:getValue();
            return ;
        end;
    end;
end;
local function _()
    local v52 = 0;
    return function()
        v52 = v52 + 1;
        return v52;
    end;
end;
v45.renderWithSelectionCursor = function(v54, v55)
    local v56 = 0;
    local v57;
    do
        local l_v56_0 = v56;
        v57 = function()
            l_v56_0 = l_v56_0 + 1;
            return l_v56_0;
        end;
    end;
    v56 = v54.state.voiceChatEnabled and not v54.props.isVRAppBuild();
    local v59;
    if not v41() then
        v59 = (v54.state.vrActive or l_UserGameSettings_0.HasEverUsedVR) and not v54.props.isVRAppBuild();
    else
        v59 = true;
        if l_Platform_0 ~= Enum.Platform.Windows then
            v59 = l_Platform_0 == Enum.Platform.UWP;
        end;
    end;
    local l_createElement_0 = l_Roact_0.createElement;
    local l_v19_0 = v19;
    local v62 = {
        pageTitle = v54.props.pageTitle, 
        position = v54.props.position
    };
    local v63 = {};
    local v64;
    if v40() then
        v64 = l_Roact_0.createElement;
        local l_v15_0 = v15;
        local v66 = {
            isFocused = v54.props.canCaptureFocus and v54.props.canGamepadCaptureFocus
        };
        local v67 = true;
        if v54.props.currentPage ~= v36.MainPagePageKey then
            v67 = v54.props.currentZone == 0;
        end;
        v66.shouldForgetPreviousSelection = v67;
        v66.didFocus = function(v68)
            if not v68 then
                if v54.state.vrActive then
                    l_GuiService_0.SelectedCoreObject = v54.volumeButton:getValue();
                    return ;
                else
                    l_GuiService_0.SelectedCoreObject = v54.cameraModeButton:getValue();
                    return ;
                end;
            else
                l_GuiService_0.SelectedCoreObject = v68;
                return ;
            end;
        end;
        v64 = v64(l_v15_0, v66);
        if v64 then
            goto label0;
        end;
    end;
    v64 = nil;
    ::label0::;
    v63.FocusHandler = v64;
    v63.PageContents = l_Roact_0.createElement("ScrollingFrame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        CanvasSize = v54.pageSize, 
        Position = v54.props.position, 
        Size = UDim2.new(1, 0, 1, 0), 
        Selectable = false
    }, {
        Layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            [l_Roact_0.Change.AbsoluteContentSize] = function(v69)
                v54.setPageSize(UDim2.new(0, 0, 0, v69.AbsoluteContentSize.Y));
            end
        }), 
        VRControlsHeader = if not v54.state.vrActive then nil else l_Roact_0.createElement(v29, {
            LayoutOrder = v57(), 
            localizationKey = "CoreScripts.InGameMenu.GameSettings.VrControlsTitle"
        }), 
        VignetteEnabled = if not l_game_EngineFeature_0 and v54.state.vrActive then l_Roact_0.createElement(v24, {
            LayoutOrder = v57(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled", 
            instance = l_UserGameSettings_0, 
            valueKey = "VignetteEnabled"
        }) else nil, 
        VRSmoothRotationEnabled = if not l_game_EngineFeature_0 and v54.state.vrActive then l_Roact_0.createElement(v24, {
            LayoutOrder = v57(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.VRSmoothRotationEnabled", 
            instance = l_UserGameSettings_0, 
            valueKey = "VRSmoothRotationEnabled"
        }) else nil, 
        VRComfortSettings = if not not l_game_EngineFeature_0 and v54.state.vrActive then l_Roact_0.createElement(v26, {
            LayoutOrder = v57()
        }) else nil, 
        VRComfortSettingsPageButton = if not not l_game_EngineFeature_0 and v54.state.vrActive then l_Roact_0.createElement("TextButton", {
            LayoutOrder = v57(), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 54), 
            Text = "", 
            [l_Roact_0.Event.Activated] = v54.props.switchToVRComfortSettingsPage
        }, {
            Text = v21({
                text = "CoreScripts.InGameMenu.GameSettings.SwitchToVRComfortSettings"
            })(function(v70)
                return l_Roact_0.createElement(v20, {
                    Text = v70.text, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    Size = UDim2.new(1, -96, 1, 0), 
                    Position = UDim2.new(0, 24, 0.5, 0), 
                    AnchorPoint = Vector2.new(0, 0.5)
                });
            end), 
            Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v22.Images.NavigateForward, 
                Size = UDim2.new(0, 36, 0, 36), 
                Position = UDim2.new(1, -36, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5)
            })
        }) else nil, 
        VRMode = if not v59 then nil else l_Roact_0.createElement(v24, {
            LayoutOrder = v57(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.VREnabled", 
            instance = l_UserGameSettings_0, 
            valueKey = "VREnabled", 
            subtextEnabled = v54.state.vrEnabled ~= l_VREnabled_0, 
            subtextKey = "CoreScripts.InGameMenu.GameSettings.RestartPending"
        }), 
        VRSafetyBubbleMode = if not v54.state.vrActive then nil else l_Roact_0.createElement(v25, {
            LayoutOrder = v57()
        }), 
        VRControlsDivider = if not v54.state.vrActive then nil else l_Roact_0.createElement(v17, {
            LayoutOrder = v57(), 
            Size = UDim2.new(1, -24, 0, 1)
        }), 
        CameraHeader = if v54.state.vrActive then nil else l_Roact_0.createElement(v29, {
            LayoutOrder = v57(), 
            localizationKey = "CoreScripts.InGameMenu.GameSettings.CameraTitle"
        }), 
        CameraMode = not v54.state.vrActive and l_Roact_0.createElement(v27, {
            LayoutOrder = v57(), 
            ButtonRef = v54.cameraModeButton, 
            canOpen = v54.props.canCaptureFocus, 
            canCaptureFocus = v54.props.canGamepadCaptureFocus
        }), 
        InvertedCamera = (not v54.state.vrActive and v54.state.invertedCameraEnabled) and l_Roact_0.createElement(v24, {
            LayoutOrder = v57(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.InvertedCamera", 
            instance = l_UserGameSettings_0, 
            valueKey = "CameraYInverted"
        }), 
        CameraSensitivity = not v54.state.vrActive and l_Roact_0.createElement(v28, {
            LayoutOrder = v57(), 
            canCaptureFocus = v54.props.canCaptureFocus and v54.props.canGamepadCaptureFocus, 
            isMenuOpen = v54.props.isMenuOpen
        }), 
        CameraDivider = if v54.state.vrActive then nil else l_Roact_0.createElement(v17, {
            LayoutOrder = v57(), 
            Size = UDim2.new(1, -24, 0, 1)
        }), 
        ControlsHeader = l_Roact_0.createElement(v29, {
            LayoutOrder = v57(), 
            localizationKey = "CoreScripts.InGameMenu.GameSettings.ControlsAudio"
        }), 
        ShiftLock = not v54.state.vrActive and l_Roact_0.createElement(v24, {
            LayoutOrder = v57(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.ShiftLock", 
            instance = l_UserGameSettings_0, 
            valueKey = "ControlMode", 
            onValue = Enum.ControlMode.MouseLockSwitch, 
            offValue = Enum.ControlMode.Classic, 
            lockedToOff = not v54.state.shiftLockEnabled
        }), 
        MovementMode = not v54.state.vrActive and l_Roact_0.createElement(v32, {
            LayoutOrder = v57(), 
            canOpen = v54.props.canCaptureFocus, 
            canCaptureFocus = v54.props.canGamepadCaptureFocus
        }), 
        VolumeEntry = l_Roact_0.createElement(v34, {
            LayoutOrder = v57(), 
            buttonRef = v54.volumeButton, 
            canCaptureFocus = v54.props.canCaptureFocus and v54.props.canGamepadCaptureFocus, 
            isMenuOpen = v54.props.isMenuOpen
        }), 
        InputDevice = v56 and l_Roact_0.createElement(v30, {
            LayoutOrder = v57(), 
            deviceType = v30.DeviceType.Input, 
            isMenuOpen = v54.props.isMenuOpen, 
            canOpen = v54.props.canCaptureFocus, 
            canCaptureFocus = v54.props.canGamepadCaptureFocus
        }), 
        OutputDevice = v56 and l_Roact_0.createElement(v30, {
            LayoutOrder = v57(), 
            deviceType = v30.DeviceType.Output, 
            isMenuOpen = v54.props.isMenuOpen, 
            canOpen = v54.props.canCaptureFocus, 
            canCaptureFocus = v54.props.canGamepadCaptureFocus
        }), 
        ControlsDivider = l_Roact_0.createElement(v17, {
            LayoutOrder = v57(), 
            Size = UDim2.new(1, -24, 0, 1)
        }), 
        GraphicsHeader = l_Roact_0.createElement(v29, {
            LayoutOrder = v57(), 
            localizationKey = "CoreScripts.InGameMenu.GameSettings.GraphicsTitle"
        }), 
        GraphicsQualityEntry = l_Roact_0.createElement(v31, {
            LayoutOrder = v57(), 
            canCaptureFocus = v54.props.canCaptureFocus and v54.props.canGamepadCaptureFocus, 
            isMenuOpen = v54.props.isMenuOpen
        }), 
        FullScreen = not v54.state.vrActive and l_Roact_0.createElement(v33, {
            LayoutOrder = v57(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.FullScreen", 
            checked = v54.state.fullScreenEnabled, 
            onToggled = function()
                l_GuiService_0:ToggleFullscreen();
                v35(v36.AnalyticsSettingsChangeName, nil, {}, true);
            end
        }), 
        GraphicsDivider = l_Roact_0.createElement(v17, {
            LayoutOrder = v57(), 
            Size = UDim2.new(1, -24, 0, 1)
        }), 
        AdvancedSettings = l_Roact_0.createElement("TextButton", {
            LayoutOrder = v57(), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 54), 
            Text = "", 
            SelectionImageObject = v55(l_CursorKind_0.Square), 
            [l_Roact_0.Event.Activated] = v54.props.switchToAdvancedPage
        }, {
            Text = v21({
                text = "CoreScripts.InGameMenu.GameSettings.SwitchToAdvancedSettings"
            })(function(v71)
                return l_Roact_0.createElement(v20, {
                    Text = v71.text, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    Size = UDim2.new(1, -96, 1, 0), 
                    Position = UDim2.new(0, 24, 0.5, 0), 
                    AnchorPoint = Vector2.new(0, 0.5)
                });
            end), 
            Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v22.Images.NavigateForward, 
                Size = UDim2.new(0, 36, 0, 36), 
                Position = UDim2.new(1, -36, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5)
            })
        }), 
        AdvancedDivider = l_Roact_0.createElement(v17, {
            LayoutOrder = v57(), 
            Size = UDim2.new(1, -24, 0, 1)
        }), 
        ShiftLockEnabledListener = l_Roact_0.createElement(v18, {
            event = l_l_LocalPlayer_0_PropertyChangedSignal_0, 
            callback = function()
                v54:setState({
                    shiftLockEnabled = l_LocalPlayer_0.DevEnableMouseLock
                });
            end
        }), 
        FullScreenListener = l_Roact_0.createElement(v18, {
            event = l_UserGameSettings_0.FullscreenChanged, 
            callback = function(v72)
                v54:setState({
                    fullScreenEnabled = v72
                });
                v35(v36.AnalyticsInGameMenuName, v36.AnalyticsFullscreenModeName, {
                    enabled = v72
                });
            end
        }), 
        CameraYInvertedListener = l_Roact_0.createElement(v18, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = function()
                v54:setState({
                    invertedCameraEnabled = l_UserGameSettings_0.IsUsingCameraYInverted
                });
            end
        }), 
        VRActiveListener = l_Roact_0.createElement(v18, {
            event = v54.props.vrService:GetPropertyChangedSignal("VREnabled"), 
            callback = function()
                if v54.props.vrService.VREnabled then
                    l_UserGameSettings_0.HasEverUsedVR = true;
                end;
                v54:setState({
                    vrActive = v54.props.vrService.VREnabled
                });
            end
        }), 
        VREnabledListener = l_Roact_0.createElement(v18, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_1, 
            callback = function()
                v54:setState({
                    vrEnabled = l_UserGameSettings_0.VREnabled
                });
            end
        })
    });
    return l_createElement_0(l_v19_0, v62, v63);
end;
v45.render = function(v73)
    return l_withSelectionCursorProvider_0(function(v74)
        return v73:renderWithSelectionCursor(v74);
    end);
end;
v45.didMount = function(v75)
    spawn(function()
        require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default:asyncInit():andThen(function()
            v75:setState({
                voiceChatEnabled = true
            });
        end):catch(function()
        end);
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v76)
    local v77 = false;
    if v76.menuPage == "GameSettings" then
        v77 = v76.isMenuOpen and not v76.respawn.dialogOpen;
    end;
    local v78 = false;
    if v76.displayOptions.inputType == v36.InputType.Gamepad then
        v78 = v76.currentZone == 1;
    end;
    local v79 = nil;
    if v40() then
        v79 = v76.currentZone;
    end;
    return {
        isMenuOpen = v76.isMenuOpen, 
        currentPage = v76.menuPage, 
        currentZone = v79, 
        canCaptureFocus = v77, 
        canGamepadCaptureFocus = v78
    };
end, function(v80)
    return {
        switchToAdvancedPage = function()
            v80(v23(v36.advancedSettingsPageKey));
        end, 
        switchToVRComfortSettingsPage = function()
            v80(v23(v36.vrComfortSettingsPageKey));
        end
    };
end)(v45);
