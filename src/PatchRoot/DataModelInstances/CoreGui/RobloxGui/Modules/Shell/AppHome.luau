local l_RobloxGui_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:FindFirstChild("Modules");
local l_Shell_0 = l_Modules_0:FindFirstChild("Shell");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = nil;
pcall(function()
    v5 = game:GetService("PlatformService");
end);
local v6 = nil;
pcall(function()
    v6 = game:GetService("ThirdPartyUserService");
end);
local l_Players_0 = game:GetService("Players");
require(l_Shell_0.BackgroundSceneManager);
local v8 = require(l_CorePackages_0.Roact);
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_AppHub_0 = require(l_Shell_0:FindFirstChild("AppHub"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_GameGenreScreen_0 = require(l_Shell_0:FindFirstChild("GameGenreScreen"));
local l_EngagementScreen_0 = require(l_Shell_0:FindFirstChild("EngagementScreen"));
local l_BadgeScreen_0 = require(l_Shell_0:FindFirstChild("BadgeScreen"));
local l_AccountScreen_0 = require(l_Shell_0:FindFirstChild("AccountScreen"));
local l_UserData_0 = require(l_Shell_0:FindFirstChild("UserData"));
local l_ControllerStateManager_0 = require(l_Shell_0:FindFirstChild("ControllerStateManager"));
local l_Alerts_0 = require(l_Shell_0:FindFirstChild("Alerts"));
local l_SiteInfoWidget_0 = require(l_Shell_0:FindFirstChild("SiteInfoWidget"));
local v24 = require(l_Shell_0.Actions.ResetStore);
local l_GameDetailScreen_0 = require(l_Shell_0:FindFirstChild("GameDetailScreen"));
local v26 = require(l_Shell_0.AvatarEditorScreenWrapper);
local v27 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v28 = require(l_Modules_0.LuaApp.Experiment.getAllAppUserLayers);
local v29 = nil;
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.Xbox.AvatarExperienceDependencyWrapper);
local v31 = require(l_Shell_0.AppState);
local v32 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local l_TitleSafeContainer_0 = require(l_Shell_0.AppContainer).TitleSafeContainer;
local v34 = l_EngagementScreen_0();
v34:SetParent(l_TitleSafeContainer_0);
local v35 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v36 = require(l_Shell_0.Experiment.XboxPrimaryNavIXPTest);
l_SiteInfoWidget_0.new();
require(script.Parent.HeroStatsManager);
local function _()
    return UserSettings().GameSettings:InStudioMode() and game:GetService("StudioService"):HasInternalPermission();
end;
local function v38()
    v29 = v8.mount(v8.createElement(v30, {
        store = v31.store
    }), l_RobloxGui_0, "AvatarEditorScreen");
    if UserSettings().GameSettings:InStudioMode() and game:GetService("StudioService"):HasInternalPermission() then
        require(l_CorePackages_0.DeveloperTools).forCoreGui("Xbox", {
            rootInstance = "RobloxGui", 
            pickerParent = "RobloxGui", 
            rootPath = {}
        }):addRoactTree("Roact tree", v29, v8);
    end;
end;
local function v39()
    if not l_ScreenManager_0:ContainsScreen(v34) then
        while l_ScreenManager_0:GetTopScreen() do
            l_ScreenManager_0:CloseCurrent();
        end;
        l_ScreenManager_0:OpenScreen(v34);
    else
        while l_ScreenManager_0:GetTopScreen() ~= v34 do
            l_ScreenManager_0:CloseCurrent();
        end;
    end;
end;
local v40 = nil;
local function _(v41, v42, v43)
    if v35() > 0 then
        l_Analytics_0.reportNavigation(v41, v42, v43);
    end;
end;
local function v45()
    l_UserData_0:Initialize();
    v31.store:dispatch(require(l_Shell_0.Actions.SetRobloxUser)({
        robloxName = l_Players_0.LocalPlayer.Name, 
        rbxuid = l_Players_0.LocalPlayer.UserId, 
        under13 = l_Players_0.LocalPlayer:GetUnder13()
    }));
    v31.store:dispatch(require(l_Modules_0.LuaApp.Thunks.GetLocalUser)());
    v39();
    v27.registerUserLayers((v28()));
    v27.initializeUserLayers(l_Players_0.LocalPlayer.UserId);
end;
local function v62(_)
    if not v36.isUserEnrolled() then
        v40 = l_AppHub_0();
    else
        v40 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("AppHub"))();
    end;
    v40:SetParent(l_TitleSafeContainer_0);
    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.OpenGameDetail, "gameDetail", function(v47)
        local v48 = l_GameDetailScreen_0(v47);
        v48:SetParent(l_TitleSafeContainer_0);
        l_ScreenManager_0:OpenScreen(v48);
    end);
    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.OpenGameGenre, "gameGenre", function(v49, v50, v51)
        local v52 = l_GameGenreScreen_0(v49, v50);
        v52:SetParent(l_TitleSafeContainer_0);
        l_ScreenManager_0:OpenScreen(v52);
        if v35() > 0 then
            l_Analytics_0.reportNavigation(v51, v49, "ExperienceGenre");
        end;
    end);
    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.OpenBadgeScreen, "gameBadges", function(v53, v54)
        local v55 = l_BadgeScreen_0(v53, v54);
        v55:SetParent(l_TitleSafeContainer_0);
        l_ScreenManager_0:OpenScreen(v55);
    end);
    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.OpenSettingsScreen, "settingsScreen", function(v56)
        v56:SetParent(l_TitleSafeContainer_0);
        l_ScreenManager_0:OpenScreen(v56);
    end);
    if v36.isUserEnrolled() then
        l_EventHub_0:addEventListener(l_EventHub_0.Notifications.OpenSearchScreen, "searchScreen", function(v57)
            v57:SetParent(l_TitleSafeContainer_0);
            l_ScreenManager_0:OpenScreen(v57);
        end);
        l_EventHub_0:addEventListener(l_EventHub_0.Notifications.OpenStoreScreen, "storeScreen", function(v58)
            v58:SetParent(l_TitleSafeContainer_0);
            l_ScreenManager_0:OpenScreen(v58);
        end);
    end;
    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.OpenAvatarEditorScreen, "avatarEditorScreen", function(_)
        l_ScreenManager_0:OpenScreen(v26);
    end);
    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.OpenAccountSettingsScreen, "accountSettingsScreen", function(v60)
        local v61 = l_AccountScreen_0(v60);
        v61:SetParent(l_TitleSafeContainer_0);
        l_ScreenManager_0:OpenScreen(v61);
    end);
    l_Utility_0.DebugLog("User and Event initialization finished. Opening AppHub");
    l_ScreenManager_0:OpenScreen(v40);
    v38();
