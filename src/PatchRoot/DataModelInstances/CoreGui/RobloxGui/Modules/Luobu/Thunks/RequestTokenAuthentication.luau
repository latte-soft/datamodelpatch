local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local v3 = require(l_Modules_0.Luobu.Http.Requests.TokenAuthenticationPostRequest);
local v4 = require(l_Modules_0.Luobu.Actions.SetTokenAuthErrMessageKey);
return function(v5, v6, v7, v8)
    v2.isType(v5, "table", "networkImpl");
    v2.isType(v7, "string", "authMethod");
    v2.isType(v8, "table", "body");
    return function(v9)
        return v3(v5, v7, v8):andThen(function(v10)
            return v1.resolve(v10.responseBody);
        end, function(v11)
            v9:dispatch(v4("Authentication.Login.Response.TencentLoginFailurePleaseTryAgain"));
            v6.Diag:reportCounter("TokenAuthenticationPostRequestFailure", 1);
            return v1.reject(v11);
        end);
    end;
end;
