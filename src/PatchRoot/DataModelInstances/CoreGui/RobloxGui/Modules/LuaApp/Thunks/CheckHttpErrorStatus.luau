local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Promise);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v6 = require(l_Modules_0.LuaApp.Thunks.LogoutUserOnUnauthorized);
local v7 = require(l_Modules_0.LuaApp.Thunks.Moderation.UserModerationCheck);
return function(v8, v9, v10, v11)
    return function(v12)
        if v10 == nil then
            return v4.resolve();
        else
            v2.warn("HTTP error url:`" .. tostring(v9) .. "`");
            v2.warn("HTTP error code:`" .. tostring(v10.StatusCode) .. "`");
            v2.warn("HTTP error body:`" .. tostring(v10.Body) .. "`");
            if v10.StatusCode == l_StatusCodes_0.FORBIDDEN then
                v12:dispatch(v7(v8, v10));
            elseif v10.StatusCode == l_StatusCodes_0.UNAUTHORIZED then
                v12:dispatch(v6(v8, v11));
            end;
            return v4.reject(v10);
        end;
    end;
end;
