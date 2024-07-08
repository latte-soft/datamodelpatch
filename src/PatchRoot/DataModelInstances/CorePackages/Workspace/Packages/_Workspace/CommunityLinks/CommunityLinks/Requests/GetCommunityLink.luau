local l_Parent_0 = script:FindFirstAncestor("CommunityLinks").Parent;
local v1 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = require(l_Parent_0.Http).Url.APIS_URL, 
    path = "community-links/v1/universes/{universeId}/community"
});
return function(v2, v3)
    return v2(v1({
        universeId = v3
    }), "GET");
end;
