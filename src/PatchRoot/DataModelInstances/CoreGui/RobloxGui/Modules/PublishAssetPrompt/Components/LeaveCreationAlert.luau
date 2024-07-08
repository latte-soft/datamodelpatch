local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.UIBlox);
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
local v5 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local v6 = require(l_CorePackages_0.Packages.React);
return function(v7)
    return v6.createElement(l_InteractiveAlert_0, {
        title = "Leave Creation?", 
        bodyText = v5:FormatByKey("CoreScripts.PublishCommon.UnsavedWarning"), 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v7.closePrompt, 
                        text = v5:FormatByKey("CoreScripts.PublishCommon.Leave")
                    }, 
                    isDefaultChild = false
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v7.cancelClosePrompt, 
                        text = v5:FormatByKey("CoreScripts.PublishCommon.Stay")
                    }, 
                    isDefaultChild = true
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v7.screenSize
    });
end;
