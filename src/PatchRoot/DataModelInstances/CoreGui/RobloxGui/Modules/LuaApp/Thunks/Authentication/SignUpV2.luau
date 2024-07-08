local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_Modules_0.LuaApp.Promise);
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(script.Parent.User);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v10 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v11 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v12 = require(l_Modules_0.LuaApp.Http.Requests.SignUpRequests);
local v13 = require(l_Modules_0.LuaApp.Enum.SignUpV2ErrorCodes);
local v14 = require(l_Modules_0.LuaApp.Enum.VerifiedSignupErrorCodes);
local v15 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v16 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v18 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v19 = require(l_Modules_0.LuaApp.Analytics.Events.AppSignupCounterNames);
local v20 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v23 = require(l_Modules_0.LuaApp.Thunks.Captcha.GetDxBlob);
local v24 = require(l_Modules_0.LuaApp.Thunks.Captcha.GetCaptchaData);
local v25 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v26 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v27 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local v29 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v30 = require(l_Modules_0.LuaApp.Flags.FFlagLuaEnableDidSwitchAccount);
local v31 = require(l_Modules_0.LuaApp.Flags.GetFFlagPasskeySignupLogErrorBody);
local v32 = require(l_Modules_0.LuaApp.Flags.GetFFlagConditionallyFireAuthenticatedCredentials);
local v33 = require(l_Modules_0.LuaApp.Thunks.Authentication.RegisterPasskey);
local v34 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v35 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetAppState);
local v36 = require(l_Modules_0.LuaApp.Constants);
local v37 = v5.interface({
    birthday = v5.string, 
    username = v5.string, 
    password = v5.string, 
    gender = v5.string, 
    locale = v5.optional(v5.string), 
    email = v5.optional(v5.string), 
    verifiedSignupVoucher = v5.optional(v5.string)
});
local function v42(v38, v39, v40, v41)
    if not l_getAppFeaturePolicies_0().getUseSingleSignOn() then
        if not v41 then
            return v12.signUpV2(v38, v39, v40);
        else
            return v12.verifiedSignup(v38, v39, v40);
        end;
    else
        return v12.singleSignOnSignup(v38, v39);
    end;
