local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.ProfileContext);
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local l_RoactRodux_0 = v1.RoactRodux;
local l_NetworkingPresence_0 = v1.NetworkingPresence;
local l_t_0 = v1.t;
local l_Dash_0 = v1.Dash;
local l_Roact_0 = v1.Roact;
local l_NetworkingFriends_0 = v1.NetworkingFriends;
local v11 = l_Roact_0.Component:extend("ProfileEventReceiver");
local v12 = {
    FriendshipDestroyed = true, 
    FriendshipCreated = true, 
    FriendshipRequested = true
};
v11.validateProps = l_t_0.strictInterface({
    robloxEventReceiver = l_t_0.any, 
    getPresenceFromUserId = l_t_0.callback, 
    profileUserId = l_t_0.string, 
    localUserId = l_t_0.string, 
    getUpdatedFriendshipStatus = l_t_0.callback
});
v11.init = function(v13)
    local l_props_0 = v13.props;
    local l_robloxEventReceiver_0 = l_props_0.robloxEventReceiver;
    v13.tokens = {
        l_robloxEventReceiver_0:observeEvent("PresenceBulkNotifications", function(v16)
            if l_Dash_0.find(v16, function(v17)
                return tostring(v17.UserId) == l_props_0.profileUserId;
            end) then
                l_props_0.getPresenceFromUserId(l_props_0.profileUserId);
            end;
        end), 
        l_robloxEventReceiver_0:observeEvent("FriendshipNotifications", function(v18)
            if v12[v18.Type] then
                local v19 = tostring(v18.EventArgs.UserId1);
                local v20 = tostring(v18.EventArgs.UserId2);
                local l_localUserId_0 = l_props_0.localUserId;
                local l_v19_0 = v19;
                if v19 == l_localUserId_0 then
                    l_v19_0 = v20;
                end;
                l_props_0.getUpdatedFriendshipStatus({
                    localUserId = l_localUserId_0, 
                    targetUserId = l_v19_0
                });
            end;
        end)
    };
end;
v11.render = function(_)
    return nil;
end;
v11.willUnmount = function(v24)
    for _, v26 in pairs(v24.tokens) do
        v26:disconnect();
    end;
end;
return l_compose_0(l_RoactRodux_0.connect(nil, function(v27)
    return {
        getPresenceFromUserId = function(v28)
            v27(l_NetworkingPresence_0.GetPresencesFromUserIds.API({
                v28
            }));
        end, 
        getUpdatedFriendshipStatus = function(v29)
            v27(l_NetworkingFriends_0.GetFriendshipStatus.API({
                currentUserId = v29.localUserId, 
                targetUserId = v29.targetUserId
            }));
        end
    };
end), v2.connect(function(v30)
    return {
        profileUserId = v30.profileUserId, 
        localUserId = v30.localUserId
    };
end))(v11);
