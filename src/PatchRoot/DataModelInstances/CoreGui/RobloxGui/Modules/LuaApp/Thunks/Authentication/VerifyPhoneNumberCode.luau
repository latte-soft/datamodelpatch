local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.PostVerifyPhoneNumber);
local v4 = require(l_Modules_0.LuaApp.Enum.PhoneNumberVerificationErrorCodes);
return function(v5, v6, v7)
    return function(_)
        return v3(v5, v6, v7):andThen(function(v9)
            return {
                voucher = v9[1].voucher
            };
        end, function(v10)
            local v11 = l_HttpService_0:JSONDecode(v10.Body);
            if v11.errors[1].code == v4.InvalidCode then
                return v2.reject("Authentication.TwoStepVerification.Label.InvalidCode");
            elseif v11.errors[1].code == v4.TooManyAttempts then
                return v2.reject("Authentication.TwoStepVerification.Response.TooManyAttempts");
            else
                return v2.reject("");
            end;
        end);
    end;
end;
