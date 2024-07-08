local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_PresenceTypes_0 = require(l_Parent_0.Analytics.Enums).PresenceTypes;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local v4 = {
    [l_PresenceType_0.InGame] = l_PresenceTypes_0.InGame.rawValue(), 
    [l_PresenceType_0.InStudio] = l_PresenceTypes_0.InStudio.rawValue(), 
    [l_PresenceType_0.Offline] = l_PresenceTypes_0.Offline.rawValue(), 
    [l_PresenceType_0.Online] = l_PresenceTypes_0.Online.rawValue()
};
return function(v5)
    return v4[v5];
end;
