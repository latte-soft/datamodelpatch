local l_Players_0 = game:GetService("Players");
local l_GetFFlagInviteListRerank_0 = require(script:FindFirstAncestor("UserLib").Parent.SharedFlags).GetFFlagInviteListRerank;
local v2 = {
    PresenceType = {
        OFFLINE = "OFFLINE", 
        ONLINE = "ONLINE", 
        IN_GAME = "IN_GAME", 
        IN_STUDIO = "IN_STUDIO"
    }, 
    new = function()
        return {};
    end
};
v2.fromData = function(v3, v4, v5, v6)
    local v7 = v2.new();
    v7.id = tostring(v3);
    v7.isFetching = false;
    v7.isFriend = v5;
    v7.friendRank = v6 or 0;
    v7.lastLocation = nil;
    v7.name = v4;
    v7.displayName = v4;
    v7.externalAppDisplayName = v4;
    v7.universeId = nil;
    v7.placeId = nil;
    v7.rootPlaceId = nil;
    v7.gameInstanceId = nil;
    v7.presence = (not not l_Players_0.LocalPlayer and v7.id == tostring(l_Players_0.LocalPlayer.UserId)) and v2.PresenceType.ONLINE or nil;
    v7.DEPRECATED_thumbnails = nil;
    v7.lastOnline = nil;
    return v7;
end;
v2.fromDataTable = function(v8)
    local v9 = v2.new();
    v9.id = tostring(v8.id);
    v9.isFriend = v8.isFriend;
    v9.friendRank = v8.friendRank;
    v9.presence = (not not l_Players_0.LocalPlayer and v9.id == tostring(l_Players_0.LocalPlayer.UserId)) and v2.PresenceType.ONLINE or nil;
    v9.isFetching = false;
    v9.lastLocation = nil;
    v9.name = v8.name;
    v9.displayName = v8.displayName or v8.name;
    v9.externalAppDisplayName = v8.externalAppDisplayName;
    v9.universeId = nil;
    v9.placeId = nil;
    v9.rootPlaceId = nil;
    v9.gameInstanceId = nil;
    v9.DEPRECATED_thumbnails = nil;
    v9.lastOnline = nil;
    v9.hasVerifiedBadge = v8.hasVerifiedBadge;
    if l_GetFFlagInviteListRerank_0() then
        v9.friendFrequentRank = v8.friendFrequentRank;
    end;
    return v9;
end;
v2.compare = function(v10, v11)
    local v12 = false;
    if v10 == nil then
        v12 = v11 == nil;
    end;
    assert(not v12, "user1 and user2 cannot both be nil");
    local v13 = true;
    if v10 ~= nil then
        v13 = typeof(v10) == "table";
    end;
    assert(v13, "user1 must be a table or nil");
    v13 = true;
    if v11 ~= nil then
        v13 = typeof(v11) == "table";
    end;
    assert(v13, "user2 must be a table or nil");
    if v10 and v11 then
        for v14, v15 in pairs(v11) do
            if v10[v14] ~= v15 then
                return false;
            end;
        end;
        for v16, v17 in pairs(v10) do
            if v11[v16] ~= v17 then
                return false;
            end;
        end;
        return true;
    else
        return false;
    end;
end;
v2.userPresenceToText = function(v18, v19)
    local l_presence_0 = v19.presence;
    local l_lastLocation_0 = v19.lastLocation;
    if l_presence_0 then
        if l_presence_0 == v2.PresenceType.OFFLINE then
            return v18:Format("Common.Presence.Label.Offline");
        elseif l_presence_0 == v2.PresenceType.ONLINE then
            return v18:Format("Common.Presence.Label.Online");
        elseif not (l_presence_0 ~= v2.PresenceType.IN_GAME) or l_presence_0 == v2.PresenceType.IN_STUDIO then
            if l_lastLocation_0 ~= nil then
                return l_lastLocation_0;
            else
                return v18:Format("Common.Presence.Label.Online");
            end;
        else
            return ;
        end;
    else
        return "";
    end;
end;
return v2;
