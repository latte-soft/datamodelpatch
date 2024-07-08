local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_SafeAsync_0 = require(l_Shell_0:FindFirstChild("SafeAsync"));
local l_Alerts_0 = require(l_Shell_0:FindFirstChild("Alerts"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_Http_0 = require(l_Shell_0:FindFirstChild("Http"));
local v8 = nil;
pcall(function()
    v8 = game:GetService("ThirdPartyUserService");
end);
local v9 = nil;
pcall(function()
    v9 = game:GetService("PlatformService");
end);
local v10 = {};
local v11 = nil;
local v12 = nil;
local v13 = 0;
local v14 = {
    USER_CREATED_CONTENT = 247, 
    MULTIPLAYER_SESSIONS = 254, 
    CROSS_PLATFORM = 185
};
local function v19(v15)
    local l_v13_0 = v13;
    local v17 = 2;
    while l_v13_0 == v13 do
        local v18 = l_Http_0.GetCrossplayEnabledStatusAsync();
        if l_v13_0 == v13 then
            if v18 ~= nil then
                v11 = v18.xboxCrossPlaySetting.isEnabled;
                if not v15 then
                    break;
                else
                    v15(v11);
                    return ;
                end;
            else
                wait(v17);
                v17 = v17 * 2;
            end;
        end;
    end;
end;
v10.GetCrossplayEnabledStatusAsync = function(v20)
    local l_v13_1 = v13;
    if not v20 then
        while v11 == nil and l_v13_1 == v13 do
            wait();
        end;
    else
        v19();
    end;
    if l_v13_1 == v13 then
        return v11;
    else
        return ;
    end;
end;
v10.UpdateCrossplayEnabled = function(v22)
    if v22 ~= v11 then
        v11 = v22;
        l_Http_0.PostCrossplayStatusAsync(v22);
    end;
end;
local v23 = nil;
v10.SetCrossplayEnabledStatusAsync = function(v24)
    if v23 then
        v23(v24);
    end;
end;
v10.UpdateSetCrossplayEnabledStatusAsyncFunc = function(v25)
    v23 = l_SafeAsync_0({
        asyncFunc = function(v26)
            if not l_Http_0.PostCrossplayStatusAsync(v26) then
                return ;
            else
                v11 = v26;
                return v26;
            end;
        end, 
        callback = v25, 
        userRelated = true
    });
end;
local v27 = l_Utility_0.Signal();
local v28 = l_Utility_0.Signal();
v10.OnGetPrivilegeSettingsBegin = v27;
v10.OnGetPrivilegeSettingsEnd = v28;
v10.GetPrivilegeSettingsAsync = l_SafeAsync_0({
    asyncFunc = function()
        v27:fire();
        local v29 = {};
        if not pcall(function()
            v29.Multiplayer = v9:BeginCheckXboxPrivilege(v14.MULTIPLAYER_SESSIONS);
            v29.SharedContent = v9:BeginCheckXboxPrivilege(v14.USER_CREATED_CONTENT);
            v29.CrossPlatform = v9:BeginCheckXboxPrivilege(v14.CROSS_PLATFORM);
        end) then
            v29.Multiplayer = {
                CanJoinGame = false, 
                LocalizedStringKey = "ErrorWord", 
                PrivilegeCheckResult = "Error", 
                Success = false
            };
            v29.SharedContent = {
                CanJoinGame = false, 
                LocalizedStringKey = "ErrorWord", 
                PrivilegeCheckResult = "Error", 
                Success = false
            };
            v29.CrossPlatform = {
                CanJoinGame = false, 
                LocalizedStringKey = "ErrorWord", 
                PrivilegeCheckResult = "Error", 
                Success = false
            };
        end;
        return v29;
    end, 
    callback = function(v30)
        v12 = v30;
        v28:fire(v12);
    end, 
    userRelated = true
});
v10.GetPrivilegeSettings = function()
    return v12;
end;
local function _()
    return v9 and v9:SeenCPPWelcomeMsg();
end;
l_EventHub_0:addEventListener(l_EventHub_0.Notifications.AuthenticationSuccess, "GameplaySettingsData", function()
    v11 = nil;
    v12 = nil;
    local function _(v32, v33)
        local v34 = false;
        if not (not v32 or v9 and v9:SeenCPPWelcomeMsg()) then
            v34 = true;
        end;
        if v32 ~= v33 then
            l_Http_0.PostCrossplayStatusAsync(v32);
            if v32 then
                v34 = true;
            end;
        end;
        if v34 then
            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Alerts_0.CrossPlatformPlayWelcome), false);
        end;
    end;
    local v36 = false;
    local v37 = false;
    spawn(function()
        v19(function(v38)
            v36 = true;
            if not ((not v37 or not v12) or not v12.CrossPlatform) and type(v12.CrossPlatform.CanJoinGame) == "boolean" then
                local l_CanJoinGame_0 = v12.CrossPlatform.CanJoinGame;
                local v40 = false;
                if not (not l_CanJoinGame_0 or v9 and v9:SeenCPPWelcomeMsg()) then
                    v40 = true;
                end;
                if l_CanJoinGame_0 ~= v38 then
                    l_Http_0.PostCrossplayStatusAsync(l_CanJoinGame_0);
                    if l_CanJoinGame_0 then
                        v40 = true;
                    end;
                end;
                if v40 then
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Alerts_0.CrossPlatformPlayWelcome), false);
                end;
            end;
        end);
    end);
    local v41 = nil;
    v41 = v10.OnGetPrivilegeSettingsEnd:connect(function(v42)
        if not (not v42 or not v42.CrossPlatform) and type(v42.CrossPlatform.CanJoinGame) == "boolean" then
            v37 = true;
            if v36 then
                local l_CanJoinGame_1 = v42.CrossPlatform.CanJoinGame;
                local l_v11_0 = v11;
                local v45 = false;
                if not (not l_CanJoinGame_1 or v9 and v9:SeenCPPWelcomeMsg()) then
                    v45 = true;
                end;
                if l_CanJoinGame_1 ~= l_v11_0 then
                    l_Http_0.PostCrossplayStatusAsync(l_CanJoinGame_1);
                    if l_CanJoinGame_1 then
                        v45 = true;
                    end;
                end;
                if v45 then
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Alerts_0.CrossPlatformPlayWelcome), false);
                end;
            end;
        end;
        v41:disconnect();
    end);
    spawn(function()
        v10.GetPrivilegeSettingsAsync();
    end);
end);
local function v46()
    v13 = v13 + 1;
    v11 = nil;
    v12 = nil;
    v28:fire();
end;
if v8 then
    v8.ActiveUserSignedOut:connect(v46);
end;
if v9 then
    v9.OnLeaveConstrained:connect(function()
        v10.GetPrivilegeSettingsAsync();
    end);
end;
return v10;
