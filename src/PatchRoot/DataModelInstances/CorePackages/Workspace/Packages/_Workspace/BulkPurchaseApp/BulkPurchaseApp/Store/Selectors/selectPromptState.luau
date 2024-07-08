local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local _ = require(l_script_FirstAncestor_0.Store.Types);
local _ = require(l_script_FirstAncestor_0.Enums.BulkPurchasePromptStateEnum);
return function(v3)
    return v3.promptState;
end;
