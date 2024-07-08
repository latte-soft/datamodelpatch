local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Requests.GetUnreadNotificationCount);
local v2 = require(l_Modules_0.LuaApp.Actions.SetNotificationCount);
local l_FFlag_0 = settings():GetFFlag("FixCountOfUnreadNotificationError");
return function(v4)
    return function(v5)
        return v1(v4):andThen(function(v6)
            local l_unreadNotifications_0 = v6.responseBody.unreadNotifications;
            if not l_FFlag_0 then
                v5:dispatch(v2(l_unreadNotifications_0));
                return l_unreadNotifications_0;
            elseif l_unreadNotifications_0 and tonumber(l_unreadNotifications_0) >= 0 then
                v5:dispatch(v2(l_unreadNotifications_0));
                return l_unreadNotifications_0;
            else
                warn(string.format("ApiFetchUnreadNotificationCount - notificationCount is not a valid number: %s", (tostring(l_unreadNotifications_0))));
                return l_unreadNotifications_0;
            end;
        end);
    end;
end;
