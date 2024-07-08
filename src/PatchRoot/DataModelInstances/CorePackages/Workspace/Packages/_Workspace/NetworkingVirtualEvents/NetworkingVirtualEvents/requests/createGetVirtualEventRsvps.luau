local v0 = require(script:FindFirstAncestor("NetworkingVirtualEvents").Parent.Http);
return function(v1)
    return (v1.GET(script, function(v2, v3, v4)
        local v5 = v2(v0.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(v3):path("rsvps");
        if v4 then
            v5 = v5:queryArgs(v4);
        end;
        return v5;
    end));
end;
