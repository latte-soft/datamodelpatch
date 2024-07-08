local l_PresenceType_0 = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxPresence.Enums.PresenceType;
return {
    [l_PresenceType_0.Offline] = "Common.Presence.Label.Offline", 
    [l_PresenceType_0.Online] = "Common.Presence.Label.Online", 
    [l_PresenceType_0.InGame] = "Common.Presence.Label.Online", 
    [l_PresenceType_0.InStudio] = "Common.Presence.Label.Online"
};
