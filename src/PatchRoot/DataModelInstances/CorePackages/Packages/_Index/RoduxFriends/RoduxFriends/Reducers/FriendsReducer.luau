local v0 = require(script.Parent.Friends.byUserId);
local v1 = require(script.Parent.Friends.countsByUserId);
local v2 = require(script.Parent.Friends.requests);
local v3 = require(script.Parent.Friends.recommendations);
local v4 = require(script.Parent.Friends.friendshipStatus);
local v5 = require(script.Parent.Friends.friendsRankByUserId);
local v6 = require(script.Parent.Friends.contactNamesByUserId);
local v7 = {
    countsByUserId = {}, 
    byUserId = {}, 
    requests = {
        receivedCount = 0
    }, 
    recommendations = {}, 
    friendshipStatus = {}, 
    friendsRankByUserId = {}, 
    contactNamesByUserId = {}
};
return function(v8)
    return function(v9, v10)
        local v11 = v9 or v7;
        return {
            byUserId = v0(v8)(v11.byUserId, v10), 
            countsByUserId = v1(v8)(v9, v10), 
            requests = v2(v8)(v11.requests, v10), 
            recommendations = v3(v8)(v11.recommendations, v10), 
            friendshipStatus = v4(v8)(v11.friendshipStatus, v10), 
            friendsRankByUserId = v5(v8)(v11.friendsRankByUserId, v10), 
            contactNamesByUserId = v6(v8)(v11.contactNamesByUserId, v10)
        };
    end;
end;
