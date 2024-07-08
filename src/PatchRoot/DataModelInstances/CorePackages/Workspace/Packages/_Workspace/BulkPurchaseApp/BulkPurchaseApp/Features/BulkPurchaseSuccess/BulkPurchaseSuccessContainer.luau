local v0 = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React);
local v1 = require(script.Parent.BulkPurchaseSuccess);
local v2 = require(script.Parent.useBulkPurchaseSuccessProps);
return function()
    return v0.createElement(v1, (v2()));
end;
