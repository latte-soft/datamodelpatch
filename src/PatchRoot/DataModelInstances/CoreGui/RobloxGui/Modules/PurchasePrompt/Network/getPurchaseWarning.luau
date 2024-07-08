local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Promise);
return function(v3, v4, v5, v6)
    return v3.getPurchaseWarning(v4, v5, v6):andThen(function(v7)
        return v2.resolve(v7);
    end):catch(function(_)
        return v2.reject(v1.UnknownFailure);
    end);
end;
