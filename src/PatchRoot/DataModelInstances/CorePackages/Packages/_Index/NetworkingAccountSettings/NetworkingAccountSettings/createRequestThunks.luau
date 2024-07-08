local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.networkRequests.createGetEmailSettings);
local _ = require(l_Parent_0.Types.networkRequestsTypes);
return function(v3)
    return {
        GetEmailSettings = v1(v3)
    };
end;
