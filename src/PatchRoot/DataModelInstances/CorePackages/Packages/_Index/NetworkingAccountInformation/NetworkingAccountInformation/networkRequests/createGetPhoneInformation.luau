local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types.networkRequestsTypes);
local v2 = require(l_Parent_0.ACCOUNT_INFORMATION_URL);
return function(v3)
    return v3.roduxNetworking.GET({
        Name = "GetPhoneInformation"
    }, function(v4)
        return v4(v2):path("v1"):path("phone");
    end);
end;
