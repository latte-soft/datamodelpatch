local v0 = require(script.Parent.Parent.CHAT_URL);
return function(v1)
    return v1.roduxNetworking.GET({
        Name = "GetMetadata"
    }, function(v2)
        return v2(v0):path("v2"):path("metadata");
    end);
end;
