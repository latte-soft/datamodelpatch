local v0 = require(script.Parent.Parent.ALIAS_URL);
local _ = require(script.Parent.Parent.networkingAliasesTypes);
return function(v2)
    return v2.roduxNetworking.POST({
        Name = "GetTagsFromUserIds"
    }, function(v3, v4)
        return v3(v0):path("v1"):path("user"):path("get-tags"):body({
            targetUserIds = v4
        });
    end);
end;
