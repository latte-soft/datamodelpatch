local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Models.Authentication.LoginResult);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.TwoStepRequests);
return function(v3, _, _)
    return function(v6)
        local l_LoginResult_0 = v6:getState().LoginResult;
        assert(v1.hasTwoStepData(l_LoginResult_0), "LoginResult does not have two step data");
        return v2.resend(v3, l_LoginResult_0.user.name, l_LoginResult_0.twoStepVerificationData.ticket):andThen(function(v8)
            return v8;
        end);
    end;
end;
