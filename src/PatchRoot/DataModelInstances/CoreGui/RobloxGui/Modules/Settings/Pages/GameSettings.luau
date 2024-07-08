local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_SoundService_0 = game:GetService("SoundService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v12 = UserSettings();
local l_GameSettings_0 = v12.GameSettings;
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_UserGameSettings_0 = v12:GetService("UserGameSettings");
local v16 = require(l_RobloxGui_0.Modules.Common.Url);
local v17 = nil;
local l_TextChatService_0 = game:GetService("TextChatService");
local l_SafetyService_0 = game:GetService("SafetyService");
local v20 = nil;
if game:GetEngineFeature("CaptureModeEnabled") then
    v20 = game:GetService("ExperienceStateCaptureService");
end;
local v21 = require(l_RobloxGui_0.Modules.Flags.FFlagAvatarChatCoreScriptSupport);
local v22 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local v23 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v25 = require(l_CoreGui_0.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal);
local v26 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local l_GetFFlagSelfViewCameraSettings_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewCameraSettings;
local v28 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAlwaysShowVRToggle);
local v29 = {
    ["Enum.SavedQualitySetting.Automatic"] = 0, 
    ["Enum.SavedQualitySetting.QualityLevel1"] = 1, 
    ["Enum.SavedQualitySetting.QualityLevel2"] = 2, 
    ["Enum.SavedQualitySetting.QualityLevel3"] = 3, 
    ["Enum.SavedQualitySetting.QualityLevel4"] = 4, 
    ["Enum.SavedQualitySetting.QualityLevel5"] = 5, 
    ["Enum.SavedQualitySetting.QualityLevel6"] = 6, 
    ["Enum.SavedQualitySetting.QualityLevel7"] = 7, 
    ["Enum.SavedQualitySetting.QualityLevel8"] = 8, 
    ["Enum.SavedQualitySetting.QualityLevel9"] = 9, 
    ["Enum.SavedQualitySetting.QualityLevel10"] = 10
};
local v30 = {
    DevComputerMovementMode = true, 
    DevComputerCameraMode = true, 
    DevEnableMouseLock = true
};
local v31 = {
    DevTouchMovementMode = true, 
    DevTouchCameraMode = true
};
local v32 = not l_UserInputService_0.TouchEnabled and "Default (Classic)" or "Default (Follow)";
local v33 = {
    Input = "Input", 
    Output = "Output"
};
local v34 = not l_UserInputService_0.TouchEnabled and "Default (Keyboard)" or "Default (Dynamic Thumbstick)";
local v35 = not l_UserInputService_0.TouchEnabled and "Click to Move" or "Tap to Move";
local v36 = {
    OverscanAdjustButton = 1, 
    ShiftLockFrame = 10, 
    CameraModeFrame = 11, 
    MovementModeFrame = 12, 
    GamepadSensitivityFrame = 13, 
    LanguageSelectorFrame = 20, 
    FeedbackModeButton = 30, 
    ChatTranslationFrame = 40, 
    ChatLanguageSelectorFrame = 41, 
    ChatTranslationToggleFrame = 42, 
    MouseAdvancedFrame = 50, 
    DeviceFrameInput = 60, 
    DeviceFrameOutput = 61, 
    VolumeFrame = 62, 
    FullScreenFrame = 70, 
    GraphicsEnablerFrame = 71, 
    GraphicsQualityFrame = 72, 
    ReducedMotionFrame = 73, 
    PreferredTransparencyFrame = 74, 
    UiNavigationKeyBindEnabledFrame = 75, 
    PerformanceStatsFrame = 80, 
    MicroProfilerFrame = 81, 
    CameraInvertedFrame = 90, 
    CameraDeviceFrame = 91, 
    VREnabledFrame = 100, 
    DeveloperConsoleButton = 101, 
    UiToggleRow = 200, 
    UiToggleRowCustom = 200, 
    UiToggleRowBillboards = 201, 
    UiToggleRowNameplates = 202, 
    FreecamToggleRow = 203, 
    InformationFrame = 999
};
local v37 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local v38 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationSettingEnabled);
local v39 = require(l_RobloxGui_0.Modules.Flags.GetFStringChatTranslationLayerName);
local v40 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationLaunchEnabled);
local v41 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationHoldoutEnabled);
local l_game_EngineFeature_0 = game:GetEngineFeature("TextChatServiceSettingsSaved");
local v43 = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsRowInitializers.ChatTranslationOptionsWithChatLanguageSwitcherInitializer);
local l_game_EngineFeature_1 = game:GetEngineFeature("GameBasicSettingsFramerateCap");
local v45 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_Constants_0 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v47 = require(l_RobloxGui_0.Modules.CoreUtility);
local v48 = require(l_RobloxGui_0.Modules.PlayerPermissionsModule);
local v49 = require(l_RobloxGui_0.Modules.Common.GetHasGuiHidingPermission);
local v50 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v51 = require(l_CorePackages_0.Cryo);
local v52 = require(script.Parent.Parent.GfxReset);
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("Settings"):WaitForChild("SettingsHub");
local v53 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local __ = nil;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v57 = require(l_RobloxGui_0.Modules.Common.PolicyService);
local l_default_1 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v59 = require(l_RobloxGui_0.Modules.Flags.GetFixGraphicsQuality);
local v60 = nil;
local v61 = nil;
local l_RobloxTranslator_0 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("RobloxTranslator"));
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v64 = l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.Video.SystemDefault");
local v65 = l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.Video.VideoCamera");
local v66 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
if v59() then
    v60 = settings().Rendering;
    v61 = l_RobloxGui_0:WaitForChild("SendNotificationInfo");
end;
local l_status_0, l_result_0 = pcall(function()
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v69 = l_status_0 and l_result_0;
game:DefineFastInt("RomarkStartWithGraphicQualityLevel", -1);
local l_game_FastInt_0 = game:GetFastInt("RomarkStartWithGraphicQualityLevel");
local v71 = not v57:IsSubjectToChinaPolicies();
local v72 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
    v72 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
        v72 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
    end;
end;
local v73 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
    v73 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
end;
local v74 = (v73 or v72) and v71;
local v75 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceChatDeviceChangeDebounceDelay);
local v76 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v77 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableUniveralVoiceToasts);
local v78 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUseSoundServiceInputApi);
local v79 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableExplicitSettingsChangeAnalytics);
local l_GetFFlagGameSettingsCameraModeFixEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagGameSettingsCameraModeFixEnabled;
local v81 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagFixCyclicFullscreenIndexEvent);
local v82 = game:DefineFastFlag("DisableFeedbackSoothsayerCheck", false);
local v83 = game:DefineFastFlag("UserShowGuiHideToggles", false);
local v84 = game:DefineFastFlag("FixDeveloperConsoleButtonSizeAndPositioning", false);
local v85 = game:DefineFastFlag("EnableTFFeedbackModeEntryCheck", false);
local v86 = game:DefineFastFlag("FeedbackEntryPointButtonSizeAdjustment2", false);
local v87 = game:DefineFastFlag("FeedbackEntryPointImprovedStrictnessCheck", false);
local v88 = game:DefineFastFlag("FixSensitivityTextPrecision", false);
local function v94(v89, v90, v91, v92)
    if not ((v79() and v90 ~= v91) and v90 ~= nil) or v91 == nil then
        return ;
    else
        local v93 = {
            universe_id = tostring(game.GameId), 
            name = v89, 
            old_value = tostring(v90), 
            new_value = tostring(v91), 
            has_touch = l_UserInputService_0.TouchEnabled, 
            has_mouse = l_UserInputService_0.MouseEnabled, 
            has_gamepad = l_UserInputService_0.GamepadEnabled
        };
        if v92 then
            v93 = v51.Dictionary.join(v93, v92);
        end;
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsExplicitSettingsChangeName, v93);
        return ;
    end;
end;
local function v96()
    local v95 = {};
    if not l_UserInputService_0.TouchEnabled then
        v95.camera_mode_desktop = tostring(l_GameSettings_0.ComputerCameraMovementMode);
    else
        v95.camera_mode_touch = tostring(l_GameSettings_0.TouchCameraMovementMode);
    end;
    if not l_UserInputService_0.TouchEnabled then
        v95.movement_mode_desktop = tostring(l_GameSettings_0.ComputerMovementMode);
    else
        v95.movement_mode_touch = tostring(l_GameSettings_0.TouchMovementMode);
    end;
    if l_UserInputService_0.MouseEnabled then
        v95.shift_lock_enabled = tostring(l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch);
    end;
    if not (not l_UserInputService_0.GamepadEnabled or not l_GameSettings_0.IsUsingGamepadCameraSensitivity) then
        v95.camera_sensitivity_gamepad = tostring((tonumber(string.format("%.2f", l_GameSettings_0.GamepadCameraSensitivity))));
    end;
    if l_UserInputService_0.MouseEnabled then
        v95.camera_sensitivity_mouse = tostring((tonumber(string.format("%.2f", l_GameSettings_0.MouseSensitivityFirstPerson.X))));
    end;
    v95.camera_y_inverted = tostring(l_GameSettings_0.CameraYInverted);
    v95.show_performance_stats = tostring(l_GameSettings_0.PerformanceStatsVisible);
    v95.volume = tostring((math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5)));
    v95.gfx_quality_level = tostring(settings().Rendering.QualityLevel);
    if l_game_EngineFeature_1 then
        v95.framerate_cap = tostring(l_GameSettings_0.FramerateCap);
    end;
    v95.fullscreen_enabled = tostring(l_GameSettings_0:InFullScreen());
    v95.microprofiler_enabled = tostring(l_GameSettings_0.OnScreenProfilerEnabled);
    v95.microprofiler_webserver_enabled = tostring(l_GameSettings_0.MicroProfilerWebServerEnabled);
    v95.reduced_motion = tostring(l_GameSettings_0.ReducedMotion);
    v95.preferred_transparency = tostring(l_GameSettings_0.PreferredTransparency);
    v95.ui_navigation_key_bind_enabled = tostring(l_GameSettings_0.UiNavigationKeyBindEnabled);
    v95.universeid = tostring(game.GameId);
    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsSettingsChangeName, v95);
