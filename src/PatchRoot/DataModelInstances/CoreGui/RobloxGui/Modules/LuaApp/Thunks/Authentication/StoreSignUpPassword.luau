local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Requests.GetPasswordValid);
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v4 = require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpPassword);
return function(v5, v6, v7)
    return function(v8)
        return v1(v5, v6, v7):andThen(function(v9)
            if not (not v9 or not v9.responseBody) and v9.responseBody.code == 0 then
                v8:dispatch(v4(v7));
                return v2.resolve();
            else
                return v2.reject();
            end;
        end, function(v10)
            v8:dispatch(v3(v10));
            return v2.reject(v10);
        end);
    end;
end;
