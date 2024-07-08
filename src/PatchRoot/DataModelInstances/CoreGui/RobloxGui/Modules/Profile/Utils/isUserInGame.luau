local l_PresenceType_0 = require(script.Parent.Parent.dependencies).RoduxPresence.Enums.PresenceType;
return function(v1, v2)
    local v3 = false;
    if v1 == l_PresenceType_0.InGame then
        v3 = v2 and v2 ~= "";
    end;
    return v3;
end;
