local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_llama_0 = v0.llama;
local l_RoduxPresence_0 = v0.RoduxPresence;
local v3 = {
    "OFFLINE", 
    "ONLINE", 
    "IN_GAME", 
    "IN_STUDIO"
};
local function v5(v4)
    return l_RoduxPresence_0.Actions.ReceivedUserPresence((l_RoduxPresence_0.Models.Presence.new(l_llama_0.Dictionary.join(v4, {
        presence = l_llama_0.None, 
        userPresenceType = (table.find(v3, v4.presence) or 1) - 1, 
        gameInstanceId = l_llama_0.None, 
        gameId = v4.gameInstanceId, 
        lastOnline = not not DateTime.now() and DateTime.fromUnixTimestamp(v4.lastOnline or 0):ToIsoDate() or "1970-01-01T00:00:00Z"
    }))));
end;
local v7 = {
    ReceivedUserPresence = function(v6)
        if not v6.payload then
            return {
                v5(v6)
            };
        else
            return v6;
        end;
    end
};
local v8 = l_RoduxPresence_0.installReducer();
return function(v9, v10)
    v9 = v9 or {
        byUserId = {}, 
        byGameId = {}, 
        byGameInstanceId = {}, 
        byPlaceId = {}
    };
    local v11 = {
        v10
    };
    local v12 = v7[v10.type];
    if v12 then
        v11 = v12(v10);
    end;
    return l_llama_0.List.reduce(v11, v8, v9);
end;
