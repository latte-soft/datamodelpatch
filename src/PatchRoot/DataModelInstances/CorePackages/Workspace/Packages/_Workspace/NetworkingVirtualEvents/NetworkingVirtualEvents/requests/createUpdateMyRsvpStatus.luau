local l_script_FirstAncestor_0 = script:FindFirstAncestor("NetworkingVirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Http);
local _ = require(l_script_FirstAncestor_0.types);
return function(v3)
    return (v3.POST(script, function(v4, v5, v6)
        return (v4(v1.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(v5):path("rsvps"):body({
            rsvpStatus = v6
        }));
    end));
end;
