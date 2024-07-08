local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.ReceivedUserPresence);
local l_UpdateFriendPresenceCounts_0 = require(l_Parent_0.LegacyFriendsRodux).Actions.UpdateFriendPresenceCounts;
local v4 = require(l_script_FirstAncestor_0.Enum.WebPresenceMap);
return function(v5, v6)
    for _, v8 in pairs(v5) do
        local v9 = v6:getState().Users[tostring(v8.userId)];
        v6:dispatch(v2(tostring(v8.userId), v4[v8.userPresenceType], v8.lastLocation, not not v8.placeId and tostring(v8.placeId) or nil, not not v8.rootPlaceId and tostring(v8.rootPlaceId) or nil, not not v8.gameId and tostring(v8.gameId) or nil, not not v8.lastOnline and tostring(v8.lastOnline) or nil, v8.universeId, not not v9 and v9.universeId or nil));
    end;
    local v10 = {};
    for _, v12 in pairs(v6:getState().Users) do
        if not (not v12.isFriend or not v12.presence) then
            v10[v12.presence] = (v10[v12.presence] or 0) + 1;
        end;
    end;
    v6:dispatch(l_UpdateFriendPresenceCounts_0(v10));
end;
