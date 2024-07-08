local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_NotificationService_0 = game:GetService("NotificationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol).default;
local v7 = require(l_CorePackages_0.Logging);
local v8 = require(l_CorePackages_0.RoactNavigation);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.UIBlox);
local v11 = require(l_Modules_0.LuaApp.Components.BrowserServiceWrapper);
local v12 = require(l_Modules_0.LuaApp.Enum.Challenge.Captcha.ActionType);
local v13 = require(l_Modules_0.LuaApp.Enum.Challenge.Type);
local v14 = require(l_Modules_0.LuaApp.Util.ExecuteJavaScriptInWebView);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppCanNativeWrapperParentHandleBackNavigationChallenge);
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebView);
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppChallengeForceInvisibleCaptchaDev);
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppChallengeForceVisibleCaptchaDev);
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppChallengeShouldIgnoreBackNavigationDisabled);
local l_GetFFlagLuaAppEnableCredentialsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFFlagLuaAppEnableCredentialsProtocol;
local l_GetFIntLuaAppCredentialsProtocolTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolTimeout;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v23 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppChallengeHybridWebViewTimeoutSeconds);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppReportChallengeHybridWebViewResult);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagReplaceBrowserServiceWrapper);
local v26 = require(l_Modules_0.LuaApp.Enum.JavascriptHybrid);
local v27 = require(l_Modules_0.Common.Roact);
local v28 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v29 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v31 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v32 = require(l_Modules_0.LuaApp.Enum.Challenge.TwoStepVerification.ActionType);
local v33 = require(l_Modules_0.LuaApp.Http.Url);
local v34 = require(l_Modules_0.LuaApp.withLocalization);
local v35 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableAsyncAttestationTokenRetrieval);
local l_Constants_0 = v10.App.Style.Constants;
local v37 = v27.PureComponent:extend(script.Name);
local v38 = nil;
pcall(function()
    v38 = game:GetService("AccountService");
end);
v37.validateProps = v9.intersection(v9.interface({
    appContainerNavigation = v9.interface({
        isVisible = v9.boolean, 
        displayOrder = v9.integer
    }), 
    onChallengeAbandoned = v9.callback, 
    onChallengeLoadFailed = v9.callback, 
    forceWebViewVisible = v9.optional(v9.boolean), 
    onChallengeDisplayed = v9.optional(v9.callback), 
    onChallengeUnmounted = v9.optional(v9.callback)
}), v9.union(v9.interface({
    challengeType = v9.literal(v13.Captcha), 
    challengeParameters = v9.strictInterface({
        actionType = v12.isEnumValue, 
        dataExchangeBlob = v9.string, 
        captchaId = v9.string, 
        onChallengeCompleted = v9.callback, 
        onChallengeInvalidated = v9.callback
    })
}), v9.interface({
    challengeType = v9.literal(v13.SecurityQuestions), 
    challengeParameters = v9.strictInterface({
        userId = v9.string, 
        sessionId = v9.string, 
        onChallengeCompleted = v9.callback, 
        onChallengeInvalidated = v9.callback
    })
}), v9.interface({
    challengeType = v9.literal(v13.TwoStepVerification), 
    challengeParameters = v9.strictInterface({
        challengeId = v9.string, 
        userId = v9.string, 
        actionType = v32.isEnumValue, 
        allowRememberDevice = v9.boolean, 
        onChallengeCompleted = v9.callback, 
        onChallengeInvalidated = v9.callback
    })
}), v9.interface({
    challengeType = v9.literal(v13.Reauthentication), 
    challengeParameters = v9.strictInterface({
        onChallengeCompleted = v9.callback, 
        onChallengeInvalidated = v9.callback
    })
}), v9.interface({
    challengeType = v9.literal(v13.Generic), 
    challengeParameters = v9.strictInterface({
        genericChallengeId = v9.string, 
        genericChallengeType = v9.string, 
        genericChallengeMetadata = v9.string, 
        onChallengeCompleted = v9.callback, 
        onChallengeInvalidated = v9.callback
    })
})));
v37.init = function(v39)
    v39:setState({
        challengeDisplayed = false
    });
    v39.webViewLoaded = false;
    v39.challengeInitializationFailed = false;
    v39.completionData = nil;
    v39.invalidationData = nil;
    v39.appType = (function()
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v41 = "unknown";
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
            return "android";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
            return "ios";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
            return "windows";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
            return "osx";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
            return "uwp";
        else
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then
                v41 = "xbox";
            end;
            return v41;
        end;
    end)();
