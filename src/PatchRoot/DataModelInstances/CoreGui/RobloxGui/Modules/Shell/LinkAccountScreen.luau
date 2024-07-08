local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local _ = game:GetService("ContextActionService");
local _ = game:GetService("GuiService");
local _ = game:GetService("RbxAnalyticsService");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_AccountManager_0 = require(l_Shell_0:FindFirstChild("AccountManager"));
local l_BaseSignInScreen_0 = require(l_Shell_0:FindFirstChild("BaseSignInScreen"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_TwoFactorScreen_0 = require(l_Shell_0:FindFirstChild("TwoFactorScreen"));
local l_GuiUtilities_0 = require(l_Shell_0:FindFirstChild("GuiUtilities"));
local l_CrossDeviceLoginScreen_0 = require(l_Shell_0:FindFirstChild("CrossDeviceLoginScreen"));
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v21 = require(l_Shell_0.Flags.GetFFlagXboxAnalyticsTrackTTI);
local v22 = require(l_Shell_0.Flags.GetFFlagXboxSignupLoadEvent);
return function()
    local v23 = l_BaseSignInScreen_0();
    v23:SetTitle(l_LocalizedStrings_0:LocalizedString("LinkAccountTitle"));
    v23:SetDescriptionText(l_LocalizedStrings_0:LocalizedString("LinkAccountPhrase"));
    local v24, v25, _ = l_GuiUtilities_0.CreateSlicedTextButton("CDL", l_LocalizedStrings_0:LocalizedString("SignInWithCDLPhrase"), UDim2.new(0, v23.SignInButton.AbsolutePosition.X, 0, (v23.SignInButton.AbsolutePosition.Y + v23.SignInButton.AbsoluteSize.Y) + 24));
    v24.Size = UDim2.new(0, 656, 0, 64);
    v24.Parent = v23.Container;
    local v27 = l_GuiUtilities_0.CreateModalOverlay();
    local v28 = nil;
    local v29 = nil;
    v23.UsernameObject:SetDefaultText(l_LocalizedStrings_0:LocalizedString("UsernameWord"));
    v23.UsernameObject:SetKeyboardTitle(l_LocalizedStrings_0:LocalizedString("UsernameWord"));
    local v30 = nil;
    v23.PasswordObject:SetDefaultText(l_LocalizedStrings_0:LocalizedString("PasswordWord"));
    v23.PasswordObject:SetKeyboardTitle(l_LocalizedStrings_0:LocalizedString("PasswordWord"));
    if not UserSettings().GameSettings:InStudioMode() then
        v23.PasswordObject:SetKeyboardType(Enum.XboxKeyBoardType.Password);
    end;
    local v31 = nil;
    local function v35()
        local v32 = nil;
        local l_Error_0 = l_AccountManager_0.AuthResults.Error;
        l_GuiUtilities_0.DoLoadingSpinner(v23.Container, v27, {
            function()
                v32 = l_AccountManager_0:LinkAccountFirstStepAsync(v28, v29);
                if not (not (v32.accountAuthResult == l_AccountManager_0.AuthResults.Success) or v32.isVerificationRequired) then
                    l_Error_0 = l_AccountManager_0:LoginAsync();
                end;
            end
        });
        if v32.accountAuthResult == l_AccountManager_0.AuthResults.Success then
            if not v32.isVerificationRequired then
                if l_Error_0 == l_AccountManager_0.AuthResults.Success then
                    l_ScreenManager_0:CloseCurrent();
                    l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.AuthenticationSuccess);
                else
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(not not l_Error_0 and l_Errors_0.Authentication[l_Error_0] or l_Errors_0.Default), false);
                end;
            else
                local v34 = l_TwoFactorScreen_0(v28, v32.userId, v32.ticket);
                v34:SetParent(v23.Container.Parent);
                l_ScreenManager_0:OpenScreen(v34, true);
            end;
        else
            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(not not v32.accountAuthResult and l_Errors_0.Authentication[v32.accountAuthResult] or l_Errors_0.Default), false);
        end;
    end;
    local v36 = false;
    v23.SignInButton.MouseButton1Click:connect(function()
        if not v36 then
            v36 = true;
            l_SoundManager_0:Play("ButtonPress");
            if not (not (v28 and #v28 > 0) or not v29) and #v29 > 0 then
                v35();
            else
                l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.SignIn.NoUsernameOrPasswordEntered), false);
            end;
            v36 = false;
            return ;
        else
            return ;
        end;
    end);
    v25.MouseButton1Click:connect(function()
        local v37 = l_CrossDeviceLoginScreen_0();
        v37:SetParent(v23.Container.Parent);
        l_ScreenManager_0:OpenScreen(v37, true);
    end);
    v23.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("LinkAccountScreenId")
        };
    end;
    if v21() then
        local l_Show_0 = v23.Show;
        local l_l_Show_0_0 = l_Show_0 --[[ copy: 11 -> 13 ]];
        v23.Show = function(v41)
            l_l_Show_0_0(v41);
            l_default_0:logEventOnce("login_page_did_mount");
        end;
    end;
    local l_Focus_0 = v23.Focus;
    v23.Focus = function(v43)
        l_Focus_0(v43);
        v30 = v23.UsernameObject.OnTextChanged:connect(function(v44)
            v28 = v44;
            if #v28 > 0 then
                l_Utility_0.SetSelectedCoreObject(v23.PasswordSelection);
                return ;
            else
                l_Utility_0.SetSelectedCoreObject(v23.UsernameSelection);
                return ;
            end;
        end);
        v31 = v23.PasswordObject.OnTextChanged:connect(function(v45)
            v29 = v45;
            if #v29 > 0 then
                l_Utility_0.SetSelectedCoreObject(v23.SignInButton);
                return ;
            else
                l_Utility_0.SetSelectedCoreObject(v23.PasswordSelection);
                return ;
            end;
        end);
        if v22() then
            l_EventIngestService_0:SetRBXEventStream("console", "loginScreen", "screenLoaded", {
                appVersion = "classic"
            });
        end;
    end;
    local l_RemoveFocus_0 = v23.RemoveFocus;
    v23.RemoveFocus = function(v47)
        l_RemoveFocus_0(v47);
        l_Utility_0.DisconnectEvent(v30);
        l_Utility_0.DisconnectEvent(v31);
    end;
    return v23;
end;
