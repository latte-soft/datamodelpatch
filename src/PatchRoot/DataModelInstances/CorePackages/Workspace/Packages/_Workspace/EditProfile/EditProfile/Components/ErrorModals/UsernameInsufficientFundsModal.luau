local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v9 = utf8.char(57346);
return function(v10)
    local v11 = l_useScreenSize_0();
    local v12 = l_useLocalization_0({
        cancelButtonText = v6.CancelButtonText, 
        buy = v6.Buy, 
        insufficientFunds = v6.InsufficientFunds, 
        message = {
            v6.InsufficientFundsMessage; 
            icon = v9, 
            rbx = v10.navigation.getParam("robux")
        }
    });
    return v2.createElement(l_InteractiveAlert_0, {
        screenSize = v11, 
        title = v12.insufficientFunds, 
        bodyText = v12.message, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = function()
                            v10.navigation.goBack();
                        end, 
                        text = v12.cancelButtonText
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v10.navigation.getParam("navigateDownToPurchaseRobux"), 
                        text = v12.buy
                    }
                }
            }
        }
    });
end;
