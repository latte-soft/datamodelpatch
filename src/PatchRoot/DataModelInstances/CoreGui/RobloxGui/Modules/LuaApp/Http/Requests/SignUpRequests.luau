local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Promise);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v6 = require(l_Modules_0.LuaApp.Http.Url);
local v7 = require(l_Modules_0.LuaApp.Components.Authentication.SingleSignOn.getSingleSignOnUrls);
local l_ConsoleAuthRequestWrapper_0 = require(l_CorePackages_0.Workspace.Packages.Http).Utils.ConsoleAuthRequestWrapper;
local v9 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v10 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v11 = require(l_Modules_0.LuaApp.Flags.FFlagSignupAddDisplayNameFieldToRequest);
local v12 = require(l_Modules_0.LuaApp.Flags.FFlagEnableKoreaKISACompliance);
local v13 = require(l_Modules_0.LuaApp.Enum.SignUpV2ErrorCodes);
local v14 = require(l_CorePackages_0.Packages.t);
local v21 = {
    signUp = function(v15, v16, v17, v18, v19, v20)
        assert(type(v16) == "string", "invalid username has been passed into SignUpRequests.signUp");
        assert(type(v17) == "string", "invalid password has been passed into SignUpRequests.signUp");
        assert(type(v18) == "string", "invalid birthdate has been passed into SignUpRequests.signUp");
        assert(tonumber(v19) and type(v19) == "string", "invalid bundleId has been passed into SignUpRequests.signUp");
        return v15(string.format("%sv3/signup", v6.AUTH_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                username = v16, 
                password = v17, 
                birthdate = v18, 
                bundleId = v19, 
                captchaId = not not v20 and v20.captchaId or nil, 
                captchaToken = not not v20 and v20.captchaToken or nil, 
                captchaProvider = not not v20 and v20.captchaProvider or nil, 
                accountBlob = not not v10 and v9.getAccountBlob() or nil
            }), 
            maxRetryCount = 0
        });
    end
};
local v22 = v14.interface({
    username = v14.string, 
    password = v14.string, 
    gender = v14.string, 
    birthday = v14.string, 
    displayName = if not v11 then nil else v14.optional(v14.string), 
    locale = v14.optional(v14.string), 
    email = v14.optional(v14.string)
});
v21.signUpV2 = function(v23, v24, v25)
    assert(v22(v24));
    return v23(string.format("%sv2/signup", v6.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            username = v24.username, 
            password = v24.password, 
            gender = v24.gender, 
            birthday = v24.birthday, 
            locale = v24.locale, 
            email = v24.email, 
            otpSession = if not v12 then nil else v24.otpSession, 
            agreementIds = v24.agreementIds, 
            displayName = if not v11 then nil else v24.displayName, 
            isTosAgreementBoxChecked = true, 
            captchaId = not not v25 and v25.captchaId or nil, 
            captchaToken = not not v25 and v25.captchaToken or nil, 
            captchaProvider = not not v25 and v25.captchaProvider or nil, 
            accountBlob = not not v10 and v9.getAccountBlob() or nil
        }), 
        maxRetryCount = 0
    });
end;
local v26 = v14.interface({
    username = v14.string, 
    password = v14.string, 
    gender = v14.string, 
    birthday = v14.string, 
    verifiedSignupVoucher = v14.string
});
v21.verifiedSignup = function(v27, v28, v29)
    assert(v26(v28));
    return v27(string.format("%sv1/verified-signup", v6.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            username = v28.username, 
            password = v28.password, 
            gender = v28.gender, 
            birthday = v28.birthday, 
            voucher = v28.verifiedSignupVoucher, 
            agreementIds = v28.agreementIds, 
            isTosAgreementBoxChecked = true, 
            captchaId = not not v29 and v29.captchaId or nil, 
            captchaToken = not not v29 and v29.captchaToken or nil, 
            captchaProvider = not not v29 and v29.captchaProvider or nil, 
            accountBlob = not not v10 and v9.getAccountBlob() or nil
        }), 
        maxRetryCount = 0
    });
end;
v21.singleSignOnSignup = function(v30, v31)
    local l_signup_0 = v7().signup;
    local v33 = l_HttpService_0:JSONEncode({
        username = v31.username, 
        password = v31.password, 
        gender = v31.gender, 
        birthday = v31.birthday, 
        locale = v31.locale, 
        email = v31.email, 
        agreementIds = v31.agreementIds, 
        isTosAgreementBoxChecked = true
    });
    if not l_signup_0 then
        return v3.reject(v13.TokenValidationFailed);
    else
        return l_ConsoleAuthRequestWrapper_0(v30, l_signup_0(), "POST", {
            postBody = v33, 
            maxRetryCount = 0
        });
    end;
end;
return v21;
