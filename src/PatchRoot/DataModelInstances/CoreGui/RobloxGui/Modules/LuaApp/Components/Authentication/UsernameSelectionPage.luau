local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.AppPage);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v10 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpLayout);
local v11 = require(l_Modules_0.LuaApp.Components.Authentication.TextInputValidationWidget);
local v12 = require(l_Modules_0.LuaApp.Thunks.Authentication.UsernameValidator);
local v13 = require(l_Modules_0.LuaApp.Thunks.Authentication.StoreSignUpUsername);
local v14 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpSelectedCharacterWithName);
local v15 = require(l_Modules_0.LuaApp.Enum.UsernameValidationContext);
local v16 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v17 = v3.PureComponent:extend("UsernamePage");
local l_Signup_0 = v15.Signup;
v17.init = function(v19)
    v19.continueButtonActivated = function(v20)
        v19.props.storeSignUpUsername(v19.props.networking, v20, v19.props.birthdayString):andThen(function()
            v19.props.authAnalytics.reportContinueButtonClicked(v16.Context.UsernameScreen);
            v19.props.goToNextPage();
        end);
    end;
    v19.usernameTextBoxDidGainFocus = false;
    v19.textInputOnFocus = function()
        if not v19.usernameTextBoxDidGainFocus then
            v19.usernameTextBoxDidGainFocus = true;
            v19.props.authAnalytics.reportUsernameFocus(v16.Context.UsernameScreen);
        end;
    end;
    v19.renderWidget = function(v21)
        return v3.createElement(v11, (v2.Dictionary.join(v21, {
            continueButtonActivated = v19.continueButtonActivated, 
            textInputType = Enum.TextInputType.NoSuggestions, 
            returnKeyType = Enum.ReturnKeyType.Next, 
            captureFocusOnMount = true, 
            textInputOnFocus = v19.textInputOnFocus, 
            validator = v12, 
            validatorAdditionalProps = {
                birthday = v19.props.birthdayString, 
                context = l_Signup_0
            }
        })));
    end;
    v19.props.authAnalytics.reportScreenLoaded(v16.Context.UsernameScreen);
end;
v17.render = function(v22)
    return v3.createElement(v10, {
        titleTextKey = "Authentication.SignUp.Heading.UsernamePage", 
        paragraphTextKeys = {
            "Authentication.SignUp.Description.UsernamePage"
        }, 
        showDisclaimerLinks = true, 
        renderWidget = v22.renderWidget, 
        renderCharacter = function()
            return v3.createElement(v14);
        end
    });
end;
return l_RoactServices_0.connect({
    networking = v8, 
    authAnalytics = v7
})((v4.connect(function(v23, _)
    return {
        birthdayString = v23.SignUpInfo.SignUpBirthday:FormatForEndpoint()
    };
end, function(v25)
    return {
        storeSignUpUsername = function(v26, v27, v28)
            return v25(v13(v26, v27, v28, l_Signup_0));
        end, 
        goToNextPage = function()
            return v25(v9({
                name = v5.PasswordSelectionPage
            }));
        end
    };
end)(v17)));
