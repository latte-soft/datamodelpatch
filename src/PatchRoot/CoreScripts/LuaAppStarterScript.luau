local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_Lighting_0 = game:GetService("Lighting");
local l_NotificationService_0 = game:GetService("NotificationService");
if require(l_Modules_0.LuaApp.Flags.FFlagDebugLuaAppValidateProps) then
    _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ = true;
end;
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppInspectRoact17);
local v8 = UserSettings().GameSettings:InStudioMode() and game:GetService("StudioService"):HasInternalPermission();
if require(l_Modules_0.LuaApp.Flags.FFlagDebugLuaAppsUseDarkTheme) then
    l_NotificationService_0.SelectedTheme = "dark";
end;
local v9 = nil;
if v8 then
    v9 = require(l_CorePackages_0.DeveloperTools).forCoreGui("UniversalApp", {
        rootInstance = "LuaAppScreenGui", 
        pickerParent = "LuaAppScreenGui"
    });
    if v7() then
        v9:initRoact((require(l_CorePackages_0.Packages.Dev.ReactDevtoolsExtensions)));
    end;
end;
local v10 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
v10.default:logEventOnce("lua_app_starter_script_requires_begin");
local v11 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
v11.Config.Enabled = not l_IsVRAppBuild_0();
require(l_CorePackages_0.UIBlox).init(require(l_CorePackages_0.Workspace.Packages.RobloxAppUIBloxConfig));
local v14 = require(l_Modules_0.Common.Roact);
local v15 = require(l_Modules_0.Common.LuaErrorReporter);
local v16 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
local v17 = require(l_Modules_0.LuaApp.Components.UniversalApp);
local v18 = require(l_Modules_0.LuaApp.Util.targetFramerateSetup);
local v19 = require(l_Modules_0.LuaApp.Flags.GetIsClientEnrolledInBacktraceRollout);
local l_IXPService_0 = game:GetService("IXPService");
local v21 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v22 = require(l_Modules_0.Common.GetDefaultQualityLevel);
v10.default:logEventOnce("lua_app_starter_script_requires_end");
if not UserSettings().GameSettings:InStudioMode() then
    local v23 = nil;
    local v24 = nil;
    if v19() then
        v23 = v16;
        v24 = l_ScriptContext_0.ErrorDetailed;
    end;
    local v25 = v15.new(v24, nil, v23);
    v25:setCurrentApp("LuaApp");
    v25:startQueueTimers();
end;
if game:GetEngineFeature("TempNewSkyRemovalBehaviorEnabled") then
    l_Lighting_0.TempUseNewSkyRemovalBehaviour = true;
end;
v10.default:logEventOnce("lua_app_starter_script_wait_for_player_begin");
if game.Players.LocalPlayer == nil then
    game.Players.PlayerAdded:Wait();
end;
v10.default:logEventOnce("lua_app_starter_script_wait_for_player_end");
local v26 = nil;
v26 = game:GetService("RunService").RenderStepped:Connect(function()
    if v26 then
        v26:Disconnect();
    end;
    settings().Rendering.QualityLevel = v22();
end);
local v27 = v14.mount(v14.createElement(v17, {
    appName = "LuaApp"
}), l_CoreGui_0, "App");
if v8 and v14.Ref ~= "ref" then
    v9:addRoactTree("Roact tree", v27, v14);
end;
if UserSettings().GameSettings:InStudioMode() then
    l_UserInputService_0.InputEnded:connect(function(v28, _)
        if not (((not (v28.UserInputType == Enum.UserInputType.Keyboard and v28.KeyCode == Enum.KeyCode.T) or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift)) or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl)) or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftAlt)) then
            local l_TestEZ_0 = require(l_CorePackages_0.JestGlobals).TestEZ;
            l_TestEZ_0.TestBootstrap:run({
                l_CorePackages_0.AppTempCommon, 
                l_Modules_0.LuaApp, 
                l_Modules_0.AvatarExperience
            }, l_TestEZ_0.Reporters.TextReporter);
        end;
    end);
    local l_l_IXPService_0_RegisteredUserLayersToStatus_0 = l_IXPService_0:GetRegisteredUserLayersToStatus();
    for v32 in v21, nil, nil do
        if not l_l_IXPService_0_RegisteredUserLayersToStatus_0[v21[v32]] then
            warn("IXP layer has not been registered: " .. v21[v32]);
        end;
    end;
end;
if not (not game:GetEngineFeature("ExposeOpenXrAPI1") or not l_IsVRAppBuild_0()) then
    v18();
end;
l_SoundManager_0.init();
v10.default:logEventOnce("lua_app_starter_script_end");
