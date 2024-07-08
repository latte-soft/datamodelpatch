local v0 = require(script.Parent.Parent.ACCOUNT_SETTINGS_URL);
return function(v1)
    return v1.roduxNetworking.GET({
        Name = "GetBlockedUsers"
    }, function(v2, v3)
        return v2(v0, {
            currentUserId = not not v3 and v3.currentUserId or nil
        }):path("v1"):path("users"):path("get-detailed-blocked-users");
    end);
end;