end;
v37.didMount = function(v42)
    v42.isMounted = true;
    local l_analytics_0 = v42.props.analytics;
    local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
    spawn(function()
        local l_UnixTimestampMillis_1 = DateTime.now().UnixTimestampMillis;
        while true do
            if l_UnixTimestampMillis_1 - l_UnixTimestampMillis_0 < v23() * 1000 then
                wait(1);
                if not v42.webViewLoaded then
                    l_UnixTimestampMillis_1 = DateTime.now().UnixTimestampMillis;
                else
                    return ;
                end;
            else
                if l_analytics_0 ~= nil and l_analytics_0.Diag ~= nil then
                    l_analytics_0.Diag:reportCounter("ChallengeHybridWebView_Timeout", 1);
                end;
                if v42.isMounted then
                    v42:navigateBack();
                end;
                return ;
            end;
        end;
    end);
end;
v37.willUnmount = function(v46)
    v46.isMounted = false;
    if v46.props.onChallengeUnmounted ~= nil then
        v46.props.onChallengeUnmounted();
    end;
    local v47 = "Unknown";
    if v46.completionData ~= nil then
        v47 = "Completed";
        v46.props.challengeParameters.onChallengeCompleted(v46.completionData);
    elseif v46.invalidationData ~= nil then
        v47 = "Invalidated";
        v46.props.challengeParameters.onChallengeInvalidated(v46.invalidationData);
    elseif v46.webViewLoaded and not v46.challengeInitializationFailed then
        v47 = "Abandoned";
        v46.props.onChallengeAbandoned();
    else
        v47 = v46.webViewLoaded and "InitializationFailed" or "LoadFailed";
        v46.props.onChallengeLoadFailed();
    end;
    if v24() and v46.props.analytics ~= nil then
        local v48 = v13.toRawValue(v46.props.challengeType):gsub("%-", "");
        if v46.props.analytics.Diag ~= nil then
            v46.props.analytics.Diag:reportCounter(string.format("ChallengeHybridWebView_Result_%s_%s_%s", v47, v46.appType, v48), 1);
        end;
        if v46.props.analytics.EventStream ~= nil then
            v46.props.analytics.EventStream:setRBXEventStream(v47, "challengeHybridWebViewResult", {
                appType = v46.appType, 
                challengeType = v48, 
                queryParameters = v46:getBaseQueryParameters() .. v46:getChallengeTypeQueryParameters()
            });
        end;
    end;
end;
local function v53(v49)
    local v50 = "";
    for v51, v52 in pairs(v49) do
        v50 = v50 .. string.format("%s=%s&", v51, v52);
    end;
    return v50;
end;
v37.getChallengeTypeQueryParameters = function(v54)
    return ({
        [v13.Captcha] = function()
            return (v53({
                ["action-type"] = v12.toRawValue(v54.props.challengeParameters.actionType), 
                ["data-exchange-blob"] = v54.props.challengeParameters.dataExchangeBlob, 
                ["captcha-id"] = v54.props.challengeParameters.captchaId
            }));
        end, 
        [v13.TwoStepVerification] = function()
            return (v53({
                ["challenge-id"] = v54.props.challengeParameters.challengeId, 
                ["user-id"] = v54.props.challengeParameters.userId, 
                ["action-type"] = v32.toRawValue(v54.props.challengeParameters.actionType), 
                ["allow-remember-device"] = not v54.props.challengeParameters.allowRememberDevice and "false" or "true"
            }));
        end, 
        [v13.SecurityQuestions] = function()
            return (v53({
                ["user-id"] = v54.props.challengeParameters.userId, 
                ["session-id"] = v54.props.challengeParameters.sessionId
            }));
        end, 
        [v13.Reauthentication] = function()
            return (v53({}));
        end, 
        [v13.Generic] = function()
            return (v53({
                ["generic-challenge-id"] = v54.props.challengeParameters.genericChallengeId, 
                ["generic-challenge-type"] = v54.props.challengeParameters.genericChallengeType, 
                ["challenge-metadata-json"] = v54.props.challengeParameters.genericChallengeMetadata
            }));
        end
    })[v54.props.challengeType]();
end;
v37.getBaseQueryParameters = function(v55)
    local v56 = {
        ["challenge-type"] = v13.toRawValue(v55.props.challengeType), 
        ["app-type"] = v55.appType, 
        ["dark-mode"] = not (l_NotificationService_0.SelectedTheme == l_Constants_0.ThemeName.Dark) and "false" or "true"
    };
    if v18() then
        v56.fc_nosuppress = "1";
    end;
    if v17() then
        v56.fc_suppress = "1";
    end;
    return (v53(v56));
end;
v37.navigateBack = function(v57)
    v57.props.navigation.goBack();
