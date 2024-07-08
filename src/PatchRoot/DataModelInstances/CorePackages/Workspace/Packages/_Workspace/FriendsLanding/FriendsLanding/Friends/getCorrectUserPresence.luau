local l_PresenceType_0 = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxPresence.Enums.PresenceType;
local v1 = require(script.Parent.isUserInGame);
return function(v2)
    if v2 then
        assert(v2, "");
        local l_userPresenceType_0 = v2.userPresenceType;
        if l_userPresenceType_0 == l_PresenceType_0.InGame then
            return not not v1(v2) and l_PresenceType_0.InGame or l_PresenceType_0.Online;
        else
            return l_userPresenceType_0;
        end;
    else
        return nil;
    end;
end;
