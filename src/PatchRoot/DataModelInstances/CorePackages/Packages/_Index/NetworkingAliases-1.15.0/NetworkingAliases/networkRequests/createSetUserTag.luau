local v0 = require(script.Parent.Parent.ALIAS_URL);
local _ = require(script.Parent.Parent.networkingAliasesTypes);
return function(v2)
    return v2.roduxNetworking.POST({
        Name = "SetUserTag"
    }, function(v3, v4, v5)
        return v3(v0):path("v1"):path("user"):path("tag"):body({
            targetUserId = v4, 
            userTag = v5
        });
    end);
end;
