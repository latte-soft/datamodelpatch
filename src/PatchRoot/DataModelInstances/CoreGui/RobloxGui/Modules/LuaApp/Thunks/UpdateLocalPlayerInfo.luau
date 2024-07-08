local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Logging);
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Thunks.Authentication.User);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.GetUsersAuthenticated);
local v5 = require(l_Modules_0.LuaApp.Thunks.GetLocalUser);
return function(v6)
    return function(v7)
        local v8 = v7:getState();
        local v9 = v8.Users[v8.LocalUserId];
        local l_IsLocalUserUnder13_0 = v8.IsLocalUserUnder13;
        local l_CountryCode_0 = v8.CountryCode;
        return v4(v6):andThen(function(v12)
            local v13 = v3.new(v9.id, v12.responseBody.name, v9.membership.Value, l_IsLocalUserUnder13_0, l_CountryCode_0, v12.responseBody.displayName);
            v13:setToLocalPlayer();
            v13:setToLocalStorage();
            v7:dispatch(v5());
            return v2.resolve();
        end, function(v14)
            v1.warn("Failed to update local user info");
            return v2.reject(v14);
        end);
    end;
end;
