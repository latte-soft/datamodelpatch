local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_Toast_0 = v5.App.Dialog.Toast;
local l_Images_0 = v5.App.ImageSet.Images;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v12 = require(l_RobloxGui_0.Modules.shouldSaveScreenshotToAlbum);
local v13 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v14 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v15 = {
    None = "None", 
    Success = "Success", 
    Fail = "Fail", 
    Permission = "Permission"
};
local v16 = v4.PureComponent:extend("CaptureNotification");
v16.validateProps = v6.strictInterface({
    forceDismissToast = v6.optional(v6.table), 
    permissionEvent = v6.optional(v6.instance)
});
v16.init = function(v17)
    v17.state = {
        screenSize = Vector2.new(0, 0), 
        dismissedPermission = false, 
        notificationType = v15.None, 
        toastContent = nil
    };
    v17.onScreenSizeChanged = function(v18)
        if v17.state.screenSize ~= v18.AbsoluteSize then
            v17:setState({
                screenSize = v18.AbsoluteSize
            });
        end;
    end;
    v17.getToastContent = function(v19)
        if not (v19 ~= v15.Success) or v19 == v15.Fail then
            local v20 = v19 == v15.Success;
            return {
                iconImage = not not v20 and l_Images_0["icons/status/success"] or l_Images_0["icons/status/alert"], 
                iconColorStyle = not v20 and {
                    Color = Color3.fromRGB(247, 75, 82), 
                    Transparency = 0
                } or nil, 
                toastTitle = not not v20 and v13:FormatByKey("NotificationScript2.Capture.Success.ToastText") or v13:FormatByKey("NotificationScript2.Capture.Fail.ToastText"), 
                onDismissed = function()
                    v17:setState({
                        notificationType = v15.None, 
                        toastContent = v4.None
                    });
                    if not (not v17.props.forceDismissToast or not v17.props.forceDismissToast.onDismissed) then
                        v17.props.forceDismissToast.onDismissed();
                    end;
                end
            };
        else
            return v4.None;
        end;
    end;
    v17.dismissPermissionAlert = function()
        v17:setState({
            dismissedPermission = true, 
            notificationType = v15.Fail, 
            toastContent = v17.getToastContent(v15.Fail)
        });
    end;
    v17.screenshotSavedToAlbumCallback = function(_, v22, v23)
        local v24 = nil;
        v24 = if not v22 then if (not v17.state.dismissedPermission and v23:find("Domain=ALAssetsLibraryErrorDomain")) and v23:find("Data unavailable") then v15.Permission else v15.Fail else v15.Success;
        v17:setState({
            notificationType = v24, 
            toastContent = v17.getToastContent(v24)
        });
    end;
    v17.permissionEventCallback = function()
        v17:setState({
            notificationType = v15.Permission, 
            toastContent = v17.getToastContent(v15.Permission)
        });
    end;
    v17.getPermissionAlertBodyText = function()
        if l_UserInputService_0:GetPlatform() == Enum.Platform.IOS then
            return v13:FormatByKey("NotificationScript2.Capture.Permission.AlertTextIOS");
        elseif l_UserInputService_0:GetPlatform() == Enum.Platform.Android then
            return v13:FormatByKey("NotificationScript2.Capture.Permission.AlertTextAndroid");
        else
            return v13:FormatByKey("NotificationScript2.Capture.Permission.AlertText");
        end;
    end;
end;
v16.renderWithStyle = function(_, v26)
    return v14(v26);
end;
v16.render = function(v27)
    local l_notificationType_0 = v27.state.notificationType;
    local v29 = false;
    if l_notificationType_0 == v15.Success then
        v29 = v27.state.toastContent;
    end;
    local v30 = false;
    if l_notificationType_0 == v15.Fail then
        v30 = v27.state.toastContent;
    end;
    return v27:renderWithStyle({
        RobloxCaptureNotificationGui = v4.createElement("ScreenGui", {
            AutoLocalize = false, 
            DisplayOrder = 9, 
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            Content = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                [v4.Change.AbsoluteSize] = v27.onScreenSizeChanged
            }, {
                SuccessToast = v29 and v4.createElement(l_Toast_0, {
                    duration = 3, 
                    show = not v27.props.forceDismissToast, 
                    toastContent = v27.state.toastContent
                }), 
                FailToast = v30 and v4.createElement(l_Toast_0, {
                    duration = 3, 
                    show = not v27.props.forceDismissToast, 
                    toastContent = v27.state.toastContent
                }), 
                PermissionAlertOverlay = l_notificationType_0 == v15.Permission and v4.createElement("Frame", {
                    Active = true, 
                    BackgroundColor3 = Color3.new(0, 0, 0), 
                    BackgroundTransparency = 0.5, 
                    Size = UDim2.new(1, 0, 1, 0)
                }, {
                    PermissionAlert = v4.createElement(l_InteractiveAlert_0, {
                        title = v13:FormatByKey("NotificationScript2.Capture.Permission.AlertTitle"), 
                        bodyText = v27.getPermissionAlertBodyText(), 
                        buttonStackInfo = {
                            buttons = {
                                {
                                    buttonType = l_ButtonType_0.PrimarySystem, 
                                    props = {
                                        onActivated = v27.dismissPermissionAlert, 
                                        text = v13:FormatByKey("NotificationScript2.Capture.Permission.AlertButtonText")
                                    }
                                }
                            }
                        }, 
                        position = UDim2.fromScale(0.5, 0.5), 
                        screenSize = v27.state.screenSize
                    })
                }), 
                ScreenshotSavedToAlbumConnection = v12() and v4.createElement(l_ExternalEventConnection_0, {
                    event = game.ScreenshotSavedToAlbum, 
                    callback = v27.screenshotSavedToAlbumCallback
                }), 
                PermissionEventConnection = v27.props.permissionEvent and v4.createElement(l_ExternalEventConnection_0, {
                    event = v27.props.permissionEvent.Event, 
                    callback = v27.permissionEventCallback
                })
            })
        })
    });
end;
v16.didUpdate = function(v31, v32)
    local l_forceDismissToast_0 = v31.props.forceDismissToast;
    if v32.forceDismissToast ~= l_forceDismissToast_0 then
        local v34;
        if v31.state.notificationType ~= v15.Success then
            v34 = false;
            if not (v31.state.notificationType == v15.Fail) then
                goto label0;
            end;
        end;
        v34 = v31.state.toastContent;
        ::label0::;
        if not ((v34 or not l_forceDismissToast_0) or not l_forceDismissToast_0.onDismissed) then
            l_forceDismissToast_0.onDismissed();
        end;
    end;
end;
return v16;
