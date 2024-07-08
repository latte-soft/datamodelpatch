local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.NotificationType);
return function(v1)
    return function(v2)
        local v3 = v2:getState();
        local v4 = v3.Navigation.history[#v3.Navigation.history];
        v1:BroadcastNotification(v4[#v4].name, v0.APP_READY);
    end;
end;
