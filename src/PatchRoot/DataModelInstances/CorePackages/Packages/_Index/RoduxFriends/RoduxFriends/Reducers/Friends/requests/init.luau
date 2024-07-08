local v0 = require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux);
local v1 = require(script.receivedCount);
local v2 = require(script.byUserId);
local v3 = require(script.mutualFriends);
local v4 = require(script.sourceUniverseIds);
local v5 = require(script.nextPageCursor);
local v6 = require(script.sentAt);
local v7 = require(script.originSourceType);
local v8 = require(script.order);
return function(v9)
    return v0.combineReducers({
        receivedCount = v1(v9), 
        byUserId = v2(v9), 
        mutualFriends = v3(v9), 
        sourceUniverseIds = v4(v9), 
        nextPageCursor = v5(v9), 
        sentAt = v6(v9), 
        originSourceType = v7(v9), 
        order = v8(v9)
    });
end;
