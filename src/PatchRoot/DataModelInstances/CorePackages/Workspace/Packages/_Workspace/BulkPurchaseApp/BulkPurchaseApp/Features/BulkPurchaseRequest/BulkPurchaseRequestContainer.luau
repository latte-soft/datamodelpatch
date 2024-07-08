local v0 = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React);
local v1 = require(script.Parent.BulkPurchaseRequest);
local v2 = require(script.Parent.useBulkPurchaseRequestProps);
return function()
    return v0.createElement(v1, (v2()));
end;