end;
game:DefineFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout", 0);
game:DefineFastString("V1MenuLanguageSelectionFeatureForcedUserIds", "");
local v97 = game:DefineFastFlag("IGMEnableGFXReset", false);
return ((function()
    if v97 then
        v52.RunGfxReset();
    end;
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    local v99 = false;
    local v100 = {};
    local __ = function()
        local l_VREnabled_0 = l_VRService_0.VREnabled;
        for v102, __ in pairs(v100) do
            v102.Visible = not l_VREnabled_0;
        end;
    end;
    l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(function()
        if not (not l_VRService_0.VREnabled or not v99) then
            local l_VREnabled_1 = l_VRService_0.VREnabled;
            for v106, __ in pairs(v100) do
                v106.Visible = not l_VREnabled_1;
            end;
        end;
    end);
    if not (not l_VRService_0.VREnabled or not v99) then
        local l_VREnabled_2 = l_VRService_0.VREnabled;
        for v109, __ in pairs(v100) do
            v109.Visible = not l_VREnabled_2;
        end;
    end;
    local function v184()
        local v111 = 1;
        if not l_GameSettings_0:InFullScreen() then
            v111 = 2;
        end;
        local l_l_NewPage_0_0 = l_NewPage_0;
        local l_l_NewPage_0_1 = l_NewPage_0;
        local l_l_NewPage_0_2 = l_NewPage_0;
        local v115, v116, v117 = v45:AddNewRow(l_NewPage_0, "Fullscreen", "Selector", {
            "On", 
            "Off"
        }, v111);
        l_l_NewPage_0_0.FullscreenFrame = v115;
        l_l_NewPage_0_1.FullscreenLabel = v116;
        l_l_NewPage_0_2.FullscreenEnabler = v117;
        l_NewPage_0.FullscreenFrame.LayoutOrder = v36.FullScreenFrame;
        v100[l_NewPage_0.FullscreenFrame] = true;
        l_NewPage_0.FullscreenEnabler.IndexChanged:connect(function(v118)
            local v119 = l_GameSettings_0:InFullScreen();
            if v118 == 1 then
                if not l_GameSettings_0:InFullScreen() then
                    l_GuiService_0:ToggleFullscreen();
                    if not v81() then
                        l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
                    elseif l_NewPage_0.FullscreenEnabler.GetSelectedIndex() ~= 1 then
                        l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
                    end;
                end;
            elseif not (not (v118 == 2) or not l_GameSettings_0:InFullScreen()) then
                l_GuiService_0:ToggleFullscreen();
                if not v81() then
                    l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
                elseif l_NewPage_0.FullscreenEnabler.GetSelectedIndex() ~= 2 then
                    l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
                end;
            end;
            spawn(function()
                if v79() then
                    v94("fullscreen_enabled", v119, l_GameSettings_0:InFullScreen());
                end;
                v96();
            end);
        end);
        l_GameSettings_0.FullscreenChanged:connect(function(v120)
            if not v120 then
                if l_NewPage_0.FullscreenEnabler:GetSelectedIndex() ~= 2 then
                    l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
                end;
            elseif l_NewPage_0.FullscreenEnabler:GetSelectedIndex() ~= 1 then
                l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
            end;
            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsFullscreenModeName, {
                enabled = v120
            });
        end);
        l_l_NewPage_0_0 = 1;
        if not v59() then
            if l_GameSettings_0.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
                l_l_NewPage_0_0 = 2;
            end;
        elseif l_GameSettings_0.GraphicsQualityLevel ~= 0 then
            l_l_NewPage_0_0 = 2;
        end;
        l_l_NewPage_0_1 = l_NewPage_0;
        l_l_NewPage_0_2 = l_NewPage_0;
        v115 = l_NewPage_0;
        local v121;
        v116, v117, v121 = v45:AddNewRow(l_NewPage_0, "Graphics Mode", "Selector", {
            "Automatic", 
            "Manual"
        }, l_l_NewPage_0_0);
        l_l_NewPage_0_1.GraphicsEnablerFrame = v116;
        l_l_NewPage_0_2.GraphicsEnablerLabel = v117;
        v115.GraphicsQualityEnabler = v121;
        l_NewPage_0.GraphicsEnablerFrame.LayoutOrder = v36.GraphicsEnablerFrame;
        l_l_NewPage_0_1 = nil;
        if not v59() then
            l_l_NewPage_0_2 = l_NewPage_0;
            v115 = l_NewPage_0;
            v116 = l_NewPage_0;
            local v122;
            v117, v121, v122 = v45:AddNewRow(l_NewPage_0, "Graphics Quality", "Slider", 10, 1);
            l_l_NewPage_0_2.GraphicsQualityFrame = v117;
            v115.GraphicsQualityLabel = v121;
            v116.GraphicsQualitySlider = v122;
        else
            l_l_NewPage_0_1 = v60:GetMaxQualityLevel() - 1;
            l_NewPage_0.mostRecentGraphicsQualityValue = l_l_NewPage_0_1;
            l_l_NewPage_0_2 = l_NewPage_0;
            v115 = l_NewPage_0;
            v116 = l_NewPage_0;
            local v123;
            v117, v121, v123 = v45:AddNewRow(l_NewPage_0, "Graphics Quality", "Slider", l_l_NewPage_0_1, 1);
            l_l_NewPage_0_2.GraphicsQualityFrame = v117;
            v115.GraphicsQualityLabel = v121;
            v116.GraphicsQualitySlider = v123;
        end;
        l_NewPage_0.GraphicsQualityFrame.LayoutOrder = v36.GraphicsQualityFrame;
        l_NewPage_0.GraphicsQualitySlider:SetMinStep(1);
        if not (not l_game_EngineFeature_1 or l_VRService_0.VREnabled) then
            l_l_NewPage_0_2 = table.clone(l_Constants_0.FramerateCaps);
            v115 = {
                l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.FramerateCapDefaultEntry", {
                    Frames = l_GameSettings_0:GetDefaultFramerateCap()
                })
            };
            for __, v125 in l_l_NewPage_0_2, nil, nil do
                table.insert(v115, l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.FramerateEntry", {
                    Frames = v125
                }));
            end;
            table.insert(l_l_NewPage_0_2, 1, -1);
            local l_v115_0 = v115 --[[ copy: 4 -> 16 ]];
            local l_l_l_NewPage_0_2_0 = l_l_NewPage_0_2 --[[ copy: 3 -> 17 ]];
            task.defer(function()
                local l_l_NewPage_0_3 = l_NewPage_0;
                local l_l_NewPage_0_4 = l_NewPage_0;
                local l_l_NewPage_0_5 = l_NewPage_0;
                local v131, v132, v133 = v45:AddNewRow(l_NewPage_0, l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate"), "DropDown", l_v115_0, table.find(l_l_l_NewPage_0_2_0, l_GameSettings_0.FramerateCap), nil, l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate.Description"));
                l_l_NewPage_0_3.FramerateCapFrame = v131;
                l_l_NewPage_0_4.FramerateCapLabel = v132;
                l_l_NewPage_0_5.FramerateCapMode = v133;
                l_NewPage_0.FramerateCapFrame.LayoutOrder = 12;
                l_NewPage_0.FramerateCapMode.IndexChanged:Connect(function(v134)
                    local l_FramerateCap_0 = l_GameSettings_0.FramerateCap;
                    l_GameSettings_0.FramerateCap = l_l_l_NewPage_0_2_0[v134];
                    if v79() then
                        v94("framerate_cap", l_FramerateCap_0, l_GameSettings_0.FramerateCap);
                    end;
                    v96();
                end);
            end);
        end;
        settings().Rendering.EnableFRM = true;
        SetGraphicsQuality = function(v136, v137)
            if v97 then
                local v138, v139 = v52.TemporaryOverride(v136);
                if v138 then
                    settings().Rendering.QualityLevel = v139;
                    return ;
                end;
            end;
            local v140 = math.floor((settings().Rendering:GetMaxQualityLevel() - 1) * (v136 / 10));
            if v140 == 20 then
                v140 = 21;
            elseif v136 == 1 then
                v140 = 1;
            elseif not (v136 < 1) or v137 then
                if settings().Rendering:GetMaxQualityLevel() < v140 then
                    v140 = settings().Rendering:GetMaxQualityLevel() - 1;
                end;
            else
                v136 = 1;
                v140 = 1;
            end;
            l_GameSettings_0.SavedQualityLevel = v136;
            settings().Rendering.QualityLevel = v140;
        end;
        l_l_NewPage_0_2 = function()
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
            SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
        end;
        v115 = function(v141)
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(2);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 2;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(true);
            if l_NewPage_0.GraphicsQualitySlider:GetValue() == v141 then
                SetGraphicsQuality(v141);
                return ;
            else
                l_NewPage_0.GraphicsQualitySlider:SetValue(v141);
                return ;
            end;
        end;
        v116 = function()
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
        end;
        v117 = function(v142)
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(2);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 2;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(true);
            if l_NewPage_0.GraphicsQualitySlider:GetValue() ~= v142 then
                l_NewPage_0.GraphicsQualitySlider:SetValue(v142);
            end;
        end;
        v121 = function()
            l_GameSettings_0.GraphicsQualityLevel = 0;
            v60.QualityLevel = 0;
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
        end;
        local function v146(v143)
            local v144 = math.clamp(v143, 1, l_l_NewPage_0_1);
            local l_GraphicsQualityLevel_0 = l_GameSettings_0.GraphicsQualityLevel;
            l_GameSettings_0.GraphicsQualityLevel = v144;
            v60.QualityLevel = v144;
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(2);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 2;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(true);
            if l_NewPage_0.GraphicsQualitySlider:GetValue() ~= v144 then
                l_NewPage_0.GraphicsQualitySlider:SetValue(v144);
            end;
            l_NewPage_0.mostRecentGraphicsQualityValue = v144;
            if v79() then
                v94("gfx_quality_level", l_GraphicsQualityLevel_0, v144);
            end;
            return v144, v144 - l_GraphicsQualityLevel_0;
        end;
        local __ = function()
            if l_game_FastInt_0 >= 0 then
                if l_game_FastInt_0 == 0 then
                    l_GameSettings_0.GraphicsQualityLevel = 0;
                    v60.QualityLevel = 0;
                    l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                    l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                    l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                    l_NewPage_0.mostRecentGraphicsQualityValue = l_l_NewPage_0_1;
                    return ;
                else
                    local v147 = math.clamp(l_game_FastInt_0, 1, l_l_NewPage_0_1);
                    local l_GraphicsQualityLevel_1 = l_GameSettings_0.GraphicsQualityLevel;
                    l_GameSettings_0.GraphicsQualityLevel = v147;
                    v60.QualityLevel = v147;
                    l_NewPage_0.GraphicsQualitySlider:SetZIndex(2);
                    l_NewPage_0.GraphicsQualityLabel.ZIndex = 2;
                    l_NewPage_0.GraphicsQualitySlider:SetInteractable(true);
                    if l_NewPage_0.GraphicsQualitySlider:GetValue() ~= v147 then
                        l_NewPage_0.GraphicsQualitySlider:SetValue(v147);
                    end;
                    l_NewPage_0.mostRecentGraphicsQualityValue = v147;
                    if v79() then
                        v94("gfx_quality_level", l_GraphicsQualityLevel_1, v147);
                    end;
                    local __ = v147 - l_GraphicsQualityLevel_1;
                    return ;
                end;
            elseif l_GameSettings_0.GraphicsQualityLevel == 0 then
                l_GameSettings_0.GraphicsQualityLevel = 0;
                v60.QualityLevel = 0;
                l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                l_NewPage_0.mostRecentGraphicsQualityValue = l_l_NewPage_0_1;
                return ;
            else
                local v150 = math.clamp(l_GameSettings_0.GraphicsQualityLevel, 1, l_l_NewPage_0_1);
                local l_GraphicsQualityLevel_2 = l_GameSettings_0.GraphicsQualityLevel;
                l_GameSettings_0.GraphicsQualityLevel = v150;
                v60.QualityLevel = v150;
                l_NewPage_0.GraphicsQualitySlider:SetZIndex(2);
                l_NewPage_0.GraphicsQualityLabel.ZIndex = 2;
                l_NewPage_0.GraphicsQualitySlider:SetInteractable(true);
                if l_NewPage_0.GraphicsQualitySlider:GetValue() ~= v150 then
                    l_NewPage_0.GraphicsQualitySlider:SetValue(v150);
                end;
                l_NewPage_0.mostRecentGraphicsQualityValue = v150;
                if v79() then
                    v94("gfx_quality_level", l_GraphicsQualityLevel_2, v150);
                end;
                local __ = v150 - l_GraphicsQualityLevel_2;
                return ;
            end;
        end;
        if not v59() then
            local v154 = false;
            do
                local l_v154_0 = v154;
                l_NewPage_0.GraphicsQualitySlider.ValueChanged:connect(function(v156)
                    SetGraphicsQuality(v156);
                    if l_v154_0 == true then
                        v96();
                    end;
                    l_v154_0 = true;
                end);
                l_NewPage_0.GraphicsQualityEnabler.IndexChanged:connect(function(v157)
                    if v157 == 1 then
                        l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                        l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                        l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                        SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
                    elseif v157 == 2 then
                        v115(l_NewPage_0.GraphicsQualitySlider:GetValue());
                    end;
                    v96();
                end);
                game.GraphicsQualityChangeRequest:Connect(function(v158)
                    if l_GameSettings_0.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
                        local l_Value_0 = l_NewPage_0.GraphicsQualitySlider:GetValue();
                        l_NewPage_0.GraphicsQualitySlider:SetValue(if not v158 then l_Value_0 - 1 else l_Value_0 + 1);
                    end;
                end);
                if l_game_FastInt_0 >= 0 then
                    if l_game_FastInt_0 == 0 then
                        l_NewPage_0.GraphicsQualityEnabler:SetSelectionIndex(1);
                        l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                        l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                        l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                        SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
                    else
                        l_NewPage_0.GraphicsQualityEnabler:SetSelectionIndex(2);
                        v115(l_game_FastInt_0);
                    end;
                elseif l_GameSettings_0.SavedQualityLevel == Enum.SavedQualitySetting.Automatic then
                    l_NewPage_0.GraphicsQualitySlider:SetValue(5);
                    l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                    l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                    l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                    SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
                else
                    local v160 = tostring(l_GameSettings_0.SavedQualityLevel);
                    v160 = not v29[v160] and 10 or v29[v160];
                    SetGraphicsQuality(v160);
                    do
                        local l_v160_0 = v160;
                        spawn(function()
                            l_NewPage_0.GraphicsQualitySlider:SetValue(l_v160_0);
                        end);
                    end;
                end;
            end;
        else
            l_NewPage_0.GraphicsQualitySlider.ValueChanged:connect(v146);
            l_NewPage_0.GraphicsQualityEnabler.IndexChanged:connect(function(v162)
                if v162 == 1 then
                    l_GameSettings_0.GraphicsQualityLevel = 0;
                    v60.QualityLevel = 0;
                    l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                    l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                    l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                elseif v162 == 2 then
                    local v163 = math.clamp(l_NewPage_0.mostRecentGraphicsQualityValue, 1, l_l_NewPage_0_1);
                    local l_GraphicsQualityLevel_3 = l_GameSettings_0.GraphicsQualityLevel;
                    l_GameSettings_0.GraphicsQualityLevel = v163;
                    v60.QualityLevel = v163;
                    l_NewPage_0.GraphicsQualitySlider:SetZIndex(2);
                    l_NewPage_0.GraphicsQualityLabel.ZIndex = 2;
                    l_NewPage_0.GraphicsQualitySlider:SetInteractable(true);
                    if l_NewPage_0.GraphicsQualitySlider:GetValue() ~= v163 then
                        l_NewPage_0.GraphicsQualitySlider:SetValue(v163);
                    end;
                    l_NewPage_0.mostRecentGraphicsQualityValue = v163;
                    if v79() then
                        v94("gfx_quality_level", l_GraphicsQualityLevel_3, v163);
                    end;
                    local __ = v163 - l_GraphicsQualityLevel_3;
                end;
                v96();
            end);
            local __ = function(v166, __)
                v61:Fire({
                    GroupName = "Graphics", 
                    Title = "Graphics Quality", 
                    Text = v166, 
                    DetailText = v166, 
                    Image = "", 
                    Duration = 2
                });
            end;
            local function v173(v169, v170)
                if v170 > 0 then
                    local v171 = l_RobloxTranslator_0:FormatByKey("NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Increased", {
                        RBX_NUMBER = tostring(v169)
                    });
                    v61:Fire({
                        GroupName = "Graphics", 
                        Title = "Graphics Quality", 
                        Text = v171, 
                        DetailText = v171, 
                        Image = "", 
                        Duration = 2
                    });
                    return ;
                else
                    if v170 < 0 then
                        local v172 = l_RobloxTranslator_0:FormatByKey("NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Decreased", {
                            RBX_NUMBER = tostring(v169)
                        });
                        v61:Fire({
                            GroupName = "Graphics", 
                            Title = "Graphics Quality", 
                            Text = v172, 
                            DetailText = v172, 
                            Image = "", 
                            Duration = 2
                        });
                    end;
                    return ;
                end;
            end;
            game.GraphicsQualityChangeRequest:Connect(function(v174)
                local l_GraphicsQualityLevel_4 = l_GameSettings_0.GraphicsQualityLevel;
                if l_GraphicsQualityLevel_4 ~= 0 then
                    local v176 = math.clamp(l_GraphicsQualityLevel_4 + (not v174 and -1 or 1), 1, l_l_NewPage_0_1);
                    local l_GraphicsQualityLevel_5 = l_GameSettings_0.GraphicsQualityLevel;
                    l_GameSettings_0.GraphicsQualityLevel = v176;
                    v60.QualityLevel = v176;
                    l_NewPage_0.GraphicsQualitySlider:SetZIndex(2);
                    l_NewPage_0.GraphicsQualityLabel.ZIndex = 2;
                    l_NewPage_0.GraphicsQualitySlider:SetInteractable(true);
                    if l_NewPage_0.GraphicsQualitySlider:GetValue() ~= v176 then
                        l_NewPage_0.GraphicsQualitySlider:SetValue(v176);
                    end;
                    l_NewPage_0.mostRecentGraphicsQualityValue = v176;
                    if v79() then
                        v94("gfx_quality_level", l_GraphicsQualityLevel_5, v176);
                    end;
                    v173(v176, v176 - l_GraphicsQualityLevel_5);
                end;
            end);
            if l_game_FastInt_0 >= 0 then
                if l_game_FastInt_0 == 0 then
                    l_GameSettings_0.GraphicsQualityLevel = 0;
                    v60.QualityLevel = 0;
                    l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                    l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                    l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                    l_NewPage_0.mostRecentGraphicsQualityValue = l_l_NewPage_0_1;
                else
                    local v178 = math.clamp(l_game_FastInt_0, 1, l_l_NewPage_0_1);
                    local l_GraphicsQualityLevel_6 = l_GameSettings_0.GraphicsQualityLevel;
                    l_GameSettings_0.GraphicsQualityLevel = v178;
                    v60.QualityLevel = v178;
                    l_NewPage_0.GraphicsQualitySlider:SetZIndex(2);
                    l_NewPage_0.GraphicsQualityLabel.ZIndex = 2;
                    l_NewPage_0.GraphicsQualitySlider:SetInteractable(true);
                    if l_NewPage_0.GraphicsQualitySlider:GetValue() ~= v178 then
                        l_NewPage_0.GraphicsQualitySlider:SetValue(v178);
                    end;
                    l_NewPage_0.mostRecentGraphicsQualityValue = v178;
                    if v79() then
                        v94("gfx_quality_level", l_GraphicsQualityLevel_6, v178);
                    end;
                    local __ = v178 - l_GraphicsQualityLevel_6;
                end;
            elseif l_GameSettings_0.GraphicsQualityLevel == 0 then
                l_GameSettings_0.GraphicsQualityLevel = 0;
                v60.QualityLevel = 0;
                l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                l_NewPage_0.mostRecentGraphicsQualityValue = l_l_NewPage_0_1;
            else
                local v181 = math.clamp(l_GameSettings_0.GraphicsQualityLevel, 1, l_l_NewPage_0_1);
                local l_GraphicsQualityLevel_7 = l_GameSettings_0.GraphicsQualityLevel;
                l_GameSettings_0.GraphicsQualityLevel = v181;
                v60.QualityLevel = v181;
                l_NewPage_0.GraphicsQualitySlider:SetZIndex(2);
                l_NewPage_0.GraphicsQualityLabel.ZIndex = 2;
                l_NewPage_0.GraphicsQualitySlider:SetInteractable(true);
                if l_NewPage_0.GraphicsQualitySlider:GetValue() ~= v181 then
                    l_NewPage_0.GraphicsQualitySlider:SetValue(v181);
                end;
                l_NewPage_0.mostRecentGraphicsQualityValue = v181;
                if v79() then
                    v94("gfx_quality_level", l_GraphicsQualityLevel_7, v181);
                end;
                local __ = v181 - l_GraphicsQualityLevel_7;
            end;
        end;
    end;
    local function v198()
        local v185 = 2;
        if l_GameSettings_0.ReducedMotion then
            v185 = 1;
        end;
        local v186 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.Heading.ReducedMotion");
        local v187 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.Description.ReducedMotion");
        local v188 = l_RobloxTranslator_0:FormatByKey("InGame.CommonUI.Label.On");
        local v189 = l_RobloxTranslator_0:FormatByKey("InGame.CommonUI.Label.Off");
        local l_l_NewPage_0_6 = l_NewPage_0;
        local l_l_NewPage_0_7 = l_NewPage_0;
        local l_l_NewPage_0_8 = l_NewPage_0;
        local v193, v194, v195 = v45:AddNewRow(l_NewPage_0, v186, "Selector", {
            v188, 
            v189
        }, v185, nil, v187);
        l_l_NewPage_0_6.ReducedMotionFrame = v193;
        l_l_NewPage_0_7.ReducedMotionLabel = v194;
        l_l_NewPage_0_8.ReducedMotionMode = v195;
        l_NewPage_0.ReducedMotionFrame.LayoutOrder = v36.ReducedMotionFrame;
        l_NewPage_0.ReducedMotionMode.IndexChanged:connect(function(v196)
            local l_ReducedMotion_0 = l_GameSettings_0.ReducedMotion;
            l_GameSettings_0.ReducedMotion = v196 == 1;
            if v79() then
                v94("reduced_motion", l_ReducedMotion_0, l_GameSettings_0.ReducedMotion);
            end;
            v96();
        end);
    end;
    local function v212()
        local v199 = 10 - math.clamp(math.floor(l_GameSettings_0.PreferredTransparency * 10 + 0.5), 0, 10);
        local v200 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.Heading.PreferredTransparency");
        local v201 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.Description.PreferredTransparency");
        local v202 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.PreferredTransparency.Transparent");
        local v203 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.PreferredTransparency.Opaque");
        local l_l_NewPage_0_9 = l_NewPage_0;
        local l_l_NewPage_0_10 = l_NewPage_0;
        local l_l_NewPage_0_11 = l_NewPage_0;
        local v207, v208, v209 = v45:AddNewRow(l_NewPage_0, v200, "Slider", 10, v199, nil, v201, v202, v203);
        l_l_NewPage_0_9.PreferredTransparencyFrame = v207;
        l_l_NewPage_0_10.PreferredTransparencyLabel = v208;
        l_l_NewPage_0_11.PreferredTransparencySlider = v209;
        l_NewPage_0.PreferredTransparencyFrame.LayoutOrder = v36.PreferredTransparencyFrame;
        l_NewPage_0.PreferredTransparencySlider.ValueChanged:connect(function(v210)
            v210 = (10 - math.clamp(math.floor(v210), 0, 10)) / 10;
            local l_PreferredTransparency_0 = l_GameSettings_0.PreferredTransparency;
            l_GameSettings_0.PreferredTransparency = v210;
            if v79() then
                v94("preferred_transparency", l_PreferredTransparency_0, l_GameSettings_0.PreferredTransparency);
            end;
            v96();
        end);
    end;
    local function v226()
        local v213 = 2;
        if l_GameSettings_0.UiNavigationKeyBindEnabled then
            v213 = 1;
        end;
        local v214 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.Heading.UiNavigationKeyBind");
        local v215 = l_RobloxTranslator_0:FormatByKey("Feature.Accessibility.Description.UiNavigationKeyBind", {
            uiNavigationKey = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.BackSlash)
        });
        local v216 = l_RobloxTranslator_0:FormatByKey("InGame.CommonUI.Label.On");
        local v217 = l_RobloxTranslator_0:FormatByKey("InGame.CommonUI.Label.Off");
        local l_l_NewPage_0_12 = l_NewPage_0;
        local l_l_NewPage_0_13 = l_NewPage_0;
        local l_l_NewPage_0_14 = l_NewPage_0;
        local v221, v222, v223 = v45:AddNewRow(l_NewPage_0, v214, "Selector", {
            v216, 
            v217
        }, v213, nil, v215);
        l_l_NewPage_0_12.UiNavigationKeyBindEnabledFrame = v221;
        l_l_NewPage_0_13.UiNavigationKeyBindEnabledLabel = v222;
        l_l_NewPage_0_14.UiNavigationKeyBindEnabledMode = v223;
        l_NewPage_0.UiNavigationKeyBindEnabledFrame.LayoutOrder = v36.UiNavigationKeyBindEnabledFrame;
        l_NewPage_0.UiNavigationKeyBindEnabledMode.IndexChanged:connect(function(v224)
            local l_UiNavigationKeyBindEnabled_0 = l_GameSettings_0.UiNavigationKeyBindEnabled;
            l_GameSettings_0.UiNavigationKeyBindEnabled = v224 == 1;
            if v79() then
                v94("ui_navigation_key_bind_enabled", l_UiNavigationKeyBindEnabled_0, l_GameSettings_0.UiNavigationKeyBindEnabled);
            end;
            v96();
        end);
    end;
    local function v238()
        local l_l_NewPage_0_15 = l_NewPage_0;
        local l_l_NewPage_0_16 = l_NewPage_0;
        local l_l_NewPage_0_17 = l_NewPage_0;
        local l_l_NewPage_0_18 = l_NewPage_0;
        local v231 = nil;
        local v232 = nil;
        local v233 = nil;
        local v234 = nil;
        l_l_NewPage_0_15.PerformanceStatsFrame = v231;
        l_l_NewPage_0_16.PerformanceStatsLabel = v232;
        l_l_NewPage_0_17.PerformanceStatsMode = v233;
        l_l_NewPage_0_18.PerformanceStatsOverrideText = v234;
        GetDesiredPerformanceStatsIndex = function()
            if not l_GameSettings_0.PerformanceStatsVisible then
                return 2;
            else
                return 1;
            end;
        end;
        l_l_NewPage_0_15 = GetDesiredPerformanceStatsIndex();
        l_l_NewPage_0_16 = l_NewPage_0;
        l_l_NewPage_0_17 = l_NewPage_0;
        l_l_NewPage_0_18 = l_NewPage_0;
        v231, v232, v233 = v45:AddNewRow(l_NewPage_0, "Performance Stats", "Selector", {
            "On", 
            "Off"
        }, l_l_NewPage_0_15);
        l_l_NewPage_0_16.PerformanceStatsFrame = v231;
        l_l_NewPage_0_17.PerformanceStatsLabel = v232;
        l_l_NewPage_0_18.PerformanceStatsMode = v233;
        l_NewPage_0.PerformanceStatsFrame.LayoutOrder = v36.PerformanceStatsFrame;
        l_NewPage_0.PerformanceStatsOverrideText = v45:Create("TextLabel")({
            Name = "PerformanceStatsLabel", 
            Text = "Set by Developer", 
            TextColor3 = Color3.new(1, 1, 1), 
            Font = v50.font(Enum.Font.SourceSans, "GameSettings"), 
            FontSize = v50.fontSize(Enum.FontSize.Size24, "GameSettings"), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 200, 1, 0), 
            Position = UDim2.new(1, -350, 0, 0), 
            Visible = false, 
            ZIndex = 2, 
            Parent = l_NewPage_0.PerformanceStatsFrame
        });
        l_NewPage_0.PerformanceStatsMode.IndexChanged:connect(function(v235)
            local v236 = nil;
            if v79() then
                v236 = l_GameSettings_0.PerformanceStatsVisible;
            end;
            if v235 == 1 then
                l_GameSettings_0.PerformanceStatsVisible = true;
            else
                l_GameSettings_0.PerformanceStatsVisible = false;
            end;
            if v79() then
                v94("show_performance_stats", v236, l_GameSettings_0.PerformanceStatsVisible);
            end;
            v96();
        end);
        l_GameSettings_0.PerformanceStatsVisibleChanged:connect(function()
            local v237 = GetDesiredPerformanceStatsIndex();
            if v237 ~= l_NewPage_0.PerformanceStatsMode.CurrentIndex then
                l_NewPage_0.PerformanceStatsMode:SetSelectionIndex(v237);
            end;
        end);
    end;
    local function v245()
        local l_l_NewPage_0_19 = l_NewPage_0;
        local l_l_NewPage_0_20 = l_NewPage_0;
        local l_l_NewPage_0_21 = l_NewPage_0;
        local v242, v243, v244 = v45:AddNewRow(l_NewPage_0, "MicroProfiler Information", "TextBox", nil, nil, 5);
        l_l_NewPage_0_19.InformationFrame = v242;
        l_l_NewPage_0_20.InformationLabel = v243;
        l_l_NewPage_0_21.InformationTextBox = v244;
        l_NewPage_0.InformationFrame.LayoutOrder = v36.InformationFrame;
        l_NewPage_0.InformationFrame.Position = UDim2.new(0.5, 0, 0.5, 0);
        l_NewPage_0.InformationText = v45:Create("TextLabel")({
            Name = "InformationLabel", 
            Text = "Information Loading", 
            Font = v50.font(Enum.Font.SourceSans), 
            FontSize = v50.fontSize(Enum.FontSize.Size14), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 800, 1, 0), 
            Position = UDim2.new(1, -650, 0, 20), 
            Visible = true, 
            ZIndex = 2, 
            Parent = l_NewPage_0.InformationFrame
        });
        return l_NewPage_0.InformationFrame, l_NewPage_0.InformationText;
    end;
    local function v274()
        local l_l_NewPage_0_22 = l_NewPage_0;
        local l_l_NewPage_0_23 = l_NewPage_0;
        local l_l_NewPage_0_24 = l_NewPage_0;
        local l_l_NewPage_0_25 = l_NewPage_0;
        local v250 = nil;
        local v251 = nil;
        local v252 = nil;
        local v253 = nil;
        l_l_NewPage_0_22.MicroProfilerFrame = v250;
        l_l_NewPage_0_23.MicroProfilerLabel = v251;
        l_l_NewPage_0_24.MicroProfilerMode = v252;
        l_l_NewPage_0_25.MicroProfilerOverrideText = v253;
        l_l_NewPage_0_22 = function()
            local l_MicroProfilerWebServerPort_0 = l_GameSettings_0.MicroProfilerWebServerPort;
            if l_MicroProfilerWebServerPort_0 ~= 0 then
                local l_l_NewPage_0_26 = l_NewPage_0;
                local l_l_NewPage_0_27 = l_NewPage_0;
                local v257, v258 = v245();
                l_l_NewPage_0_26.InformationFrame = v257;
                l_l_NewPage_0_27.InformationText = v258;
                l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. l_MicroProfilerWebServerPort_0;
                return true;
            else
                return false;
            end;
        end;
        l_l_NewPage_0_23 = function(v259)
            local function __()
                l_GameSettings_0.MicroProfilerWebServerEnabled = false;
                if not (not l_NewPage_0.InformationFrame and not l_NewPage_0.InformationText) then
                    l_NewPage_0.InformationFrame.Visible = false;
                    l_NewPage_0.InformationFrame.Parent = nil;
                    l_NewPage_0.InformationText.Parent = nil;
                    l_NewPage_0.InformationFrame = nil;
                    l_NewPage_0.InformationText = nil;
                end;
            end;
            local v261 = nil;
            local v262 = nil;
            local v263 = nil;
            if not v73 then
                if v72 then
                    if v79() then
                        v261 = "regular";
                        v262 = l_GameSettings_0.OnScreenProfilerEnabled;
                    end;
                    l_GameSettings_0.OnScreenProfilerEnabled = v259 == 1;
                    if v79() then
                        v263 = l_GameSettings_0.OnScreenProfilerEnabled;
                    end;
                end;
            else
                if v79() then
                    v261 = "webserver";
                    v262 = l_GameSettings_0.MicroProfilerWebServerEnabled;
                end;
                if v259 == 1 then
                    l_GameSettings_0.MicroProfilerWebServerEnabled = true;
                    local v264 = 30;
                    while v264 >= 1 do
                        local l_MicroProfilerWebServerPort_1 = l_GameSettings_0.MicroProfilerWebServerPort;
                        local v266;
                        if l_MicroProfilerWebServerPort_1 ~= 0 then
                            local l_l_NewPage_0_28 = l_NewPage_0;
                            local l_l_NewPage_0_29 = l_NewPage_0;
                            local v269, v270 = v245();
                            l_l_NewPage_0_28.InformationFrame = v269;
                            l_l_NewPage_0_29.InformationText = v270;
                            l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. l_MicroProfilerWebServerPort_1;
                            v266 = true;
                        else
                            v266 = false;
                        end;
                        if not v266 then
                            v264 = v264 - 1;
                            wait(0.1);
                        else
                            break;
                        end;
                    end;
                    if v264 <= 0 then
                        l_NewPage_0.MicroProfilerMode:SetSelectionIndex(2);
                        l_GameSettings_0.MicroProfilerWebServerEnabled = false;
                        if not (not l_NewPage_0.InformationFrame and not l_NewPage_0.InformationText) then
                            l_NewPage_0.InformationFrame.Visible = false;
                            l_NewPage_0.InformationFrame.Parent = nil;
                            l_NewPage_0.InformationText.Parent = nil;
                            l_NewPage_0.InformationFrame = nil;
                            l_NewPage_0.InformationText = nil;
                        end;
                    end;
                else
                    l_GameSettings_0.MicroProfilerWebServerEnabled = false;
                    if not (not l_NewPage_0.InformationFrame and not l_NewPage_0.InformationText) then
                        l_NewPage_0.InformationFrame.Visible = false;
                        l_NewPage_0.InformationFrame.Parent = nil;
                        l_NewPage_0.InformationText.Parent = nil;
                        l_NewPage_0.InformationFrame = nil;
                        l_NewPage_0.InformationText = nil;
                    end;
                end;
                if v79() then
                    v263 = l_GameSettings_0.MicroProfilerWebServerEnabled;
                end;
            end;
            l_RbxAnalyticsService_0:ReportCounter("MicroprofilerSettingsPressed");
            if v79() then
                v94("microprofiler_enabled", v262, v263, {
                    microprofiler_type = v261
                });
            end;
            v96();
        end;
        l_l_NewPage_0_24 = function()
            if not v73 then
                if not v72 then
                    return 2;
                elseif not l_GameSettings_0.OnScreenProfilerEnabled then
                    return 2;
                else
                    return 1;
                end;
            elseif not l_GameSettings_0.MicroProfilerWebServerEnabled then
                return 2;
            else
                return 1;
            end;
        end;
        l_l_NewPage_0_25 = if not v73 then if v72 then l_GameSettings_0.OnScreenProfilerEnabled and 1 or 2 else 2 else l_GameSettings_0.MicroProfilerWebServerEnabled and 1 or 2;
        v250 = l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.MicroProfiler");
        v251 = l_NewPage_0;
        v252 = l_NewPage_0;
        v253 = l_NewPage_0;
        local v271, v272, v273 = v45:AddNewRow(l_NewPage_0, v250, "Selector", {
            "On", 
            "Off"
        }, l_l_NewPage_0_25);
        v251.MicroProfilerFrame = v271;
        v252.MicroProfilerLabel = v272;
        v253.MicroProfilerMode = v273;
        l_NewPage_0.MicroProfilerFrame.LayoutOrder = v36.MicroProfilerFrame;
        v251 = l_GameSettings_0.MicroProfilerWebServerPort;
        if v251 ~= 0 then
            v252 = l_NewPage_0;
            v253 = l_NewPage_0;
            v271, v272 = v245();
            v252.InformationFrame = v271;
            v253.InformationText = v272;
            l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. v251;
        end;
        v251 = false;
        l_GameSettings_0:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function()
            v251 = true;
            if not l_GameSettings_0.OnScreenProfilerEnabled then
                l_NewPage_0.MicroProfilerMode:SetSelectionIndex(2);
                return ;
            else
                l_NewPage_0.MicroProfilerMode:SetSelectionIndex(1);
                return ;
            end;
        end);
        l_NewPage_0.MicroProfilerMode.IndexChanged:connect(function(...)
            if not v251 then
                l_l_NewPage_0_23(...);
                return ;
            else
                v251 = false;
                return ;
            end;
        end);
    end;
    local function v396(v275)
        if not (not l_UserInputService_0.MouseEnabled or v53) then
            local l_l_NewPage_0_30 = l_NewPage_0;
            local l_l_NewPage_0_31 = l_NewPage_0;
            local l_l_NewPage_0_32 = l_NewPage_0;
            local l_l_NewPage_0_33 = l_NewPage_0;
            local v280 = nil;
            local v281 = nil;
            local v282 = nil;
            local v283 = nil;
            l_l_NewPage_0_30.ShiftLockFrame = v280;
            l_l_NewPage_0_31.ShiftLockLabel = v281;
            l_l_NewPage_0_32.ShiftLockMode = v282;
            l_l_NewPage_0_33.ShiftLockOverrideText = v283;
            if not (not l_UserInputService_0.MouseEnabled or not l_UserInputService_0.KeyboardEnabled) then
                l_l_NewPage_0_30 = 2;
                if l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch then
                    l_l_NewPage_0_30 = 1;
                end;
                l_l_NewPage_0_31 = l_NewPage_0;
                l_l_NewPage_0_32 = l_NewPage_0;
                l_l_NewPage_0_33 = l_NewPage_0;
                v280, v281, v282 = v45:AddNewRow(l_NewPage_0, "Shift Lock Switch", "Selector", {
                    "On", 
                    "Off"
                }, l_l_NewPage_0_30);
                l_l_NewPage_0_31.ShiftLockFrame = v280;
                l_l_NewPage_0_32.ShiftLockLabel = v281;
                l_l_NewPage_0_33.ShiftLockMode = v282;
                l_NewPage_0.ShiftLockFrame.LayoutOrder = v36.ShiftLockFrame;
                v100[l_NewPage_0.ShiftLockFrame] = true;
                l_NewPage_0.ShiftLockOverrideText = v45:Create("TextLabel")({
                    Name = "ShiftLockOverrideLabel", 
                    Text = "Set by Developer", 
                    TextColor3 = Color3.new(1, 1, 1), 
                    Font = v50.font(Enum.Font.SourceSans, "GameSettings"), 
                    FontSize = v50.fontSize(Enum.FontSize.Size24, "GameSettings"), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 200, 1, 0), 
                    Position = UDim2.new(1, -350, 0, 0), 
                    Visible = false, 
                    ZIndex = 2, 
                    Parent = l_NewPage_0.ShiftLockFrame
                });
                l_NewPage_0.ShiftLockMode.IndexChanged:connect(function(v284)
                    local v285 = nil;
                    if v79() then
                        v285 = l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch;
                    end;
                    if v284 == 1 then
                        l_GameSettings_0.ControlMode = Enum.ControlMode.MouseLockSwitch;
                    else
                        l_GameSettings_0.ControlMode = Enum.ControlMode.Classic;
                    end;
                    if v79() then
                        v94("shift_lock_enabled", v285, l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch);
                    end;
                    v96();
                end);
            end;
        end;
        cameraModeIsUserChoice = function()
            if not l_UserInputService_0.TouchEnabled then
                return l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice;
            else
                return l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice;
            end;
        end;
        setCameraModeVisible = function(v286)
            if l_NewPage_0.CameraMode then
                l_NewPage_0.CameraMode.SelectorFrame.Visible = v286;
                l_NewPage_0.CameraMode:SetInteractable(v286);
                l_NewPage_0.CameraModeOverrideText.Visible = not v286;
            end;
        end;
        local v287 = v47.waitForChildOfClass(l_LocalPlayer_0, "PlayerScripts");
        local v288 = {};
        local v289 = {};
        do
            local l_v288_0, l_v289_0 = v288, v289;
            local function v296(v292)
                local v293 = nil;
                if not pcall(function()
                    v293 = l_v289_0[l_v288_0[v292]];
                end) or v293 == nil then
                    return false;
                else
                    local v294 = nil;
                    local v295 = nil;
                    if not l_UserInputService_0.TouchEnabled then
                        if v79() then
                            v295 = l_GameSettings_0.ComputerCameraMovementMode.Value;
                        end;
                        v294 = l_GameSettings_0.ComputerCameraMovementMode.Value ~= v293;
                        l_GameSettings_0.ComputerCameraMovementMode = v293;
                    else
                        if v79() then
                            v295 = l_GameSettings_0.TouchCameraMovementMode.Value;
                        end;
                        v294 = l_GameSettings_0.TouchCameraMovementMode.Value ~= v293;
                        l_GameSettings_0.TouchCameraMovementMode = v293;
                    end;
                    if not (not v79() or not v294) then
                        v94("camera_mode", v295, v293);
                    end;
                    return v294;
                end;
            end;
            local l_v287_0 = v287 --[[ copy: 1 -> 18 ]];
            local l_v296_0 = v296 --[[ copy: 4 -> 19 ]];
            local function v306()
                local v299 = {};
                if l_v287_0 then
                    v299 = if not l_UserInputService_0.TouchEnabled then l_v287_0:GetRegisteredComputerCameraMovementModes() else l_v287_0:GetRegisteredTouchCameraMovementModes();
                end;
                l_v288_0 = {};
                l_v289_0 = {};
                if #v299 <= 0 then
                    setCameraModeVisible(false);
                    return ;
                else
                    if not l_GetFFlagGameSettingsCameraModeFixEnabled_0() then
                        setCameraModeVisible(true);
                    else
                        setCameraModeVisible(cameraModeIsUserChoice());
                    end;
                    for v300 = 1, #v299 do
                        local v301 = v299[v300];
                        local l_Name_0 = v301.Name;
                        if l_Name_0 == "Default" then
                            l_Name_0 = v32;
                        end;
                        l_v288_0[#l_v288_0 + 1] = l_Name_0;
                        l_v289_0[l_Name_0] = v301.Value;
                    end;
                    if l_NewPage_0.CameraMode then
                        l_NewPage_0.CameraMode:UpdateOptions(l_v288_0);
                    end;
                    local v303 = -1;
                    v303 = if not l_UserInputService_0.TouchEnabled then l_GameSettings_0.ComputerCameraMovementMode.Value else l_GameSettings_0.TouchCameraMovementMode.Value;
                    if v303 > -1 then
                        v303 = v303 + 1;
                        local v304 = nil;
                        do
                            local l_v304_0 = v304;
                            if not (not pcall(function()
                                l_v304_0 = v299[v303];
                            end) or not l_v304_0) then
                                l_v296_0(l_v304_0.Value + 1);
                                l_NewPage_0.CameraMode:SetSelectionIndex(l_v304_0.Value + 1);
                            end;
                        end;
                    end;
                    return ;
                end;
            end;
            local l_l_NewPage_0_34 = l_NewPage_0;
            local l_l_NewPage_0_35 = l_NewPage_0;
            local l_l_NewPage_0_36 = l_NewPage_0;
            local v310, v311, v312 = v45:AddNewRow(l_NewPage_0, "Camera Mode", "Selector", l_v288_0, 1);
            l_l_NewPage_0_34.CameraModeFrame = v310;
            l_l_NewPage_0_35.CameraModeLabel = v311;
            l_l_NewPage_0_36.CameraMode = v312;
            l_NewPage_0.CameraModeFrame.LayoutOrder = v36.CameraModeFrame;
            v100[l_NewPage_0.CameraMode] = true;
            l_NewPage_0.CameraModeOverrideText = v45:Create("TextLabel")({
                Name = "CameraDevOverrideLabel", 
                Text = "Set by Developer", 
                TextColor3 = Color3.new(1, 1, 1), 
                Font = v50.font(Enum.Font.SourceSans, "GameSettings"), 
                FontSize = v50.fontSize(Enum.FontSize.Size24, "GameSettings"), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.6, 0, 1, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Visible = false, 
                ZIndex = 2, 
                Parent = l_NewPage_0.CameraModeFrame
            });
            if v287 then
                local l_v306_0 = v306 --[[ copy: 5 -> 20 ]];
                v287.TouchCameraMovementModeRegistered:connect(function(__)
                    if l_UserInputService_0.TouchEnabled then
                        l_v306_0();
                    end;
                end);
                v287.ComputerCameraMovementModeRegistered:connect(function(__)
                    if l_UserInputService_0.MouseEnabled then
                        l_v306_0();
                    end;
                end);
            end;
            l_l_NewPage_0_34 = false;
            local l_v296_1 = v296 --[[ copy: 4 -> 21 ]];
            l_NewPage_0.CameraMode.IndexChanged:connect(function(v317)
                if l_v296_1(v317) then
                    if l_l_NewPage_0_34 then
                        v96();
                    end;
                    l_l_NewPage_0_34 = true;
                end;
            end);
            v306();
        end;
        v287 = false;
        v288 = function()
            if not v287 then
                v287 = true;
                local v318 = nil;
                v318 = if not l_GameSettings_0.VREnabled then {
                    "On (restart pending)", 
                    "Off"
                } else {
                    "On", 
                    "Off (restart pending)"
                };
                local l_l_NewPage_0_37 = l_NewPage_0;
                local l_l_NewPage_0_38 = l_NewPage_0;
                local l_l_NewPage_0_39 = l_NewPage_0;
                local v322, v323, v324 = v45:AddNewRow(l_NewPage_0, "VR", "Selector", v318, not l_GameSettings_0.VREnabled and 2 or 1);
                l_l_NewPage_0_37.VREnabledFrame = v322;
                l_l_NewPage_0_38.VREnabledLabel = v323;
                l_l_NewPage_0_39.VREnabledSelector = v324;
                l_NewPage_0.VREnabledFrame.LayoutOrder = v36.VREnabledFrame;
                l_NewPage_0.VREnabledSelector.IndexChanged:connect(function(v325)
                    local v326 = v325 == 1;
                    if l_GameSettings_0.VREnabled ~= v326 then
                        l_GameSettings_0.VREnabled = v326;
                    end;
                end);
            end;
        end;
        v289 = function()
            if not l_VRService_0.VREnabled then
                if l_GameSettings_0.HasEverUsedVR then
                    v288();
                end;
                return ;
            else
                l_GameSettings_0.HasEverUsedVR = true;
                v288();
                return ;
            end;
        end;
        if not v28() or not l_getAppFeaturePolicies_0().getIsLinkedVRModeAvailable() then
            if not l_VRService_0.VREnabled then
                if l_GameSettings_0.HasEverUsedVR then
                    v288();
                end;
            else
                l_GameSettings_0.HasEverUsedVR = true;
                v288();
            end;
            l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v289);
        else
            v288();
        end;
        local function v341()
            local v327 = not l_TextChatService_0.ChatTranslationEnabled and 2 or 1;
            local l_l_NewPage_0_40 = l_NewPage_0;
            local l_l_NewPage_0_41 = l_NewPage_0;
            local l_l_NewPage_0_42 = l_NewPage_0;
            local v331, v332, v333 = v45:AddNewRow(l_NewPage_0, "Automatic Chat Translation", "Selector", {
                "On", 
                "Off"
            }, v327);
            l_l_NewPage_0_40.ChatTranslationFrame = v331;
            l_l_NewPage_0_41.ChatTranslationLabel = v332;
            l_l_NewPage_0_42.ChatTranslationEnabler = v333;
            l_NewPage_0.ChatTranslationFrame.LayoutOrder = v36.ChatTranslationFrame;
            l_NewPage_0.ChatTranslationEnabler.IndexChanged:connect(function(v334)
                local v335 = v334 == 1;
                local l_ChatTranslationEnabled_0 = l_TextChatService_0.ChatTranslationEnabled;
                if v335 ~= l_ChatTranslationEnabled_0 then
                    if not l_game_EngineFeature_0 then
                        l_TextChatService_0.ChatTranslationEnabled = v335;
                    else
                        l_GameSettings_0.ChatTranslationEnabled = v335;
                    end;
                    v94("chat_translation", l_ChatTranslationEnabled_0, v335, {
                        locale_id = l_LocalPlayer_0.LocaleId
                    });
                end;
            end);
            l_l_NewPage_0_40 = not l_TextChatService_0.ChatTranslationToggleEnabled and 2 or 1;
            l_l_NewPage_0_41 = l_NewPage_0;
            l_l_NewPage_0_42 = l_NewPage_0;
            v331 = l_NewPage_0;
            local v337;
            v332, v333, v337 = v45:AddNewRow(l_NewPage_0, "Option to View Untranslated Message", "Selector", {
                "On", 
                "Off"
            }, l_l_NewPage_0_40);
            l_l_NewPage_0_41.ChatTranslationToggleFrame = v332;
            l_l_NewPage_0_42.ChatTranslationToggleLabel = v333;
            v331.ChatTranslationToggleEnabler = v337;
            l_NewPage_0.ChatTranslationToggleFrame.LayoutOrder = v36.ChatTranslationToggleFrame;
            l_NewPage_0.ChatTranslationToggleEnabler.IndexChanged:connect(function(v338)
                local v339 = v338 == 1;
                local l_ChatTranslationToggleEnabled_0 = l_TextChatService_0.ChatTranslationToggleEnabled;
                if v339 ~= l_ChatTranslationToggleEnabled_0 then
                    if not l_game_EngineFeature_0 then
                        l_TextChatService_0.ChatTranslationToggleEnabled = v339;
                    else
                        l_GameSettings_0.ChatTranslationToggleEnabled = v339;
                    end;
                    v94("chat_translation_toggle", l_ChatTranslationToggleEnabled_0, v339, {
                        locale_id = l_LocalPlayer_0.LocaleId
                    });
                end;
            end);
        end;
        local function v346(v342)
            local v343 = {
                ChatTranslationEnabled = false, 
                ChatTranslationToggleEnabled = false
            };
            if not v342 or v342 == "" then
                return v343;
            elseif v342 == "override" then
                v343.ChatTranslationEnabled = true;
                return v343;
            else
                local l_status_1, l_result_1 = pcall(function()
                    return v37:GetLayerData(v342);
                end);
                if l_status_1 then
                    v343.ChatTranslationEnabled = l_result_1.chatTranslationEnabled or false;
                    v343.ChatTranslationToggleEnabled = l_result_1.chatTranslationToggleEnabled or false;
                end;
                return v343;
            end;
        end;
        local __ = function(v347)
            if not l_game_EngineFeature_0 then
                local l_status_2, __ = pcall(function()
                    l_TextChatService_0.ChatTranslationEnabled = v347.ChatTranslationEnabled;
                    l_TextChatService_0.ChatTranslationToggleEnabled = v347.ChatTranslationToggleEnabled;
                end);
                return l_status_2;
            else
                l_GameSettings_0.ChatTranslationEnabled = v347.ChatTranslationEnabled;
                l_GameSettings_0.ChatTranslationToggleEnabled = v347.ChatTranslationToggleEnabled;
                return true;
            end;
        end;
        if not ((not game:GetEngineFeature("EnableTCSChatTranslation") or game:GetEngineFeature("EnableTCSChatTranslationLanguageSwitcher")) or not v38()) then
            if not v40() then
                local v351 = v346((v39()));
                local v352;
                if not l_game_EngineFeature_0 then
                    local l_v351_0 = v351 --[[ copy: 8 -> 22 ]];
                    local l_status_3, __ = pcall(function()
                        l_TextChatService_0.ChatTranslationEnabled = l_v351_0.ChatTranslationEnabled;
                        l_TextChatService_0.ChatTranslationToggleEnabled = l_v351_0.ChatTranslationToggleEnabled;
                    end);
                    v352 = l_status_3;
                else
                    l_GameSettings_0.ChatTranslationEnabled = v351.ChatTranslationEnabled;
                    l_GameSettings_0.ChatTranslationToggleEnabled = v351.ChatTranslationToggleEnabled;
                    v352 = true;
                end;
                if not (not v352 or not v351.ChatTranslationEnabled) then
                    v341();
                end;
            else
                if not (not v41() or v346((v39())).ChatTranslationEnabled) then
                    if not l_game_EngineFeature_0 then
                        pcall(function()
                            l_TextChatService_0.ChatTranslationEnabled = false;
                        end);
                    else
                        l_GameSettings_0.ChatTranslationEnabled = false;
                    end;
                end;
                v341();
            end;
        end;
        local v356 = {};
        setMovementModeVisible = function(v357)
            if l_NewPage_0.MovementMode then
                local v358 = v357 and #v356 > 0;
                l_NewPage_0.MovementMode.SelectorFrame.Visible = v358;
                l_NewPage_0.MovementMode:SetInteractable(v358);
                l_NewPage_0.MovementModeOverrideText.Visible = not v358;
            end;
        end;
        if v275 then
            local v359 = {};
            local v360 = {};
            local v361 = v47.waitForChildOfClass(l_LocalPlayer_0, "PlayerScripts");
            local function __(v362)
                local l_v362_0 = v362;
                if v362 == "Default" then
                    return v34;
                elseif v362 == "KeyboardMouse" then
                    return "Keyboard + Mouse";
                elseif v362 == "ClickToMove" then
                    return v35;
                elseif v362 == "DynamicThumbstick" then
                    return "Dynamic Thumbstick";
                else
                    if v362 == "Thumbstick" then
                        l_v362_0 = "Classic Thumbstick";
                    end;
                    return l_v362_0;
                end;
            end;
            local l_l_NewPage_0_43 = l_NewPage_0;
            local l_l_NewPage_0_44 = l_NewPage_0;
            local l_l_NewPage_0_45 = l_NewPage_0;
            local v368, v369, v370 = v45:AddNewRow(l_NewPage_0, "Movement Mode", "Selector", v359, 1);
            l_l_NewPage_0_43.MovementModeFrame = v368;
            l_l_NewPage_0_44.MovementModeLabel = v369;
            l_l_NewPage_0_45.MovementMode = v370;
            l_NewPage_0.MovementModeFrame.LayoutOrder = v36.MovementModeFrame;
            v100[l_NewPage_0.MovementMode] = true;
            l_NewPage_0.MovementModeOverrideText = v45:Create("TextLabel")({
                Name = "MovementDevOverrideLabel", 
                Text = "Set by Developer", 
                TextColor3 = Color3.new(1, 1, 1), 
                Font = v50.font(Enum.Font.SourceSans, "GameSettings"), 
                FontSize = v50.fontSize(Enum.FontSize.Size24, "GameSettings"), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.6, 0, 1, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Visible = false, 
                ZIndex = 2, 
                Parent = l_NewPage_0.MovementModeFrame
            });
            do
                local l_v359_0, l_v360_0 = v359, v360;
                l_l_NewPage_0_43 = function(v373)
                    local v374 = nil;
                    if not pcall(function()
                        v374 = l_v360_0[l_v359_0[v373]];
                    end) or v374 == nil then
                        return ;
                    else
                        local v375 = nil;
                        if not l_UserInputService_0.TouchEnabled then
                            if v79() then
                                v375 = l_GameSettings_0.ComputerMovementMode;
                            end;
                            l_GameSettings_0.ComputerMovementMode = v374;
                        else
                            if v79() then
                                v375 = l_GameSettings_0.TouchMovementMode;
                            end;
                            l_GameSettings_0.TouchMovementMode = v374;
                        end;
                        if v79() then
                            v94("movement_mode", v375, v374);
                        end;
                        return ;
                    end;
                end;
                l_l_NewPage_0_44 = function()
                    if v361 then
                        if not l_UserInputService_0.TouchEnabled then
                            v356 = v361:GetRegisteredComputerMovementModes();
                        else
                            v356 = v361:GetRegisteredTouchMovementModes();
                        end;
                    end;
                    l_v359_0 = {};
                    l_v360_0 = {};
                    if #v356 <= 0 then
                        setMovementModeVisible(false);
                        return ;
                    else
                        setMovementModeVisible(true);
                        for v376 = 1, #v356 do
                            local v377 = v356[v376];
                            local l_Name_1 = v377.Name;
                            local l_l_Name_1_0 = l_Name_1;
                            if l_Name_1 == "Default" then
                                l_l_Name_1_0 = v34;
                            elseif l_Name_1 == "KeyboardMouse" then
                                l_l_Name_1_0 = "Keyboard + Mouse";
                            elseif l_Name_1 == "ClickToMove" then
                                l_l_Name_1_0 = v35;
                            elseif l_Name_1 == "DynamicThumbstick" then
                                l_l_Name_1_0 = "Dynamic Thumbstick";
                            elseif l_Name_1 == "Thumbstick" then
                                l_l_Name_1_0 = "Classic Thumbstick";
                            end;
                            local l_l_l_Name_1_0_0 = l_l_Name_1_0;
                            l_v359_0[#l_v359_0 + 1] = l_l_l_Name_1_0_0;
                            l_v360_0[l_l_l_Name_1_0_0] = v377;
                        end;
                        if l_NewPage_0.MovementMode then
                            l_NewPage_0.MovementMode:UpdateOptions(l_v359_0);
                        end;
                        local v381 = -1;
                        v381 = if not l_UserInputService_0.TouchEnabled then l_GameSettings_0.ComputerMovementMode.Value else l_GameSettings_0.TouchMovementMode.Value;
                        if v381 > -1 then
                            v381 = v381 + 1;
                            local v382 = nil;
                            do
                                local l_v382_0 = v382;
                                if not (not pcall(function()
                                    l_v382_0 = l_v360_0[l_v359_0[v381]];
                                end) or not l_v382_0) then
                                    l_l_NewPage_0_43(l_v382_0.Value + 1);
                                    l_NewPage_0.MovementMode:SetSelectionIndex(l_v382_0.Value + 1);
                                end;
                            end;
                        end;
                        return ;
                    end;
                end;
                l_l_NewPage_0_44();
                if v361 then
                    v361.TouchMovementModeRegistered:connect(function(__)
                        if l_UserInputService_0.TouchEnabled then
                            l_l_NewPage_0_44();
                        end;
                    end);
                    v361.ComputerMovementModeRegistered:connect(function(__)
                        if l_UserInputService_0.MouseEnabled then
                            l_l_NewPage_0_44();
                        end;
                    end);
                end;
                l_NewPage_0.MovementMode.IndexChanged:connect(function(v386)
                    l_l_NewPage_0_43(v386);
                    v96();
                end);
            end;
        end;
        setShiftLockVisible = function(v387)
            if l_NewPage_0.ShiftLockMode then
                l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v387;
                l_NewPage_0.ShiftLockMode:SetInteractable(v387);
            end;
        end;
        local v388 = false;
        if if not l_UserInputService_0.TouchEnabled then l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice else l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
            l_NewPage_0.CameraModeOverrideText.Visible = false;
            setCameraModeVisible(true);
        else
            l_NewPage_0.CameraModeOverrideText.Visible = true;
            setCameraModeVisible(false);
        end;
        local v389 = false;
        v389 = if not l_UserInputService_0.TouchEnabled then l_LocalPlayer_0.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice else l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice;
        if l_NewPage_0.MovementModeOverrideText then
            if v389 then
                l_NewPage_0.MovementModeOverrideText.Visible = false;
                setMovementModeVisible(true);
            else
                l_NewPage_0.MovementModeOverrideText.Visible = true;
                setMovementModeVisible(false);
            end;
        end;
        if l_NewPage_0.ShiftLockOverrideText then
            l_NewPage_0.ShiftLockOverrideText.Visible = not l_LocalPlayer_0.DevEnableMouseLock;
            setShiftLockVisible(l_LocalPlayer_0.DevEnableMouseLock);
        end;
        v388 = function(v390)
            if l_NewPage_0.ShiftLockOverrideText and v390 == "DevEnableMouseLock" then
                l_NewPage_0.ShiftLockOverrideText.Visible = not l_LocalPlayer_0.DevEnableMouseLock;
                setShiftLockVisible(l_LocalPlayer_0.DevEnableMouseLock);
                return ;
            elseif v390 == "DevComputerCameraMode" then
                local v391 = l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice;
                setCameraModeVisible(v391);
                l_NewPage_0.CameraModeOverrideText.Visible = not v391;
                return ;
            else
                if v390 == "DevComputerMovementMode" then
                    local v392 = l_LocalPlayer_0.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice;
                    setMovementModeVisible(v392);
                    if l_NewPage_0.MovementModeOverrideText then
                        l_NewPage_0.MovementModeOverrideText.Visible = not v392;
                        return ;
                    end;
                elseif v390 == "DevTouchMovementMode" then
                    local v393 = l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice;
                    setMovementModeVisible(v393);
                    if l_NewPage_0.MovementModeOverrideText then
                        l_NewPage_0.MovementModeOverrideText.Visible = not v393;
                        return ;
                    end;
                elseif v390 == "DevTouchCameraMode" then
                    local v394 = l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice;
                    setCameraModeVisible(v394);
                    l_NewPage_0.CameraModeOverrideText.Visible = not v394;
                end;
                return ;
            end;
        end;
        l_LocalPlayer_0.Changed:connect(function(v395)
            if not (not l_UserInputService_0.TouchEnabled or not v31[v395]) then
                v388(v395);
            end;
            if not (not l_UserInputService_0.KeyboardEnabled or not v30[v395]) then
                v388(v395);
            end;
        end);
    end;
    local function v417()
        local v397 = v16.ROLES_URL .. "v1/users/authenticated/roles";
        local v398 = l_HttpService_0:RequestInternal({
            Url = v397, 
            Method = "GET"
        });
        local function v407(v399)
            if v399 then
                if (v87 or not game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled")) or l_NewPage_0.FeedbackEntryPointEnabled then
                    local function v400()
                        if (not v87 or not game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled")) or l_NewPage_0.FeedbackEntryPointEnabled then
                            l_NewPage_0.HubRef:PopMenu(false, true);
                            if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
                                l_SafetyService_0.IsCaptureModeForReport = false;
                            end;
                            if v20 ~= nil then
                                v20:ToggleCaptureMode();
                            end;
                            return ;
                        else
                            return ;
                        end;
                    end;
                    local v401 = nil;
                    local v402 = nil;
                    if not v86 then
                        local v403, v404 = v45:MakeStyledButton("toggleFeedbackModeButton", "Give Feedback", UDim2.new(0, 300, 1, -20), v400, l_NewPage_0);
                        v401 = v403;
                        v402 = v404;
                        v401.Position = UDim2.new(1, -400, 0, 12);
                    else
                        local v405, v406 = v45:MakeStyledButton("toggleFeedbackModeButton", "Give Feedback", UDim2.new(1, 0, 1, -20), v400, l_NewPage_0);
                        v401 = v405;
                        v402 = v406;
                        v401.Size = UDim2.new(0.6, 0, 1, -20);
                        v401.Position = UDim2.new(0.4, 0, 0, 12);
                    end;
                    v401.ZIndex = 2;
                    v401.Selectable = true;
                    v402.ZIndex = 2;
                    if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
                        l_NewPage_0.toggleFeedbackModeButton = v401;
                        l_NewPage_0.toggleFeedbackModeText = v402;
                    end;
                    if not v86 then
                        v45:AddNewRowObject(l_NewPage_0, "Give Translation Feedback", v401).LayoutOrder = v36.FeedbackModeButton;
                    else
                        v45:AddNewRowObject(l_NewPage_0, "Give Translation Feedback", v401, nil, true).LayoutOrder = v36.FeedbackModeButton;
                        return ;
                    end;
                else
                    return ;
                end;
            end;
        end;
        if not v82 then
            v398:Start(function(v408, v409)
                local v410 = false;
                local v411 = false;
                local v412 = nil;
                if v408 then
                    if v409.StatusCode == 401 then
                        v412 = "Roles Api Request: Unauthorized";
                    elseif not (v409.StatusCode >= 200) or v409.StatusCode >= 400 then
                        v412 = "Roles Api Status code: " .. v409.StatusCode;
                    else
                        local l_status_4, l_result_4 = pcall(function()
                            for __, v414 in pairs(l_HttpService_0:JSONDecode(v409.Body).roles) do
                                if v414 == "Soothsayer" then
                                    v410 = true;
                                end;
                            end;
                        end);
                        v411 = l_status_4;
                        v412 = l_result_4;
                    end;
                else
                    v412 = "Roles Api Request: Connection error";
                end;
                if not v411 then
                    v66:warning("Feedback Mode initialization api call failed with url: " .. v397 .. " and with error message: " .. v412);
                end;
                v407(v410);
            end);
            return ;
        else
            v407(true);
            return ;
        end;
    end;
    local function v568()
        local v418 = 1;
        local v419 = 1;
        local v420 = false;
        local v421 = nil;
        local v422 = nil;
        local l_LocaleId_0 = l_Players_0.LocalPlayer.LocaleId;
        local v424 = nil;
        local v425 = nil;
        local v426 = {};
        local v427 = {};
        local v428 = {};
        local v429 = {};
        local v430 = {};
        local v431 = v16.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", l_Players_0.LocalPlayer.LocaleId:gsub("-", "_"));
        local v432 = l_HttpService_0:RequestInternal({
            Url = v431, 
            Method = "GET"
        });
        local v433 = v16.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId);
        local v434 = l_HttpService_0:RequestInternal({
            Url = v433, 
            Method = "GET"
        });
        local v435 = v16.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d", game.GameId);
        local v436 = l_HttpService_0:RequestInternal({
            Url = v435, 
            Method = "GET"
        });
        local v437 = v16.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId);
        local v438 = l_HttpService_0:RequestInternal({
            Url = v437, 
            Method = "GET"
        });
        local function v470(v439, v440)
            if v439 then
                local v441 = false;
                table.insert(v430, v428[v421].languageName .. " (Original)");
                for __, v443 in pairs(v426) do
                    if v443 == v425 then
                        v441 = true;
                    end;
                    if v443 ~= v421 then
                        table.insert(v430, v428[v443].languageName);
                    end;
                end;
                if v441 == true then
                    for v444, v445 in pairs(v430) do
                        if v444 ~= 1 and v427[v445] == v425 then
                            v418 = v444;
                            v419 = v444;
                        end;
                    end;
                end;
                local l_l_NewPage_0_46 = l_NewPage_0;
                local l_l_NewPage_0_47 = l_NewPage_0;
                local l_l_NewPage_0_48 = l_NewPage_0;
                local v449, v450, v451 = v45:AddNewRow(l_NewPage_0, "Experience Language", "DropDown", v430, v418);
                l_l_NewPage_0_46.LanguageSelectorFrame = v449;
                l_l_NewPage_0_47.LanguageSelectorLabel = v450;
                l_l_NewPage_0_48.LanguageSelectorMode = v451;
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = v36.LanguageSelectorFrame;
                if v418 == 1 then
                    l_LocalPlayer_0:SetExperienceSettingsLocaleId(v422);
                else
                    l_LocalPlayer_0:SetExperienceSettingsLocaleId(v428[v427[v430[v418]]].localeCode);
                end;
                l_NewPage_0.LanguageSelectorMode.IndexChanged:connect(function(v452)
                    l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                    local __ = nil;
                    local v454 = {
                        settingValue = {
                            settingType = "LanguageFamily", 
                            settingTargetId = if v452 == 1 then v428[v421].id else v428[v427[v430[v452]]].id
                        }
                    };
                    local v455 = v16.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId);
                    local v456 = l_HttpService_0:RequestInternal({
                        Url = v455, 
                        Method = "POST", 
                        Headers = {
                            ["Content-Type"] = "application/json"
                        }, 
                        Body = l_HttpService_0:JSONEncode(v454)
                    });
                    local function v459(v457, v458)
                        if not v457 then
                            v66:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. v458);
                            v420 = true;
                            l_NewPage_0.LanguageSelectorMode:SetSelectionIndex(v419);
                        else
                            v419 = v452;
                            if v452 == 1 then
                                l_LocalPlayer_0:SetExperienceSettingsLocaleId(v422);
                            else
                                l_LocalPlayer_0:SetExperienceSettingsLocaleId(v428[v427[v430[v452]]].localeCode);
                            end;
                        end;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(true);
                    end;
                    if not l_RunService_0:IsStudio() then
                        if not v420 then
                            v456:Start(function(v460, v461)
                                local v462 = false;
                                local v463 = nil;
                                if v460 then
                                    if v461.StatusCode == 401 then
                                        v463 = "User Experience Language Settings Update Request: Unauthorized";
                                    elseif not (v461.StatusCode >= 200) or v461.StatusCode >= 400 then
                                        v463 = "User Experience Language Settings Update Request Status Code: " .. v461.StatusCode;
                                    else
                                        v66:info("User Experience Language Settings Update Request succeeded with code: " .. v461.StatusCode);
                                        v462 = true;
                                    end;
                                else
                                    v463 = "User Experience Language Settings Update Request: Connection error";
                                end;
                                if not v462 then
                                    v66:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. v455 .. " with error message: " .. v463);
                                end;
                                v459(v462, v463);
                            end);
                            return ;
                        else
                            v420 = false;
                            v459(true, nil);
                            return ;
                        end;
                    else
                        v459(true, nil);
                        return ;
                    end;
                end);
                return ;
            else
                if v440 == nil then
                    v440 = "Execution path did not set earliest error to non-nil value.";
                end;
                v66:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v440);
                local l_l_NewPage_0_49 = l_NewPage_0;
                local l_l_NewPage_0_50 = l_NewPage_0;
                local l_l_NewPage_0_51 = l_NewPage_0;
                local v467, v468, v469 = v45:AddNewRow(l_NewPage_0, "Experience Language", "DropDown", {
                    "Unavailable"
                }, 1);
                l_l_NewPage_0_49.LanguageSelectorFrame = v467;
                l_l_NewPage_0_50.LanguageSelectorLabel = v468;
                l_l_NewPage_0_51.LanguageSelectorMode = v469;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = v36.LanguageSelectorFrame;
                return ;
            end;
        end;
        local function __(v471, v472)
            if not v471 then
                v470(false, v472);
                return ;
            else
                v438:Start(function(v473, v474)
                    local v475 = false;
                    local v476 = nil;
                    if v473 then
                        if v474.StatusCode == 401 then
                            v476 = "User Experience Language Setting Request: Unauthorized";
                        elseif not (v474.StatusCode >= 200) or v474.StatusCode >= 400 then
                            v476 = "User Experience Language Setting Request Status code: " .. v474.StatusCode;
                        else
                            local l_status_5, l_result_5 = pcall(function()
                                local l_userUniverseLocalizationSettingValue_0 = l_HttpService_0:JSONDecode(v474.Body).userUniverseLocalizationSettingValue;
                                if l_userUniverseLocalizationSettingValue_0 == nil then
                                    v425 = v424;
                                    return ;
                                else
                                    if l_userUniverseLocalizationSettingValue_0.settingType == "SourceOrTranslation" then
                                        if l_userUniverseLocalizationSettingValue_0.settingTargetId == 1 then
                                            v425 = v421;
                                        else
                                            v425 = v424;
                                        end;
                                    end;
                                    if l_userUniverseLocalizationSettingValue_0.settingType == "LanguageFamily" then
                                        if v429[l_userUniverseLocalizationSettingValue_0.settingTargetId] == nil then
                                            v425 = v424;
                                            return ;
                                        else
                                            v425 = v429[l_userUniverseLocalizationSettingValue_0.settingTargetId];
                                        end;
                                    end;
                                    return ;
                                end;
                            end);
                            v475 = l_status_5;
                            v476 = l_result_5;
                        end;
                    else
                        v476 = "User Experience Language Setting Request: Connection error";
                    end;
                    if not v475 then
                        v66:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v437 .. " with error message: " .. v476);
                    end;
                    v470(v475, v476);
                end);
                return ;
            end;
        end;
        local function __(v481, v482)
            if not v481 then
                v470(false, v482);
            else
                v436:Start(function(v483, v484)
                    local v485 = false;
                    local v486 = nil;
                    if v483 then
                        if v484.StatusCode == 401 then
                            v486 = "Experience Supported Language Request: Unauthorized";
                        elseif not (v484.StatusCode >= 200) or v484.StatusCode >= 400 then
                            v486 = "Experience Supported Language Request Status code: " .. v484.StatusCode;
                        else
                            local l_status_6, l_result_6 = pcall(function()
                                for v487, v488 in pairs(l_HttpService_0:JSONDecode(v484.Body).data) do
                                    v426[v487] = v488.languageCode;
                                end;
                            end);
                            v485 = l_status_6;
                            v486 = l_result_6;
                        end;
                    else
                        v486 = "Experience Supported Language Request: Connection error";
                    end;
                    if not v485 then
                        v66:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v435 .. " with error message: " .. v486);
                    end;
                    if v482 == nil then
                        v482 = v486;
                    end;
                    local v491 = v485 and v481;
                    local l_v482_0 = v482;
                    if not v491 then
                        v470(false, l_v482_0);
                        return ;
                    else
                        v438:Start(function(v493, v494)
                            local v495 = false;
                            local v496 = nil;
                            if v493 then
                                if v494.StatusCode == 401 then
                                    v496 = "User Experience Language Setting Request: Unauthorized";
                                elseif not (v494.StatusCode >= 200) or v494.StatusCode >= 400 then
                                    v496 = "User Experience Language Setting Request Status code: " .. v494.StatusCode;
                                else
                                    local l_status_7, l_result_7 = pcall(function()
                                        local l_userUniverseLocalizationSettingValue_1 = l_HttpService_0:JSONDecode(v494.Body).userUniverseLocalizationSettingValue;
                                        if l_userUniverseLocalizationSettingValue_1 == nil then
                                            v425 = v424;
                                            return ;
                                        else
                                            if l_userUniverseLocalizationSettingValue_1.settingType == "SourceOrTranslation" then
                                                if l_userUniverseLocalizationSettingValue_1.settingTargetId == 1 then
                                                    v425 = v421;
                                                else
                                                    v425 = v424;
                                                end;
                                            end;
                                            if l_userUniverseLocalizationSettingValue_1.settingType == "LanguageFamily" then
                                                if v429[l_userUniverseLocalizationSettingValue_1.settingTargetId] == nil then
                                                    v425 = v424;
                                                    return ;
                                                else
                                                    v425 = v429[l_userUniverseLocalizationSettingValue_1.settingTargetId];
                                                end;
                                            end;
                                            return ;
                                        end;
                                    end);
                                    v495 = l_status_7;
                                    v496 = l_result_7;
                                end;
                            else
                                v496 = "User Experience Language Setting Request: Connection error";
                            end;
                            if not v495 then
                                v66:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v437 .. " with error message: " .. v496);
                            end;
                            v470(v495, v496);
                        end);
                        return ;
                    end;
                end);
            end;
        end;
        local function __(v501, v502)
            if not v501 then
                v470(false, v502);
                --[[ close >= 2 ]]
            else
                v434:Start(function(v503, v504)
                    local v505 = false;
                    local v506 = nil;
                    if v503 then
                        if v504.StatusCode == 401 then
                            v506 = "Experience Source Language Request: Unauthorized";
                        elseif not (v504.StatusCode >= 200) or v504.StatusCode >= 400 then
                            v506 = "Experience Source Language Status code: " .. v504.StatusCode;
                        else
                            local l_status_8, l_result_8 = pcall(function()
                                v421 = l_HttpService_0:JSONDecode(v504.Body).languageCode;
                                v422 = v428[v421].localeCode;
                            end);
                            v505 = l_status_8;
                            v506 = l_result_8;
                        end;
                    else
                        v506 = "Experience Source Language Request: Connection error";
                    end;
                    if not v505 then
                        v66:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v433 .. " with error message: " .. v506);
                    end;
                    if v502 == nil then
                        v502 = v506;
                    end;
                    local v509 = v505 and v501;
                    local l_v502_0 = v502;
                    if not v509 then
                        v470(false, l_v502_0);
                    else
                        v436:Start(function(v511, v512)
                            local v513 = false;
                            local v514 = nil;
                            if v511 then
                                if v512.StatusCode == 401 then
                                    v514 = "Experience Supported Language Request: Unauthorized";
                                elseif not (v512.StatusCode >= 200) or v512.StatusCode >= 400 then
                                    v514 = "Experience Supported Language Request Status code: " .. v512.StatusCode;
                                else
                                    local l_status_9, l_result_9 = pcall(function()
                                        for v515, v516 in pairs(l_HttpService_0:JSONDecode(v512.Body).data) do
                                            v426[v515] = v516.languageCode;
                                        end;
                                    end);
                                    v513 = l_status_9;
                                    v514 = l_result_9;
                                end;
                            else
                                v514 = "Experience Supported Language Request: Connection error";
                            end;
                            if not v513 then
                                v66:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v435 .. " with error message: " .. v514);
                            end;
                            if l_v502_0 == nil then
                                l_v502_0 = v514;
                            end;
                            local v519 = v513 and v509;
                            local l_l_v502_0_0 = l_v502_0;
                            if not v519 then
                                v470(false, l_l_v502_0_0);
                                return ;
                            else
                                v438:Start(function(v521, v522)
                                    local v523 = false;
                                    local v524 = nil;
                                    if v521 then
                                        if v522.StatusCode == 401 then
                                            v524 = "User Experience Language Setting Request: Unauthorized";
                                        elseif not (v522.StatusCode >= 200) or v522.StatusCode >= 400 then
                                            v524 = "User Experience Language Setting Request Status code: " .. v522.StatusCode;
                                        else
                                            local l_status_10, l_result_10 = pcall(function()
                                                local l_userUniverseLocalizationSettingValue_2 = l_HttpService_0:JSONDecode(v522.Body).userUniverseLocalizationSettingValue;
                                                if l_userUniverseLocalizationSettingValue_2 == nil then
                                                    v425 = v424;
                                                    return ;
                                                else
                                                    if l_userUniverseLocalizationSettingValue_2.settingType == "SourceOrTranslation" then
                                                        if l_userUniverseLocalizationSettingValue_2.settingTargetId == 1 then
                                                            v425 = v421;
                                                        else
                                                            v425 = v424;
                                                        end;
                                                    end;
                                                    if l_userUniverseLocalizationSettingValue_2.settingType == "LanguageFamily" then
                                                        if v429[l_userUniverseLocalizationSettingValue_2.settingTargetId] == nil then
                                                            v425 = v424;
                                                            return ;
                                                        else
                                                            v425 = v429[l_userUniverseLocalizationSettingValue_2.settingTargetId];
                                                        end;
                                                    end;
                                                    return ;
                                                end;
                                            end);
                                            v523 = l_status_10;
                                            v524 = l_result_10;
                                        end;
                                    else
                                        v524 = "User Experience Language Setting Request: Connection error";
                                    end;
                                    if not v523 then
                                        v66:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v437 .. " with error message: " .. v524);
                                    end;
                                    v470(v523, v524);
                                end);
                                return ;
                            end;
                        end);
                    end;
                end);
            end;
        end;
        v432:Start(function(v529, v530)
            local v531 = false;
            local v532 = nil;
            if v529 then
                if v530.StatusCode == 401 then
                    v532 = "Locale Code to Language Code Mapping Request: Unauthorized";
                elseif not (v530.StatusCode >= 200) or v530.StatusCode >= 400 then
                    v532 = "Locale Code to Language Code Mapping Request Status code: " .. v530.StatusCode;
                else
                    local l_status_11, l_result_11 = pcall(function()
                        for __, v534 in pairs(l_HttpService_0:JSONDecode(v530.Body).data) do
                            local l_languageCode_0 = v534.locale.language.languageCode;
                            local l_locale_0 = v534.locale.locale;
                            local l_name_0 = v534.locale.language.name;
                            local l_id_0 = v534.locale.language.id;
                            v428[l_languageCode_0] = {
                                localeCode = l_locale_0, 
                                languageName = l_name_0, 
                                id = l_id_0
                            };
                            v429[l_id_0] = l_languageCode_0;
                            v427[l_name_0] = l_languageCode_0;
                            if v534.locale.locale == l_LocaleId_0:gsub("-", "_") then
                                v424 = v534.locale.language.languageCode;
                            end;
                        end;
                    end);
                    v531 = l_status_11;
                    v532 = l_result_11;
                end;
            else
                v532 = "Locale Code to Language Code Mapping Request: Connection error";
            end;
            if not v531 then
                v66:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v431 .. " with error message: " .. v532);
            end;
            local l_v531_0 = v531;
            local l_v532_0 = v532;
            if not l_v531_0 then
                v470(false, l_v532_0);
                --[[ close >= 6 ]]
            else
                v434:Start(function(v543, v544)
                    local v545 = false;
                    local v546 = nil;
                    if v543 then
                        if v544.StatusCode == 401 then
                            v546 = "Experience Source Language Request: Unauthorized";
                        elseif not (v544.StatusCode >= 200) or v544.StatusCode >= 400 then
                            v546 = "Experience Source Language Status code: " .. v544.StatusCode;
                        else
                            local l_status_12, l_result_12 = pcall(function()
                                v421 = l_HttpService_0:JSONDecode(v544.Body).languageCode;
                                v422 = v428[v421].localeCode;
                            end);
                            v545 = l_status_12;
                            v546 = l_result_12;
                        end;
                    else
                        v546 = "Experience Source Language Request: Connection error";
                    end;
                    if not v545 then
                        v66:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v433 .. " with error message: " .. v546);
                    end;
                    if l_v532_0 == nil then
                        l_v532_0 = v546;
                    end;
                    local v549 = v545 and l_v531_0;
                    local l_l_v532_0_0 = l_v532_0;
                    if not v549 then
                        v470(false, l_l_v532_0_0);
                    else
                        v436:Start(function(v551, v552)
                            local v553 = false;
                            local v554 = nil;
                            if v551 then
                                if v552.StatusCode == 401 then
                                    v554 = "Experience Supported Language Request: Unauthorized";
                                elseif not (v552.StatusCode >= 200) or v552.StatusCode >= 400 then
                                    v554 = "Experience Supported Language Request Status code: " .. v552.StatusCode;
                                else
                                    local l_status_13, l_result_13 = pcall(function()
                                        for v555, v556 in pairs(l_HttpService_0:JSONDecode(v552.Body).data) do
                                            v426[v555] = v556.languageCode;
                                        end;
                                    end);
                                    v553 = l_status_13;
                                    v554 = l_result_13;
                                end;
                            else
                                v554 = "Experience Supported Language Request: Connection error";
                            end;
                            if not v553 then
                                v66:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v435 .. " with error message: " .. v554);
                            end;
                            if l_l_v532_0_0 == nil then
                                l_l_v532_0_0 = v554;
                            end;
                            local v559 = v553 and v549;
                            local l_l_l_v532_0_0_0 = l_l_v532_0_0;
                            if not v559 then
                                v470(false, l_l_l_v532_0_0_0);
                                return ;
                            else
                                v438:Start(function(v561, v562)
                                    local v563 = false;
                                    local v564 = nil;
                                    if v561 then
                                        if v562.StatusCode == 401 then
                                            v564 = "User Experience Language Setting Request: Unauthorized";
                                        elseif not (v562.StatusCode >= 200) or v562.StatusCode >= 400 then
                                            v564 = "User Experience Language Setting Request Status code: " .. v562.StatusCode;
                                        else
                                            local l_status_14, l_result_14 = pcall(function()
                                                local l_userUniverseLocalizationSettingValue_3 = l_HttpService_0:JSONDecode(v562.Body).userUniverseLocalizationSettingValue;
                                                if l_userUniverseLocalizationSettingValue_3 == nil then
                                                    v425 = v424;
                                                    return ;
                                                else
                                                    if l_userUniverseLocalizationSettingValue_3.settingType == "SourceOrTranslation" then
                                                        if l_userUniverseLocalizationSettingValue_3.settingTargetId == 1 then
                                                            v425 = v421;
                                                        else
                                                            v425 = v424;
                                                        end;
                                                    end;
                                                    if l_userUniverseLocalizationSettingValue_3.settingType == "LanguageFamily" then
                                                        if v429[l_userUniverseLocalizationSettingValue_3.settingTargetId] == nil then
                                                            v425 = v424;
                                                            return ;
                                                        else
                                                            v425 = v429[l_userUniverseLocalizationSettingValue_3.settingTargetId];
                                                        end;
                                                    end;
                                                    return ;
                                                end;
                                            end);
                                            v563 = l_status_14;
                                            v564 = l_result_14;
                                        end;
                                    else
                                        v564 = "User Experience Language Setting Request: Connection error";
                                    end;
                                    if not v563 then
                                        v66:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v437 .. " with error message: " .. v564);
                                    end;
                                    v470(v563, v564);
                                end);
                                return ;
                            end;
                        end);
                    end;
                end);
            end;
        end);
    end;
    local function v573(v569)
        local v570 = {
            ChatTranslationEnabled = false, 
            ChatTranslationToggleEnabled = false
        };
        if not v569 or v569 == "" then
            return v570;
        elseif v569 == "override" then
            v570.ChatTranslationEnabled = true;
            return v570;
        else
            local l_status_15, l_result_15 = pcall(function()
                return v37:GetLayerData(v569);
            end);
            if l_status_15 then
                v570.ChatTranslationEnabled = l_result_15.chatTranslationEnabled or false;
                v570.ChatTranslationToggleEnabled = l_result_15.chatTranslationToggleEnabled or false;
            end;
            return v570;
        end;
    end;
    local __ = function(v574)
        if not l_game_EngineFeature_0 then
            local l_status_16, __ = pcall(function()
                l_TextChatService_0.ChatTranslationEnabled = v574.ChatTranslationEnabled;
                l_TextChatService_0.ChatTranslationToggleEnabled = v574.ChatTranslationToggleEnabled;
            end);
            return l_status_16;
        else
            l_GameSettings_0.ChatTranslationEnabled = v574.ChatTranslationEnabled;
            l_GameSettings_0.ChatTranslationToggleEnabled = v574.ChatTranslationToggleEnabled;
            return true;
        end;
    end;
    local function v588()
        local v578 = math.floor(l_GameSettings_0.MasterVolume * 10);
        local l_l_NewPage_0_52 = l_NewPage_0;
        local l_l_NewPage_0_53 = l_NewPage_0;
        local l_l_NewPage_0_54 = l_NewPage_0;
        local v582, v583, v584 = v45:AddNewRow(l_NewPage_0, "Volume", "Slider", 10, v578);
        l_l_NewPage_0_52.VolumeFrame = v582;
        l_l_NewPage_0_53.VolumeLabel = v583;
        l_l_NewPage_0_54.VolumeSlider = v584;
        l_NewPage_0.VolumeFrame.LayoutOrder = v36.VolumeFrame;
        l_l_NewPage_0_52 = Instance.new("Sound", game:GetService("CoreGui").RobloxGui.Sounds);
        l_l_NewPage_0_52.Name = "VolumeChangeSound";
        l_l_NewPage_0_52.SoundId = "rbxasset://sounds/uuhhh.mp3";
        l_NewPage_0.VolumeSlider.ValueChanged:connect(function(v585)
            local v586 = nil;
            if v79() then
                v586 = math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5);
            end;
            local v587 = v585 / 10;
            l_l_NewPage_0_52.Volume = v587;
            l_l_NewPage_0_52:Play();
            l_GameSettings_0.MasterVolume = v587;
            if v79() then
                v94("volume", v586, (math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5)));
            end;
            v96();
        end);
    end;
    local function v597()
        local v589 = 1;
        if pcall(function()
            if l_GameSettings_0.CameraYInverted == true then
                v589 = 2;
            end;
        end) == false then
            return ;
        else
            local l_l_NewPage_0_55 = l_NewPage_0;
            local l_l_NewPage_0_56 = l_NewPage_0;
            local v592, v593, v594 = v45:AddNewRow(l_NewPage_0, "Camera Inverted", "Selector", {
                "Off", 
                "On"
            }, v589);
            l_l_NewPage_0_55.CameraInvertedFrame = v592;
            _ = v593;
            l_l_NewPage_0_56.CameraInvertedSelector = v594;
            l_NewPage_0.CameraInvertedFrame.LayoutOrder = v36.CameraInvertedFrame;
            v100[l_NewPage_0.CameraInvertedFrame] = true;
            l_NewPage_0.CameraInvertedSelector.IndexChanged:connect(function(v595)
                local v596 = nil;
                if v79() then
                    v596 = l_GameSettings_0.CameraYInverted;
                end;
                if v595 == 2 then
                    l_GameSettings_0.CameraYInverted = true;
                else
                    l_GameSettings_0.CameraYInverted = false;
                end;
                if v79() then
                    v94("camera_y_inverted", v596, l_GameSettings_0.CameraYInverted);
                end;
                v96();
            end);
            return ;
        end;
    end;
    local function v602(v598)
        local v599 = nil;
        local v600 = nil;
        if not (not l_UserInputService_0.GamepadEnabled or not l_GameSettings_0.IsUsingGamepadCameraSensitivity) then
            if v79() then
                v599 = "gamepad";
                v600 = l_GameSettings_0.GamepadCameraSensitivity;
            end;
            l_GameSettings_0.GamepadCameraSensitivity = v598;
        end;
        if l_UserInputService_0.MouseEnabled then
            if v79() then
                v599 = "mouse";
                v600 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
            end;
            local v601 = Vector2.new(v598, v598);
            l_GameSettings_0.MouseSensitivityFirstPerson = v601;
            l_GameSettings_0.MouseSensitivityThirdPerson = v601;
        end;
        if (v79() and typeof(v600) == "number") and typeof(v598) == "number" then
            v94("camera_sensitivity", tonumber(string.format("%.2f", v600)), tonumber(string.format("%.2f", v598)), {
                sensitivity_type = v599
            });
        end;
        v96();
    end;
    local function v629()
        local function __(v603)
            local v604 = v603 <= 1 and math.floor((v603 - 0.2) / 0.16 + 0.5) or math.floor((v603 + 2) / 0.6 + 0.5);
            if v603 <= 0.2 then
                return 0;
            else
                return v604;
            end;
        end;
        local function __(v606)
            local v607 = v606 <= 5 and 0.16 * v606 + 0.2 or 0.6 * v606 - 2;
            if v607 <= 0.2 then
                return 0.2;
            else
                return v607;
            end;
        end;
        local l_MouseSensitivity_0 = l_GameSettings_0.MouseSensitivity;
        local v610 = l_MouseSensitivity_0 <= 0.2 and 0 or (l_MouseSensitivity_0 <= 1 and math.floor((l_MouseSensitivity_0 - 0.2) / 0.16 + 0.5) or math.floor((l_MouseSensitivity_0 + 2) / 0.6 + 0.5));
        l_MouseSensitivity_0 = true;
        local __ = tostring(l_GameSettings_0.MouseSensitivityFirstPerson.X);
        local l_l_NewPage_0_57 = l_NewPage_0;
        local l_l_NewPage_0_58 = l_NewPage_0;
        local l_l_NewPage_0_59 = l_NewPage_0;
        local v615, v616, v617 = v45:AddNewRow(l_NewPage_0, "Camera Sensitivity", "Slider", 10, v610);
        l_l_NewPage_0_57.MouseAdvancedFrame = v615;
        l_l_NewPage_0_58.MouseAdvancedLabel = v616;
        l_l_NewPage_0_59.MouseAdvancedEntry = v617;
        l_NewPage_0.MouseAdvancedFrame.LayoutOrder = v36.MouseAdvancedFrame;
        v100[l_NewPage_0.MouseAdvancedFrame] = true;
        l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size = UDim2.new(l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.X.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.Y.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.Y.Offset - 6);
        l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position = UDim2.new(l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.X.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.X.Offset - 60, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.Y.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.Y.Offset);
        l_NewPage_0.MouseAdvancedLabel.ZIndex = 2;
        l_NewPage_0.MouseAdvancedEntry:SetInteractable(true);
        l_l_NewPage_0_57 = v45:Create("TextBox")({
            Name = "CameraSensitivityTextBox", 
            TextColor3 = Color3.new(1, 1, 1), 
            BorderColor3 = Color3.new(0.8, 0.8, 0.8), 
            BackgroundColor3 = Color3.new(0.2, 0.2, 0.2), 
            Font = v50.font(Enum.Font.SourceSans), 
            TextSize = v50.textSize(18), 
            Size = UDim2.new(0, 60, 0.8, 0), 
            Position = UDim2.new(1, -2, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            ZIndex = 3, 
            Selectable = false, 
            Parent = l_NewPage_0.MouseAdvancedEntry.SliderFrame, 
            BorderSizePixel = not v50.UIBloxThemeEnabled and 1 or 0
        });
        if v50.UIBloxThemeEnabled then
            v45:Create("UICorner")({
                CornerRadius = v50.DefaultCornerRadius, 
                Parent = l_l_NewPage_0_57
            });
        end;
        l_l_NewPage_0_58 = function(v618)
            if string.len(v618) > 7 then
                v618 = string.sub(v618, 1, 7);
            end;
            l_l_NewPage_0_57.Text = v618;
        end;
        l_l_NewPage_0_59 = function(v619)
            l_l_NewPage_0_57.Text = tostring((tonumber((string.format("%.3f", math.floor(v619 * 1000 + 0.5) / 1000)))));
        end;
        if not v88 then
            v615 = tostring(l_GameSettings_0.MouseSensitivityFirstPerson.X);
            if string.len(v615) > 7 then
                v615 = string.sub(v615, 1, 7);
            end;
            l_l_NewPage_0_57.Text = v615;
        else
            l_l_NewPage_0_57.Text = tostring((tonumber((string.format("%.3f", math.floor(l_GameSettings_0.MouseSensitivityFirstPerson.X * 1000 + 0.5) / 1000)))));
        end;
        v615 = l_NewPage_0.MouseAdvancedEntry;
        local l_X_0 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
        v615:SetValue(l_X_0 <= 0.2 and 0 or (l_X_0 <= 1 and math.floor((l_X_0 - 0.2) / 0.16 + 0.5) or math.floor((l_X_0 + 2) / 0.6 + 0.5)));
        clampMouseSensitivity = function(v621)
            if v621 < 0 then
                v621 = -v621;
            end;
            if v621 > 100 then
                return 100;
            else
                if v621 < 0.001 then
                    v621 = 0.001;
                end;
                return v621;
            end;
        end;
        setMouseSensitivity = function(v622, v623)
            if l_MouseSensitivity_0 then
                v602(v622);
                l_MouseSensitivity_0 = false;
                if v623 ~= l_NewPage_0.MouseAdvancedEntry then
                    l_NewPage_0.MouseAdvancedEntry:SetValue(v622 <= 0.2 and 0 or (v622 <= 1 and math.floor((v622 - 0.2) / 0.16 + 0.5) or math.floor((v622 + 2) / 0.6 + 0.5)));
                end;
                if not v88 then
                    local v624 = tostring(v622);
                    if string.len(v624) > 7 then
                        v624 = string.sub(v624, 1, 7);
                    end;
                    l_l_NewPage_0_57.Text = v624;
                else
                    l_l_NewPage_0_57.Text = tostring((tonumber((string.format("%.3f", math.floor(v622 * 1000 + 0.5) / 1000)))));
                end;
                l_MouseSensitivity_0 = true;
                return ;
            else
                return ;
            end;
        end;
        l_l_NewPage_0_57.FocusLost:connect(function()
            l_NewPage_0.MouseAdvancedEntry:SetInteractable(true);
            local v625 = tonumber((string.match(l_l_NewPage_0_57.Text, "([%d%.]+)")));
            if not v625 then
                setMouseSensitivity(l_GameSettings_0.MouseSensitivityFirstPerson.X, l_l_NewPage_0_57);
                return ;
            else
                setMouseSensitivity(clampMouseSensitivity(v625), l_l_NewPage_0_57);
                return ;
            end;
        end);
        l_l_NewPage_0_57.Focused:connect(function()
            l_NewPage_0.MouseAdvancedEntry:SetInteractable(false);
        end);
        l_NewPage_0.MouseAdvancedEntry.ValueChanged:connect(function(v626)
            local v627 = clampMouseSensitivity(v626);
            local v628 = v627 <= 5 and 0.16 * v627 + 0.2 or 0.6 * v627 - 2;
            setMouseSensitivity(v628 <= 0.2 and 0.2 or v628, l_NewPage_0.MouseAdvancedEntry);
        end);
    end;
    local function v646()
        local function __(v630)
            local v631 = v630 <= 1 and math.floor((v630 - 0.2) / 0.16 + 0.5) or math.floor((v630 + 2) / 0.6 + 0.5);
            if v630 <= 0.2 then
                return 0;
            else
                return v631;
            end;
        end;
        local function __(v633)
            local v634 = v633 <= 5 and 0.16 * v633 + 0.2 or 0.6 * v633 - 2;
            if v634 <= 0.2 then
                return 0.2;
            else
                return v634;
            end;
        end;
        local l_GamepadCameraSensitivity_0 = l_GameSettings_0.GamepadCameraSensitivity;
        local v637 = l_GamepadCameraSensitivity_0 <= 0.2 and 0 or (l_GamepadCameraSensitivity_0 <= 1 and math.floor((l_GamepadCameraSensitivity_0 - 0.2) / 0.16 + 0.5) or math.floor((l_GamepadCameraSensitivity_0 + 2) / 0.6 + 0.5));
        l_GamepadCameraSensitivity_0 = l_NewPage_0;
        local l_l_NewPage_0_60 = l_NewPage_0;
        local l_l_NewPage_0_61 = l_NewPage_0;
        local v640, v641, v642 = v45:AddNewRow(l_NewPage_0, "Camera Sensitivity", "Slider", 10, v637);
        l_GamepadCameraSensitivity_0.GamepadSensitivityFrame = v640;
        l_l_NewPage_0_60.GamepadSensitivityLabel = v641;
        l_l_NewPage_0_61.GamepadSensitivitySlider = v642;
        l_NewPage_0.GamepadSensitivityFrame.LayoutOrder = v36.GamepadSensitivityFrame;
        l_NewPage_0.GamepadSensitivitySlider.ValueChanged:connect(function(v643)
            local l_v602_0 = v602;
            local v645 = v643 <= 5 and 0.16 * v643 + 0.2 or 0.6 * v643 - 2;
            l_v602_0(v645 <= 0.2 and 0.2 or v645);
        end);
    end;
    local function v657()
        local v653, v654, v655 = v45:MakeStyledButton("AdjustButton", "Adjust", UDim2.new(0, 300, 1, -20), function()
            local v647 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
            local v648 = nil;
            v648 = require(l_RobloxGui_0.Modules.Settings.Components.OverscanWrapper)((require(l_RobloxGui_0.Modules.Shell.Components.Overscan10ft.Overscan)));
            local v649 = require(l_RobloxGui_0.Modules.Common.Roact);
            local v650 = nil;
            local v651 = {
                onUnmount = function()
                    if v650 then
                        v649.unmount(v650);
                        l_ContextActionService_0:UnbindCoreAction("RbxStopOverscanMovement");
                        v647:SetVisibility(true, true);
                    end;
                end, 
                ImageVisible = false, 
                BackgroundTransparency = 0.2
            };
            v647:SetVisibility(false, true);
            l_ContextActionService_0:BindCoreAction("RbxStopOverscanMovement", function()
            end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            local __ = nil;
            v650 = v649.mount(v649.createElement(v648, v651), l_RobloxGui_0, (tostring(v648)));
        end, l_NewPage_0);
        v654.Font = v50.font(Enum.Font.SourceSans);
        v653.Position = UDim2.new(1, -400, 0, 12);
        if l_RunService_0:IsStudio() then
            v653.Selectable = false;
            v653.Active = false;
            v653.Enabled.Value = false;
            v654.TextColor3 = Color3.fromRGB(100, 100, 100);
        end;
        local v656 = v45:AddNewRowObject(l_NewPage_0, "Safe Zone", v653);
        v656.LayoutOrder = v36.OverscanAdjustButton;
        v655(v656);
    end;
    local function v670()
        local function v669()
            local function v660()
                local v658 = require(script.Parent.Parent.Parent.DevConsoleMaster);
                if v658 then
                    v658:SetVisibility(true);
                    local v659 = require(script.Parent.Parent.SettingsHub);
                    if v659 then
                        v659:SetVisibility(false);
                    end;
                end;
            end;
            if not v84 then
                local v661, v662, v663 = v45:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(0, 300, 1, -20), v660, l_NewPage_0);
                v662.Font = v50.font(Enum.Font.SourceSans);
                v661.Position = UDim2.new(1, -400, 0, 12);
                local v664 = v45:AddNewRowObject(l_NewPage_0, "Developer Console", v661);
                v664.LayoutOrder = v36.DeveloperConsoleButton;
                v663(v664);
                return ;
            else
                local v665, v666, v667 = v45:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(1, 0, 1, -20), v660, l_NewPage_0);
                v666.Font = v50.font(Enum.Font.SourceSans);
                v665.Size = UDim2.new(0.6, -10, 1, -20);
                v665.Position = UDim2.new(0.4, 10, 0, 12);
                local v668 = v45:AddNewRowObject(l_NewPage_0, "Developer Console", v665, nil, true);
                v668.LayoutOrder = v36.DeveloperConsoleButton;
                v667(v668);
                return ;
            end;
        end;
        if not l_RunService_0:IsStudio() then
            spawn(function()
                if v48.CanPlayerManagePlaceAsync(l_Players_0.LocalPlayer) then
                    v669();
                end;
            end);
            return ;
        else
            v669();
            return ;
        end;
    end;
    local function v699()
        if not v83 then
            local v671 = {
                "All visible", 
                "Hide nameplates/bubble chat"
            };
            local l_l_NewPage_0_62 = l_NewPage_0;
            local l_l_NewPage_0_63 = l_NewPage_0;
            local l_l_NewPage_0_64 = l_NewPage_0;
            local v675, v676, v677 = v45:AddNewRow(l_NewPage_0, "BillboardGui Visibility", "Selector", v671, 1);
            l_l_NewPage_0_62.uiToggleRow = v675;
            l_l_NewPage_0_63.uiToggleFrame = v676;
            l_l_NewPage_0_64.uiToggleSelector = v677;
            l_NewPage_0.uiToggleRow.LayoutOrder = v36.UiToggleRow;
            l_NewPage_0.uiToggleSelector.IndexChanged:connect(function(__)
                l_GuiService_0:ToggleGuiIsVisibleIfAllowed(Enum.GuiType.PlayerNameplates);
            end);
            return ;
        else
            local v679 = {
                {
                    label = "Custom", 
                    type = Enum.GuiType.Custom, 
                    layoutOrderKey = "UiToggleRowCustom"
                }, 
                {
                    label = "CustomBillboards", 
                    type = Enum.GuiType.CustomBillboards, 
                    layoutOrderKey = "UiToggleRowBillboards"
                }, 
                {
                    label = "PlayerNameplates", 
                    type = Enum.GuiType.PlayerNameplates, 
                    layoutOrderKey = "UiToggleRowNameplates"
                }
            };
            local v680 = l_RobloxTranslator_0:FormatByKey("InGame.CommonUI.Label.On");
            local v681 = l_RobloxTranslator_0:FormatByKey("InGame.CommonUI.Label.Off");
            l_NewPage_0.uiToggleSelectors = {};
            for __, v683 in v679, nil, nil do
                local v684 = l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.ShowGuiType", {
                    GuiType = v683.label
                });
                local v685, v686, v687 = v45:AddNewRow(l_NewPage_0, v684, "Selector", {
                    v680, 
                    v681
                }, 1);
                v685.LayoutOrder = v36[v683.layoutOrderKey];
                v687.IndexChanged:Connect(function(v688)
                    if (not l_GuiService_0:GetGuiIsVisible(v683.type) and 2 or 1) ~= v688 then
                        l_GuiService_0:ToggleGuiIsVisibleIfAllowed(v683.type);
                    end;
                end);
                l_NewPage_0.uiToggleSelectors[v683.label] = {
                    label = v684, 
                    type = v683.type, 
                    row = v685, 
                    frame = v686, 
                    selector = v687
                };
            end;
            local v689 = l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.Freecam");
            local l_l_NewPage_0_65 = l_NewPage_0;
            local l_l_NewPage_0_66 = l_NewPage_0;
            local l_l_NewPage_0_67 = l_NewPage_0;
            local v693, v694, v695 = v45:AddNewRow(l_NewPage_0, v689, "Selector", {
                v681, 
                v680
            }, 1);
            l_l_NewPage_0_65.freecamRow = v693;
            l_l_NewPage_0_66.freecamFrame = v694;
            l_l_NewPage_0_67.freecamSelector = v695;
            l_NewPage_0.freecamRow.LayoutOrder = v36.FreecamToggleRow;
            l_NewPage_0.freecamSelector.IndexChanged:Connect(function(v696)
                local v697 = v696 == 2;
                local l_l_LocalPlayer_0_FirstChild_0 = l_LocalPlayer_0:FindFirstChild("FreecamScript", true);
                if l_l_LocalPlayer_0_FirstChild_0 then
                    l_l_LocalPlayer_0_FirstChild_0:SetAttribute("FreecamEnabled", v697);
                    return ;
                else
                    warn("Freecam not present");
                    return ;
                end;
            end);
            return ;
        end;
    end;
    local function v705()
        if not v83 then
            if l_NewPage_0.uiToggleSelector then
                local v700 = nil;
                v700 = not l_GuiService_0:GetGuiIsVisible(Enum.GuiType.PlayerNameplates) and 2 or 1;
                if v700 == l_NewPage_0.uiToggleSelector:GetSelectedIndex() then
                    return ;
                else
                    l_NewPage_0.uiToggleSelector:SetSelectionIndex(v700);
                end;
            else
                return ;
            end;
        elseif l_NewPage_0.uiToggleSelectors then
            for __, v702 in l_NewPage_0.uiToggleSelectors, nil, nil do
                local v703 = not l_GuiService_0:GetGuiIsVisible(v702.type) and 2 or 1;
                if v703 ~= v702.selector:GetSelectedIndex() then
                    v702.selector:SetSelectionIndex(v703);
                end;
            end;
            local l_l_LocalPlayer_0_FirstChild_1 = l_LocalPlayer_0:FindFirstChild("FreecamScript", true);
            if l_l_LocalPlayer_0_FirstChild_1 then
                l_NewPage_0.freecamSelector:SetSelectionIndex(not l_l_LocalPlayer_0_FirstChild_1:GetAttribute("FreecamEnabled") and 1 or 2);
                return ;
            end;
        else
            return ;
        end;
    end;
    local function __(v706, v707, v708)
        local l_v706_0 = v706;
        if l_v706_0 then
            l_v706_0 = v707;
            if l_v706_0 then
                l_v706_0 = v708;
                if l_v706_0 then
                    l_v706_0 = false;
                    if #v706 > 0 then
                        l_v706_0 = false;
                        if v708 > 0 then
                            l_v706_0 = false;
                            if v708 <= #v706 then
                                l_v706_0 = #v706 == #v707;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return l_v706_0;
    end;
    local function v719(v711)
        local v712, v713, v714, v715 = pcall(function()
            return v17:GetSpeakerDevices();
        end);
        if not v712 then
            goto block72;
        else
            local l_v713_0 = v713;
            if l_v713_0 then
                l_v713_0 = v714;
                if l_v713_0 then
                    l_v713_0 = v715;
                    if l_v713_0 then
                        l_v713_0 = false;
                        if #v713 > 0 then
                            l_v713_0 = false;
                            if v715 > 0 then
                                l_v713_0 = false;
                                if v715 <= #v713 then
                                    l_v713_0 = #v713 == #v714;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            if not l_v713_0 then
                goto block72;
            else
                l_v713_0 = 0;
                for v717, v718 in ipairs(v713) do
                    if v718 == v711 then
                        l_v713_0 = v717;
                    end;
                end;
                if l_v713_0 > 0 then
                    if v76() then
                        v66:debug("[OutputDeviceSelection] Setting VCS Speaker Device To {} {} ", v713[l_v713_0], v714[l_v713_0]);
                    end;
                    v17:SetSpeakerDevice(v713[l_v713_0], v714[l_v713_0]);
                    return ;
                elseif v76() then
                    v66:warning("Could not find equivalent VoiceChatService Device");
                    return ;
                end;
            end;
        end;
        while true do
            do
                return ;
            end;
            ::label0::;
            if v76() then
                v66:warning("Could not connect to Voice Chat Service to change Output Device");
            end;
        end;
    end;
    local function v725()
        local v720, v721, v722, v723 = pcall(function()
            return l_SoundService_0:GetOutputDevices();
        end);
        if v720 then
            local l_v721_0 = v721;
            if l_v721_0 then
                l_v721_0 = v722;
                if l_v721_0 then
                    l_v721_0 = v723;
                    if l_v721_0 then
                        l_v721_0 = false;
                        if #v721 > 0 then
                            l_v721_0 = false;
                            if v723 > 0 then
                                l_v721_0 = false;
                                if v723 <= #v721 then
                                    l_v721_0 = #v721 == #v722;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            if l_v721_0 then
                v719(v721[v723]);
                return ;
            end;
        end;
        if v76() then
            v66:warning("Could not connect to Voice Chat Service to change Output Device");
        end;
    end;
    local function __(v726, v727)
        l_SoundService_0:SetOutputDevice(v726, v727);
        v66:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", v726, v727);
    end;
    local function v745(v729)
        local v730 = l_NewPage_0[v729 .. "DeviceIndex"] or 0;
        local v731 = l_NewPage_0[v729 .. "DeviceNames"] or {};
        local v732 = l_NewPage_0[v729 .. "DeviceGuids"] or {};
        local v733 = v729 == v33.Input and l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.InputDevice") or l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.GameSettings.OutputDevice");
        local l_l_NewPage_0_68 = l_NewPage_0;
        local v735 = v729 .. "DeviceFrame";
        local l_l_NewPage_0_69 = l_NewPage_0;
        local v737 = v729 .. "DeviceSelector";
        local v738, v739, v740 = v45:AddNewRow(l_NewPage_0, v733, "Selector", v731, v730);
        l_l_NewPage_0_68[v735] = v738;
        _ = v739;
        l_l_NewPage_0_69[v737] = v740;
        l_NewPage_0[v729 .. "DeviceFrame"].LayoutOrder = v729 == v33.Input and v36.DeviceFrameInput or v36.DeviceFrameOutput;
        l_NewPage_0[v729 .. "DeviceInfo"] = {
            Name = v730 > 0 and v731[v730] or nil, 
            Guid = v730 > 0 and v732[v730] or nil
        };
        l_l_NewPage_0_68 = 0;
        v735 = v75();
        l_NewPage_0[v729 .. "DeviceSelector"].IndexChanged:connect(function(v741)
            if l_NewPage_0[v729 .. "DeviceInfo"].Name == l_NewPage_0[v729 .. "DeviceNames"][v741] and l_NewPage_0[v729 .. "DeviceInfo"].Guid == l_NewPage_0[v729 .. "DeviceGuids"][v741] then
                return ;
            else
                local v742 = l_l_NewPage_0_68 + 1;
                l_l_NewPage_0_68 = v742;
                wait(v735);
                if v742 == l_l_NewPage_0_68 then
                    l_l_NewPage_0_68 = 0;
                    l_NewPage_0[v729 .. "DeviceInfo"] = {
                        Name = l_NewPage_0[v729 .. "DeviceNames"][v741], 
                        Guid = l_NewPage_0[v729 .. "DeviceGuids"][v741]
                    };
                    local l_Name_2 = l_NewPage_0[v729 .. "DeviceInfo"].Name;
                    local l_Guid_0 = l_NewPage_0[v729 .. "DeviceInfo"].Guid;
                    if not l_NewPage_0.VoiceChatOptionsEnabled then
                        l_SoundService_0:SetOutputDevice(l_Name_2, l_Guid_0);
                        v66:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", l_Name_2, l_Guid_0);
                    else
                        l_default_1:SwitchDevice(v729, l_Name_2, l_Guid_0);
                        return ;
                    end;
                end;
                return ;
            end;
        end);
    end;
    local function v757()
        local v746 = l_NewPage_0.CameraDeviceIndex or 1;
        local v747 = l_NewPage_0.CameraDeviceNames or {};
        local v748 = l_NewPage_0.CameraDeviceGuids or {};
        local l_v65_0 = v65;
        local l_l_NewPage_0_70 = l_NewPage_0;
        local l_l_NewPage_0_71 = l_NewPage_0;
        local v752, v753, v754 = v45:AddNewRow(l_NewPage_0, l_v65_0, "Selector", v747, v746);
        l_l_NewPage_0_70.CameraDeviceFrame = v752;
        _ = v753;
        l_l_NewPage_0_71.CameraDeviceSelector = v754;
        l_NewPage_0.CameraDeviceFrame.LayoutOrder = v36.CameraDeviceFrame;
        l_NewPage_0.CameraDeviceInfo = {
            Name = v746 > 0 and v747[v746] or nil, 
            Guid = v746 > 0 and v748[v746] or nil
        };
        l_NewPage_0.CameraDeviceSelector.IndexChanged:connect(function(v755)
            if l_NewPage_0.CameraDeviceInfo.Name == l_NewPage_0.CameraDeviceNames[v755] and l_NewPage_0.CameraDeviceInfo.Guid == l_NewPage_0.CameraDeviceGuids[v755] then
                return ;
            else
                l_NewPage_0.CameraDeviceInfo = {
                    Name = l_NewPage_0.CameraDeviceNames[v755], 
                    Guid = l_NewPage_0.CameraDeviceGuids[v755]
                };
                local l_Guid_1 = l_NewPage_0.CameraDeviceInfo.Guid;
                v66:info("Changed webcam to: {}", l_Guid_1);
                l_UserGameSettings_0.DefaultCameraID = l_Guid_1;
                return ;
            end;
        end);
    end;
    local function v764()
        local v758, v759, v760, v761 = pcall(function()
            return l_SoundService_0:GetOutputDevices();
        end);
        local l_Output_0 = v33.Output;
        if v758 then
            local l_v759_0 = v759;
            if l_v759_0 then
                l_v759_0 = v760;
                if l_v759_0 then
                    l_v759_0 = v761;
                    if l_v759_0 then
                        l_v759_0 = false;
                        if #v759 > 0 then
                            l_v759_0 = false;
                            if v761 > 0 then
                                l_v759_0 = false;
                                if v761 <= #v759 then
                                    l_v759_0 = #v759 == #v760;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            if l_v759_0 then
                l_NewPage_0[l_Output_0 .. "DeviceNames"] = v759;
                l_NewPage_0[l_Output_0 .. "VCSDeviceNames"] = v759;
                l_NewPage_0[l_Output_0 .. "VCSDeviceGuids"] = v760;
                l_NewPage_0[l_Output_0 .. "DeviceGuids"] = v760;
                l_NewPage_0[l_Output_0 .. "DeviceIndex"] = v761;
                goto label1 --[[  true, true  ]];
            end;
        end;
        if v76() then
            v66:warning("Errors in get {} device info", l_Output_0);
        end;
        l_NewPage_0[l_Output_0 .. "DeviceNames"] = {};
        l_NewPage_0[l_Output_0 .. "DeviceGuids"] = {};
        l_NewPage_0[l_Output_0 .. "VCSDeviceNames"] = {};
        l_NewPage_0[l_Output_0 .. "VCSDeviceGuids"] = {};
        l_NewPage_0[l_Output_0 .. "DeviceIndex"] = 0;
        ::label1::;
        if l_NewPage_0[l_Output_0 .. "DeviceSelector"] then
            l_NewPage_0[l_Output_0 .. "DeviceSelector"]:UpdateOptions(v759);
            l_NewPage_0[l_Output_0 .. "DeviceSelector"]:SetSelectionIndex(v761);
            return ;
        else
            v745(l_Output_0);
            return ;
        end;
    end;
    local function v775(v765)
        if not (not (v765 ~= v33.Input and v765 ~= v33.Output) or not v76()) then
            v66:warning("{} is not supported in VoiceChat devices", v765);
        end;
        local v766, v767, v768, v769 = pcall(function()
            if v765 == v33.Input then
                if not game:GetEngineFeature("UseFmodForInputDevices") or not v78() then
                    return v17:GetMicDevices();
                else
                    return l_SoundService_0:GetInputDevices();
                end;
            else
                return l_SoundService_0:GetOutputDevices();
            end;
        end);
        local v770, v771, v772, v773 = pcall(function()
            return v17:GetSpeakerDevices();
        end);
        if not (not v766 or not v770) then
            local l_v767_0 = v767;
            if l_v767_0 then
                l_v767_0 = v768;
                if l_v767_0 then
                    l_v767_0 = v769;
                    if l_v767_0 then
                        l_v767_0 = false;
                        if #v767 > 0 then
                            l_v767_0 = false;
                            if v769 > 0 then
                                l_v767_0 = false;
                                if v769 <= #v767 then
                                    l_v767_0 = #v767 == #v768;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            if l_v767_0 then
                l_v767_0 = v771;
                if l_v767_0 then
                    l_v767_0 = v772;
                    if l_v767_0 then
                        l_v767_0 = v773;
                        if l_v767_0 then
                            l_v767_0 = false;
                            if #v771 > 0 then
                                l_v767_0 = false;
                                if v773 > 0 then
                                    l_v767_0 = false;
                                    if v773 <= #v771 then
                                        l_v767_0 = #v771 == #v772;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                if l_v767_0 then
                    l_NewPage_0[v765 .. "DeviceNames"] = v767;
                    l_NewPage_0[v765 .. "VCSDeviceNames"] = v771;
                    l_NewPage_0[v765 .. "VCSDeviceGuids"] = v772;
                    l_NewPage_0[v765 .. "DeviceGuids"] = v768;
                    l_NewPage_0[v765 .. "DeviceIndex"] = v769;
                    goto label2 --[[  true, true  ]];
                end;
            end;
        end;
        if v76() then
            if #v767 > 0 then
                v66:warning("Errors in get {} device info success: {} VCSSuccess: {}", v765, v766, v770);
            else
                v66:warning("Empty deviceNames list for {}", v765);
            end;
        end;
        l_NewPage_0[v765 .. "DeviceNames"] = {};
        l_NewPage_0[v765 .. "DeviceGuids"] = {};
        l_NewPage_0[v765 .. "VCSDeviceNames"] = {};
        l_NewPage_0[v765 .. "VCSDeviceGuids"] = {};
        l_NewPage_0[v765 .. "DeviceIndex"] = 0;
        ::label2::;
        if l_NewPage_0[v765 .. "DeviceSelector"] then
            l_NewPage_0[v765 .. "DeviceSelector"]:UpdateOptions(v767);
            l_NewPage_0[v765 .. "DeviceSelector"]:SetSelectionIndex(v769);
        else
            v745(v765);
        end;
        if l_NewPage_0[v765 .. "DeviceFrame"] then
            if #v767 > 0 then
                l_NewPage_0[v765 .. "DeviceFrame"].Visible = true;
                return ;
            else
                l_NewPage_0[v765 .. "DeviceFrame"].Visible = false;
            end;
        end;
    end;
    local function v782()
        local l_l_VideoCaptureService_0_CameraDevices_0 = l_VideoCaptureService_0:GetCameraDevices();
        local v777 = {};
        local v778 = {};
        local v779 = 1;
        table.insert(v777, v64);
        table.insert(v778, "{DefaultDeviceGuid}");
        for v780, v781 in pairs(l_l_VideoCaptureService_0_CameraDevices_0) do
            if v780 == l_UserGameSettings_0.DefaultCameraID then
                v779 = #v777 + 1;
            end;
            table.insert(v777, v781);
            table.insert(v778, v780);
        end;
        l_NewPage_0.CameraDeviceNames = v777;
        l_NewPage_0.CameraDeviceGuids = v778;
        l_NewPage_0.CameraDeviceIndex = 0;
        if l_NewPage_0.CameraDeviceSelector then
            l_NewPage_0.CameraDeviceSelector:UpdateOptions(v777);
        else
            v757();
        end;
        l_NewPage_0.CameraDeviceSelector:SetSelectionIndex(v779);
    end;
    local v783 = nil;
    local v784 = nil;
    local function __()
        if not l_NewPage_0.VoiceChatOptionsEnabled then
            v764();
            return ;
        else
            v775(v33.Input);
            v775(v33.Output);
            return ;
        end;
    end;
    local function __()
        if l_SoundService_0.DeviceListChanged then
            v783 = l_SoundService_0.DeviceListChanged:Connect(function()
                if l_NewPage_0.PageOpen then
                    if not l_NewPage_0.VoiceChatOptionsEnabled then
                        v764();
                    else
                        v775(v33.Input);
                        v775(v33.Output);
                        return ;
                    end;
                end;
            end);
        end;
    end;
    local function __()
        if l_VideoCaptureService_0.DevicesChanged then
            v784 = l_VideoCaptureService_0.DevicesChanged:Connect(function()
                if l_NewPage_0.PageOpen then
                    v782();
                end;
            end);
        end;
    end;
    local function __()
        if not (not l_SoundService_0.DeviceListChanged or not v783) then
            v783:Disconnect();
        end;
    end;
    local function __()
        if not (not l_VideoCaptureService_0.DevicesChanged or not v784) then
            v784:Disconnect();
            v784 = nil;
        end;
    end;
    local function __()
        if l_default_1:VoiceChatAvailable() then
            l_NewPage_0.VoiceChatOptionsEnabled = true;
            v725();
        end;
    end;
    l_NewPage_0.VoiceChatOptionsEnabled = false;
    if game:GetEngineFeature("VoiceChatSupported") then
        spawn(function()
            l_default_1:asyncInit():andThen(function()
                v17 = l_default_1:getService();
                if l_default_1:VoiceChatAvailable() then
                    l_NewPage_0.VoiceChatOptionsEnabled = true;
                    v725();
                end;
                if not v77() then
                    l_default_1:CheckAndShowNotAudiblePrompt();
                end;
            end):catch(function()
                if v76() then
                    v66:warning("Failed to init VoiceChatServiceManager");
                end;
                if not v77() then
                    l_default_1:CheckAndShowPermissionPrompt();
                end;
            end);
        end);
    end;
    l_NewPage_0.VideoOptionsEnabled = false;
    local v791 = nil;
    local function __()
        if v791 then
            v791:disconnect();
            v791 = nil;
        end;
    end;
    if not (not v21 and not l_GetFFlagSelfViewCameraSettings_0()) then
        local function v794(v793)
            l_NewPage_0.VideoOptionsEnabled = v793.hasCameraPermissions;
        end;
        if not v26() then
            v22(v794, nil, nil, "GameSettings.createDeviceOptions");
        elseif v23() then
            v22(v794, {
                l_default_0.Permissions.CAMERA_ACCESS
            }, true);
            if v791 then
                v791:disconnect();
            end;
            v791 = v25:connect(function()
                l_NewPage_0.VideoOptionsEnabled = true;
                v782();
                if l_VideoCaptureService_0.DevicesChanged then
                    v784 = l_VideoCaptureService_0.DevicesChanged:Connect(function()
                        if l_NewPage_0.PageOpen then
                            v782();
                        end;
                    end);
                end;
            end);
        end;
    end;
    v396(not v53 and ((l_UserInputService_0.TouchEnabled or l_UserInputService_0.MouseEnabled) or l_UserInputService_0.KeyboardEnabled));
    local function __()
        if not l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            local v795 = nil;
            v795 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
                if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                    if v795 then
                        v795:disconnect();
                    end;
                    v646();
                end;
            end);
            return ;
        else
            v646();
            return ;
        end;
    end;
    if not l_UserInputService_0.MouseEnabled then
        if not l_UserInputService_0.GamepadEnabled then
            local v797 = nil;
            do
                local l_v797_0 = v797;
                l_v797_0 = l_UserInputService_0.GamepadConnected:connect(function()
                    if l_v797_0 then
                        l_v797_0:disconnect();
                    end;
                    if not l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                        local v799 = nil;
                        v799 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
                            if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                                if v799 then
                                    v799:disconnect();
                                end;
                                v646();
                            end;
                        end);
                        return ;
                    else
                        v646();
                        return ;
                    end;
                end);
            end;
        elseif not l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            local v800 = nil;
            do
                local l_v800_0 = v800;
                l_v800_0 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
                    if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                        if l_v800_0 then
                            l_v800_0:disconnect();
                        end;
                        v646();
                    end;
                end);
            end;
        else
            v646();
        end;
    else
        v629();
    end;
    if not l_GameSettings_0.IsUsingCameraYInverted then
        local v802 = nil;
        do
            local l_v802_0 = v802;
            l_v802_0 = l_GameSettings_0.Changed:connect(function(v804)
                if not (not (v804 == "IsUsingCameraYInverted") or not l_GameSettings_0.IsUsingCameraYInverted) then
                    l_v802_0:disconnect();
                    v597();
                end;
            end);
        end;
    else
        v597();
    end;
    v588();
    v184();
    v198();
    v212();
    if l_UserInputService_0.KeyboardEnabled then
        v226();
    end;
    if not v57:IsSubjectToChinaPolicies() then
        v238();
    end;
    if v74 then
        v274();
    end;
    if not (not v53 or not l_getAppFeaturePolicies_0().getSupportsOverscan()) then
        v657();
    end;
    v670();
    v49(l_RunService_0:IsStudio(), l_LocalPlayer_0, v48):andThen(function(v805)
        if v805 then
            v699();
        end;
    end):catch(function(v806)
        warn(v806);
    end);
    v99 = true;
    if l_VRService_0.VREnabled then
        local l_VREnabled_3 = l_VRService_0.VREnabled;
        for v808, __ in pairs(v100) do
            v808.Visible = not l_VREnabled_3;
        end;
    end;
    l_NewPage_0.TabHeader.Name = "GameSettingsTab";
    if not v50.UIBloxThemeEnabled then
        l_NewPage_0.TabHeader.Icon.Image = not v53 and "rbxasset://textures/ui/Settings/MenuBarIcons/GameSettingsTab.png" or "rbxasset://textures/ui/Settings/MenuBarIcons/GameSettingsTab@2x.png";
        if not v69 then
            l_NewPage_0.TabHeader.Icon.Title.Text = "Settings";
        else
            l_NewPage_0.TabHeader.Title.Text = "Settings";
        end;
    else
        local v810 = v50.Images["icons/common/settings"];
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectOffset = v810.ImageRectOffset;
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectSize = v810.ImageRectSize;
        l_NewPage_0.TabHeader.TabLabel.Icon.Image = v810.Image;
        l_NewPage_0.TabHeader.TabLabel.Title.Text = "Settings";
    end;
    l_NewPage_0.Page.ZIndex = 5;
    if l_NewPage_0.PageListLayout then
        l_NewPage_0.PageListLayout.Padding = UDim.new(0, 0);
    end;
    l_NewPage_0.PageOpen = false;
    if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
        l_NewPage_0.FeedbackEntryPointEnabled = true;
    end;
    local function __()
        if not l_RunService_0:IsStudio() then
            if game:GetEngineFeature("CaptureModeEnabled") == false then
                return false;
            elseif not v85 or not v53 then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
    l_NewPage_0.OpenSettingsPage = function()
        l_NewPage_0.PageOpen = true;
        if not l_NewPage_0.VoiceChatOptionsEnabled then
            v764();
        else
            v775(v33.Input);
            v775(v33.Output);
        end;
        if l_SoundService_0.DeviceListChanged then
            v783 = l_SoundService_0.DeviceListChanged:Connect(function()
                if l_NewPage_0.PageOpen then
                    if not l_NewPage_0.VoiceChatOptionsEnabled then
                        v764();
                    else
                        v775(v33.Input);
                        v775(v33.Output);
                        return ;
                    end;
                end;
            end);
        end;
        l_NewPage_0.startVolume = l_GameSettings_0.MasterVolume;
        if not ((not v21 and not l_GetFFlagSelfViewCameraSettings_0() or not l_NewPage_0.VideoOptionsEnabled) or not game:GetEngineFeature("VideoCaptureService")) then
            v782();
            if l_VideoCaptureService_0.DevicesChanged then
                v784 = l_VideoCaptureService_0.DevicesChanged:Connect(function()
                    if l_NewPage_0.PageOpen then
                        v782();
                    end;
                end);
            end;
        end;
        v705();
        if not ((not game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") or not l_NewPage_0.toggleFeedbackModeButton) or not l_NewPage_0.toggleFeedbackModeText) then
            local l_l_NewPage_0_72 = l_NewPage_0;
            local v813 = false;
            if v20 ~= nil then
                v813 = v20:CanEnterCaptureMode();
            end;
            l_l_NewPage_0_72.FeedbackEntryPointEnabled = v813;
            if not l_NewPage_0.FeedbackEntryPointEnabled then
                l_NewPage_0.toggleFeedbackModeButton.Active = false;
                l_NewPage_0.toggleFeedbackModeButton.Enabled.Value = false;
                l_NewPage_0.toggleFeedbackModeText.TextColor3 = v50.color("ButtonNonInteractable", Color3.fromRGB(100, 100, 100));
                l_NewPage_0.toggleFeedbackModeText.Text = "Unavailable";
            else
                l_NewPage_0.toggleFeedbackModeButton.Active = true;
                l_NewPage_0.toggleFeedbackModeButton.Enabled.Value = true;
                l_NewPage_0.toggleFeedbackModeText.Text = "Give Feedback";
                return ;
            end;
        end;
    end;
    l_NewPage_0.CloseSettingsPage = function()
        l_NewPage_0.PageOpen = false;
        if not (not l_SoundService_0.DeviceListChanged or not v783) then
            v783:Disconnect();
        end;
        if not (not v21 and not l_GetFFlagSelfViewCameraSettings_0()) then
            if not ((not game:GetEngineFeature("VideoCaptureService") or not l_VideoCaptureService_0.DevicesChanged) or not v784) then
                v784:Disconnect();
                v784 = nil;
            end;
            if not (not v26() or not v791) then
                v791:disconnect();
                v791 = nil;
            end;
        end;
        if (not (not game:GetEngineFeature("VoiceChatSupported") or not l_NewPage_0.VoiceChatOptionsEnabled) and l_NewPage_0.startVolume ~= nil) and l_NewPage_0.startVolume > 0 then
            l_default_1:CheckAndShowNotAudiblePrompt();
        end;
    end;
    isLangaugeSelectionDropdownEnabled = function()
        if game:GetEngineFeature("EnableSetExperienceSettingsLocaleIdApi") ~= true then
            return false;
        elseif l_LocalPlayer_0.UserId % 1000 + 1 <= game:GetFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout") then
            return true;
        else
            for v814 in game:GetFastString("V1MenuLanguageSelectionFeatureForcedUserIds"):gmatch("%d+") do
                if tonumber(v814) == l_LocalPlayer_0.UserId then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    l_NewPage_0.SetHub = function(__, v816)
        l_NewPage_0.HubRef = v816;
        if isLangaugeSelectionDropdownEnabled() then
            v568();
        end;
        if not ((not game:GetEngineFeature("EnableTCSChatTranslation") or not game:GetEngineFeature("EnableTCSChatTranslationLanguageSwitcher")) or not v38()) then
            if not v40() then
                local v817 = v573((v39()));
                local v818;
                if not l_game_EngineFeature_0 then
                    local l_status_17, __ = pcall(function()
                        l_TextChatService_0.ChatTranslationEnabled = v817.ChatTranslationEnabled;
                        l_TextChatService_0.ChatTranslationToggleEnabled = v817.ChatTranslationToggleEnabled;
                    end);
                    v818 = l_status_17;
                else
                    l_GameSettings_0.ChatTranslationEnabled = v817.ChatTranslationEnabled;
                    l_GameSettings_0.ChatTranslationToggleEnabled = v817.ChatTranslationToggleEnabled;
                    v818 = true;
                end;
                if not (not v818 or not v817.ChatTranslationEnabled) then
                    v43(l_NewPage_0, v36, v94);
                end;
            else
                if not (not v41() or v573((v39())).ChatTranslationEnabled) then
                    if not l_game_EngineFeature_0 then
                        pcall(function()
                            l_TextChatService_0.ChatTranslationEnabled = false;
                        end);
                    else
                        l_GameSettings_0.ChatTranslationEnabled = false;
                    end;
                end;
                v43(l_NewPage_0, v36, v94);
            end;
        end;
        if if not l_RunService_0:IsStudio() then game:GetEngineFeature("CaptureModeEnabled") ~= false and ((not v85 or not v53) or false) else false then
            v417();
        end;
    end;
    return l_NewPage_0;
end)());
