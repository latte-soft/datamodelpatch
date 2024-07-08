local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = require(l_Parent_0.Http).Url.APIS_URL, 
    path = "phone-number-api/v1/phone-prefix-list"
});
return function(v2)
    return v2(v1(), "GET");
end;
