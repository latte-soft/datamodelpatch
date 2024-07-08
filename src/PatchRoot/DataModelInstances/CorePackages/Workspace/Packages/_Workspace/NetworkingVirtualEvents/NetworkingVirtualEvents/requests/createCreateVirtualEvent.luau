local l_script_FirstAncestor_0 = script:FindFirstAncestor("NetworkingVirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Http);
local _ = require(l_script_FirstAncestor_0.types);
return function(v3)
    return (v3.POST(script, function(v4, v5)
        return v4(v1.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):path("create"):body({
            title = v5.title, 
            description = v5.description, 
            eventTime = {
                startTime = v5.eventTime.startTime:ToIsoDate(), 
                endTime = v5.eventTime.endTime:ToIsoDate()
            }, 
            universeId = v5.universeId
        });
    end));
end;
