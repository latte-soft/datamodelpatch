local v0 = require(script.Parent.Parent.ACCOUNT_SETTINGS_URL);
return function(v1)
    return v1.roduxNetworking.POST({
        Name = "BlockUserById"
    }, function(v2, v3)
        return v2(v0, {
            currentUserId = v3.currentUserId
        }):path("v1"):path("users"):id(v3.userId):path("block"):body({});
    end);
end;
