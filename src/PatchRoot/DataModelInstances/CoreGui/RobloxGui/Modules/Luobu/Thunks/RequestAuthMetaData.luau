local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local v3 = require(l_Modules_0.Luobu.Http.Requests.AuthGetMetaDataRequest);
local v4 = require(l_Modules_0.Luobu.Actions.SetTokenAuthErrMessageKey);
return function(v5, v6, v7)
    v2.isType(v5, "table", "networkImpl");
    v2.isType(v7, "string", "authMethod");
    return function(v8)
        return v3(v5, v7):andThen(function(v9)
            return v1.resolve(v9.responseBody);
        end, function(v10)
            v8:dispatch(v4("Authentication.Login.Response.TencentLoginFailurePleaseTryAgain"));
            v6.Diag:reportCounter("RequestAuthMetaDataFailure", 1);
            return v1.reject(v10);
        end);
    end;
end;
