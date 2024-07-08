local l_UserModel_0 = require(script:FindFirstAncestor("SocialLibraries").dependencies).UserModel;
local v1 = {
    [l_UserModel_0.PresenceType.IN_GAME] = 3, 
    [l_UserModel_0.PresenceType.ONLINE] = 2, 
    [l_UserModel_0.PresenceType.IN_STUDIO] = 1, 
    [l_UserModel_0.PresenceType.OFFLINE] = 0
};
return function(v2, v3)
    v2 = v2 or {};
    v3 = v3 or {};
    local l_presence_0 = v2.presence;
    local l_presence_1 = v3.presence;
    if not (not l_presence_0 or not l_presence_1) and v1[l_presence_0] ~= v1[l_presence_1] then
        return v1[l_presence_1] < v1[l_presence_0];
    else
        return v2.displayName < v3.displayName;
    end;
end;
