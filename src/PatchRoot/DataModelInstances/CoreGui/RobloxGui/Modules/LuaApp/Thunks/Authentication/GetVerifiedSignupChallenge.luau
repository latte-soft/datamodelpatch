local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.PostVerifiedSignupChallenge);
local v5 = require(l_Modules_0.LuaApp.Enum.PhoneNumberVerificationErrorCodes);
return function(v6, v7)
    return v4(v6, v7):andThen(function(v8)
        return {
            challenge = v8[1].challenge
        };
    end, function(v9)
        local v10 = l_HttpService_0:JSONDecode(v9.Body);
        if v10.errors[1].code == v5.TooManyAttempts then
            return v3.reject("Authentication.TwoStepVerification.Response.TooManyAttempts");
        elseif v10.errors[1].code == v5.PhoneNumberAlreadyLinked then
            return v3.reject("Authentication.SignUp.Response.PhoneNumberAlreadyLinked");
        elseif v10.errors[1].code == v5.InvalidPhoneNumber then
            return v3.reject("Authentication.SignUp.Response.InvalidPhoneNumber");
        else
            return v3.reject("");
        end;
    end);
end;
