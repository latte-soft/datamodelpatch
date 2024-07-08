local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local _ = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
return v1.makeActionCreator("BulkPurchaseFailed", function(v3)
    return {
        errorCode = v3
    };
end);
