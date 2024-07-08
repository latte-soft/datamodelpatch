local l_Parent_0 = script:FindFirstAncestor("ApolloPresence").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_PresenceType_0 = require(l_Parent_0.GraphQLServer).types.PresenceType;
local v3 = {
    [l_PresenceType_0.Offline] = 0, 
    [l_PresenceType_0.Online] = 1, 
    [l_PresenceType_0.InGame] = 2, 
    [l_PresenceType_0.InStudio] = 3
};
local v6 = v1.List.foldLeft(v1.Dictionary.keys(v3), function(v4, v5)
    v4[tostring(v3[v5])] = v5;
    return v4;
end, {});
local function _(v7)
    if not v7 then
        return "";
    else
        return (tostring(v7));
    end;
end;
return {
    formatNumberToPresenceType = function(v9)
        return not not v9 and v6[tostring(v9)] or l_PresenceType_0.Offline;
    end, 
    formatPresenceTypeToNumber = function(v10)
        return not not v10 and v3[v10] or v3[l_PresenceType_0.Offline];
    end, 
    formatUserPresence = function(v11)
        local v12 = {
            id = v11.id
        };
        local v13;
        if not v11.userPresenceType then
            local l_userPresenceNumber_0 = v11.userPresenceNumber;
            v13 = not not l_userPresenceNumber_0 and v6[tostring(l_userPresenceNumber_0)] or l_PresenceType_0.Offline;
        else
            v13 = v11.userPresenceType;
        end;
        v12.userPresenceType = v13;
        v12.lastLocation = v11.lastLocation or "";
        v12.lastOnline = v11.lastOnline or "";
        local l_gameId_0 = v11.gameId;
        v12.gameId = not l_gameId_0 and "" or tostring(l_gameId_0);
        l_gameId_0 = v11.placeId;
        v12.placeId = not l_gameId_0 and "" or tostring(l_gameId_0);
        l_gameId_0 = v11.rootPlaceId;
        v12.rootPlaceId = not l_gameId_0 and "" or tostring(l_gameId_0);
        l_gameId_0 = v11.universeId;
        v12.universeId = not l_gameId_0 and "" or tostring(l_gameId_0);
        return v12;
    end
};
