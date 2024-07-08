local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactRoblox);
local v5 = require(l_Parent_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local v7 = require(l_Parent_0.NotificationModalsManager);
local l_useState_0 = v3.useState;
local l_useCallback_0 = v3.useCallback;
local l_useEffect_0 = v3.useEffect;
local l_useRef_0 = v3.useRef;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v13 = game:DefineFastFlag("EnableConsoleAutoFocusForUEN", false);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v16 = require(l_Parent_0.HttpRequest);
local v17 = v16.config({
    requestFunction = v16.requestFunctions.HttpRbxApi
});
local v18 = require(script.Parent.Parent.Requests.FollowingsPostFollow);
local l_sendEventDeferred_0 = require(l_Parent_0.NotificationsCommon).sendEventDeferred;
local v20 = require(script.Parent.Parent.Analytics.ModalEventConstants);
local v21 = require(script.Parent.Parent.Util.RichTextEscape);
return function(v22)
    local v23 = l_useLocalization_0({
        Cancel = "CommonUI.Controls.Action.Cancel", 
        Yes = "CommonUI.Controls.Action.Yes", 
        Heading = "Feature.Notifications.Heading.TurnOnNotifications", 
        ReceiveUpdates = "Feature.Notifications.Label.ReceiveActivityUpdates", 
        ReceiveUpdatesForExperience = "Feature.Notifications.Label.GetUpdatesFromExperience", 
        NotificationsEnabledForExperience = "Feature.Notifications.Response.NotificationsEnabledForExperience", 
        NotificationsEnabled = "Feature.Notifications.Response.NotificationsEnabled", 
        SomethingWentWrong = "Feature.Call.Error.Description.Generic"
    });
    local v24 = l_useCallback_0(function()
        l_sendEventDeferred_0(v20.ModalContext, v20.OptInEventName, {
            [v20.ActionType] = v20.Clicked, 
            [v20.Button] = v20.Cancel, 
            [v20.UniverseId] = v22.ExperienceId
        });
        v22.CloseModal();
    end, {
        v22.CloseModal, 
        v22.ExperienceId
    });
    local v25 = l_useCallback_0(function()
        l_sendEventDeferred_0(v20.ModalContext, v20.OptInEventName, {
            [v20.ActionType] = v20.Clicked, 
            [v20.Button] = v20.Confirm, 
            [v20.UniverseId] = v22.ExperienceId
        });
        if not (not (v22.ExperienceId ~= "0") or not game.Players.LocalPlayer) then
            l_sendEventDeferred_0(v20.ModalContext, v20.OptInEventName, {
                [v20.ActionType] = v20.BackendRequested, 
                [v20.UniverseId] = v22.ExperienceId
            });
            v18(v17, tostring(game.Players.LocalPlayer.UserId), (tostring(v22.ExperienceId))):andThen(function()
                l_sendEventDeferred_0(v20.ModalContext, v20.OptInEventName, {
                    [v20.ActionType] = v20.BackendSuccess, 
                    [v20.UniverseId] = v22.ExperienceId
                });
                v7.SetUIBloxToast({
                    iconImage = l_Images_0["icons/common/notificationOn"], 
                    toastTitle = if not v22.ExperienceName then v23.NotificationsEnabled else v23.NotificationsEnabledForExperience:gsub("{experienceName}", v22.ExperienceName)
                });
            end, function()
                l_sendEventDeferred_0(v20.ModalContext, v20.OptInEventName, {
                    [v20.ActionType] = v20.BackendFailed, 
                    [v20.UniverseId] = v22.ExperienceId
                });
                v7.SetUIBloxToast({
                    iconImage = l_Images_0["icons/status/alert"], 
                    toastTitle = v23.SomethingWentWrong
                });
            end);
        end;
        v22.CloseModal();
    end, {
        v22.CloseModal, 
        v22.ExperienceId, 
        v23
    });
    local v26, v27 = l_useState_0(Vector2.new(800, 600));
    local v29 = l_useCallback_0(function(v28)
        v27(v28.AbsoluteSize);
    end, {
        v27
    });
    local v30 = l_useRef_0(nil);
    if v13 then
        l_useEffect_0(function()
            if l_UserInputService_0.GamepadEnabled then
                task.delay(0.3, function()
                    local v31 = v30.current and v30.current:FindFirstChild("Buttons", true);
                    local v32 = v31 and v31:FindFirstChild("2");
                    if v32 then
                        l_GuiService_0.SelectedCoreObject = v32;
                    end;
                end);
            end;
        end, {});
    end;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ref = v30, 
        [v4.Change.AbsoluteSize] = v29
    }, {
        ConfirmationPrompt = v3.createElement(l_InteractiveAlert_0, {
            screenSize = v26, 
            title = v23.Heading, 
            bodyText = if not v22.ExperienceName then v23.ReceiveUpdates else string.gsub(v23.ReceiveUpdatesForExperience, "{experienceName}", "\n<b>" .. v21(v22.ExperienceName) .. "</b>"), 
            richText = true, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v24, 
                            text = v23.Cancel
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v25, 
                            text = v23.Yes
                        }, 
                        isDefaultChild = false
                    }
                }
            }
        })
    });
end;
