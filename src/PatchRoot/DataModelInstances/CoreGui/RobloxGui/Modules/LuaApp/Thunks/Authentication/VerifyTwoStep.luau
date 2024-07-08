local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Models.Authentication.LoginResult);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.TwoStepRequests);
local v5 = require(l_Modules_0.LuaApp.Enum.TwoStepErrorCodes);
return function(v6, v7, v8)
    return function(v9)
        local l_LoginResult_0 = v9:getState().LoginResult;
        assert(v3.hasTwoStepData(l_LoginResult_0), "LoginResult does not have two step data");
        return v4.verify(v6, l_LoginResult_0.user.name, l_LoginResult_0.twoStepVerificationData.ticket, v7, v8):andThen(function(v11)
            return v11;
        end, function(v12)
            local v13 = l_HttpService_0:JSONDecode(v12.Body);
            if v13.errors[1].code == v5.InvalidCode then
                return v2.reject("Authentication.TwoStepVerification.Label.InvalidCode");
            elseif v13.errors[1].code == v5.TooManyAttempts then
                return v2.reject("Authentication.TwoStepVerification.Response.TooManyAttempts");
            else
                return ;
            end;
        end);
    end;
end;
