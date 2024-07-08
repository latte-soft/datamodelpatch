local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v4 = settings():FindFirstChild("Game Options") or error("Game Options does not exist", 0);
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local v10 = require(l_CorePackages_0.InGameMenuDependencies);
local v11 = require(l_CorePackages_0.Workspace.Packages.VideoProtocol);
local l_Roact_0 = v10.Roact;
local l_RoactRodux_0 = v10.RoactRodux;
local l_UIBlox_0 = v10.UIBlox;
local l_t_0 = v10.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_ContextualMenu_0 = l_UIBlox_0.App.Menu.ContextualMenu;
local l_MenuDirection_0 = l_UIBlox_0.App.Menu.MenuDirection;
local l_KeyLabel_0 = l_UIBlox_0.App.Menu.KeyLabel;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_Parent_0 = script.Parent.Parent;
local v23 = require(l_Parent_0.Localization.withLocalization);
local v24 = require(l_Parent_0.Actions.SetRespawning);
local v25 = require(l_Parent_0.Thunks.CloseMenu);
local v26 = require(l_Parent_0.Resources.Assets);
local v27 = require(l_Parent_0.Actions.SetCurrentPage);
local v28 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicator);
local v29 = require(l_Parent_0.Resources.Constants);
local v30 = require(l_Parent_0.Enums.Direction);
local v31 = require(script.Parent.PageNavigation);
local v32 = require(script.Parent.GameIconHeader);
local v33 = require(script.Parent.ZonePortal);
local l_Flags_0 = l_Parent_0.Flags;
local v35 = require(l_Flags_0.FFlagRecordRecording);
local v36 = game:DefineFastFlag("TakeAScreenshotOfThis", false);
local v37 = game:DefineFastFlag("ShowContextMenuWhenButtonsArePresent", false);
local v38 = require(l_Flags_0.GetFFlagIGMGamepadSelectionHistory);
local v39 = require(l_Flags_0.GetFFlagSideNavControllerBar);
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v41 = require(script.Parent.Connection.FocusHandler);
local v42 = require(script.Parent.IGMMainPageControllerBar);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v44 = {
    [v29.InputType.MouseAndKeyboard] = Enum.KeyCode.R, 
    [v29.InputType.Gamepad] = Enum.KeyCode.ButtonY
};
local v45 = {
    [v29.InputType.MouseAndKeyboard] = Enum.KeyCode.F12
};
local v46 = {
    [v29.InputType.MouseAndKeyboard] = Enum.KeyCode.L, 
    [v29.InputType.Gamepad] = Enum.KeyCode.ButtonX
};
local v47 = l_Roact_0.PureComponent:extend("MainPage");
local function _()
    if not l_VRService_0.VREnabled then
        if v36 then
            return not require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Common:WaitForChild("PolicyService")):IsSubjectToChinaPolicies();
        else
            return true;
        end;
    else
        return false;
    end;
end;
v47.renderButtonModels = function(v49, v50, v51)
    local v52 = {};
    local l_inputType_0 = v49.props.inputType;
    if if not l_VRService_0.VREnabled then not v36 or not require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Common:WaitForChild("PolicyService")):IsSubjectToChinaPolicies() else false then
        if v36 then
            table.insert(v52, {
                icon = l_Images_0["icons/controls/screenshot"], 
                text = v51.screenCapture, 
                onActivated = function()
                    v49:setState({
                        modalOpen = false
                    });
                    v49.props.closeMenu();
                    l_RunService_0.RenderStepped:Wait();
                    l_RunService_0.RenderStepped:Wait();
                    l_CoreGui_0:TakeScreenshot();
                end
            });
        end;
        if not (not v4.VideoCaptureEnabled or not v35) then
            local l_recordVideo_0 = v51.recordVideo;
            local v55 = nil;
            if v49.props.recording then
                local v56 = os.date("*t", v49.state.recordingDuration);
                l_recordVideo_0 = v51.recording:gsub("{DURATION}", (("%d:%02d"):format(v56.min, v56.sec)));
                v55 = v50.Theme.Alert.Color;
            end;
            table.insert(v52, {
                icon = l_Images_0["icons/controls/screenrecord"], 
                text = l_recordVideo_0, 
                onActivated = function()
                    l_CoreGui_0:ToggleRecording();
                    v49:setState({
                        modalOpen = false
                    });
                end, 
                keyCodeLabel = v45[l_inputType_0], 
                iconColorOverride = v55, 
                textColorOverride = v55
            });
        end;
    end;
    if v49.props.respawnButtonVisible then
        table.insert(v52, {
            icon = v26.Images.RespawnIcon, 
            text = v51.respawnCharacter, 
            onActivated = function()
                v49:setState({
                    modalOpen = false
                });
                v49.props.startRespawning();
            end, 
            keyCodeLabel = v44[l_inputType_0]
        });
    end;
    return v52;
