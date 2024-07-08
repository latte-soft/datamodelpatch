local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Promise);
return function(v3, _)
    return v3.getAccountInfo():andThen(function(v5)
        return v2.resolve(v5);
    end):catch(function(_)
        return v2.reject(v1.UnknownFailure);
    end);
end;
