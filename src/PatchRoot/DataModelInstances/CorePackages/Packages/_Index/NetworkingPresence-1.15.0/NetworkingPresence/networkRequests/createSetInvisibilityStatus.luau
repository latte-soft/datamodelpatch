local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.networkingPresenceTypes);
local v2 = require(l_Parent_0.PRESENCE_URL);
return function(v3)
    return v3.roduxNetworking.POST({
        Name = "SetInvisibilityStatus"
    }, function(v4, v5)
        return v4(v2):path("v1"):path("presence"):path("set-invisibility-status"):body({
            isInvisible = v5
        });
    end);
end;