end;
v47.validateProps = l_t_0.strictInterface({
    open = l_t_0.boolean, 
    isMainPageMoreMenuOpen = l_t_0.optional(l_t_0.boolean), 
    respawnButtonVisible = l_t_0.boolean, 
    startLeavingGame = l_t_0.callback, 
    startRespawning = l_t_0.callback, 
    setMainPageMoreMenuOpen = l_t_0.optional(l_t_0.callback), 
    closeMenu = l_t_0.callback, 
    recording = l_t_0.boolean, 
    screenSize = l_t_0.Vector2, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    inputType = l_t_0.optional(l_t_0.string), 
    setFirstItemRef = l_t_0.optional(l_t_0.callback), 
    voiceEnabled = l_t_0.optional(l_t_0.boolean), 
    currentZone = not not v38() and l_t_0.optional(l_t_0.number) or nil, 
    isMainPageInForeground = not not v39() and l_t_0.optional(l_t_0.boolean) or nil
});
v47.init = function(v57)
    v57.moreMenuFrameRef = nil;
    v57.moreMenuFirstItemFrameRef = nil;
    v57.moreMenuButtonRef = l_Roact_0.createRef();
    v57.mainPageFirstButtonRef = l_Roact_0.createRef();
    v57.setMoreMenuRef = function(v58)
        v57.moreMenuFrameRef = v58;
    end;
    v57.setMoreMenuFirstItemRef = function(v59)
        v57.moreMenuFirstItemFrameRef = v59;
    end;
    v57.getRecordingDuration = function()
        local v60 = v11.default:getRecordingDuration();
        return not not v60 and v60.recordingDuration or 0;
    end;
    v57.state = {
        modalOpen = false, 
        recordingDuration = 0
    };
end;
v47.getDerivedStateFromProps = function(v61)
    if not v39() then
        if not v61.canCaptureFocus then
            return {
                modalOpen = false
            };
        end;
    elseif not v61.isMainPageInForeground then
        return {
            modalOpen = false
        };
    end;
    return nil;
end;
v47.renderMainPageFocusHandler = function(v62)
    local v63 = v62.canGamepadCaptureFocus(v62.props);
    local v64 = nil;
    if v38() then
        v63 = v62.canGamepadCaptureFocus(v62.props) and not v62.state.modalOpen;
        v64 = not v62.props.open or v62.props.currentZone == 0;
    end;
    return l_Roact_0.createElement(v41, {
        isFocused = v63, 
        shouldForgetPreviousSelection = v64, 
        didFocus = not not v38() and function(v65)
            if not v39() then
                l_ContextActionService_0:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, v67)
                    if v67 == Enum.UserInputState.End then
                        v62:setState({
                            modalOpen = true
                        });
                        return Enum.ContextActionResult.Sink;
                    else
                        return Enum.ContextActionResult.Pass;
                    end;
                end, false, Enum.KeyCode.ButtonL3);
            end;
            l_GuiService_0.SelectedCoreObject = v65 or v62.mainPageFirstButtonRef:getValue();
        end or function()
            l_ContextActionService_0:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, v69)
                if v69 == Enum.UserInputState.End then
                    v62:setState({
                        modalOpen = not v62.state.modalOpen
                    });
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonL3);
        end, 
        didBlur = function()
            if not v39() then
                l_ContextActionService_0:UnbindCoreAction("LeftStickTogglesMoreMenuAction");
            end;
        end
    });