end;
v37.render = function(v58)
    local l_isVisible_0 = v58.props.appContainerNavigation.isVisible;
    local l_displayOrder_0 = v58.props.appContainerNavigation.displayOrder;
    local v61 = v58.props.forceWebViewVisible and true;
    local l_challengeDisplayed_0 = v58.state.challengeDisplayed;
    local v63 = string.format("%schallenge/cdn/hybrid?%s%s", not not v16(v58.props.challengeParameters.userId) and v33.STATIC_CDN_URL or v33.WWW_URL, v58:getBaseQueryParameters(), v58:getChallengeTypeQueryParameters());
    return v34({
        title = "Feature.AccountSettings.Heading.Tab.Security"
    })(function(v64)
        return v27.createElement(v11, {
            isVisible = l_isVisible_0, 
            displayOrder = l_displayOrder_0, 
            ignoreBackNavigationDisabled = v19(), 
            backNavigationHandledByParent = v15(), 
            webViewVisible = v61 or l_isVisible_0 and l_challengeDisplayed_0, 
            windowClosedCallback = function()
                if not (v25() and l_default_1.isEnabled()) then
                    v58:navigateBack();
                end;
            end, 
            modal = false, 
            isGenericWebview = true, 
            enableOverlayReplacement = true, 
            title = v64.title, 
            url = v63, 
            javaScriptCallback = function(v65)
                if v58.isMounted then
                    local v66 = l_HttpService_0:JSONDecode(v65);
                    if not (not (v66.moduleID == v26.Module.Navigation and v66.functionName == v26.Function.navigateToFeature) or not v66.params) and v66.params.params then
                        if not v58.webViewLoaded then
                            v58.webViewLoaded = true;
                            if v58.props.analytics ~= nil and v58.props.analytics.Diag ~= nil then
                                v58.props.analytics.Diag:reportCounter("ChallengeHybridWebView_NotTimeout", 1);
                            end;
                        end;
                        local l_params_0 = v66.params.params;
                        if l_params_0.feature == v26.Feature.ChallengeParsed and l_params_0.data.parsed == false then
                            v58.challengeInitializationFailed = true;
                            v58:navigateBack();
                            return ;
                        elseif l_params_0.feature == v26.Feature.ChallengeInitialized and l_params_0.data.initialized == false then
                            v58.challengeInitializationFailed = true;
                            v58:navigateBack();
                            return ;
                        elseif l_GetFFlagLuaAppEnableCredentialsProtocol_0() and l_params_0.feature == v26.Feature.CredentialsProtocolAvailable then
                            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v68)
                                v14.Execute(l_params_0.data.callId, (tostring(v68.isAvailable or false)));
                            end):catch(function()
                                v14.Execute(l_params_0.data.callId, "false");
                            end);
                            return ;
                        elseif l_GetFFlagLuaAppEnableCredentialsProtocol_0() and l_params_0.feature == v26.Feature.GetCredentials then
                            l_default_0:getCredentials(l_default_0.CredentialsTypes.FIDO2, l_params_0.data.authenticationOptionsJSON, l_GetFIntLuaAppCredentialsProtocolTimeout_0()):andThen(function(v69)
                                if v69 ~= nil then
                                    v7.warn("Executing javascript on webview to return GetCredentialsResponse");
                                    v14.Execute(l_params_0.data.callId, (l_HttpService_0:JSONEncode(v69)));
                                end;
                            end):catch(function()
                                v14.Execute(l_params_0.data.callId, "");
                            end);
                            return ;
                        elseif l_params_0.feature == v26.Feature.GetIntegrityToken then
                            if not ((not game:GetEngineFeature("AccountService") or not v38) or not v38:DeviceIntegrityAvailable()) then
                                local v70 = if not v35() then v38:GetDeviceIntegrityToken(l_params_0.data.deviceIntegrityParams) else v38:GetDeviceIntegrityTokenYield(l_params_0.data.deviceIntegrityParams);
                                if v70 ~= nil then
                                    v14.Execute(l_params_0.data.callId, (l_HttpService_0:JSONEncode(v70)));
                                    return ;
                                end;
                            end;
                            v14.Execute(l_params_0.data.callId, "");
                            return ;
                        elseif l_params_0.feature == v26.Feature.ChallengeCompleted then
                            v58.completionData = l_params_0.data;
                            v58:navigateBack();
                            return ;
                        elseif l_params_0.feature == v26.Feature.ChallengeInvalidated then
                            v58.invalidationData = l_params_0.data;
                            v58:navigateBack();
                            return ;
                        else
                            if v66.params.params.feature == v26.Feature.ChallengeDisplayed then
                                v58:setState({
                                    challengeDisplayed = true
                                });
                                if v58.props.onChallengeDisplayed ~= nil then
                                    v58.props.onChallengeDisplayed();
                                end;
                            end;
                            return ;
                        end;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end
        });
    end);
end;
return (l_RoactServices_0.connect({
    analytics = v28
})((v29.connect(nil, function(v71)
    return {
        setBackNavigationDisabled = function(v72)
            return v71(v31(v72));
        end
    };
end)((v8.withNavigation(v37))))));
