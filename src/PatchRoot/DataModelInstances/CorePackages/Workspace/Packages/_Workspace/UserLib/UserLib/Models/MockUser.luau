local l_MockId_0 = require(script:FindFirstAncestor("UserLib").Parent.Dev.UnitTestHelpers).MockId;
local v1 = require(script.Parent.User);
local v2 = {};
v2.__index = v2;
v2.new = function()
    local v3 = v1.new();
    v3.id = l_MockId_0();
    v3.isFetching = false;
    v3.isFriend = false;
    v3.friendRank = 0;
    v3.lastLocation = nil;
    v3.name = "USER NAME";
    v3.universeId = nil;
    v3.placeId = nil;
    v3.rootPlaceId = nil;
    v3.gameInstanceId = nil;
    v3.presence = v1.PresenceType.OFFLINE;
    v3.membership = nil;
    v3.thumbnails = nil;
    v3.lastOnline = nil;
    v3.displayName = "DN+" .. v3.name;
    v3.externalAppDisplayName = "EXTERNAL APP DISPLAY NAME";
    v3.hasVerifiedBadge = false;
    setmetatable(v3, {
        __index = v1
    });
    return v3;
end;
v2.mockEndpointResponse = function()
    return {
        created = "0001-01-01T06:00:00Z", 
        displayName = "DN+12345", 
        friendFrequentRank = 1, 
        friendFrequentScore = 2, 
        id = 12345, 
        isBanned = false, 
        isDeleted = false, 
        isOnline = false, 
        name = "USER NAME", 
        presenceType = 0, 
        hasVerifiedBadge = false
    };
end;
return v2;