end;
v47.renderMoreMenuFocusHandler = function(v70)
    local _ = nil;
    return l_Roact_0.createElement(v41, {
        isFocused = if not v39() then v70.canGamepadCaptureFocus(v70.props) else v70.props.isMainPageInForeground and v70.props.inputType == v29.InputType.Gamepad and v70.state.modalOpen, 
        didFocus = function()
            local function v74(_, v73)
                if v73 == Enum.UserInputState.End then
                    v70:setState({
                        modalOpen = false
                    });
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end;
            if not v38() then
                l_ContextActionService_0:BindCoreAction("CloseMoreMenuAction", v74, false, Enum.KeyCode.ButtonB);
            else
                l_ContextActionService_0:BindCoreAction("CloseMoreMenuAction", v74, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonL3);
            end;
            if v70.moreMenuFrameRef ~= nil then
                l_GuiService_0:RemoveSelectionGroup("MainPageMoreMenu");
            end;
            l_GuiService_0:AddSelectionParent("MainPageMoreMenu", v70.moreMenuFrameRef);
            l_GuiService_0.SelectedCoreObject = v70.moreMenuFirstItemFrameRef;
        end, 
        didBlur = function()
            l_ContextActionService_0:UnbindCoreAction("CloseMoreMenuAction");
        end
    });
