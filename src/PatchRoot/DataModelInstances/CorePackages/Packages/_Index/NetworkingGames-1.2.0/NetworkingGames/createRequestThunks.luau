local l_networkRequests_0 = script.Parent.networkRequests;
local v1 = require(l_networkRequests_0.createGetExperiencesPlayabilityStatus);
local v2 = require(l_networkRequests_0.createGetExperiencesProductInfo);
local v3 = require(l_networkRequests_0.createGetExperiencesDetails);
local v4 = require(l_networkRequests_0.createGetExperienceMedia);
return function(v5)
    return {
        GetExperiencesPlayabilityStatus = v1(v5), 
        GetExperiencesProductInfo = v2(v5), 
        GetExperiencesDetails = v3(v5), 
        GetExperienceMedia = v4(v5)
    };
end;
