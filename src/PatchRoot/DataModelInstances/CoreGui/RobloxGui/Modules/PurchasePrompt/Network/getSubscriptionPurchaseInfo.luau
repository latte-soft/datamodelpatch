local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Utils.parseSubscriptionError);
return function(v3, v4)
    return v3.getSubscriptionPurchaseInfo(v4):catch(function(v5)
        return v1.reject(v2(v5));
    end);
end;
