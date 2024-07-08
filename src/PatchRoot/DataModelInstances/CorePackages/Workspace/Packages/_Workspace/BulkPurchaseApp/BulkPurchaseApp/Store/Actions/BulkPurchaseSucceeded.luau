local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local _ = require(l_script_FirstAncestor_0.Enums.BulkPurchasePromptStateEnum);
return v1.makeActionCreator("BulkPurchaseSucceeded", function(v3, v4)
    return {
        promptState = v3, 
        itemStatuses = v4
    };
end);
