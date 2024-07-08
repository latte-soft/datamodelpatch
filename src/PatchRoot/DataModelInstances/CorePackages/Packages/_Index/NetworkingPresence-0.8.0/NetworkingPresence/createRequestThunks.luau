local v0 = require(script.Parent.networkRequests.createGetPresencesFromUserIds);
local _ = require(script.Parent.networkingPresenceTypes);
return function(v2)
    return {
        GetPresencesFromUserIds = v0(v2)
    };
end;
