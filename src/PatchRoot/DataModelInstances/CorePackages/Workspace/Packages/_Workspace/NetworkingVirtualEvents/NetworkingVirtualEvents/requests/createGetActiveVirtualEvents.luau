local v0 = require(script:FindFirstAncestor("NetworkingVirtualEvents").Parent.Http);
return function(v1)
    return (v1.GET(script, function(v2, v3)
        local v4 = v2(v0.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):path("active");
        if v3 then
            v4 = v4:queryArgs(v3);
        end;
        return v4;
    end));
end;
