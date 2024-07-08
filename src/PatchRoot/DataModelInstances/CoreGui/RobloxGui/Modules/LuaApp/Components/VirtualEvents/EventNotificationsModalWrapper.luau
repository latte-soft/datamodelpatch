local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.ApolloClient);
local _ = require(l_CorePackages_0.Workspace.Packages.GraphQLServer);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.VirtualEvents);
local l_useMutation_0 = v1.useMutation;
local l_EventNotificationsModal_0 = v5.EventNotificationsModal;
return function(v8)
    local v9 = l_useMutation_0(v5.requests.NEVER_SHOW_NOTIFICATIONS_MODAL_AGAIN);
    local v10 = l_useMutation_0(v5.requests.ENABLE_PUSH_NOTIFICATIONS);
    return v3.createElement(l_EventNotificationsModal_0, v4.Dictionary.join(v8, {
        onClose = v3.useCallback(function()
            v9[1]();
            if v8.onClose then
                v8.onClose();
            end;
        end, {
            v9, 
            v8.onClose
        }), 
        onConfirm = v3.useCallback(function()
            v10[1]();
            v5.fireEventNotificationEnabled({
                virtualEventId = v8.virtualEvent.id, 
                universeId = v8.virtualEvent.universeId, 
                channel = v8.channel
            });
            if v8.onConfirm then
                v8.onConfirm();
            end;
        end, {
            v10, 
            v8.virtualEvent, 
            v8.channel, 
            v8.onConfirm
        })
    }));
end;
