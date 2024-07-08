local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.networkRequests.createGetPhoneInformation);
local _ = require(l_Parent_0.Types.networkRequestsTypes);
return function(v3)
    return {
        GetPhoneInformation = v1(v3)
    };
end;
