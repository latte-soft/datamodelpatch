local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Promise);
local v2 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.AuthenticationApi.AuthPlatformDisconnect);
return function(v4, v5)
    return function(v6)
        return v3(v4):andThen(function()
            warn("--Console Account Disconnected");
            v6:dispatch(v2(v4, v5));
            return v1.resolve();
        end);
    end;
end;
