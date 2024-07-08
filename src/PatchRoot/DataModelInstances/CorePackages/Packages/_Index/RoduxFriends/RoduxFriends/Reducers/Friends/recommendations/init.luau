local v0 = require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux);
local v1 = require(script.byUserId);
local v2 = require(script.bySource);
local v3 = require(script.hasIncomingFriendRequest);
return function(v4)
    return v0.combineReducers({
        byUserId = v1(v4), 
        bySource = v2(v4), 
        hasIncomingFriendRequest = v3(v4)
    });
end;
