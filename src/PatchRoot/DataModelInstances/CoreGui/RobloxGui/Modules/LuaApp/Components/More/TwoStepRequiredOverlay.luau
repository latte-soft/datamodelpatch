local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local _ = require(l_CorePackages_0.Cryo);
local _ = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_Images_0 = v5.App.ImageSet.Images;
local v9 = require(l_Modules_0.LuaApp.withLocalization);
local v10 = game:DefineFastFlag("AETwoFactorLogOutMessage", false);
return function(v11)
    local l_closePrompt_0 = v11.closePrompt;
    local l_navigateToSecuritySettings_0 = v11.navigateToSecuritySettings;
    return v9({
        title = "Authentication.TwoStepVerification.Title.VerificationRequired", 
        message = not v10 and "Authentication.TwoStepVerification.Label.TwoStepRequired" or "Authentication.TwoStepVerification.Label.TwoStepRequiredLogout", 
        cancel = "Feature.Catalog.Action.Cancel", 
        gotoSecurity = "Authentication.TwoStepVerification.Action.GoToSecurity"
    })(function(v14)
        return v2.createElement(l_InteractiveAlert_0, {
            title = v14.title, 
            titleIcon = l_Images_0["icons/status/error_large"], 
            bodyText = v14.message, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = l_closePrompt_0, 
                            text = v14.cancel
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = l_navigateToSecuritySettings_0, 
                            text = v14.gotoSecurity
                        }
                    }
                }
            }, 
            screenSize = v11.screenSize
        });
    end);
end;
