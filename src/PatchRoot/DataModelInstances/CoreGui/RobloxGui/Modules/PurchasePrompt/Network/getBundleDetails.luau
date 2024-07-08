local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Promise);
return function(v3, v4)
    return v3.getBundleDetails(v4):andThen(function(v5)
        return v2.resolve(v5);
    end):catch(function(_)
        return v2.reject(v1.UnknownFailure);
    end);
end;
