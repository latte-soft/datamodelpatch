local l_CorePackages_0 = game:GetService("CorePackages");
local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local l_game_EngineFeature_0 = game:GetEngineFeature("LoadErrorHandlerFromEngine");
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CoreScriptErrorReporter", l_RobloxGui_0);
local v10 = require(l_CorePackages_0.Roact);
local l_PolicyService_0 = require(l_Modules_0:WaitForChild("Common"):WaitForChild("PolicyService"));
local l_FFlag_0 = settings():GetFFlag("ConnectionScriptEnabled");
local v13 = require(l_RobloxGui_0.Modules.Flags.FFlagUseRoactGlobalConfigInCoreScripts);
local v14 = require(l_RobloxGui_0.Modules.Flags.FFlagConnectErrorHandlerInLoadingScript);
local v15 = game:DefineFastFlag("DebugAvatarChatVisualization", false);
local v16 = require(l_RobloxGui_0.Modules.Flags.GetFFlagScreenshotHudApi);
local v17 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceDefaultChannel);
local v18 = require(l_RobloxGui_0.Modules.Flags.GetFFlagShareInviteLinkContextMenuABTestEnabled);
local v19 = require(l_RobloxGui_0.Modules.ShareInviteLinkABTestManager);
local v20 = require(l_Modules_0.IsExperienceMenuABTestEnabled);
local v21 = require(l_Modules_0.ExperienceMenuABTestManager);
local v22 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenuIXP);
local v23 = require(l_Modules_0.Settings.Pages.ShareGame.NewInviteMenuExperimentManager);
local v24 = require(l_Modules_0.Flags.GetFFlagEnableSoundSessionTelemetry);
local v25 = require(l_Modules_0.Settings.Flags.GetFFlagReportAnythingAnnotationIXP);
local v26 = require(l_RobloxGui_0.Modules.TrustAndSafety.TrustAndSafetyIXPManager);
local v27 = require(l_Modules_0.Experiment.GetCoreScriptsLayers);
local v28 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRtMessaging);
local v29 = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagContactListClientEnabled);
local v30 = game:DefineFastFlag("AddPublishAssetPrompt6", false);
local l_isCharacterNameHandlerEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isCharacterNameHandlerEnabled;
local l_GetFFlagIrisAlwaysOnTopEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisAlwaysOnTopEnabled;
local l_GetFFlagEnableSocialContextToast_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSocialContextToast;
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local l_GetFFlagEnableAppChatInExperience_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience;
local v36 = game:DefineFastFlag("LuaAppEnableToastNotificationsCoreScripts4", false);
local v37 = game:DefineFastFlag("AdPortalTeleportPromptLua", false);
local v38 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceUserAgency3);
local v39 = require(l_RobloxGui_0.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification);
local v40 = require(l_RobloxGui_0.Modules.Flags.getFFlagMicrophoneDevicePermissionsPromptLogging);
game:DefineFastFlag("MoodsEmoteFix3", false);
local v41 = game:DefineFastFlag("EnableSendCameraAccessAnalytics", false);
local v42 = game:DefineFastFlag("EnableExperienceNotificationPrompts2", false);
local v43 = game:DefineFastFlag("EnableBulkPurchaseApp3", false);
local v44 = game:DefineFastFlag("EnablePremiumSponsoredExperienceReporting", false);
local v45 = require(l_CorePackages_0.UIBlox);
local v46 = require(l_Modules_0.UIBloxInGameConfig);
v45.init(v46);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v48 = require(l_RobloxGui_0.Modules.Flags.FFlagAvatarChatCoreScriptSupport);
if not require(l_RobloxGui_0.Modules.Chrome.Enabled)() then
    if v48 then
        require(l_CorePackages_0.ExperienceChat).GlobalFlags.AvatarChatEnabled = true;
    end;
else
    local v49 = require(l_CorePackages_0.ExperienceChat);
    v49.GlobalFlags.AvatarChatEnabled = v48;
    v49.GlobalFlags.ChromeEnabled = true;
end;
if require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount)() then
    require(l_CorePackages_0.ExperienceChat).GlobalFlags.DoNotPromptCameraPermissionsOnMount = true;
