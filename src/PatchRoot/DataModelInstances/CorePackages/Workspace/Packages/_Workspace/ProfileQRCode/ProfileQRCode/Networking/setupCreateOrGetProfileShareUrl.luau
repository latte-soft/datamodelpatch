local v0 = require(script:FindFirstAncestor("ProfileQRCode").Parent.Http);
local function v2(v1)
    return v1(v0.Url.APIS_URL .. "sharelinks"):path("v1"):path("get-or-create-link"):body({
        linkType = "Profile"
    });
end;
return {
    profileLinkType = "Profile", 
    buildUrl = v2, 
    setupRequest = function(v3)
        return v3.POST(script, v2);
    end
};
