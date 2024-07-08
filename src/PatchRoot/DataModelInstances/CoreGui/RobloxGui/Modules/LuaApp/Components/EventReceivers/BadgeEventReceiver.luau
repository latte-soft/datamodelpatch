local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(game:GetService("CorePackages").Workspace.Packages.RoactServices).RoactServices;
local v4 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v5 = require(l_Modules_0.LuaApp.Thunks.ApiFetchUnreadNotificationCount);
local v6 = require(l_Modules_0.LuaApp.Actions.SetNotificationCount);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUpdateNotificationBadgeCountEnabled);
local v8 = v1.Component:extend("BadgeEventReceiver");
v8.init = function(v9)
    local l_setNotificationCount_0 = v9.props.setNotificationCount;
    local l_getNotificationCount_0 = v9.props.getNotificationCount;
    local l_RobloxEventReceiver_0 = v9.props.RobloxEventReceiver;
    local l_networking_0 = v9.props.networking;
    if v7() then
        v9.lastSeqNumOfNotificationStream = nil;
    end;
    v9.tokens = {
        l_RobloxEventReceiver_0:observeEvent("UpdateNotificationBadge", function(v14, v15)
            if v15 == "NotificationIcon" then
                l_setNotificationCount_0((tonumber(v14.badgeString)));
            end;
        end), 
        l_RobloxEventReceiver_0:observeEvent("NotificationStream", function(v16, v17)
            if v17 == "NotificationsRead" then
                l_setNotificationCount_0(0);
            else
                l_getNotificationCount_0(l_networking_0);
            end;
            if not ((not v7() or not v16) or not v16.SequenceNumber) then
                v9.lastSeqNumOfNotificationStream = v16.SequenceNumber;
            end;
        end)
    };
    if v7() then
        table.insert(v9.tokens, l_RobloxEventReceiver_0:observeEvent("signalR", function(v18, _, v20)
            if not ((not (v18 == Enum.ConnectionState.Connected) or not v20) or not v20.NotificationStream) then
                if v9.lastSeqNumOfNotificationStream ~= v20.NotificationStream then
                    l_getNotificationCount_0(l_networking_0);
                end;
                v9.lastSeqNumOfNotificationStream = v20.NotificationStream;
            end;
        end));
    end;
end;
v8.render = function(_)
end;
v8.willUnmount = function(v22)
    for _, v24 in pairs(v22.tokens) do
        v24:disconnect();
    end;
end;
return (l_RoactServices_0.connect({
    networking = v4
})((v2.connect(nil, function(v25)
    return {
        getNotificationCount = function(v26)
            return v25(v5(v26));
        end, 
        setNotificationCount = function(...)
            return v25(v6(...));
        end
    };
end)(v8))));
