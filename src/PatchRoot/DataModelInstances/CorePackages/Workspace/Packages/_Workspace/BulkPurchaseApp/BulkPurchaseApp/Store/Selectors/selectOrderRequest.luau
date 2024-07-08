local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types);
return function(v1)
    return v1.orderRequest;
end;
