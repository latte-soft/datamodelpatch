local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.AddFriendStatus);
local v4 = require(l_CorePackages_0.Workspace.Packages.NetworkingFriends).config({
    roduxNetworking = require(l_CorePackages_0.Workspace.Packages.RoduxNetworking).mock()
});
return function(v5, v6)
    v5 = v5 or {};
    if v6.type == v3.name then
        return (v2.Dictionary.join(v5, {
            [v6.id] = v6.status
        }));
    elseif v6.type == v4.RequestFriendshipFromUserId.Succeeded.name then
        return v2.Dictionary.join(v5, {
            [tostring(v6.namedIds.users)] = Enum.FriendStatus.FriendRequestSent
        });
    elseif v6.type == v4.AcceptFriendRequestFromUserId.Succeeded.name then
        return v2.Dictionary.join(v5, {
            [tostring(v6.ids[1])] = Enum.FriendStatus.Friend
        });
    elseif v6.type == v4.DeclineFriendRequestFromUserId.Succeeded.name then
        local l_ids_0 = v6.ids;
        local v8 = {};
        for _, v10 in l_ids_0, nil, nil do
            v8[tostring(v10)] = Enum.FriendStatus.NotFriend;
        end;
        return v2.Dictionary.join(v5, v8);
    elseif v6.type == v4.UnfriendTargetUserId.Succeeded.name then
        return v2.Dictionary.join(v5, {
            [tostring(v6.namedIds.users)] = Enum.FriendStatus.NotFriend
        });
    else
        return v5;
    end;
end;
