local l_UserInputService_0 = game:GetService("UserInputService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v2 = require(script.Parent.Parent.Resources.Constants);
local l_InputTypeMap_0 = v2.InputTypeMap;
return function(v4, v5, v6, v7, v8)
    if v8 == nil then
        v8 = l_RbxAnalyticsService_0;
    end;
    local function v11()
        local l_GameSettings_0 = UserSettings().GameSettings;
        local v10 = {};
        if not l_UserInputService_0.TouchEnabled then
            v10.camera_mode_desktop = tostring(l_GameSettings_0.ComputerCameraMovementMode);
        else
            v10.camera_mode_touch = tostring(l_GameSettings_0.TouchCameraMovementMode);
        end;
        if not l_UserInputService_0.TouchEnabled then
            v10.movement_mode_desktop = tostring(l_GameSettings_0.ComputerMovementMode);
        else
            v10.movement_mode_touch = tostring(l_GameSettings_0.TouchMovementMode);
        end;
        if l_UserInputService_0.MouseEnabled then
            v10.shift_lock_enabled = tostring(l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch);
        end;
        if not (not l_UserInputService_0.GamepadEnabled or not l_GameSettings_0.IsUsingGamepadCameraSensitivity) then
            v10.camera_sensitivity_gamepad = string.format("%.2f", l_GameSettings_0.GamepadCameraSensitivity);
        end;
        if l_UserInputService_0.MouseEnabled then
            v10.camera_sensitivity_mouse = string.format("%.2f", l_GameSettings_0.MouseSensitivityFirstPerson.X);
        end;
        v10.camera_y_inverted = tostring(l_GameSettings_0.CameraYInverted);
        v10.show_performance_stats = tostring(l_GameSettings_0.PerformanceStatsVisible);
        v10.volume = tostring((math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5)));
        v10.gfx_quality_level = tostring(settings().Rendering.QualityLevel);
        v10.fullscreen_enabled = tostring(l_GameSettings_0:InFullScreen());
        v10.microprofiler_enabled = tostring(l_GameSettings_0.OnScreenProfilerEnabled);
        v10.microprofiler_webserver_enabled = tostring(l_GameSettings_0.MicroProfilerWebServerEnabled);
        return v10;
    end;
    if v7 == true then
        v6 = v11();
        v5 = v2.AnalyticsSettingsChangeName;
        v4 = v2.AnalyticsInGameMenuName;
    end;
    if not v6 then
        v6 = {};
    end;
    v6.universeid = tostring(game.GameId);
    v6.inputDevice = tostring(l_InputTypeMap_0[l_UserInputService_0:GetLastInputType()] or l_UserInputService_0:GetLastInputType());
    v8:SetRBXEventStream(v2.AnalyticsTargetName, v4, v5, v6);
end;
