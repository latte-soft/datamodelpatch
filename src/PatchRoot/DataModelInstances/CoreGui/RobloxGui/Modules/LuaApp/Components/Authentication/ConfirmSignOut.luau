local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local v7 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v8 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v9 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v9.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local v12 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local l_GetFFlagLuaAppUseUIBloxColorPalettes_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppUseUIBloxColorPalettes;
local l_GetUIBloxUseNewThemeColorPalettes_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetUIBloxUseNewThemeColorPalettes;
local v15 = v1.PureComponent:extend("ConfirmSignOut");
v15.render = function(v16)
    local l_theme_0 = v16.props.theme;
    local l_containerWidth_0 = v16.props.containerWidth;
    local l_closeAlert_0 = v16.props.closeAlert;
    local l_continueFunc_0 = v16.props.continueFunc;
    local l_localization_0 = v16.props.localization;
    local function v23(v22)
        return v1.createElement(v7, {
            theme = l_theme_0, 
            containerWidth = l_containerWidth_0, 
            titleText = v22.titleText, 
            titleFont = l_theme_0.AlertWindow.Title.Font, 
            messageText = v22.messageText, 
            messageFont = l_theme_0.AlertWindow.Title.Font, 
            buttonFont = l_theme_0.AlertWindow.Button.Font, 
            confirmButtonText = v22.confirmButtonText, 
            onConfirm = l_continueFunc_0, 
            isConfirming = false, 
            hasCancelButton = true, 
            onCancel = l_closeAlert_0
        });
    end;
    if not (not l_GetFFlagLuaAppUseUIBloxColorPalettes_0() or not l_GetUIBloxUseNewThemeColorPalettes_0()) then
        v23 = function(v24)
            return v1.createElement(l_InteractiveAlert_0, {
                screenSize = Vector2.new(l_containerWidth_0, 0), 
                title = v24.titleText, 
                bodyText = v24.messageText, 
                buttonStackInfo = {
                    buttons = {
                        {
                            props = {
                                text = v24.cancelButtonText, 
                                onActivated = l_closeAlert_0
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                text = v24.confirmButtonText, 
                                onActivated = l_continueFunc_0
                            }
                        }
                    }
                }
            });
        end;
    end;
    if not v12() then
        return v23({
            titleText = l_localization_0:Format("Application.Logout.Title.Logout"), 
            messageText = l_localization_0:Format("Application.Logout.Message.Confirmation"), 
            confirmButtonText = l_localization_0:Format("Application.Logout.Action.Logout"), 
            cancelButtonText = l_localization_0:Format("Feature.GamePage.LabelCancelField")
        });
    else
        return v6({
            titleText = "Application.Logout.Title.Logout", 
            messageText = "Application.Logout.Message.Confirmation", 
            confirmButtonText = "Application.Logout.Action.Logout", 
            cancelButtonText = "Feature.GamePage.LabelCancelField"
        })(v23);
    end;
end;
return (l_RoactServices_0.connect({
    localization = v5
})((v2.connect(nil, function(v25)
    return {
        closeAlert = function()
            return v25(v8());
        end
    };
end)(v15))));
