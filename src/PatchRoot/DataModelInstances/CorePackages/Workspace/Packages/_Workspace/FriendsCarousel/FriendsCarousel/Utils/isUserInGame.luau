local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local _ = require(l_Parent_0.Common.ModelTypes);
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
return function(v4)
    if v4 then
        local v5;
        if not (not (v4.userPresenceType == l_PresenceType_0.InGame) or not v4.lastLocation) then
            v5 = true;
            if not (v4.lastLocation == "") then
                goto label0;
            end;
        end;
        v5 = false;
        ::label0::;
        return v5;
    else
        return false;
    end;
end;
