local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.Authentication.EmailVerification.CheckEmailVerification);
local v2 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v3 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
return function(v5, v6)
    return function(v7)
        return v7:dispatch(v1(v5, true, {
            addEmailOver13TextKey = "Feature.VerificationUpsell.Description.LogoutAddEmailTextOver13", 
            addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.LogoutAddEmailTextUnder13", 
            addEmailTitleKey = "Feature.VerificationUpsell.Heading.VerifyOnLogout", 
            updateEmailSecondaryButtonText = "Feature.VerificationUpsell.Action.Logout", 
            origin = "logout", 
            onUpdateEmailSecondaryButtonPressedEvent = v3.Button.SkipLogOutAnyway, 
            onUpdateEmailSecondaryButtonPressed = function()
                v7:dispatch(v2(v5, v6, v4.EmailUpsellLogOut));
            end
        }));
    end;
end;
