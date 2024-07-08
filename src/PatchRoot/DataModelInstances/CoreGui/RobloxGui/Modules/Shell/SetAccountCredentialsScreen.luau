local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:FindFirstChild("RobloxGui");
local l_Shell_0 = l_RobloxGui_0:FindFirstChild("Modules"):FindFirstChild("Shell");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("RbxAnalyticsService");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_AccountManager_0 = require(l_Shell_0:FindFirstChild("AccountManager"));
local l_BaseSignInScreen_0 = require(l_Shell_0:FindFirstChild("BaseSignInScreen"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_LoadingWidget_0 = require(l_Shell_0:FindFirstChild("LoadingWidget"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v21 = require(l_Shell_0.Flags.GetFFlagXboxAnalyticsTrackTTI);
local v22 = require(l_Shell_0.Flags.GetFFlagXboxSignupLoadEvent);
return function(v23, v24, v25)
    local v26 = l_BaseSignInScreen_0();
    v26:SetTitle(v23 or "");
    v26:SetDescriptionText(v24 or "");
    v26:SetButtonText(v25 or "");
    local v27 = l_Utility_0.Create("Frame")({
        Name = "ModalOverlay", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = l_GlobalSettings_0.ModalBackgroundTransparency, 
        BackgroundColor3 = l_GlobalSettings_0.ModalBackgroundColor, 
        BorderSizePixel = 0, 
        ZIndex = 4
    });
    local v28 = nil;
    local v29 = nil;
    local v30 = false;
    local v31 = false;
    local v32 = 0;
    local v33 = 0;
    v26.UsernameObject:SetDefaultText(l_LocalizedStrings_0:LocalizedString("UsernameWord") .. " (" .. l_LocalizedStrings_0:LocalizedString("UsernameRulePhrase") .. ")");
    v26.UsernameObject:SetKeyboardTitle(l_LocalizedStrings_0:LocalizedString("UsernameWord"));
    v26.UsernameObject:SetKeyboardDescription(l_LocalizedStrings_0:LocalizedString("UsernameRulePhrase"));
    local v34 = nil;
    v26.PasswordObject:SetDefaultText(l_LocalizedStrings_0:LocalizedString("PasswordWord") .. " (" .. l_LocalizedStrings_0:LocalizedString("PasswordRulePhrase") .. ")");
    v26.PasswordObject:SetKeyboardTitle(l_LocalizedStrings_0:LocalizedString("PasswordWord"));
    v26.PasswordObject:SetKeyboardDescription(l_LocalizedStrings_0:LocalizedString("PasswordRulePhrase"));
    if not UserSettings().GameSettings:InStudioMode() then
        v26.PasswordObject:SetKeyboardType(Enum.XboxKeyBoardType.Password);
    end;
    local v35 = nil;
    local function v39()
        local v36 = nil;
        local v37 = l_LoadingWidget_0({
            Parent = v27
        }, {
            function()
                v36 = l_AccountManager_0:HasLinkedAccountAsync();
                if v36 == l_AccountManager_0.AuthResults.Success then
                    v36 = l_AccountManager_0:SetRobloxCredentialsAsync(v28, v29);
                elseif v36 == l_AccountManager_0.AuthResults.AccountUnlinked then
                    v36 = l_AccountManager_0:SignupAsync(v28, v29);
                end;
                if v36 == l_AccountManager_0.AuthResults.Success then
                    v36 = l_AccountManager_0:LoginAsync();
                end;
            end
        });
        v27.Parent = l_RobloxGui_0;
        l_ContextActionService_0:BindCoreAction("BlockB", function()
        end, false, Enum.KeyCode.ButtonB);
        local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
        l_GuiService_0.SelectedCoreObject = nil;
        v37:AwaitFinished();
        v37:Cleanup();
        v37 = nil;
        l_GuiService_0.SelectedCoreObject = l_SelectedCoreObject_0;
        l_ContextActionService_0:UnbindCoreAction("BlockB");
        v27.Parent = nil;
        if v36 == l_AccountManager_0.AuthResults.Success then
            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.AuthenticationSuccess);
        else
            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(not not v36 and l_Errors_0.Authentication[v36] or l_Errors_0.Default), false);
        end;
    end;
    local function v44(v40)
        v33 = v33 + 1;
        local v41 = nil;
        local v42, v43 = l_AccountManager_0:IsValidPasswordAsync(v28 or "", v29);
        v31 = v42;
        v41 = v43;
        if not v31 then
            if v31 == false then
                if not v40 then
                    l_GuiService_0.SelectedCoreObject = v26.PasswordSelection;
                    v42 = l_Errors_0.Default;
                    if v41 then
                        v42 = l_Errors_0.SignIn.InvalidPassword;
                        v42.Msg = v41;
                    end;
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(v42), false);
                end;
            else
                l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.Default), false);
            end;
        elseif v28 and #v28 > 0 then
            l_GuiService_0.SelectedCoreObject = v26.SignInButton;
        else
            l_GuiService_0.SelectedCoreObject = v26.UsernameSelection;
        end;
        v33 = v33 - 1;
    end;
    local function v49(v45)
        v32 = v32 + 1;
        local v46 = nil;
        local v47, v48 = l_AccountManager_0:IsValidUsernameAsync(v28);
        v30 = v47;
        v46 = v48;
        if not v30 then
            if v30 == false then
                if not v45 then
                    l_GuiService_0.SelectedCoreObject = v26.UsernameSelection;
                    v47 = l_Errors_0.Default;
                    if v46 then
                        v47 = l_Errors_0.SignIn.InvalidUsername;
                        v47.Msg = v46;
                    end;
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(v47), false);
                end;
            else
                l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.Default), false);
            end;
        elseif v29 and #v29 > 0 then
            v44();
        else
            l_GuiService_0.SelectedCoreObject = v26.PasswordSelection;
        end;
        v32 = v32 - 1;
    end;
    local function v51(v50)
        v28 = v50;
        if #v28 > 0 then
            v49();
            return ;
        else
            l_GuiService_0.SelectedCoreObject = v26.UsernameSelection;
            v30 = false;
            return ;
        end;
    end;
    local function v53(v52)
        v29 = v52;
        if #v29 > 0 then
            v44();
            return ;
        else
            l_GuiService_0.SelectedCoreObject = v26.PasswordSelection;
            v31 = false;
            return ;
        end;
    end;
    local v54 = false;
    v26.SignInButton.MouseButton1Click:connect(function()
        if not v54 then
            v54 = true;
            local function _()
                local v55 = true;
                if v32 <= 0 then
                    v55 = v33 > 0;
                end;
                return v55;
            end;
            local function v58()
                while true do
                    local v57 = true;
                    if v32 <= 0 then
                        v57 = v33 > 0;
                    end;
                    if v57 then
                        wait();
                    else
                        break;
                    end;
                end;
            end;
            l_SoundManager_0:Play("ButtonPress");
            local v59 = nil;
            local v60 = true;
            if v32 <= 0 then
                v60 = v33 > 0;
            end;
            if not v60 then
                if not (v30 ~= nil) or v31 == nil then
                    v59 = {};
                    if v30 == nil then
                        table.insert(v59, function()
                            v49(true);
                            while true do
                                local v61 = true;
                                if v32 <= 0 then
                                    v61 = v33 > 0;
                                end;
                                if v61 then
                                    wait();
                                else
                                    break;
                                end;
                            end;
                        end);
                    end;
                    if v31 == nil then
                        table.insert(v59, function()
                            v44(true);
                            while true do
                                local v62 = true;
                                if v32 <= 0 then
                                    v62 = v33 > 0;
                                end;
                                if v62 then
                                    wait();
                                else
                                    break;
                                end;
                            end;
                        end);
                    end;
                end;
            else
                v59 = {
                    v58
                };
            end;
            if v59 then
                v60 = l_LoadingWidget_0({
                    Parent = v27
                }, v59);
                v27.Parent = l_RobloxGui_0;
                v60:AwaitFinished();
                v60:Cleanup();
                v60 = nil;
                v27.Parent = nil;
            end;
            if not v30 or not v31 then
                if not (v30 ~= false) or v31 == false then
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.SignIn.NoUsernameOrPasswordEntered), false);
                else
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.SignIn.ConnectionFailed), false);
                end;
            else
                v39();
            end;
            v54 = false;
            return ;
        else
            return ;
        end;
    end);
    v26.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("SetAccountCredentialsScreenId")
        };
    end;
    if v21() then
        local l_Show_0 = v26.Show;
        local l_l_Show_0_0 = l_Show_0 --[[ copy: 19 -> 21 ]];
        v26.Show = function(v66)
            l_l_Show_0_0(v66);
            l_default_0:logEventOnce("signup_page_did_mount");
        end;
    end;
    local l_Focus_0 = v26.Focus;
    v26.Focus = function(v68)
        l_Focus_0(v68);
        v34 = v26.UsernameObject.OnTextChanged:connect(v51);
        v35 = v26.PasswordObject.OnTextChanged:connect(v53);
        if v22() then
            l_EventIngestService_0:SetRBXEventStream("console", "luaSignUpScreen", "screenLoaded", {
                appVersion = "classic"
            });
        end;
    end;
    local l_RemoveFocus_0 = v26.RemoveFocus;
    v26.RemoveFocus = function(v70)
        l_RemoveFocus_0(v70);
        l_Utility_0.DisconnectEvent(v34);
        l_Utility_0.DisconnectEvent(v35);
    end;
    return v26;
end;
