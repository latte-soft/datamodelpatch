local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v4 = require(l_Modules_0.LuaApp.Thunks.LogoutUserOnUnauthorized);
return function(v5, v6, v7)
    return function(v8)
        if v6 ~= nil and v6.StatusCode == l_StatusCodes_0.UNAUTHORIZED then
            v8:dispatch(v4(v5, v7));
        end;
        return v2.reject(v6);
    end;
end;
