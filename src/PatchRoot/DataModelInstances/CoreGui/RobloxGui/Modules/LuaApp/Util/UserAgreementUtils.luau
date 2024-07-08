local v0 = require(game:GetService("CorePackages").Logging);
local v1 = {
    TermsOfService = true, 
    PrivacyPolicy = true, 
    RiderTerms = true, 
    ChildrenPrivacyPolicy = true, 
    LuobuThirdPartyDataUse = true
};
setmetatable(v1, {
    __index = function(_, v3)
        v0.warn(string.format("Unknown User Agreement Type: %s", (tostring(v3))));
        return false;
    end
});
return {
    CheckAgreementTypeExists = function(v4)
        return v1[v4];
    end
};