end;
if require(l_RobloxGui_0.Modules.Flags.GetFFlagJoinWithoutMicPermissions)() then
    require(l_CorePackages_0.ExperienceChat).GlobalFlags.JoinWithoutMicPermissions = true;
end;
if require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAlwaysAvailableCamera)() then
    require(l_CorePackages_0.ExperienceChat).GlobalFlags.EnableAlwaysAvailableCamera = true;
end;
if require(l_RobloxGui_0.Modules.Flags.GetFFlagConsolidateBubbleChat)() then
    require(l_CorePackages_0.ExperienceChat).GlobalFlags.ConsolidateBubbleChat = true;
end;
if require(l_RobloxGui_0.Modules.Flags.getFFlagRenderVoiceBubbleAfterAsyncInit)() then
    require(l_CorePackages_0.ExperienceChat).GlobalFlags.RenderVoiceBubbleAfterAsyncInit = true;
end;
if not (not v13 or not l_RunService_0:IsStudio()) then
    v10.setGlobalConfig({
        propValidation = true, 
        elementTracing = true
    });
end;
local l_UIBlox_0 = require(l_CorePackages_0.InGameMenuDependencies).UIBlox;
if l_UIBlox_0 ~= v45 then
    l_UIBlox_0.init(v46);
end;
local l_Folder_0 = Instance.new("Folder");
l_Folder_0.Name = "Sounds";
l_Folder_0.Parent = l_RobloxGui_0;
local function v55(v52)
    local l_status_0, l_result_0 = pcall(require, v52);
    if not l_status_0 then
        warn("Failure to Start CoreScript module " .. v52.Name .. ".\n" .. l_result_0);
        return ;
    else
        return l_result_0;
    end;
end;
if not (((v14 or l_game_EngineFeature_0) or not l_FFlag_0) or l_GuiService_0:IsTenFootInterface()) then
    l_ScriptContext_0:AddCoreScriptLocal("Connection", l_RobloxGui_0);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/NotificationScript2", l_RobloxGui_0);
coroutine.wrap(v55)(l_Modules_0.SelfieView);
coroutine.wrap(v55)(l_Modules_0.TopBar);
if game:GetEngineFeature("LuobuModerationStatus") then
    coroutine.wrap(function()
        local l_Watermark_0 = l_Modules_0.Watermark;
        local l_status_1, l_result_1 = pcall(require, l_Watermark_0);
        if not l_status_1 then
            warn("Failure to Start CoreScript module " .. l_Watermark_0.Name .. ".\n" .. l_result_1);
            return ;
        else
            return ;
        end;
    end)();
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/MainBotChatScript2", l_RobloxGui_0);
if game:GetEngineFeature("ProximityPrompts") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ProximityPrompt", l_RobloxGui_0);
end;
if game:GetEngineFeature("ValidateUGCBodyAPIFeature") then
    require(l_Modules_0.Server.UGCValidation.UGCValidationFunctionInstaller)();
end;
coroutine.wrap(function()
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ScreenTimeInGame", l_RobloxGui_0);
end)();
coroutine.wrap(function()
    if l_PolicyService_0:IsSubjectToChinaPolicies() then
        if not game:IsLoaded() then
            game.Loaded:Wait();
        end;
        local l_LuobuWarningToast_0 = l_Modules_0.LuobuWarningToast;
        local l_status_2, l_result_2 = pcall(require, l_LuobuWarningToast_0);
        if not l_status_2 then
            warn("Failure to Start CoreScript module " .. l_LuobuWarningToast_0.Name .. ".\n" .. l_result_2);
        else
            return ;
        end;
    end;
end)();
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PerformanceStatsManagerScript", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PlayerRagdoll", l_RobloxGui_0);
coroutine.wrap(v55)(l_RobloxGui_0.Modules.ChatSelector);
coroutine.wrap(v55)(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v62 = nil;
local l_status_3, l_result_3 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserRoactBubbleChatBeta");
end);
v62 = l_status_3 and l_result_3;
if not (not game:GetEngineFeature("EnableBubbleChatFromChatService") and not v62) then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PlayerBillboards", l_RobloxGui_0);
end;
if l_GetFFlagIrisAlwaysOnTopEnabled_0() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/IrisUpdateBubbleChat", l_RobloxGui_0);
end;
coroutine.wrap(function()
    local l_PurchasePrompt_0 = l_Modules_0.PurchasePrompt;
    local l_status_4, l_result_4 = pcall(require, l_PurchasePrompt_0);
    local v68;
    if not l_status_4 then
        warn("Failure to Start CoreScript module " .. l_PurchasePrompt_0.Name .. ".\n" .. l_result_4);
        v68 = nil;
    else
        v68 = l_result_4;
    end;
    if v68 then
        v68.mountPurchasePrompt();
    end;
end)();
if v30 then
    coroutine.wrap(v55)(l_Modules_0.PublishAssetPrompt);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/BlockPlayerPrompt", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/FriendPlayerPrompt", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/AvatarContextMenu", l_RobloxGui_0);
