local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Promise);
return function(v3, v4, v5)
    return v3.getProductInfo(v4, v5):catch(function(_)
        return v2.reject(v1.UnknownFailureNoItemName);
    end);
end;
