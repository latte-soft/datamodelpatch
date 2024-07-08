local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local v3 = require(l_script_FirstAncestor_0.Constants);
local l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 = require(l_Parent_0.SharedFlags).GetFFlagFriendsMenuDummyLoadingFriendsFix;
local function v6(v5)
    return {
        displayName = "", 
        friendFrequentRank = v5, 
        friendRank = v5, 
        hasVerifiedBadge = false, 
        id = not not l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0() and v3.DummyFriendsPrefix .. tostring(v5) or tostring(v5), 
        isFetching = true, 
        isFriend = true, 
        lastLocation = "", 
        lastOnline = DateTime.now(), 
        name = "", 
        presence = "", 
        isLoadingPlaceholder = true
    };
end;
return function(v7)
    local v8 = {};
    for v9 = 1, v7 do
        v8[v9] = v6(v9);
    end;
    return v8;
end;
