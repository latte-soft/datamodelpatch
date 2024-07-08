local l_PresenceType_0 = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxPresence.Enums.PresenceType;
return function(v1)
    if v1 then
        assert(v1, "user modal must be non-nil");
        local v2;
        if not (not (v1.userPresenceType == l_PresenceType_0.InGame) or not v1.lastLocation) then
            v2 = true;
            if not (v1.lastLocation == "") then
                goto label0;
            end;
        end;
        v2 = false;
        ::label0::;
        return v2;
    else
        return false;
    end;
end;
