local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local v3 = nil;
pcall(function()
    v3 = game:GetService("PlatformService");
end);
local v4 = nil;
pcall(function()
    v4 = game:GetService("ThirdPartyUserService");
end);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("MemStorageService");
local l_Http_0 = require(l_Shell_0:FindFirstChild("Http"));
local l_NoActionOverlay_0 = require(l_Shell_0:FindFirstChild("NoActionOverlay"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_Alerts_0 = require(l_Shell_0:FindFirstChild("Alerts"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_AppState_0 = require(l_Shell_0:FindFirstChild("AppState"));
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v16 = {};
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = {
    APP_SHELL = 0, 
    GAME = 1
};
local v22 = l_Utility_0.GetFastVariable("XboxPresencePolling");
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = false;
local v27 = {
    flag = true
};
local function v30()
    v27.flag = false;
    local v28 = {
        flag = true
    };
    spawn(function()
        v26 = true;
        while v28.flag do
            if v26 then
                l_Http_0.RegisterAppPresence();
            end;
            v26 = false;
            wait(v22);
        end;
    end);
    l_Utility_0.DisconnectEvent(v23);
    v23 = l_UserInputService_0.InputBegan:connect(function(_)
        v26 = true;
    end);
    l_Utility_0.DisconnectEvent(v24);
    v24 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
        v26 = true;
    end);
    v27 = v28;
end;
local function _()
    v27.flag = false;
    l_Utility_0.DisconnectEvent(v23);
    l_Utility_0.DisconnectEvent(v24);
end;
local function _(v32)
    if v20 then
        if v32 == v21.GAME then
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            v20:Hide();
        else
            l_ScreenManager_0:CloseCurrent();
        end;
        v20 = nil;
        return ;
    else
        return ;
    end;
end;
local function _(v34, v35)
    if not v20 then
        v20 = l_NoActionOverlay_0(v34);
        if v35 == v21.GAME then
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
            v20:Show();
            return ;
        else
            l_ScreenManager_0:OpenScreen(v20, false);
            return ;
        end;
    else
        return ;
    end;
end;
local function v39(v37)
    local v38 = true;
    if v37 ~= Enum.UserInputType.Gamepad1 then
        v38 = true;
        if v37 ~= Enum.UserInputType.Gamepad2 then
            v38 = true;
            if v37 ~= Enum.UserInputType.Gamepad3 then
                v38 = true;
                if v37 ~= Enum.UserInputType.Gamepad4 then
                    v38 = true;
                    if v37 ~= Enum.UserInputType.Gamepad5 then
                        v38 = true;
                        if v37 ~= Enum.UserInputType.Gamepad6 then
                            v38 = true;
                            if v37 ~= Enum.UserInputType.Gamepad7 then
                                v38 = v37 == Enum.UserInputType.Gamepad8;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v38;
end;
local function _(v40)
    if v39(l_UserInputService_0:GetLastInputType()) then
        local v41 = "";
        if v40 == v21.APP_SHELL then
            v41 = l_AppState_0.store:getState().XboxUser.gamertag;
        elseif v4 then
            v41 = v4:GetUserPlatformName();
        end;
        local l_Controller_0 = l_Alerts_0.LostConnection.Controller;
        l_Controller_0.Msg = string.format(l_Controller_0.Msg, v41);
        if not v20 then
            v20 = l_NoActionOverlay_0(l_Controller_0);
            if v40 == v21.GAME then
                l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
                v20:Show();
                return ;
            else
                l_ScreenManager_0:OpenScreen(v20, false);
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
local function _(v44)
    if v20 then
        if v44 == v21.GAME then
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            v20:Hide();
        else
            l_ScreenManager_0:CloseCurrent();
        end;
        v20 = nil;
        return ;
    else
        return ;
    end;
end;
local function _()
    v17 = l_Utility_0.DisconnectEvent(v17);
    v18 = l_Utility_0.DisconnectEvent(v18);
    v19 = l_Utility_0.DisconnectEvent(v19);
end;
local function _()
    v30();
    l_Utility_0.DisconnectEvent(v25);
    v25 = v3.ViewChanged:connect(function(v47)
        if v47 == v21.APP_SHELL then
            v30();
            return ;
        else
            v27.flag = false;
            l_Utility_0.DisconnectEvent(v23);
            l_Utility_0.DisconnectEvent(v24);
            return ;
        end;
    end);
end;
v16.Initialize = function(_)
    if v3 then
        if v3.DatamodelType == v21.APP_SHELL then
            l_EventHub_0:addEventListener(l_EventHub_0.Notifications.AuthenticationSuccess, "AchievementManager", function()
                v30();
                l_Utility_0.DisconnectEvent(v25);
                v25 = v3.ViewChanged:connect(function(v50)
                    if v50 == v21.APP_SHELL then
                        v30();
                        return ;
                    else
                        v27.flag = false;
                        l_Utility_0.DisconnectEvent(v23);
                        l_Utility_0.DisconnectEvent(v24);
                        return ;
                    end;
                end);
            end);
        end;
        return ;
    else
        return ;
    end;
end;
v16.CheckUserConnected = function(_)
    if v3 then
        return ;
    else
        return ;
    end;
end;
return v16;
