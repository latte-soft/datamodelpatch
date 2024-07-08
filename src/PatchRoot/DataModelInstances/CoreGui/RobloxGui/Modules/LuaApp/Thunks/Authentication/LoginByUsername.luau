local l_HttpService_0 = game:GetService("HttpService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Promise);
local v5 = require(l_Modules_0.LuaApp.Http.Requests.LoginRequests);
local v6 = require(l_Modules_0.LuaApp.AppPage);
local v7 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v8 = require(l_Modules_0.LuaApp.Models.Authentication.LoginResult);
local v9 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodes);
local v10 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodeSSO);
local v11 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.LoginByUsernameSSOErrorsTelemetry);
local v12 = require(l_Modules_0.LuaApp.Thunks.Authentication.Util.GetLoginByUsernameErrorMessage);
local v13 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v15 = require(l_Modules_0.LuaApp.Thunks.Captcha.GetDxBlob);
local v16 = require(l_Modules_0.LuaApp.Thunks.Captcha.GetCaptchaDataJson);
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin);
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnableRelinkingCooldownError);
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagBlockTwoSVForNoWebView);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableGenericTwoFAMessage);
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLoginByUsernameSSOErrorsTelemetry);
local v22 = game:DefineFastFlag("ImproveHandlingConsoleErrorMsg", false);
local function _(v23, v24, v25, v26, v27)
    if not l_getAppFeaturePolicies_0().getUseSingleSignOn() then
        return v5.logByUsername(v23, v24, v25, v26, v27);
    else
        return v5.singleSignOnConnectWithCredential(v23, v24, v25, "Username");
    end;
end;
return function(v29, v30, v31, v32, v33, v34, v35)
    return function(v36)
        local v37 = l_getAppFeaturePolicies_0().getUseSingleSignOn();
        local v38 = l_getAppFeaturePolicies_0().getPlatformAccountName();
        local l_v29_0 = v29;
        local l_v30_0 = v30;
        local l_v31_0 = v31;
        return (if not l_getAppFeaturePolicies_0().getUseSingleSignOn() then v5.logByUsername(l_v29_0, l_v30_0, l_v31_0, v33, v35) else v5.singleSignOnConnectWithCredential(l_v29_0, l_v30_0, l_v31_0, "Username")):andThen(function(v42)
            assert(v42, "no login attempt result");
            assert(#v42 == 1, "no result or more than one result");
            local v43 = v8.fromJsonData(v42[1]);
            assert(v43, "result invalid");
            if (not if not v19() then v37 else v37 or not l_getAppFeaturePolicies_0().getWebViewSupport() or not v43) or not v8.hasTwoStepData(v43) then
                return v43;
            else
                return v4.reject({
                    errorCode = v9.ServiceUnavailable, 
                    errorKey = not v20() and "Authentication.Login.Response.Require2FA" or "Authentication.Login.Response.Require2FAGeneric"
                });
            end;
        end, function(v44)
            local v45 = l_HttpService_0:JSONDecode(v44.Body);
            local v46 = nil;
            local l_code_0 = v45.errors[1].code;
            local v48 = nil;
            if l_code_0 == v9.IncorrectCValueOrPassword then
                v46 = "Authentication.Login.Response.IncorrectUsernamePassword";
            elseif l_code_0 == v9.Captcha then
                local _ = v15(v45);
                local _ = nil;
                local v51, v52 = v16(v45);
                v36:dispatch(v7({
                    name = v6.CaptchaNative, 
                    detail = "", 
                    extraProps = {
                        captchaCallback = v32, 
                        captchaType = "login", 
                        captchaId = v51, 
                        cvalueType = "username", 
                        cvalue = v30, 
                        dxBlob = v52, 
                        backNavigationDisabledWhileLoading = true
                    }
                }));
            elseif v17() and l_code_0 == v9.SecurityQuestions then
                v46 = "Authentication.Login.Response.SomethingWentWrong";
                if v45.errors[1].fieldData then
                    local v53 = l_HttpService_0:JSONDecode(v45.errors[1].fieldData);
                    if not (not v53.sessionId or not v53.userId) then
                        v48 = v53;
                        v46 = nil;
                    end;
                end;
            elseif l_code_0 == v9.ServiceUnavailable then
                v46 = "Authentication.Login.Response.ServiceUnavailable";
            elseif l_code_0 ~= v9.AccountLocked then
                v46 = "Authentication.Login.Response.SomethingWentWrong";
            end;
            if v37 then
                warn("Login ErrorCode:", l_code_0);
                local l_l_code_0_0 = l_code_0;
                if not v22 then
                    if l_code_0 == v10.AuthError then
                        l_code_0 = v9.ServiceUnavailable;
                        v46 = "Authentication.Login.Response.SomethingWentWrong";
                    elseif l_code_0 == v10.IncorrectCValueOrPassword then
                        l_code_0 = v9.IncorrectCValueOrPassword;
                        v46 = "Authentication.Login.Response.IncorrectUsernamePassword";
                    elseif l_code_0 == v10.Require2FA then
                        l_code_0 = v9.ServiceUnavailable;
                        v46 = not v20() and "Authentication.Login.Response.Require2FA" or "Authentication.Login.Response.Require2FAGeneric";
                    elseif not (l_code_0 ~= v10.ExternalIdentityAlreadyConnected) or l_code_0 == v10.ExternalIdentityAlreadyConnectedXbox then
                        l_code_0 = v9.ServiceUnavailable;
                        v46 = {
                            "Authentication.Login.Response.AlreadyLinked"; 
                            platform = v38
                        };
                    elseif v18() and l_code_0 == v10.RelinkingCooldown then
                        l_code_0 = v9.ServiceUnavailable;
                        v46 = {
                            "Authentication.Login.Response.RelinkingFreeze"; 
                            platform = v38
                        };
                    end;
                else
                    v46 = v12(l_code_0);
                end;
                if v21() then
                    v13.default:logRobloxTelemetryEvent(v11, nil, {
                        ssoErrorCode = l_l_code_0_0, 
                        msgShown = if not v46[1] then v46 else v46[1]
                    });
                end;
            end;
            return v4.reject({
                errorKey = v46, 
                errorCode = l_code_0, 
                securityQuestionsData = v48, 
                securityQuestionsCallback = v34
            });
        end);
    end;
end;
