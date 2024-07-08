local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.Common.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_Modules_0.LuaApp.Thunks.FriendshipCreated);
local v8 = require(l_Modules_0.LuaApp.Thunks.FriendshipDestroyed);
local v9 = require(script.Parent.EventNetworking);
local l_FriendsCarouselFriendshipUpdateSignal_0 = require(l_Modules_0.LuaApp.Components.FriendsCarousel.api).Signals.FriendsCarouselFriendshipUpdateSignal;
local l_FFlagFriendsCarouselFriendshipUpdatesEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFriendsCarouselFriendshipUpdatesEnabled;
local v12 = v4.Component:extend("FriendshipEventReceiver");
v12.init = function(v13)
    local l_friendshipCreated_0 = v13.props.friendshipCreated;
    local l_friendshipDestroyed_0 = v13.props.friendshipDestroyed;
    local l_networking_0 = v13.props.networking;
    v13.tokens = {
        v13.props.RobloxEventReceiver:observeEvent("FriendshipNotifications", function(v17)
            local v18 = tostring(v13.props.localUserId);
            if v17.Type == "FriendshipDestroyed" then
                local v19 = v18 == tostring(v17.EventArgs.UserId1) and tostring(v17.EventArgs.UserId2) or tostring(v17.EventArgs.UserId1);
                l_friendshipDestroyed_0({
                    otherUser = v19, 
                    localUserId = v18
                });
                if l_FFlagFriendsCarouselFriendshipUpdatesEnabled_0 then
                    l_FriendsCarouselFriendshipUpdateSignal_0:Fire({
                        removedUserId = v19
                    });
                    return ;
                end;
            elseif v17.Type == "FriendshipCreated" then
                local v20 = v18 == tostring(v17.EventArgs.UserId1) and tostring(v17.EventArgs.UserId2) or tostring(v17.EventArgs.UserId1);
                l_friendshipCreated_0(l_networking_0, v20);
                if l_FFlagFriendsCarouselFriendshipUpdatesEnabled_0 then
                    l_FriendsCarouselFriendshipUpdateSignal_0:Fire({
                        addedUserId = v20
                    });
                end;
            end;
        end)
    };
end;
v12.render = function(_)
end;
v12.willUnmount = function(v22)
    for _, v24 in pairs(v22.tokens) do
        v24:disconnect();
    end;
end;
return (l_RoactServices_0.connect({
    networking = v6
})((v3.connect(function(v25)
    return {
        localUserId = v25.LocalUserId
    };
end, function(v26)
    return {
        friendshipCreated = function(...)
            return v26(v7(...));
        end, 
        friendshipDestroyed = function(v27)
            v26(v9.RoduxFriends.Actions.FriendshipDestroyed(v27.otherUser, v27.localUserId));
            return v26(v8(v27.otherUser));
        end
    };
end)(v12))));
