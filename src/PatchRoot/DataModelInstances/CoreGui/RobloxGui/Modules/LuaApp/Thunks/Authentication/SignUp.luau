local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v5 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v6 = require(l_Modules_0.LuaApp.Promise);
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_Modules_0.LuaApp.Enum.SignUpErrorCodes);
local v9 = require(l_Modules_0.LuaApp.Thunks.Authentication.SignUpRedirectToLandingPage);
local v10 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v11 = require(l_Modules_0.LuaApp.Http.Requests.SignUpRequests);
local v12 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v13 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v14 = require(l_Modules_0.LuaApp.Actions.Authentication.ClearSignUpInfo);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v16 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v17 = require(l_Modules_0.LuaApp.Analytics.Events.AppSignupCounterNames);
local v18 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v19 = require(l_Modules_0.LuaApp.Thunks.Captcha.GetDxBlob);
local v20 = require(l_Modules_0.LuaApp.Thunks.Captcha.GetCaptchaData);
local v21 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v22 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v23 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v24 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
return function(v25, v26, v27, v28, v29, v30, v31)
    return function(v32)
        local l_SignUpInfo_0 = v32:getState().SignUpInfo;
        local l_SignUpUsername_0 = l_SignUpInfo_0.SignUpUsername;
        local l_SignUpPassword_0 = l_SignUpInfo_0.SignUpPassword;
        return v11.signUp(v25, l_SignUpUsername_0, l_SignUpPassword_0, l_SignUpInfo_0.SignUpBirthday:FormatForEndpoint(), l_SignUpInfo_0.SignUpSelectedBundleId, v29):andThen(function(v36)
            v27:BroadcastNotification("", v12.DID_SIGN_UP);
            v16(v17.Success, 1);
            l_MemStorageService_0:Fire(v13.AuthenticatedCredentials, l_HttpService_0:JSONEncode({
                cvalue = l_SignUpUsername_0, 
                password = l_SignUpPassword_0, 
                authType = "signup"
            }));
            if v24 then
                v23.setAccountBlob(v36.responseBody.accountBlob);
                v23.flush();
            end;
            v32:dispatch(v14());
            v32:dispatch(v4(v25, v26, v30, v31, v18.SignUp));
            return v6.resolve();
        end, function(v37)
            local v38 = l_HttpService_0:JSONDecode(v37.Body);
            local v39 = (v38.errors and v38.errors[1]) and v38.errors[1].code;
            v16(v17.Failure, 1);
            if v39 == v8.Captcha then
                v16(v17.FailureCaptcha, 1);
            elseif v39 == v8.InvalidBirthdate then
                v16(v17.FailureBirthdayInvalid, 1);
            elseif v39 == v8.InvalidPassword then
                v16(v17.FailurePasswordInvalid, 1);
            elseif v39 == v8.InvalidUsername then
                v16(v17.FailureUsernameInvalid, 1);
            elseif v39 == v8.UsernameAndPasswordTheSame then
                v16(v17.FailurePasswordMatchesUsername, 1);
            elseif v39 == v8.UsernameAlreadyTaken then
                v16(v17.FailureUsernameTaken, 1);
            elseif v39 == v8.TokenValidationFailed then
                v16(v17.FailureTokenValidationFailed, 1);
            elseif v37.HttpError == Enum.HttpError.OK and v37.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS then
                v16(v17.FailureThrottled, 1);
            elseif v37.HttpError == Enum.HttpError.OK and v37.StatusCode == l_StatusCodes_0.INTERNAL_SERVER_ERROR then
                v16(v17.FailureInternalServerError, 1);
            elseif v37.HttpError == Enum.HttpError.OK and v37.StatusCode == l_StatusCodes_0.BAD_REQUEST then
                v16(v17.FailureBadRequest, 1);
            elseif v37.HttpError == Enum.HttpError.OK and v37.StatusCode == l_StatusCodes_0.NOT_FOUND then
                v16(v17.FailureNotFound, 1);
            else
                v16(v17.FailureUnknownError, 1);
            end;
            if v39 == v8.Captcha then
                local _ = v19(v38);
                local _ = "";
                local v42, v43 = v20(v38);
                v32:dispatch(v10({
                    name = v7.CaptchaNative, 
                    detail = "", 
                    extraProps = {
                        captchaCallback = v28, 
                        captchaType = "signup", 
                        captchaId = v42, 
                        dxBlob = v43, 
                        backNavigationDisabledWhileLoading = true
                    }
                }));
            elseif not (v39 ~= v8.UsernameAlreadyTaken) or v39 == v8.BundleIdNotValid then
                v32:dispatch(v5({
                    HttpError = Enum.HttpError.OK
                }));
                v32:dispatch(v9());
            elseif v39 == v8.InvalidPassword then
                v32:dispatch(v21({
                    toastType = v22.NetworkingError, 
                    toastMessage = "Authentication.SignUp.Response.PasswordComplexity"
                }));
            else
                v32:dispatch(v5({
                    HttpError = Enum.HttpError.OK
                }));
            end;
            return v6.reject(v39);
        end);
    end;
end;