coroutine.wrap(v55)(l_RobloxGui_0.Modules.BackpackScript);
coroutine.wrap(v55)(l_RobloxGui_0.Modules.KeyboardUINavigation);
coroutine.wrap(v55)(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
coroutine.wrap(v55)(l_RobloxGui_0.Modules.Screenshots.ScreenshotsApp);
coroutine.wrap(v55)(l_Modules_0.AvatarEditorPrompts);
coroutine.wrap(v55)(l_RobloxGui_0.Modules.VirtualCursor.VirtualCursorMain);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/VehicleHud", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/InviteToGamePrompt", l_RobloxGui_0);
if l_UserInputService_0.TouchEnabled then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ContextActionTouch", l_RobloxGui_0);
    l_RobloxGui_0:WaitForChild("ControlFrame");
    l_RobloxGui_0.ControlFrame:WaitForChild("BottomLeftControl");
    l_RobloxGui_0.ControlFrame.BottomLeftControl.Visible = false;
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/InspectAndBuy", l_RobloxGui_0);
coroutine.wrap(function()
    if not l_VRService_0.VREnabled then
        l_VRService_0:GetPropertyChangedSignal("VREnabled"):Wait();
    end;
    local l_VRAvatarHeightScaling_0 = l_RobloxGui_0.Modules.VR.VRAvatarHeightScaling;
    local l_status_5, l_result_5 = pcall(require, l_VRAvatarHeightScaling_0);
    if not l_status_5 then
        warn("Failure to Start CoreScript module " .. l_VRAvatarHeightScaling_0.Name .. ".\n" .. l_result_5);
    end;
    l_VRAvatarHeightScaling_0 = l_RobloxGui_0.Modules.VR.VirtualKeyboard;
    l_status_5, l_result_5 = pcall(require, l_VRAvatarHeightScaling_0);
    if not l_status_5 then
        warn("Failure to Start CoreScript module " .. l_VRAvatarHeightScaling_0.Name .. ".\n" .. l_result_5);
    end;
    l_VRAvatarHeightScaling_0 = l_RobloxGui_0.Modules.VR.UserGui;
    l_status_5, l_result_5 = pcall(require, l_VRAvatarHeightScaling_0);
    if not l_status_5 then
        warn("Failure to Start CoreScript module " .. l_VRAvatarHeightScaling_0.Name .. ".\n" .. l_result_5);
        return ;
    else
        return ;
    end;
end)();
l_status_3 = nil;
local v72;
l_result_3, v72 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserVRAvatarGestures");
end);
if l_result_3 and v72 then
    coroutine.wrap(v55)(l_RobloxGui_0.Modules.VR.VRAvatarGestures.VRAvatarGesturesClient);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/NetworkPause", l_RobloxGui_0);
if not (not v16() or l_PolicyService_0:IsSubjectToChinaPolicies()) then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ScreenshotHud", l_RobloxGui_0);
end;
if v40() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/MicrophoneDevicePermissionsLoggingInitializer", l_RobloxGui_0);
end;
if not (not game:GetEngineFeature("VoiceChatSupported") or not v17()) then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/VoiceDefaultChannel", l_RobloxGui_0);
end;
coroutine.wrap(function()
    require(l_Modules_0.Common.IXPServiceWrapper):InitializeAsync(l_LocalPlayer_0.UserId, v27());
    if v20() then
        v21.default:initialize();
    end;
    if v18() then
        v19.default:initialize();
    end;
    if v22() then
        v23.default:initialize();
    end;
    if v25() then
        v26.default:initialize();
    end;
end)();
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ExperienceChatMain", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ChatEmoteUsage", script.Parent);
if v36 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ToastNotificationGUI", script.Parent);
end;
if v28() then
    game:GetService("RtMessagingService");
