local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.LuaApp.Http.Requests.GetUsernameValid);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.PostUsernameValid);
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v5 = require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpUsername);
return function(v6, v7, v8, v9)
    return function(v10)
        return v2(v6, v7, v8, v9):andThen(function(v11)
            if ((v11 and v11.responseBody) and v11.responseBody.code) == 0 then
                v10:dispatch(v5(v7));
                return v3.resolve();
            else
                return v3.reject();
            end;
        end, function(v12)
            v10:dispatch(v4(v12));
            return v3.reject(v12);
        end);
    end;
end;
