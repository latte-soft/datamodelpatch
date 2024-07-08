local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local _ = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v3 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
return function(v5, v6)
    return function(v7)
        if v7:getState().AuthenticationStatus.status == v1.LOGGED_IN then
            v7:dispatch(v3(v5, v6, v4.UnauthorizedResponse));
        end;
    end;
end;
