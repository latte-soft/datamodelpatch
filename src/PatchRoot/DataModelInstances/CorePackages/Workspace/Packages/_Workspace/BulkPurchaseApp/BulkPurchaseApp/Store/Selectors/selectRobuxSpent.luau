local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types);
return function(v1)
    local v2 = 0;
    if not (not v1.itemData or not v1.itemStatuses) then
        for _, v4 in v1.itemData, nil, nil do
            if v1.itemStatuses[v4.id] == Enum.MarketplaceItemPurchaseStatus.Success then
                v2 = v2 + v4.priceRobux;
            end;
        end;
    end;
    return v2;
end;
