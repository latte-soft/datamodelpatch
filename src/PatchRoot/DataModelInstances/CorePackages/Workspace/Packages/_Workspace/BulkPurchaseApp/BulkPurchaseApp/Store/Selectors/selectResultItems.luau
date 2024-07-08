local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types);
local function _(v1)
    if v1 == "AvatarBundle" then
        return Enum.MarketplaceProductType.AvatarBundle;
    else
        return Enum.MarketplaceProductType.AvatarAsset;
    end;
end;
return function(v3)
    local v4 = {};
    if v3.itemData then
        for _, v6 in v3.itemData, nil, nil do
            table.insert(v4, {
                id = v6.id, 
                type = if v6.type == "AvatarBundle" then Enum.MarketplaceProductType.AvatarBundle else Enum.MarketplaceProductType.AvatarAsset, 
                status = if not v3.itemStatuses then Enum.MarketplaceItemPurchaseStatus.SystemError else v3.itemStatuses[v6.id] or Enum.MarketplaceItemPurchaseStatus.SystemError
            });
        end;
    end;
    return v4;
end;
