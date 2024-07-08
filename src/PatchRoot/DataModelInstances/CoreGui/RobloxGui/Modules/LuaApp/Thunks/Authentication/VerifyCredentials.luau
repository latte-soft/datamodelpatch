local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.AuthVerifyCredentials);
return function(v3, v4, v5, v6)
    return function(v7)
        return v2(v3, v4, v5, v6):andThen(nil, function(v8)
            v7:dispatch(v1(v8));
        end);
    end;
end;
