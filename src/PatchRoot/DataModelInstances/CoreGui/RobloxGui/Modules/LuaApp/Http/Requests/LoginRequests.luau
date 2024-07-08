local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Url);
local v4 = require(l_Modules_0.LuaApp.Components.Authentication.SingleSignOn.getSingleSignOnUrls);
local l_ConsoleAuthRequestWrapper_0 = require(l_CorePackages_0.Workspace.Packages.Http).Utils.ConsoleAuthRequestWrapper;
local l_HttpService_0 = game:GetService("HttpService");
local v7 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v8 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodes);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLoginAccountSelector);
local v11 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v12 = {};
getLoginUrl = function()
    return string.format("%sv2/login", v3.AUTH_URL);
end;
v12.logByPasskey = function(v13, v14, v15)
    return v13(getLoginUrl(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            ctype = "Passkey", 
            cvalue = l_HttpService_0:JSONEncode(v14), 
            password = v15, 
            accountBlob = not not v11 and v7.getAccountBlob() or nil
        }), 
        maxRetryCount = 0
    });
end;
v12.logByUsername = function(v16, v17, v18, v19, v20)
    return v16(getLoginUrl(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            ctype = "Username", 
            cvalue = v17, 
            password = v18, 
            captchaToken = not not v19 and v19.captchaToken or nil, 
            captchaProvider = not not v19 and v19.captchaProvider or nil, 
            captchaId = not not v19 and v19.captchaId or nil, 
            securityQuestionSessionId = (not not v9() and v20) and v20.sessionId or nil, 
            securityQuestionRedemptionToken = (not not v9() and v20) and v20.redemptionToken or nil, 
            accountBlob = not not v11 and v7.getAccountBlob() or nil
        }), 
        maxRetryCount = 0
    });
end;
v12.logByEmail = function(v21, v22, v23, v24, v25, v26)
    return v21(getLoginUrl(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            ctype = "Email", 
            cvalue = v22, 
            password = v23, 
            captchaToken = not not v24 and v24.captchaToken or nil, 
            captchaProvider = not not v24 and v24.captchaProvider or nil, 
            captchaId = not not v24 and v24.captchaId or nil, 
            securityQuestionSessionId = (not not v9() and v25) and v25.sessionId or nil, 
            securityQuestionRedemptionToken = (not not v9() and v25) and v25.redemptionToken or nil, 
            userId = not not v10() and v26 or nil, 
            accountBlob = not not v11 and v7.getAccountBlob() or nil
        }), 
        maxRetryCount = 0
    });
end;
v12.logByPhone = function(v27, v28, v29, v30, v31, v32)
    return v27(getLoginUrl(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            ctype = "PhoneNumber", 
            cvalue = v28, 
            password = v29, 
            captchaToken = not not v30 and v30.captchaToken or nil, 
            captchaProvider = not not v30 and v30.captchaProvider or nil, 
            captchaId = not not v30 and v30.captchaId or nil, 
            securityQuestionSessionId = (not not v9() and v31) and v31.sessionId or nil, 
            securityQuestionRedemptionToken = (not not v9() and v31) and v31.redemptionToken or nil, 
            userId = not not v10() and v32 or nil, 
            accountBlob = not not v11 and v7.getAccountBlob() or nil
        }), 
        maxRetryCount = 0
    });
end;
v12.loginWithCode = function(v33, v34, v35, v36, v37)
    return v33(getLoginUrl(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            ctype = "AuthToken", 
            cvalue = v34, 
            password = v35, 
            captchaToken = not not v36 and v36.captchaToken or nil, 
            captchaProvider = not not v36 and v36.captchaProvider or nil, 
            captchaId = not not v36 and v36.captchaId or nil, 
            securityQuestionSessionId = (not not v9() and v37) and v37.sessionId or nil, 
            securityQuestionRedemptionToken = (not not v9() and v37) and v37.redemptionToken or nil, 
            accountBlob = not not v11 and v7.getAccountBlob() or nil
        }), 
        maxRetryCount = 0
    });
end;
v12.logByOtp = function(v38, v39, v40, v41, v42)
    return v38(getLoginUrl(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            ctype = "EmailOtpSessionToken", 
            cvalue = v39, 
            password = v40, 
            securityQuestionSessionId = (not not v9() and v41) and v41.sessionId or nil, 
            securityQuestionRedemptionToken = (not not v9() and v41) and v41.redemptionToken or nil, 
            userId = not not v10() and v42 or nil, 
            accountBlob = not not v11 and v7.getAccountBlob() or nil
        }), 
        maxRetryCount = 0
    });
end;
v12.singleSignOnLogin = function(v43)
    local l_login_0 = v4().login;
    if not l_login_0 then
        return v2.reject({
            errorCode = v8.ServiceUnavailable
        });
    else
        return l_ConsoleAuthRequestWrapper_0(v43, l_login_0(), "POST", {
            postBody = "{}", 
            maxRetryCount = 0
        });
    end;
end;
v12.singleSignOnConnectWithCode = function(v45, v46, v47)
    local l_connect_0 = v4().connect;
    local v49 = l_HttpService_0:JSONEncode({
        ctype = "AuthToken", 
        cvalue = v46, 
        password = v47
    });
    if not l_connect_0 then
        return v2.reject({
            errorCode = v8.ServiceUnavailable
        });
    else
        return l_ConsoleAuthRequestWrapper_0(v45, l_connect_0(), "POST", {
            postBody = v49, 
            maxRetryCount = 0
        });
    end;
end;
v12.singleSignOnConnectWithCredential = function(v50, v51, v52, v53)
    local l_connect_1 = v4().connect;
    local v55 = l_HttpService_0:JSONEncode({
        ctype = v53, 
        cvalue = v51, 
        password = v52
    });
    if not l_connect_1 then
        return v2.reject({
            errorCode = v8.ServiceUnavailable
        });
    else
        return l_ConsoleAuthRequestWrapper_0(v50, l_connect_1(), "POST", {
            postBody = v55, 
            maxRetryCount = 0
        });
    end;
end;
return v12;