end;
local v63 = nil;
local function _(v64)
    v63 = v36.experiment(l_TitleSafeContainer_0, {
        v32.XboxClassicUILayer
    }, function(v65)
        if v65.layerLoadingStatus == Enum.IXPLoadingStatus.Initialized then
            v36.setExperimentState(v65.layerToVariables);
            v62(v64);
            if v63 then
                v63:Disconnect();
                v63 = nil;
            end;
        end;
    end);
end;
local function v69(v67)
    if v29 then
        v8.unmount(v29);
        v29 = nil;
    end;
    l_Utility_0.DebugLog("Beging Reauth, cleaning things up");
    v31.store:dispatch(require(l_Shell_0.Actions.SetRobloxUser)());
    v31.store:dispatch(require(l_Modules_0.LuaApp.Thunks.GetLocalUser)());
    v31.store:dispatch(require(l_Shell_0.Actions.SetXboxUser)());
    v39();
    l_UserData_0:Reset();
    v40 = nil;
    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.OpenGameDetail, "gameDetail");
    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.OpenGameGenre, "gameGenre");
    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.OpenBadgeScreen, "gameBadges");
    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.OpenSettingsScreen, "settingsScreen");
    if v36.isUserEnrolled() then
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.OpenSearchScreen, "searchScreen");
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.OpenStoreScreen, "storeScreen");
    end;
    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.OpenAvatarEditorScreen, "avatarEditorScreen");
    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.OpenAccountSettingsScreen, "accountSettingsScreen");
    l_Utility_0.DebugLog("Reauth complete. Return to engagement screen.");
    v31.store:dispatch(v24());
    if v36.isEnabled() then
        v27.clearUserLayers();
    end;
    l_ScreenManager_0:OpenScreen(v34);
    local v68 = l_Alerts_0.SignOut[v67] or l_Alerts_0.Default;
    if v67 == 6 then
        v68 = nil;
    end;
    if v68 then
        l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(v68), false);
    end;
end;
local function v73(v70, v71)
    local v72 = v70 == 0;
    if not v72 then
        l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.GameJoin[v70] or l_Errors_0.GameJoin.Default), false);
    end;
    l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.GameJoin, v72, v71);
end;
if v5 then
    v5.GameJoined:connect(v73);
end;
if v6 then
    v6.ActiveUserSignedOut:connect(v69);
end;
l_ControllerStateManager_0:Initialize();
l_EventHub_0:addEventListener(l_EventHub_0.Notifications.AuthenticationSuccess, "authUserSuccess", function(v74)
    l_Utility_0.DebugLog("User authenticated, initializing app shell");
    v45();
    if not v36.isEnabled() then
        v62(v74);
        return ;
    else
        v63 = v36.experiment(l_TitleSafeContainer_0, {
            v32.XboxClassicUILayer
        }, function(v75)
            if v75.layerLoadingStatus == Enum.IXPLoadingStatus.Initialized then
                v36.setExperimentState(v75.layerToVariables);
                v62(v74);
                if v63 then
                    v63:Disconnect();
                    v63 = nil;
                end;
            end;
        end);
        return ;
    end;
end);
l_ScreenManager_0:OpenScreen(v34);
l_UserInputService_0.MouseIconEnabled = false;
return {};
