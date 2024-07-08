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
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v12 = require(l_Modules_0.LuaApp.Thunks.Captcha.GetDxBlob);
local v13 = require(l_Modules_0.LuaApp.Thunks.Captcha.GetCaptchaDataJson);
local v14 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin);
local v15 = game:DefineFastFlag("ConsoleCrossDeviceLoginErrorFix", false);
local function _(v16, v17, v18, v19, v20)
    if not l_getAppFeaturePolicies_0().getUseSingleSignOn() then
        return v5.loginWithCode(v16, v17, v18, v19, v20);
    else
        return v5.singleSignOnConnectWithCode(v16, v17, v18);
    end;
end;
return function(v22, v23, v24, v25, v26, v27, v28)
    return function(v29)
        local v30 = l_getAppFeaturePolicies_0().getUseSingleSignOn();
        local v31 = l_getAppFeaturePolicies_0().getPlatformAccountName();
        local l_v22_0 = v22;
        local l_v23_0 = v23;
        local l_v24_0 = v24;
        return (if not l_getAppFeaturePolicies_0().getUseSingleSignOn() then v5.loginWithCode(l_v22_0, l_v23_0, l_v24_0, v26, v28) else v5.singleSignOnConnectWithCode(l_v22_0, l_v23_0, l_v24_0)):andThen(function(v35)
            assert(v35, "no login attempt result");
            assert(#v35 == 1, "no result or more than one result");
            assert(v8.fromJsonData(v35[1]), "result invalid");
            return v8.fromJsonData(v35[1]);
        end, function(v36)
            local v37 = l_HttpService_0:JSONDecode(v36.Body);
            local v38 = ((v37 and v37.errors) and v37.errors[1]) and v37.errors[1].code;
            local v39 = nil;
            local v40 = nil;
            if v38 == v9.Captcha then
                local _ = v12(v37);
                local _ = nil;
                local v43, v44 = v13(v37);
                v29:dispatch(v7({
                    name = v6.CaptchaNative, 
                    detail = "", 
                    extraProps = {
                        captchaCallback = v25, 
                        captchaType = "login", 
                        cvalueType = "authToken", 
                        captchaId = v43, 
                        cvalue = v23, 
                        dxBlob = v44, 
                        backNavigationDisabledWhileLoading = true
                    }
                }));
            elseif v14() and v38 == v9.SecurityQuestions then
                v40 = "Authentication.Login.Response.SomethingWentWrong";
                if v37.errors[1].fieldData then
                    local v45 = l_HttpService_0:JSONDecode(v37.errors[1].fieldData);
                    if not (not v45.sessionId or not v45.userId) then
                        v39 = v45;
                        v40 = nil;
                    end;
                end;
            end;
            if not (not v15 or not v30) then
                warn("Login ErrorCode:", v38);
                if v38 == v10.AuthError then
                    v38 = v9.ServiceUnavailable;
                    v40 = "Authentication.Login.Response.SomethingWentWrong";
                elseif not (v38 ~= v10.ExternalIdentityAlreadyConnected) or v38 == v10.ExternalIdentityAlreadyConnectedXbox then
                    v38 = v9.ServiceUnavailable;
                    v40 = {
                        "Authentication.Login.Response.AlreadyLinked"; 
                        platform = v31
                    };
                elseif v38 == v10.RelinkingCooldown then
                    v38 = v9.ServiceUnavailable;
                    v40 = {
                        "Authentication.Login.Response.RelinkingFreeze"; 
                        platform = v31
                    };
                end;
            end;
            return v4.reject({
                errorKey = v40, 
                errorCode = v38, 
                securityQuestionsData = v39, 
                securityQuestionsCallback = v27
            });
        end);
    end;
end;
