local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.SetIsLocalUserSoothsayer);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.UsersGetRoles);
return function(v5)
    return function(v6)
        return v4(v5):andThen(function(v7)
            v6:dispatch(v3(v2.List.find(v7.responseBody.roles or {}, "Soothsayer") ~= nil));
        end);
    end;
end;