end;
v47.render = function(v75)
    local v76 = nil;
    v76 = if not v39() then v75.canGamepadCaptureFocus(v75.props) else v75.props.isMainPageInForeground and v75.props.inputType == v29.InputType.Gamepad;
    return l_withStyle_0(function(v77)
        return v23({
            leaveGame = "CoreScripts.InGameMenu.LeaveGame", 
            respawnCharacter = "CoreScripts.InGameMenu.RespawnCharacter", 
            recordVideo = "CoreScripts.InGameMenu.Record.StartRecording", 
            recording = "CoreScripts.InGameMenu.Record.Duration", 
            screenCapture = "CoreScripts.InGameMenu.Controls.Screenshot"
        })(function(v78)
            local v79 = l_Roact_0.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = UDim2.fromOffset(44, 44), 
                onActivated = function()
                    v75:setState({
                        modalOpen = true
                    });
                end, 
                icon = v26.Images.MoreActions, 
                [l_Roact_0.Ref] = v75.moreMenuButtonRef
            });
            local v80 = v75:renderButtonModels(v77, v78);
            local l_respawnButtonVisible_0 = v75.props.respawnButtonVisible;
            if v37 then
                l_respawnButtonVisible_0 = #v80 > 0;
            end;
            local v82 = v46[v75.props.inputType];
            local v83 = not l_respawnButtonVisible_0 and 0 or -56;
            local l_modalOpen_0 = v75.state.modalOpen;
            local v85 = l_Roact_0.createElement(v42, {
                canCaptureFocus = v76, 
                isMainPageMoreMenuOpen = l_modalOpen_0
            });
            local v86 = nil;
            if v75.props.voiceEnabled then
                v86 = l_Roact_0.createElement(v28, {
                    size = UDim2.fromOffset(44, 44), 
                    userId = tostring(l_Players_0.LocalPlayer.UserId), 
                    iconStyle = "MicLight", 
                    onClicked = function()
                        l_default_0:ToggleMic("VRInGameMenuMainPage");
                    end
                });
                v83 = v83 - 56;
            end;
            return l_Roact_0.createElement("TextButton", {
                Size = UDim2.new(0, 400, 1, 0), 
                BackgroundColor3 = v77.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v77.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Visible = v75.props.open, 
                Text = "", 
                AutoButtonColor = false, 
                Selectable = false
            }, {
                MoreMenuFocusHandler = v75:renderMoreMenuFocusHandler(), 
                MainPageFocusHandler = not l_VRService_0.VREnabled and v75:renderMainPageFocusHandler() or nil, 
                ControllerBar = v85, 
                ZonePortal = l_Roact_0.createElement(v33, {
                    targetZone = 0, 
                    direction = v30.Left
                }), 
                GameIconHeader = l_Roact_0.createElement(v32), 
                PageNavigation = l_Roact_0.createElement(v31, {
                    Position = UDim2.new(0, v29.Zone.ContentOffset, 0, 148), 
                    mainPageFirstButtonRef = v75.mainPageFirstButtonRef
                }), 
                ContextualMenu = l_Roact_0.createElement(l_ContextualMenu_0, {
                    buttonProps = v80, 
                    setFrameRef = v75.setMoreMenuRef, 
                    setFirstItemRef = v75.setMoreMenuFirstItemRef, 
                    open = l_modalOpen_0, 
                    menuDirection = l_MenuDirection_0.Up, 
                    openPositionY = UDim.new(1, -84), 
                    closeBackgroundVisible = true, 
                    screenSize = v75.props.screenSize, 
                    onDismiss = function()
                        v75:setState({
                            modalOpen = false
                        });
                    end
                }), 
                BottomButtons = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 84), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = 1
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 12), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    Padding = l_Roact_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 24), 
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    LeaveGame = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, v83, 0, 44), 
                        Position = UDim2.fromScale(1, 0), 
                        AnchorPoint = Vector2.new(1, 0), 
                        LayoutOrder = 1
                    }, {
                        Button = l_Roact_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            size = UDim2.fromScale(1, 1), 
                            onActivated = v75.props.startLeavingGame, 
                            text = v78.leaveGame
                        }), 
                        KeyLabel = not not v82 and l_Roact_0.createElement(l_KeyLabel_0, {
                            keyCode = v82, 
                            iconThemeKey = "UIDefault", 
                            textThemeKey = "SystemPrimaryContent", 
                            AnchorPoint = Vector2.new(1, 0.5), 
                            Position = UDim2.new(1, -16, 0.5, 0), 
                            LayoutOrder = 2, 
                            ZIndex = 2
                        }) or nil
                    }), 
                    VoiceChatMuteButton = v86, 
                    MoreButton = l_respawnButtonVisible_0 and v79
                })
            });
        end);
    end);
end;
v47.willUnmount = function(v87)
    v87.recording = false;
    l_GuiService_0:RemoveSelectionGroup("MainPageMoreMenu");
    if v39() then
        l_ContextActionService_0:UnbindCoreAction("LeftStickTogglesMoreMenuAction");
    end;
end;
v47.canGamepadCaptureFocus = function(v88)
    return v88.canCaptureFocus and v88.inputType == v29.InputType.Gamepad;