end;
if l_GetFFlagLuaAppEnableSquadPage_0() then
    coroutine.wrap(function()
        local l_Squads_0 = l_CorePackages_0.Workspace.Packages.Squads;
        local l_status_6, l_result_6 = pcall(require, l_Squads_0);
        local v76;
        if not l_status_6 then
            warn("Failure to Start CoreScript module " .. l_Squads_0.Name .. ".\n" .. l_result_6);
            v76 = nil;
        else
            v76 = l_result_6;
        end;
        v76.renderCoreScriptSquad.new();
    end)();
end;
if game:GetEngineFeature("FacialAnimationStreaming2") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/FacialAnimationStreaming", script.Parent);
end;
if v48 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/FaceChatSelfieView", l_RobloxGui_0);
    if v15 then
        l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/AvatarChatDebugVisualization", script.Parent);
    end;
    if game:GetEngineFeature("TrackerLodControllerDebugUI") then
        l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/TrackerLodControllerDebugUI", script.Parent);
    end;
end;
if not (not game:GetEngineFeature("NewMoodAnimationTypeApiEnabled") or not game:GetFastFlag("MoodsEmoteFix3")) then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/AvatarMood", script.Parent);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PortalTeleportGUI", l_RobloxGui_0);
if not (not game:GetEngineFeature("PortalAdPrompt") or not v37) then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/AdTeleportPrompt", l_RobloxGui_0);
end;
if game:GetEngineFeature("EnableAdsEudsaStaticDisclosure") then
    coroutine.wrap(function()
        local l_AdsEudsa_0 = l_CorePackages_0.Workspace.Packages.AdsEudsa;
        local l_status_7, l_result_7 = pcall(require, l_AdsEudsa_0);
        local v80;
        if not l_status_7 then
            warn("Failure to Start CoreScript module " .. l_AdsEudsa_0.Name .. ".\n" .. l_result_7);
            v80 = nil;
        else
            v80 = l_result_7;
        end;
        if not (not v80 or not v80.starterScript) then
            v80.starterScript();
        end;
    end)();
end;
if v44 then
    coroutine.wrap(function()
        local l_PremiumSponsoredExperienceReporting_0 = l_CorePackages_0.Workspace.Packages.PremiumSponsoredExperienceReporting;
        local l_status_8, l_result_8 = pcall(require, l_PremiumSponsoredExperienceReporting_0);
        local v84;
        if not l_status_8 then
            warn("Failure to Start CoreScript module " .. l_PremiumSponsoredExperienceReporting_0.Name .. ".\n" .. l_result_8);
            v84 = nil;
        else
            v84 = l_result_8;
        end;
        if not (not v84 or not v84.starterScript) then
            v84.starterScript();
        end;
    end)();
end;
if game:GetEngineFeature("EnableVoiceAttention") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/VoiceAttention", script.Parent);
end;
if v24() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/SoundTelemetry", script.Parent);
end;
coroutine.wrap(v55)(l_Modules_0.ApolloClient);
if v29() then
    coroutine.wrap(v55)(l_Modules_0.ContactList);
end;
if l_isCharacterNameHandlerEnabled_0() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CharacterNameHandler", script.Parent);
end;
if v38() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/VoiceUserAgency", l_RobloxGui_0);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CoreScriptsGlobalEffects", script.Parent);
require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager.init();
if l_GetFFlagEnableSocialContextToast_0() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/SocialContextToast", l_RobloxGui_0);
end;
if v39() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/GameInviteModalGUI", script.Parent);
end;
if v42 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ExperienceNotifications", script.Parent);
end;
require(l_CorePackages_0.Workspace.Packages.Achievements).InExpAchievementManager.new():startUp();
if require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagPlayerViewRemoteEnabled)() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PlayerView", l_RobloxGui_0);
end;
if v41 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/SendCameraAccessAnalytics", l_RobloxGui_0);
end;
if v43 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/BulkPurchaseApp", l_RobloxGui_0);
end;
if l_GetFFlagEnableAppChatInExperience_0() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/AppChatMain", l_RobloxGui_0);
end;
