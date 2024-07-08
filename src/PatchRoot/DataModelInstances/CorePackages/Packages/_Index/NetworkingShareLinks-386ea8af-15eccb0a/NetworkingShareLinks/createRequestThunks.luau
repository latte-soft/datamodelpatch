local _ = require(script.Parent.networkingShareLinkTypes);
local l_networkRequests_0 = script.Parent.networkRequests;
local v2 = require(l_networkRequests_0.createGenerateLink);
local v3 = require(l_networkRequests_0.createResolveLinkFromLinkId);
return function(v4)
    return {
        ResolveLinkFromLinkId = v3(v4), 
        GenerateLink = v2(v4)
    };
end;
