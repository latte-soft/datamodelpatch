local l_PresenceType_0 = require(script:FindFirstAncestor("SocialTab").dependencies).RoduxPresence.Enums.PresenceType;
local v1 = {
    [l_PresenceType_0.InGame] = 3, 
    [l_PresenceType_0.Online] = 2, 
    [l_PresenceType_0.InStudio] = 1, 
    [l_PresenceType_0.Offline] = 0
};
local function _(v2)
    return v1[v2] or v1[l_PresenceType_0.Offline];
end;
return function(v4, v5)
    local v6 = v1[v4.userPresenceType] or v1[l_PresenceType_0.Offline];
    local v7 = v1[v5.userPresenceType] or v1[l_PresenceType_0.Offline];
    if v6 == v7 then
        return string.lower(v4.displayName) < string.lower(v5.displayName);
    else
        return v7 < v6;
    end;
end;
