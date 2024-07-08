local l_RobloxGui_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_RobloxGui_0:FindFirstChild("Modules");
local l_Shell_0 = l_Modules_0:FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v6 = require(l_Modules_0.LuaApp.Analytics.Events.userInteractions);
local v7 = require(l_Modules_0.LuaApp.Analytics.Events.pageHeartbeat);
local l_contentHistory_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("contentHistory"));
local v9 = require(l_Shell_0.Experiment.XboxPrimaryNavIXPTest);
local v10 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v11 = nil;
pcall(function()
    v11 = game:GetService("RbxAnalyticsService");
end);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v14 = l_EventStream_0.new(v11);
local v15 = {};
local v16 = {
    TenFoot = "tenFoot", 
    Classic = "classic"
};
local function _()
    if not v9.isUserEnrolled() then
        return v16.Classic;
    else
        return v16.TenFoot;
    end;
end;
local function v24(v18, v19)
    local v20 = nil;
    local v21 = nil;
    local l_status_0, l_result_0 = pcall(function()
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            v20 = "console";
            v21 = "XboxOne";
            v18 = v18 or "";
            v19 = v19 or {};
            l_EventIngestService_0:SetRBXEvent(v20, v21, v18, v19);
        end;
    end);
    if not l_status_0 then
        l_Utility_0.DebugLog("setRBXEvent() failed because", l_result_0, "Input: target:", v20, " eventContext:", v21, " eventName:", v18);
    end;
    return l_status_0;
end;
local function v31(v25, v26)
    local v27 = nil;
    local v28 = nil;
    local l_status_1, l_result_1 = pcall(function()
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            v27 = "console";
            v28 = "XboxOne";
            v25 = v25 or "";
            v26 = v26 or {};
            l_EventIngestService_0:SetRBXEventStream(v27, v28, v25, v26);
        end;
    end);
    if not l_status_1 then
        l_Utility_0.DebugLog("setRBXEventStream() failed because", l_result_1, "Input: target:", v27, " eventContext:", v28, " eventName:", v25);
    end;
    return l_status_1;
end;
local _ = function(_)
    local v33 = nil;
    local l_status_2, l_result_2 = pcall(function()
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            v33 = "console";
            v11:ReleaseRBXEventStream(v33);
        end;
    end);
    if not l_status_2 then
        l_Utility_0.DebugLog("releaseRBXEventStream() failed because", l_result_2, "Input: target:", v33);
    end;
    return l_status_2;
end;
local function _(v37)
    local l_status_3, l_result_3 = pcall(function()
        v11:UpdateHeartbeatObject(v37);
    end);
    if not l_status_3 then
        l_Utility_0.DebugLog("UpdateHeartbeatObject() failed because ", l_result_3, "Input: args:", v37);
    end;
    return l_status_3;
end;
local function _(v41, v42)
    local l_status_4, l_result_4 = pcall(function()
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            v41 = v41 or "";
            v41 = "Xbox-" .. tostring(v41);
            v42 = v42 or 1;
            v11:ReportCounter(v41, v42);
        end;
    end);
    if not l_status_4 then
        l_Utility_0.DebugLog("reportCounter() failed because", l_result_4, "Input: counterName:", v41, "amount:", v42);
    end;
    return l_status_4;
end;
v15.SetRBXEvent = function(v46, v47)
    v24(v46, v47);
end;
v15.SetRBXEventStream = function(v48, v49)
    v31(v48, v49);
end;
v15.UpdateHeartbeatObject = function(v50)
    local l_status_5, l_result_5 = pcall(function()
        v11:UpdateHeartbeatObject(v50);
    end);
    if not l_status_5 then
        l_Utility_0.DebugLog("UpdateHeartbeatObject() failed because ", l_result_5, "Input: args:", v50);
    end;
end;
v15.ReportCounter = function(v53, v54)
    local l_v53_0 = v53;
    local l_v54_0 = v54;
    local l_status_6, l_result_6 = pcall(function()
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            l_v53_0 = l_v53_0 or "";
            l_v53_0 = "Xbox-" .. tostring(l_v53_0);
            l_v54_0 = l_v54_0 or 1;
            v11:ReportCounter(l_v53_0, l_v54_0);
        end;
    end);
    if not l_status_6 then
        l_Utility_0.DebugLog("reportCounter() failed because", l_result_6, "Input: counterName:", l_v53_0, "amount:", l_v54_0);
    end;
end;
v15.reportPageChanged = function()
    v6(v14, "luaPage");
end;
v15.reportPageHeartbeat = function(v59, v60)
    v7(v14, v59, v60);