end;
v47.didUpdate = function(v89, v90, v91)
    local l_modalOpen_1 = v89.state.modalOpen;
    local l_modalOpen_2 = v91.modalOpen;
    if not ((v38() or not v89.canGamepadCaptureFocus(v89.props)) or l_modalOpen_1) then
        if not l_modalOpen_2 then
            if not v89.canGamepadCaptureFocus(v90) then
                l_GuiService_0.SelectedCoreObject = v89.mainPageFirstButtonRef:getValue();
            end;
        else
            l_GuiService_0.SelectedCoreObject = v89.moreMenuButtonRef:getValue();
        end;
    end;
    if v39() then
        local function _(v94, v95)
            local l_isMainPageInForeground_0 = v94.isMainPageInForeground;
            if l_isMainPageInForeground_0 then
                l_isMainPageInForeground_0 = false;
                if v94.inputType == v29.InputType.Gamepad then
                    l_isMainPageInForeground_0 = not v95;
                end;
            end;
            return l_isMainPageInForeground_0;
        end;
        local l_props_0 = v89.props;
        local l_isMainPageInForeground_1 = l_props_0.isMainPageInForeground;
        if l_isMainPageInForeground_1 then
            l_isMainPageInForeground_1 = false;
            if l_props_0.inputType == v29.InputType.Gamepad then
                l_isMainPageInForeground_1 = not l_modalOpen_1;
            end;
        end;
        if l_isMainPageInForeground_1 then
            l_isMainPageInForeground_1 = v90.isMainPageInForeground;
            if l_isMainPageInForeground_1 then
                l_isMainPageInForeground_1 = false;
                if v90.inputType == v29.InputType.Gamepad then
                    l_isMainPageInForeground_1 = not l_modalOpen_2;
                end;
            end;
            if not l_isMainPageInForeground_1 then
                l_ContextActionService_0:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, v101)
                    if v101 == Enum.UserInputState.End then
                        v89:setState({
                            modalOpen = true
                        });
                        return Enum.ContextActionResult.Sink;
                    else
                        return Enum.ContextActionResult.Pass;
                    end;
                end, false, Enum.KeyCode.ButtonL3);
                goto label0 --[[  true, true  ]];
            end;
        end;
        l_props_0 = v89.props;
        l_isMainPageInForeground_1 = l_props_0.isMainPageInForeground;
        if l_isMainPageInForeground_1 then
            l_isMainPageInForeground_1 = false;
            if l_props_0.inputType == v29.InputType.Gamepad then
                l_isMainPageInForeground_1 = not l_modalOpen_1;
            end;
        end;
        if not l_isMainPageInForeground_1 then
            l_isMainPageInForeground_1 = v90.isMainPageInForeground;
            if l_isMainPageInForeground_1 then
                l_isMainPageInForeground_1 = false;
                if v90.inputType == v29.InputType.Gamepad then
                    l_isMainPageInForeground_1 = not l_modalOpen_2;
                end;
            end;
            if l_isMainPageInForeground_1 then
                l_ContextActionService_0:UnbindCoreAction("LeftStickTogglesMoreMenuAction");
            end;
        end;
    end;
    ::label0::;
    if v35 then
        if not v89.props.recording then
            v89.recording = false;
        elseif not v90.recording then
            v89.recording = true;
            local v102 = tick() - v89.getRecordingDuration();
            local function v103()
                if v89.recording then
                    delay(0.2, v103);
                end;
                v89:setState({
                    recordingDuration = tick() - v102
                });
            end;
            v89:setState({
                recordingDuration = 0
            });
            delay(0.2, v103);
        end;
    end;
    if l_VRService_0.VREnabled then
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v104, _)
    local v106 = nil;
    if v39() then
        v106 = (v104.isMenuOpen and not v104.respawn.dialogOpen) and v104.menuPage == v29.MainPagePageKey;
    end;
    local v107 = nil;
    if v38() then
        v107 = v104.currentZone;
    end;
    local v108 = false;
    if v104.menuPage == v29.MainPagePageKey then
        v108 = (v104.isMenuOpen and not v104.respawn.dialogOpen) and v104.currentZone == 1;
    end;
    return {
        open = v104.isMenuOpen, 
        respawnButtonVisible = v104.respawn.enabled, 
        recording = v104.recording, 
        screenSize = v104.screenSize, 
        voiceEnabled = v104.voiceState.voiceEnabled, 
        canCaptureFocus = v108, 
        currentZone = v107, 
        inputType = v104.displayOptions.inputType, 
        isMainPageInForeground = v106
    };
end, function(v109)
    return {
        startLeavingGame = function()
            v109(v27(v29.LeaveGamePromptPageKey));
        end, 
        startRespawning = function()
            v109(v24(true));
        end, 
        closeMenu = function()
            v109(v25);
        end
    };
end)(v47);
