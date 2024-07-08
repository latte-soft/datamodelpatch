local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.LoginRequests);
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v6 = require(l_Modules_0.LuaApp.Models.Authentication.LoginResult);
local v7 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodes);
local v8 = require(l_Modules_0.LuaApp.Thunks.Captcha.GetDxBlob);
local v9 = require(l_Modules_0.LuaApp.Thunks.Captcha.GetCaptchaDataJson);
local v10 = require(l_Modules_0.LuaApp.Thunks.Authentication.GetMultipleUsersPerCredentialErrorData);
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin);
local v12 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLoginAccountSelector);
return function(v13, v14, v15, v16, v17, v18, v19, v20)
    return function(v21)
        return v3.logByPhone(v13, v14, v15, v17, v19, v20):andThen(function(v22)
            assert(v22, "no login attempt result");
            assert(#v22 == 1, "no result or more than one result");
            assert(v6.fromJsonData(v22[1]), "result invalid");
            return v6.fromJsonData(v22[1]);
        end, function(v23)
            local v24 = l_HttpService_0:JSONDecode(v23.Body);
            local v25 = nil;
            local l_code_0 = v24.errors[1].code;
            local v27 = nil;
            if l_code_0 == v7.IncorrectCValueOrPassword then
                v25 = "Authentication.Login.Response.IncorrectPhoneOrPassword";
            elseif l_code_0 == v7.Captcha then
                local _ = v8(v24);
                local _ = nil;
                local v30, v31 = v9(v24);
                v21:dispatch(v5({
                    name = v4.CaptchaNative, 
                    detail = "", 
                    extraProps = {
                        captchaCallback = v16, 
                        captchaType = "login", 
                        captchaId = v30, 
                        cvalueType = "phonenumber", 
                        cvalue = v14, 
                        dxBlob = v31, 
                        backNavigationDisabledWhileLoading = true
                    }
                }));
            elseif v11() and l_code_0 == v7.SecurityQuestions then
                v25 = "Authentication.Login.Response.SomethingWentWrong";
                if v24.errors[1].fieldData then
                    local v32 = l_HttpService_0:JSONDecode(v24.errors[1].fieldData);
                    if not (not v32.sessionId or not v32.userId) then
                        v27 = v32;
                        v25 = nil;
                    end;
                end;
            elseif v12() and l_code_0 == v7.MultipleUsersPerCredential then
                return v2.reject({
                    errorKey = v25, 
                    errorCode = l_code_0, 
                    usersData = v10(v24)
                });
            elseif l_code_0 == v7.ServiceUnavailable then
                v25 = "Authentication.Login.Response.ServiceUnavailable";
            elseif l_code_0 ~= v7.AccountLocked then
                v25 = "Authentication.Login.Response.LoginWithUsernameUnknownError";
            end;
            return v2.reject({
                errorKey = v25, 
                errorCode = l_code_0, 
                securityQuestionsData = v27, 
                securityQuestionsCallback = v18
            });
        end);
    end;
end;
