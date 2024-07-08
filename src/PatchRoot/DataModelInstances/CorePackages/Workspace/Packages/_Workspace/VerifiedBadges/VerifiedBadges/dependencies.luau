local l_Parent_0 = script:FindFirstAncestor("VerifiedBadges").Parent;
local v1 = require(l_Parent_0.UsersNetworking);
local v2 = require(l_Parent_0.FriendsNetworking);
local v3 = require(l_Parent_0.RoduxNetworking);
local v4 = require(l_Parent_0.HttpRequest);
local v5 = v3.config({
    keyPath = "VerifiedBadges.NetworkStatus", 
    networkImpl = v4.config({
        requestFunction = v4.requestFunctions.RequestInternal, 
        maxRetryCount = 0
    })
});
return {
    RoduxNetworking = v5, 
    FriendsNetworking = v2.config({
        roduxNetworking = v5
    }), 
    UsersNetworking = v1.config({
        roduxNetworking = v5
    })
};
