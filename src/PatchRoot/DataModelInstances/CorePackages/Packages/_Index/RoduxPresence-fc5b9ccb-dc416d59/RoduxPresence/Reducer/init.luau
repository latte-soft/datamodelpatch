local v0 = require(script.Presence.byUserId);
local v1 = require(script.Presence.byGameId);
local v2 = require(script.Presence.byGameInstanceId);
local v3 = require(script.Presence.byPlaceId);
return function(v4)
    return function(v5, v6)
        local v7 = v5 or {
            byUserId = {}, 
            byGameInstanceId = {}, 
            byGameId = {}, 
            byPlaceId = {}
        };
        return {
            byUserId = v0(v4)(v7.byUserId, v6), 
            byGameInstanceId = v2(v4)(v7, v6), 
            byGameId = v1(v4)(v7, v6), 
            byPlaceId = v3(v4)(v7, v6)
        };
    end;
end;