end;
v15.reportNavigation = function(v61, v62, v63)
    local v64 = l_contentHistory_0:getLastContentName();
    if v62 ~= v64 then
        v31("Navigation", {
            activationType = v61, 
            toContent = v62, 
            fromContent = v64, 
            contentType = v63, 
            navigationVersion = if not v9.isUserEnrolled() then v16.Classic else v16.TenFoot
        });
        if v10() > 1 then
            print("[ANALYTICS] Navigation", "ActivationType:", v61, "| ContentName:", v62, "| ContentType:", v63, "| PrevContentName:", v64, "| NavigationVersion:", if not v9.isUserEnrolled() then v16.Classic else v16.TenFoot);
        end;
    end;
end;
local function v67(v65)
    local v66 = l_contentHistory_0:getLastContentName();
    if v65 ~= v66 then
        v31("NavigationLoaded", {
            toContent = v65, 
            fromContent = v66, 
            navigationVersion = if not v9.isUserEnrolled() then v16.Classic else v16.TenFoot
        });
        if v10() > 1 then
            print("[ANALYTICS] NavigationLoaded ContentName:", v65, "| PrevContentName:", v66, "| NavigationVersion:", if not v9.isUserEnrolled() then v16.Classic else v16.TenFoot);
        end;
    end;
end;
v15.reportNavigationLoaded = function(v68)
    if not v9.isUserEnrolled() then
        spawn(function()
            v67(v68);
        end);
        return ;
    else
        v67(v68);
        return ;
    end;
end;
v15.reportBackNavigation = function(v69)
    local v70 = l_contentHistory_0:getLastContentName();
    v31("NavigationBack", {
        fromContent = v69, 
        toContent = v70, 
        navigationVersion = if not v9.isUserEnrolled() then v16.Classic else v16.TenFoot
    });
    if v10() > 1 then
        print("[ANALYTICS] NavigationBack FromContent:", v69, "| ToContent:", v70, "| NavigationVersion:", if not v9.isUserEnrolled() then v16.Classic else v16.TenFoot);
    end;
end;
local v71 = {
    WidgetId = "WidgetName", 
    AppHubId = "AppHub", 
    AvatarEditorScreenId = "AvatarEditorScreen", 
    AvatarPaneId = "AvatarPane", 
    AvatarTileId = "AvatarTile", 
    BadgeOverlayId = "BadgeOverlay", 
    BaseCarouselScreenId = "BaseCarouselScreen", 
    BaseOverlayId = "BaseOverlay", 
    BaseTileId = "BaseTile", 
    ConfirmPromptId = "ConfirmPrompt", 
    DisableCrossplayOverlayId = "DisableCrossplayOverlay", 
    EnableCrossplayOverlayId = "EnableCrossplayOverlay", 
    EngagementScreenId = "EngagementScreen", 
    ErrorOverlayId = "ErrorOverlay", 
    GameDetailId = "GameDetail", 
    GameGenreScreenId = "GameGenreScreen", 
    GamesPaneId = "GamesPane", 
    GameSearchScreenId = "GameSearchScreen", 
    HomePaneId = "HomePane", 
    ImageOverlayId = "ImageOverlay", 
    LinkAccountScreenId = "LinkAccountScreen", 
    NoActionOverlayId = "NoActionOverlay", 
    OutfitTileId = "OutfitTile", 
    OverscanScreenId = "OverscanScreen", 
    PurchasePackagePromptId = "PurchasePackagePrompt", 
    ReportOverlayId = "ReportOverlay", 
    RobuxBalanceOverlayId = "RobuxBalanceOverlay", 
    SetAccountCredentialsScreenId = "SetAccountCredentialsScreen", 
    SettingsScreenId = "SettingsScreen", 
    SideBarId = "SideBar", 
    SignInScreenId = "SignInScreen", 
    SocialPaneId = "SocialPane", 
    StorePaneId = "StorePane", 
    TabDockId = "TabDock", 
    UnlinkAccountOverlayId = "UnlinkAccountOverlay", 
    UnlinkAccountScreenId = "UnlinkAccountScreen", 
    TwoFactorScreen = "TwoFactorScreen", 
    CrossDeviceLoginScreen = "CrossDeviceLoginScreen", 
    StoreScreenId = "StoreScreen", 
    SearchScreenId = "SearchScreen", 
    PartyUiId = "PartyUi"
};
local v72 = {
    HomeId = "HomeTab", 
    AvatarId = "AvatarTab", 
    DiscoverId = "DiscoverTab", 
    FriendsId = "FriendsTab", 
    StoreId = "StoreTab", 
    SearchId = "SearchTab", 
    SettingsId = "SettingsTab"
};
v15.WidgetNames = function(v73)
    local v74 = v71 and v71[v73];
    if not v74 then
        l_Utility_0.DebugLog("Analytics.WidgetNames: Could not find widget name for:", v73);
        v74 = v73;
    end;
    return v74;
end;
v15.TabNames = function(v75)
    local v76 = v72 and v72[v75];
    if not v76 then
        l_Utility_0.DebugLog("Analytics.TabNames: Could not find tab name for:", v75);
        v76 = v75;
    end;
    return v76;
end;
return v15;
