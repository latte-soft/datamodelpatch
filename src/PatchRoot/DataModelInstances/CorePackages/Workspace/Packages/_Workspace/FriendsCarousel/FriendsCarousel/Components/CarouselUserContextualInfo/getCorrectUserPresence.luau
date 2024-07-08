local l_Parent_0 = script.Parent.Parent.Parent;
local l_PresenceType_0 = require(l_Parent_0.dependencies).RoduxPresence.Enums.PresenceType;
local _ = require(l_Parent_0.Common.ModelTypes);
local v3 = require(l_Parent_0.Utils.isUserInGame);
return function(v4)
    local l_userPresenceType_0 = v4.userPresenceType;
    if l_userPresenceType_0 == l_PresenceType_0.InGame then
        return not not v3(v4) and l_PresenceType_0.InGame or l_PresenceType_0.Online;
    else
        return l_userPresenceType_0;
    end;
end;
