local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local v2 = require(l_script_FirstAncestor_0.Parent.Http);
local _ = require(l_script_FirstAncestor_0.Common.Enums);
return v1.POST({
    Name = "GetProfile"
}, function(v4, v5)
    return v4(v2.Url.APIS_URL .. "profile-platform-api"):path("v1"):path("profiles"):path("get"):body({
        profileType = v5.profileType, 
        profileId = v5.profileId, 
        components = v5.components, 
        includeComponentOrdering = true
    });
end);
