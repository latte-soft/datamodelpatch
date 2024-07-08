local v0 = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React);
return function(v1, v2)
    return function()
        v2((v1()));
        return v0.createElement("Frame");
    end;
end;
