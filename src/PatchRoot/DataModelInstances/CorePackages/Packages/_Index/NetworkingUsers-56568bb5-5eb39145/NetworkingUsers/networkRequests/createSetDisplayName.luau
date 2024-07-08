local v0 = require(script.Parent.Parent.USERS_URL);
return function(v1)
    return v1.roduxNetworking.PATCH({
        Name = "SetDisplayName"
    }, function(v2, v3, v4)
        return v2(v0):path("v1"):path("users"):id(v3):path("display-names"):body({
            newDisplayName = v4
        });
    end);
end;
