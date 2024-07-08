local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
local _ = require(l_Parent_0.Types.networkRequestsTypes);
return function(v3)
    return v3.roduxNetworking.POST({
        Name = "GetContactEntitiesByContactId"
    }, function(v4, v5)
        return v4(v1):path("contacts-api"):path("v1"):path("contacts"):path("entities"):body({
            userContactIds = v5
        });
    end);
end;
