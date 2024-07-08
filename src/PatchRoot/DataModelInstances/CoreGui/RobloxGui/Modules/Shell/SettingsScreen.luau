local l_RobloxGui_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui");
local l_Shell_0 = l_RobloxGui_0:FindFirstChild("Modules"):FindFirstChild("Shell");
local l_SettingsScreenConsole_0 = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("SettingsScreenConsole"));
local v3 = nil;
pcall(function()
    v3 = game:GetService("PlatformService");
end);
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = nil;
pcall(function()
    v5 = game:GetService("ThirdPartyUserService");
end);
local l_BaseScreen_0 = require(l_Shell_0:FindFirstChild("BaseScreen"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_AccountScreen_0 = require(l_Shell_0:FindFirstChild("AccountScreen"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
return function()
    local v13 = l_BaseScreen_0(true);
    local v14 = nil;
    v13.GetVersionInfo = function(_)
        if UserSettings().GameSettings:InStudioMode() or l_UserInputService_0:GetPlatform() == Enum.Platform.Windows then
            return {
                Major = 1, 
                Minor = 0, 
                Build = 0, 
                Revision = 0
            };
        elseif not v3 then
            return {
                Major = 1, 
                Minor = 1, 
                Build = 1, 
                Revision = 1
            };
        else
            return v3:GetVersionIdInfo();
        end;
    end;
    v13.OpenAccountScreen = function(_)
        local v17 = l_AccountScreen_0();
        if not v17 then
            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.Default), false);
            return ;
        else
            v17:SetParent(v13.view.Container.Parent);
            l_ScreenManager_0:OpenScreen(v17, true);
            return ;
        end;
    end;
    v13.OpenSwitchProfileScreen = function(_)
        if UserSettings().GameSettings:InStudioMode() or l_UserInputService_0:GetPlatform() == Enum.Platform.Windows then
            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.Test.FeatureNotAvailableInStudio), false);
            return ;
        else
            if v5 then
                v5:ShowAccountPicker();
            end;
            return ;
        end;
    end;
    v13.OpenOverscanScreen = function(_)
        l_ScreenManager_0:OpenScreen((require(l_Shell_0.Components.RoactScreenManagerWrapper).new(require(l_Shell_0.Components.Overscan.Overscan), l_RobloxGui_0, {
            ImageVisible = true, 
            BackgroundTransparency = 0
        })));
    end;
    v13.OpenHelpScreen = function(_)
        if UserSettings().GameSettings:InStudioMode() or l_UserInputService_0:GetPlatform() == Enum.Platform.Windows then
            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.Test.FeatureNotAvailableInStudio), false);
            return ;
        else
            pcall(function()
                return v3:PopupHelpUI();
            end);
            return ;
        end;
    end;
    local function _()
        return l_SettingsScreenConsole_0(v13);
    end;
    v13.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("SettingsScreenId")
        };
    end;
    v13.GetId = function(_)
        return l_Analytics_0.TabNames("SettingsId");
    end;
    v13.GetDefaultSelectionObject = function(_)
        return v13.view and v13.view:GetDefaultSelectionObject();
    end;
    local l_Hide_0 = v13.Hide;
    v13.Hide = function(v26)
        l_Hide_0(v26);
        if v14 then
            v14:disconnect();
            v14 = nil;
        end;
    end;
    v13.ScreenRemoved = function(_)
        spawn(function()
            if v3 ~= nil then
                v3:SaveSettings();
            end;
        end);
    end;
    v13.view = l_SettingsScreenConsole_0(v13);
    v13:SetTitle(l_LocalizedStrings_0:LocalizedString("SettingsWord"));
    return v13;
end;
