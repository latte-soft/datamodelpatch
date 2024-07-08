local v0 = require(script.Parent.Parent.dependencies);
local l_RoduxNetworking_0 = v0.RoduxNetworking;
local l_Url_0 = v0.Url;
return l_RoduxNetworking_0.POST(script, function(v3, v4)
    return (v3(l_Url_0.APIS_URL):path("thumbnails-gateway"):path("v1"):path("getavatarthumbnails"):body({
        height = v4.height, 
        width = v4.width, 
        format = "png", 
        avatarType = "avatar", 
        assetHashIds = v4.assetHashIds
    }));
end);
