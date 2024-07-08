local l_useSelector_0 = require(script:FindFirstAncestor("UserSearch").Parent.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v1)
    return l_useSelector_0(function(v2)
        return {
            status = if not v2.FriendStatuses then nil else v2.FriendStatuses[v1], 
            following = not not v2.FriendFollowings and (v2.FriendFollowings[v1] or false), 
            isMyself = v2.LocalUserId == v1
        };
    end);
end;
