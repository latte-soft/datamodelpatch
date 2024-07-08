local v0 = require(script.Parent.Parent.USERS_URL);
return function(v1)
    return v1.roduxNetworking.POST({
        Name = "SetDescription"
    }, function(v2, v3, v4)
        return v2(v0, {
            LocalUserId = v3
        }):path("v1"):path("description"):body({
            description = v4
        });
    end);
end;
