local v0 = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React);
local v1 = require(script.Parent.BulkPurchasePartialSuccess);
local v2 = require(script.Parent.useBulkPurchasePartialSuccessProps);
return function()
    return v0.createElement(v1, (v2()));
end;
