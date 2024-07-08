local l_llama_0 = require(script:FindFirstAncestor("FriendsLanding").AddFriends.dependencies).llama;
return function(v1)
    local v2 = {};
    local v3 = {};
    local v4 = {};
    local v5 = {};
    for v6, v7 in pairs(v1.responseBody.data) do
        table.insert(v2, table.concat(l_llama_0.List.map(v7.mutualFriendsList, function(v8)
            return v8;
        end), ","));
        table.insert(v3, not v7.friendRequest.sourceUniverseId and 0 or v7.friendRequest.sourceUniverseId);
        table.insert(v4, v7.friendRequest.senderId);
        table.insert(v5, v6);
    end;
    return {
        page = "friendRequests", 
        requestingUserId = table.concat(v4, ","), 
        gamesContext = table.concat(v3, ","), 
        absPosition = table.concat(v5, ","), 
        mutualFriendsContext = table.concat(v2, ";")
    };
end;
