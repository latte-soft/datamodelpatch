local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.Url);
local v3 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v4 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
return {
    configuration = function(v5, v6)
        return v5(string.format("%sv1/users/%d/configuration", v2.TWOSTEPVERIFICATION_URL, v6), "GET");
    end, 
    resend = function(v7, v8, v9)
        assert(type(v8) == "string", "invalid username has been passed into TwoStepRequests.resend");
        assert(type(v9) == "string", "invalid ticket has been passed into TwoStepRequests.resend");
        return v7(string.format("%sv1/twostepverification/resend", v2.AUTH_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                username = v8, 
                ticket = v9, 
                actionType = "Login"
            }), 
            maxRetryCount = 0
        });
    end, 
    verify = function(v10, v11, v12, v13, v14)
        assert(type(v11) == "string", "invalid username has been passed into TwoStepRequests.verify");
        assert(type(v12) == "string", "invalid ticket has been passed into TwoStepRequests.verify");
        assert(type(v13) == "string", "invalid code has been passed into TwoStepRequests.verify");
        assert(type(v14) == "boolean", "invalid rememberDevice has been passed into TwoStepRequests.verify");
        return v10(string.format("%sv1/twostepverification/verify", v2.AUTH_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                username = v11, 
                ticket = v12, 
                code = v13, 
                rememberDevice = v14, 
                actionType = "Login"
            }), 
            maxRetryCount = 0
        });
    end, 
    login = function(v15, v16, v17, v18, v19)
        assert(type(v16) == "string", "invalid user ID has been passed into TwoStepRequests.login");
        assert(type(v17) == "string", "invalid challengeId has been passed into TwoStepRequests.login");
        assert(type(v18) == "string", "invalid verificationToken has been passed into TwoStepRequests.login");
        assert(type(v19) == "boolean", "invalid rememberDevice has been passed into TwoStepRequests.login");
        return v15(string.format("%sv3/users/%s/two-step-verification/login", v2.AUTH_URL, v16), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                challengeId = v17, 
                verificationToken = v18, 
                rememberDevice = v19, 
                accountBlob = not not v4 and v3.getAccountBlob() or nil
            }), 
            maxRetryCount = 0
        });
    end
};
