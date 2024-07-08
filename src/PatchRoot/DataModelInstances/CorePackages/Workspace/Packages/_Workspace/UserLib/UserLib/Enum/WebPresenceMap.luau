local v0 = require(script:FindFirstAncestor("UserLib").Models.User);
return {
    [0] = v0.PresenceType.OFFLINE, 
    [1] = v0.PresenceType.ONLINE, 
    [2] = v0.PresenceType.IN_GAME, 
    [3] = v0.PresenceType.IN_STUDIO
};
