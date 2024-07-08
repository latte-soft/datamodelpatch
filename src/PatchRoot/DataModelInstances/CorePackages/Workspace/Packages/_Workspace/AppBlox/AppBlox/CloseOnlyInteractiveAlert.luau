local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
return function(v7)
    return v1.createElement(l_InteractiveAlert_0, {
        screenSize = l_useScreenSize_0(), 
        title = v7.title, 
        bodyText = v7.body, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v7.closeAlert, 
                        text = v7.buttonText or l_useLocalization_0({
                            closeButtonText = "Feature.ProfileBadges.action.close"
                        }).closeButtonText
                    }
                }
            }
        }
    });
end;
