local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.PromiseUtilities);
local v2 = require(l_Modules_0.LuaApp.Thunks.ApiFetchAccountSettingsEmail);
local v3 = require(l_Modules_0.LuaApp.Thunks.ApiFetchPasswordStatus);
local v4 = require(l_Modules_0.LuaApp.Thunks.ApiFetchFriendRequestsCount);
local v5 = require(l_Modules_0.LuaApp.Thunks.ApiFetchUnreadMessageCount);
local v6 = require(l_Modules_0.LuaApp.Thunks.ApiFetchUnreadNotificationCount);
return function(v7)
    return function(v8)
        local v9 = {};
        table.insert(v9, v8:dispatch(v2(v7)));
        table.insert(v9, v8:dispatch(v3(v7)));
        table.insert(v9, v8:dispatch(v4(v7)));
        table.insert(v9, v8:dispatch(v5(v7)));
        table.insert(v9, v8:dispatch(v6(v7)));
        return v1.Batch(v9):andThen(function(v10)
            local l_failureCount_0 = v1.CountResults(v10).failureCount;
            if l_failureCount_0 ~= 0 then
                warn(string.format("%d of %d notification count fetching failed", l_failureCount_0, #v9));
            end;
        end);
    end;
end;
