local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local v7 = require(l_CorePackages_0.Packages.t);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_AppUpdateService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUpdateService;
local v12 = require(l_Modules_0.LuaApp.withLocalization);
local v13 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local v14 = require(l_Modules_0.LuaApp.Actions.SetScreenGuiBlur);
local v15 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v16 = require(l_Modules_0.LuaApp.Constants);
local l_GetFFlagMoveUpdateCheckToUniversalApp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagMoveUpdateCheckToUniversalApp;
local v18 = v2.PureComponent:extend("UpdateRequiredPrompt");
if l_GetFFlagMoveUpdateCheckToUniversalApp_0() then
    v18.validateProps = v7.interface({
        canPerformBinaryUpdate = v7.optional(v7.boolean), 
        closeOverlay = v7.callback, 
        screenSize = v7.Vector2, 
        setScreenGuiBlur = v7.callback, 
        appUpdateService = v7.table
    });
end;
v18.init = function(v19)
    v19.performManagedUpdate = function()
        v19.props.appUpdateService:performManagedUpdate();
    end;
end;
v18.render = function(v20)
    if not l_GetFFlagMoveUpdateCheckToUniversalApp_0() then
        return v12({
            titleText = "CommonUI.Controls.Label.ForceUpdateTitle", 
            bodyText = "CommonUI.Controls.Label.ForceUpdateBody", 
            buttonText = "CommonUI.Controls.Action.CloseRoblox"
        })(function(v21)
            return v20.props.enabled and v2.createElement(v2.Portal, {
                target = l_CoreGui_0
            }, {
                UpdateRequiredPrompt = v2.createElement(v13, {
                    IgnoreGuiInset = true, 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    DisplayOrder = v16.DisplayOrder.UpdateRequiredPrompt, 
                    OnTopOfCoreBlur = true
                }, {
                    Overlay = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundColor3 = v16.Color.BLACK, 
                        BackgroundTransparency = 0, 
                        Active = true, 
                        Selectable = false
                    }, {
                        AlertWindow = v2.createElement(l_InteractiveAlert_0, {
                            title = v21.titleText, 
                            bodyText = v21.bodyText, 
                            buttonStackInfo = {
                                buttons = {
                                    {
                                        buttonType = l_ButtonType_0.PrimarySystem, 
                                        props = {
                                            onActivated = v20.performManagedUpdate, 
                                            text = v21.buttonText
                                        }
                                    }
                                }
                            }, 
                            screenSize = v20.props.screenSize
                        })
                    })
                })
            });
        end);
    else
        return v12({
            titleText = "CommonUI.Controls.Label.ForceUpdateTitle", 
            bodyText = "CommonUI.Controls.Label.ForceUpdateBody", 
            buttonText = "CommonUI.Controls.Action.CloseRoblox", 
            cancelButtonText = "Feature.GamePage.LabelCancelField"
        })(function(v22)
            return (v2.createElement(l_InteractiveAlert_0, {
                screenSize = v20.props.screenSize, 
                title = v22.titleText, 
                bodyText = v22.bodyText, 
                buttonStackInfo = {
                    buttons = {
                        if not v20.props.canPerformBinaryUpdate then {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                text = v22.cancelButtonText, 
                                onActivated = v20.props.closeOverlay
                            }
                        } else {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                text = v22.buttonText, 
                                onActivated = v20.performManagedUpdate
                            }
                        }
                    }
                }
            }));
        end);
    end;
end;
v18.updateBlur = function(v23)
    v23.props.setScreenGuiBlur(if not l_GetFFlagMoveUpdateCheckToUniversalApp_0() then v23.props.enabled else false);
end;
v18.didMount = function(v24)
    v24:updateBlur();
end;
v18.didUpdate = function(v25)
    v25:updateBlur();
end;
v18.willUnmount = function(v26)
    v26.props.setScreenGuiBlur(false);
end;
return l_RoactServices_0.connect({
    analytics = v10, 
    appUpdateService = l_AppUpdateService_0
})((v3.connect(function(v27, _)
    return {
        screenSize = v27.ScreenSize, 
        enabled = v27.AppUpdateStatus.status == Enum.AppUpdateStatus.Available
    };
end, function(v29)
    return {
        setScreenGuiBlur = function(v30)
            v29(v14("UpdateRequiredPrompt", v30, v16.DisplayOrder.UpdateRequiredPrompt));
        end, 
        closeOverlay = if not l_GetFFlagMoveUpdateCheckToUniversalApp_0() then nil else function()
            v29(v15());
        end
    };
end)(v18)));
