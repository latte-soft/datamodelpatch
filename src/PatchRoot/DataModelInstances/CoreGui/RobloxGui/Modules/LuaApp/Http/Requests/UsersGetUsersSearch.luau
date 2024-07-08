local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.UrlBuilder).UrlBuilder.new({
    base = require(l_CorePackages_0.Workspace.Packages.Http).Url.USERS_URL, 
    path = "/users/search", 
    query = {
        {
            name = "keyword", 
            value = "{keyword}", 
            optional = false
        }, 
        {
            name = "limit", 
            value = "{limit}", 
            optional = false
        }, 
        {
            name = "cursor", 
            value = "{cursor}", 
            optional = true
        }, 
        {
            name = "sessionId", 
            value = "{sessionId}", 
            optional = true
        }
    }
});
return function(v2, v3, v4, v5, v6)
    return v2(v1({
        keyword = v3, 
        limit = v4, 
        cursor = v5, 
        sessionId = if not v6 then nil else v6.userSearchSessionId
    }), "GET");
end;
