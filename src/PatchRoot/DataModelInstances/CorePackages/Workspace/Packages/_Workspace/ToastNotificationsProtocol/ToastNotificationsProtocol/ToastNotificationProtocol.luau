local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.ToastNotificationProtocolTypes);
local v5 = require(l_Parent_0.ToastNotificationProtocolConstants);
local l_getPlatformTarget_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).getPlatformTarget;
local v7 = {};
v7.__index = v7;
game:DefineFastFlag("LuaAppInitializeToastNotificationEventParams2", false);
v7.new = function()
    return (setmetatable({}, v7));
end;
v7.setupNotifications = function(_, v9)
    if #v9 > 0 then
        local v10 = nil;
        local v11 = nil;
        if game:GetFastFlag("LuaAppInitializeToastNotificationEventParams2") then
            v11 = l_getPlatformTarget_0();
            v10 = not l_Players_0.LocalPlayer and "" or tostring(l_Players_0.LocalPlayer.UserId);
        end;
        l_MessageBusService_0:Publish(v5.MESSAGE_INIT_TOAST_NOTIF, {
            channels = v9, 
            userId = v10, 
            platform = v11
        });
    end;
end;
v7.updateNotification = function(_, v13, v14)
    if not (not v13 or not v14) then
        l_MessageBusService_0:Publish(v5.MESSAGE_UPDATE_TOAST_NOTIF, {
            notificationId = v13, 
            stateName = v14
        });
    end;
end;
v7.voltronBroadcast = function(_, v16, v17)
    if v16 then
        l_MessageBusService_0:Publish(v16, v17);
    end;
end;
v7.dismissNotification = function(_, v19)
    if v19 then
        l_MessageBusService_0:Publish(v5.MESSAGE_DISMISS_TOAST_NOTIF, {
            notificationId = v19
        });
    end;
end;
v7.listenToDisplayNotification = function(_, v21)
    return l_MessageBusService_0:Subscribe(v5.MESSAGE_DISPLAY_TOAST_NOTIF, v21, false, true);
end;
v7.listenToDismissNotification = function(_, v23)
    return l_MessageBusService_0:Subscribe(v5.MESSAGE_DISMISS_TOAST_NOTIF, v23, false, true);
end;
v7.default = v7.new();
return v7;