end;
return function(v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55)
    return function(v56)
        assert(v37(v50));
        local function v59(v57)
            if v29 == true then
                local v58 = v8.fromLocalStorage();
                if not (v58 and v58.userId ~= -1) then
                    v27.setAccountBlob(v57.responseBody.accountBlob);
                    v27.flush();
                    v56:dispatch(v10(v43, v44, v48, v49, v20.SignUp));
                    return ;
                else
                    v35();
                    v27.setAccountSwitchStatus(v36.Auth.AccountSwitcherSwitchedStatus);
                    v27.setAccountBlob(v57.responseBody.accountBlob);
                    v27.flush();
                    if not v30 then
                        l_GuiService_0:BroadcastNotification("", v15.DID_LOG_OUT);
                        return ;
                    else
                        l_GuiService_0:BroadcastNotification("", v15.DID_SWITCH_ACCOUNT);
                        return ;
                    end;
                end;
            else
                v56:dispatch(v10(v43, v44, v48, v49, v20.SignUp));
                return ;
            end;
        end;
        return v42(v43, v50, v47, v51):andThen(function(v60)
            v45:BroadcastNotification("", v15.DID_SIGN_UP);
            v18(v19.Success, 1);
            local v61 = (v50.username and v50.password) and string.len(v50.password) > 0;
            if not (v32() and not v61) then
                l_MemStorageService_0:Fire(v16.AuthenticatedCredentials, l_HttpService_0:JSONEncode({
                    cvalue = v50.username, 
                    password = v50.password, 
                    authType = "signup"
                }));
            end;
            if not (not v54 or not v50.password) then
                l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, l_HttpService_0:JSONEncode({
                    username = v50.username, 
                    password = v50.password
                }), 120):andThen(function(v62)
                    local v63 = if not v62 then {} else l_HttpService_0:JSONDecode(v62);
                    if v63 and v63.errorCode == nil then
                        l_Logger_0:info("Successfully registered password.");
                        return ;
                    else
                        l_Logger_0:warning("Error registering password: ", v63.errorMsg);
                        return ;
                    end;
                end, function(v64)
                    l_Logger_0:warning("Error registering password: ", v64);
                end);
            end;
            if v52 then
                v27.setSignupActionRequired("auth");
                if v53 then
                    return v33(v43):andThen(function(_)
                        v27.setSignupActionRequired("");
                        v55.reportAuthModalShown(v34.Context.SignupPasskeyCreated, "success");
                        v27.flush();
                        v59(v60);
                        return v6.resolve();
                    end, function(v66)
                        if not v66.name then
                            v55.reportAuthModalShown(v34.Context.SignupPasskeyCreated, "unknown");
                        else
                            v55.reportAuthModalShown(v34.Context.SignupPasskeyCreated, v66.name);
                            if v31() and type(v66.body) == "string" then
                                v55.reportAuthClientError(v34.Context.SignupPasswordFallbackPasskeyCreated, v66.body);
                            end;
                        end;
                        v27.flush();
                        v59(v60);
                        return v6.resolve();
                    end);
                end;
            end;
            v27.flush();
            v59(v60);
            return v6.resolve();
        end, function(v67)
            local l_status_0, l_result_0 = pcall(function()
                return l_HttpService_0:JSONDecode(v67.Body);
            end);
            if not l_status_0 then
                v56:dispatch(v11({
                    HttpError = Enum.HttpError.OK
                }));
                return v6.reject();
            else
                local v70 = (l_result_0.errors and l_result_0.errors[1]) and l_result_0.errors[1].code;
                v18(v19.Failure, 1);
                local v71 = not not v51 and v14 or v13;
                if v70 and v70 == v71.Captcha then
                    v18(v19.FailureCaptcha, 1);
                elseif v70 and v70 == v71.TooManyAttempts then
                    v18(v19.FailureThrottled, 1);
                elseif v70 and v70 == v71.InvalidBirthdate then
                    v18(v19.FailureBirthdayInvalid, 1);
                elseif v70 and v70 == v71.InvalidUsername then
                    v18(v19.FailureUsernameInvalid, 1);
                elseif v70 and v70 == v71.UsernameAlreadyTaken then
                    v18(v19.FailureUsernameTaken, 1);
                elseif v70 and v70 == v71.InvalidPassword then
                    v18(v19.FailurePasswordInvalid, 1);
                elseif v70 and v70 == v71.UsernameAndPasswordTheSame then
                    v18(v19.FailurePasswordMatchesUsername, 1);
                elseif v70 and v70 == v71.PasswordTooSimple then
                    v18(v19.FailurePasswordTooSimple, 1);
                elseif v67.HttpError == Enum.HttpError.OK and v67.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS then
                    v18(v19.FailureThrottled, 1);
                elseif v67.HttpError == Enum.HttpError.OK and v67.StatusCode == l_StatusCodes_0.INTERNAL_SERVER_ERROR then
                    v18(v19.FailureInternalServerError, 1);
                elseif v67.HttpError == Enum.HttpError.OK and v67.StatusCode == l_StatusCodes_0.BAD_REQUEST then
                    v18(v19.FailureBadRequest, 1);
                elseif v67.HttpError == Enum.HttpError.OK and v67.StatusCode == l_StatusCodes_0.NOT_FOUND then
                    v18(v19.FailureNotFound, 1);
                else
                    v18(v19.FailureUnknownError, 1);
                end;
                if v70 == v71.Captcha then
                    local _ = v23(l_result_0);
                    local _ = "";
                    local v74, v75 = v24(l_result_0);
                    v56:dispatch(v9({
                        name = v7.CaptchaNative, 
                        detail = "", 
                        extraProps = {
                            captchaCallback = v46, 
                            captchaType = "signup", 
                            captchaId = v74, 
                            dxBlob = v75, 
                            backNavigationDisabledWhileLoading = true
                        }
                    }));
                elseif v70 == v71.InvalidEmail then
                    v56:dispatch(v25({
                        toastType = v26.NetworkingError, 
                        toastMessage = "Authentication.SignUp.Response.InvalidEmail"
                    }));
                elseif v70 == v71.InvalidPassword then
                    v56:dispatch(v25({
                        toastType = v26.NetworkingError, 
                        toastMessage = "Authentication.SignUp.Response.PasswordComplexity"
                    }));
                elseif not (not (not (v29 == true) or v70 ~= v71.EmptyAccountSwitchBlobRequired) or v70 == v71.ParentEmptyAccountSwitchBlobRequired) then
                    v56:dispatch(v11({
                        HttpError = Enum.HttpError.OK
                    }));
                end;
                return v6.reject(v70);
            end;
        end);
    end;
end;
