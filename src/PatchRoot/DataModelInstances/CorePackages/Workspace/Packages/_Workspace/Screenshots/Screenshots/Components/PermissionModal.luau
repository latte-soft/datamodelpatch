local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local l_default_0 = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol.default;
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RobloxAppHooks);
local v6 = require(l_Parent_1.UIBlox);
local l_useCallback_0 = v4.useCallback;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useScreenSize_0 = v5.useScreenSize;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v11 = require(l_Parent_0.Analytics.EventNames);
local v12 = require(l_Parent_0.Analytics.useAnalytics);
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
return function(v15)
    local v16 = l_useScreenSize_0();
    local v17 = l_useStyle_0();
    local v18 = v12();
    local v19 = l_useLocalization_0({
        alertBody = "Feature.Captures.Description.AllowPhotoAccessInfo", 
        alertTitle = "Feature.Captures.Title.AllowPhotoAccessInfo", 
        accessDeniedCTA = "Feature.Captures.Action.AllowPhotoAccessDeclined", 
        accessAllowedCTA = "Feature.Captures.Action.AllowPhotoAccessAccepted"
    });
    local l_Theme_0 = v17.Theme;
    return v4.createElement("Frame", {
        Active = true, 
        BackgroundColor3 = l_Theme_0.Overlay.Color, 
        BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
        Size = UDim2.new(1, 0, 1, 0), 
        Visible = v15.visible, 
        ZIndex = v15.zIndex
    }, {
        Alert = v4.createElement(l_InteractiveAlert_0, {
            bodyText = v19.alertBody, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = l_useCallback_0(function()
                                v18.fireEvent(v11.CapturesSavePermissionModalCancelPressed);
                                v15.closeModal();
                            end, {
                                v15.closeModal
                            }), 
                            text = v19.accessDeniedCTA
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = l_useCallback_0(function()
                                l_default_0:requestPermissions({
                                    l_default_0.Permissions.WRITE_MEDIA_STORAGE
                                });
                                v18.fireEvent(v11.CapturesSavePermissionModalAllowPressed);
                                v15.closeModal();
                            end, {
                                v15.closeModal
                            }), 
                            text = v19.accessAllowedCTA
                        }
                    }
                }
            }, 
            isMiddleContentFocusable = false, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = v16, 
            title = v19.alertTitle
        })
    });
end;
