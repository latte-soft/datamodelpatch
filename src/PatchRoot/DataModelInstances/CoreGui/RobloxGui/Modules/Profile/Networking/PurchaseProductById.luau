local v0 = require(script.Parent.Parent.dependencies);
local l_RoduxNetworking_0 = v0.RoduxNetworking;
local l_Url_0 = v0.Url;
return l_RoduxNetworking_0.POST(script, function(v3, v4, v5)
    return v3(l_Url_0.ECONOMY_URL):path("v1"):path("purchases"):path("products"):id(v4):body(v5 or {});
end);
