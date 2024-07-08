local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v8 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v9 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v10 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v11 = require(l_Modules_0.LuaApp.EventStreamConstants);
local _ = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local v13 = v1.PureComponent:extend("AgreeToPhoneNumberVerification");
v13.defaultProps = {
    phoneNumber = ""
};
v13.init = function(v14)
    v14.onConfirm = function()
        v14.props.closeAlert();
        v14.props.verificationChallengeCallback();
        v14.props.authEventAnalytics.reportButtonClicked(v11.Context.SinglePageSignUpScreen, v11.Button.VerifyPhonePrompt);
    end;
end;
v13.render = function(v15)
    return l_withStyle_0(function(v16)
        local l_Theme_0 = v16.Theme;
        local l_containerWidth_0 = v15.props.containerWidth;
        local l_closeAlert_0 = v15.props.closeAlert;
        local _ = v15.props.localization;
        return v6({
            titleText = "Feature.VerificationUpsell.Label.VerifyPhoneNumber", 
            messageText = "Feature.VerificationUpsell.Message.Confirmation", 
            confirmButtonText = "Feature.VerificationUpsell.Action.Ok", 
            cancelButtonText = "Feature.VerificationUpsell.Action.Edit"
        })(function(v21)
            return v1.createElement(v8, {
                theme = l_Theme_0, 
                containerWidth = l_containerWidth_0, 
                titleText = v21.titleText, 
                titleFont = v16.Font.Title.Font, 
                messageText = string.gsub(v21.messageText, "{phoneNumber}", v15.props.phoneNumber), 
                messageFont = v16.Font.Body.Font, 
                buttonFont = v16.Font.Body.Font, 
                confirmButtonText = v21.confirmButtonText, 
                cancelButtonText = v21.cancelButtonText, 
                onConfirm = v15.onConfirm, 
                isConfirming = false, 
                hasCancelButton = true, 
                onCancel = l_closeAlert_0
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    localization = v5, 
    authEventAnalytics = v10
})((v2.connect(nil, function(v22)
    return {
        closeAlert = function()
            return v22(v9());
        end
    };
end)(v13))));
