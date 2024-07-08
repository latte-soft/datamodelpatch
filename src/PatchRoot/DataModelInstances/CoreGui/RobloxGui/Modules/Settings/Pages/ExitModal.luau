local v0 = {
    EventContext = "educational_popup", 
    ConfirmName = "educational_confirmed", 
    CancelName = "educational_close_app", 
    DismissName = "educational_dismiss_prompt"
};
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Players_0 = game:GetService("Players");
local v9 = require(l_RobloxGui_0.Modules.Flags.GetFFlagSwitchInExpTranslationsPackage);
local l_GetFFlagChromeSurveySupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeSurveySupport;
local l_l_GuiService_0_NotificationTypeList_0 = l_GuiService_0:GetNotificationTypeList();
local v12 = require(l_CorePackages_0.Roact);
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local v14 = nil;
v14 = if not v9() then require(l_RobloxGui_0.Modules.InGameMenu.Localization.Localization) else require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local v15 = require(l_RobloxGui_0.Modules.InGameMenu.Utility.SendAnalytics);
local v16 = require(l_RobloxGui_0.Modules.InGameMenu.Utility.UserLocalStore);
local v17 = require(l_RobloxGui_0.Modules.Common.GetDefaultQualityLevel);
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v19 = require(l_RobloxGui_0.Modules.Chrome.Service.LocalStore);
local l_UIBlox_0 = require(l_CorePackages_0.InGameMenuDependencies).UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_EducationalModal_0 = l_UIBlox_0.App.Dialog.Modal.EducationalModal;
local v23 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v24 = nil;
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v26 = require(l_RobloxGui_0.Modules.Flags.GetFIntEducationalPopupDisplayMaxCount);
v24 = (function()
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.LeaveAppFunc = function(v28)
        l_GuiService_0.SelectedCoreObject = nil;
        v15(v0.EventContext, v0.CancelName, {
            source = not v28 and "Button" or "Native"
        });
        l_RunService_0.RenderStepped:wait();
        l_RunService_0.RenderStepped:wait();
        settings().Rendering.QualityLevel = v17();
        l_GuiService_0:BroadcastNotification("", l_l_GuiService_0_NotificationTypeList_0.NATIVE_EXIT);
    end;
    l_NewPage_0.LeaveGameFunc = function(v29)
        l_GuiService_0.SelectedCoreObject = nil;
        v15(v0.EventContext, v0.ConfirmName, {
            source = not v29 and "Button" or "Gamepad"
        });
        l_LinkingProtocol_0.default:detectURL("roblox://navigation/home");
        l_RunService_0.RenderStepped:wait();
        l_RunService_0.RenderStepped:wait();
        game:Shutdown();
        settings().Rendering.QualityLevel = v17();
    end;
    l_NewPage_0.LeaveGameFromHotkey = function(_, v31, v32)
        if v31 == Enum.UserInputState.Begin then
            local v33 = true;
            if v32.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v33 = true;
                if v32.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v33 = true;
                    if v32.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v33 = v32.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            l_NewPage_0.LeaveGameFunc(v33);
        end;
    end;
    l_NewPage_0.DontLeaveFunc = function(v34)
        v24.dismissedFrom = not v34 and "Button" or "Gamepad";
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:PopMenu(v34, true);
        end;
    end;
    l_NewPage_0.DontLeaveFromHotkey = function(_, v36, v37)
        if v36 == Enum.UserInputState.Begin then
            local v38 = true;
            if v37.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v38 = true;
                if v37.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v38 = true;
                    if v37.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v38 = v37.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            l_NewPage_0.DontLeaveFunc(v38);
        end;
    end;
    l_NewPage_0.DontShowAgain = function()
        local v39 = v16.new();
        v39:SetItem("NativeCloseLuaPromptDisplayCount", (tostring(math.huge)));
        v39:Flush();
    end;
    l_NewPage_0.ShouldShow = function()
        local v40 = v16.new();
        local v41 = tonumber(v40:GetItem("NativeCloseLuaPromptDisplayCount"));
        if v26() < v41 then
            return false;
        else
            v40:SetItem("NativeCloseLuaPromptDisplayCount", (tostring(v41 + 1)));
            v40:Flush();
            return true;
        end;
    end;
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.Page.Name = "ExitModalPage";
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    l_NewPage_0.IsPageClipped = false;
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 1);
    local v42 = v14.new(l_LocalizationService_0.RobloxLocaleId);
    local function v47()
        v42:SetLocale(l_LocalizationService_0.RobloxLocaleId);
        local v43 = {
            title = v42:Format("CoreScripts.InGameMenu.ExitModal.Title"), 
            subtitle = v42:Format("CoreScripts.InGameMenu.ExitModal.Subtitle"), 
            bodyTextOpenMenu = v42:Format("CoreScripts.InGameMenu.ExitModal.BodyTextOpenMenu"), 
            bodyTextClickHome = v42:Format("CoreScripts.InGameMenu.ExitModal.BodyTextClickHome"), 
            optionDontShow = v42:Format("CoreScripts.InGameMenu.ExitModal.OptionDontShow"), 
            actionExit = v42:Format("CoreScripts.InGameMenu.ExitModal.ActionExit"), 
            actionHome = v42:Format("CoreScripts.InGameMenu.ExitModal.ActionHome")
        };
        return v23({
            v12.createElement(l_EducationalModal_0, {
                bodyContents = {
                    {
                        text = v43.bodyTextOpenMenu, 
                        isSystemMenuIcon = true
                    }, 
                    {
                        icon = l_Images_0["icons/menu/home_off"], 
                        text = v43.bodyTextClickHome
                    }
                }, 
                hasDoNotShow = true, 
                cancelText = v43.actionExit, 
                confirmText = v43.actionHome, 
                doNotShowText = v43.optionDontShow, 
                titleBackgroundImageProps = {
                    image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg", 
                    imageHeight = 200, 
                    text = "<font face=\"GothamBlack\" size=\"42\">" .. v43.title .. "</font><font size=\"4\"><br /></font><br />" .. v43.subtitle
                }, 
                screenSize = l_CoreGui_0.RobloxGui.AbsoluteSize, 
                onDismiss = function()
                    l_NewPage_0.DontLeaveFunc(false);
                end, 
                onCancel = function(v44)
                    if v44 then
                        l_NewPage_0.DontShowAgain();
                    end;
                    l_NewPage_0.LeaveAppFunc(false);
                end, 
                onConfirm = function(v45)
                    if v45 then
                        l_NewPage_0.DontShowAgain();
                    end;
                    l_NewPage_0.LeaveGameFunc(false);
                    local v46 = nil;
                    if l_GetFFlagChromeSurveySupport_0() then
                        v46 = {
                            chromeSeenCount = tostring(v19.getChromeSeenCount())
                        };
                    end;
                    l_MessageBus_0.publish(l_Constants_0.OnSurveyEventDescriptor, {
                        eventType = l_Constants_0.SurveyEventType, 
                        userId = tostring(l_Players_0.LocalPlayer.UserId), 
                        customProps = v46
                    });
                end
            })
        });
    end;
    local v48 = v12.mount(v47(), l_NewPage_0.Page, "ExitModal");
    local v49 = false;
    local function v50()
        if not v49 then
            v49 = true;
            task.delay(1, function()
                v49 = false;
                v48 = v12.update(v48, v47());
            end);
        end;
    end;
    l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(v50);
    l_CoreGui_0.RobloxGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(v50);
    return l_NewPage_0;
end)();
v24.Displayed.Event:connect(function()
    if not v24.ShouldShow() then
        v24.LeaveAppFunc(true);
    end;
    v24.dismissedFrom = "Menu";
    l_ContextActionService_0:BindCoreAction("LeaveGameAction", v24.LeaveGameFromHotkey, false, Enum.KeyCode.ButtonA);
    l_ContextActionService_0:BindCoreAction("DontLeaveAction", v24.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB);
end);
v24.Hidden.Event:connect(function()
    if v24.dismissedFrom then
        v15(v0.EventContext, v0.DismissName, {
            source = v24.dismissedFrom
        });
        v24.dismissedFrom = nil;
    end;
    l_ContextActionService_0:UnbindCoreAction("LeaveGameAction");
    l_ContextActionService_0:UnbindCoreAction("DontLeaveAction");
end);
return v24;
