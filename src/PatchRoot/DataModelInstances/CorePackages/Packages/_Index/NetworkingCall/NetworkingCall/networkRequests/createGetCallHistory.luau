local v0 = require(script.Parent.Parent.CALL_URL);
local _ = require(script.Parent.Parent.networkingCallTypes);
return function(v2)
    return (v2.roduxNetworking.GET({
        Name = "GetCallHistory"
    }, function(v3, v4)
        return v3(v0):path("call"):path("v1"):path("get-call-history"):queryArgs({
            universeId = if not v4 then nil else v4.universeId, 
            limit = if not v4 then nil else v4.limit, 
            cursor = if not v4 then nil else v4.cursor
        });
    end));
end;
