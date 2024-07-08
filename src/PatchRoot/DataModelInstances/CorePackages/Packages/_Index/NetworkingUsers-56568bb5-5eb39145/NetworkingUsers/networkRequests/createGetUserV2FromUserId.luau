local v0 = require(script.Parent.Parent.USERS_URL);
return function(v1)
    return v1.roduxNetworking.GET({
        Name = "GetUserV2FromUserId"
    }, function(v2, v3)
        return v2(v0):path("v1"):path("users"):id(v3);
    end);
end;
