local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local v1 = require(script.Parent.EditDescriptionModal);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local v5 = require(l_script_FirstAncestor_0.Networking.UsersNetworking);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_HttpService_0 = game:GetService("HttpService");
local v12 = require(l_script_FirstAncestor_0.Flags.EditProfileIXP);
local v13 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v13.EventNames;
local l_useAnalytics_0 = v13.useAnalytics;
return function(v16)
    local v17 = l_useDispatch_0();
    local v18 = l_useScreenSize_0();
    local v19 = l_useLocalUserId_0();
    local v20 = v16.navigation.getParam("setDescription");
    local v21, v22 = v3.useState(false);
    local v23, v24 = v3.useState(false);
    local v25 = if not if not v16.IXPNotEnabled then v12.useIsExperimentEnabled() else false then nil else l_useAnalytics_0();
    local v26 = l_useLocalization_0({
        About = v10.About, 
        Caption = v10.AboutModalCaption, 
        ThrottleError = v10.TooManyAttemptsTryAgainLater
    });
    return v3.createElement(v1, {
        screenSize = v18, 
        title = v26.About, 
        description = v26.Caption, 
        throttleErrorText = v26.ThrottleError, 
        initialText = v16.navigation.getParam("initialText"), 
        cancelOnActivated = function()
            v16.navigation.goBack();
        end, 
        saveOnActivated = function(v27)
            return v17(v5.SetDescription.API(v19, v27)):andThen(function(v28)
                v20(l_getDeepValue_0(v28, "responseBody.description"));
                v16.navigation.goBack();
            end):catch(function(v29)
                local v30 = l_HttpService_0:JSONDecode(v29.Body);
                if v30.errors[1].code == 2 then
                    if v25 then
                        v25.fireAnalyticsEvent(l_EventNames_0.DescriptionPINBlocked);
                    end;
                    v22(true);
                    return ;
                else
                    if v30.errors[1].code == 0 then
                        v24(true);
                    end;
                    return ;
                end;
            end);
        end, 
        textError = v21, 
        throttleError = v23
    });
end;
