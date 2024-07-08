local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.AddFriends.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_llama_0 = v1.llama;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local v5 = require(l_script_FirstAncestor_0.Friends.mapToUsers);
local v6 = require(l_script_FirstAncestor_0.TestHelpers.getBaseTestStates);
local l_smallNumbersOfFriends_0 = v6().smallNumbersOfFriends;
local l_manyFriends_0 = v6().manyFriends;
local v9 = {
    [Enum.FriendStatus.Friend] = "Friend", 
    [Enum.FriendStatus.FriendRequestReceived] = "RequestReceived"
};
local v10 = l_llama_0.Dictionary.keys(v9);
local function _(v11)
    return v10[1 + v11 % #v10];
end;
local function v16(v13)
    return l_Rodux_0.Store.new(function()
        return {
            LocalUserId = "0", 
            FriendStatuses = l_llama_0.Dictionary.map(v13, function(v14, v15)
                return v10[1 + v15 % #v10], v14.id;
            end), 
            ScreenSize = Vector2.new(360, 720)
        };
    end, {
        l_Rodux_0.thunkMiddleware
    });
end;
local function _(v17)
    local v18 = v5(v17)("test");
    l_llama_0.List.every(v18, function(v19, v20)
        v19.displayName = v9[v10[1 + v20 % #v10]];
        v19.userPresenceType = l_PresenceType_0.InGame;
        v19.lastLocation = "Last Location";
        return true;
    end);
    return v18;
end;
local v22 = v5(l_manyFriends_0)("test");
l_llama_0.List.every(v22, function(v23, v24)
    v23.displayName = v9[v10[1 + v24 % #v10]];
    v23.userPresenceType = l_PresenceType_0.InGame;
    v23.lastLocation = "Last Location";
    return true;
end);
local l_v22_0 = v22;
local v26 = v5(l_smallNumbersOfFriends_0)("test");
l_llama_0.List.every(v26, function(v27, v28)
    v27.displayName = v9[v10[1 + v28 % #v10]];
    v27.userPresenceType = l_PresenceType_0.InGame;
    v27.lastLocation = "Last Location";
    return true;
end);
return {
    friendRequests = l_v22_0, 
    manyFriendRequests = l_v22_0, 
    smallNumbersOfFriendRequests = v26, 
    createStore = v16
};
