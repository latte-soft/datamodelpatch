local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local _ = require(l_script_FirstAncestor_0.Store.Types);
return v1.makeActionCreator("BulkPurchaseRequested", function(v3, v4, v5, v6, v7)
    return {
        itemData = v3, 
        balance = v5, 
        totalCost = v6, 
        orderRequest = v4, 
        options = v7
    };
end);
