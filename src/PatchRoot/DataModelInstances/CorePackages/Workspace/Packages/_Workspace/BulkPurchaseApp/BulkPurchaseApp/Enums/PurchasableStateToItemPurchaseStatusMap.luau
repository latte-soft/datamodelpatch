local v0 = require(script.Parent.PurchasableStateEnum);
return {
    [v0.Unknown] = Enum.MarketplaceItemPurchaseStatus.SystemError, 
    [v0.AlreadyOwned] = Enum.MarketplaceItemPurchaseStatus.AlreadyOwned, 
    [v0.QuantityLimitExceeded] = Enum.MarketplaceItemPurchaseStatus.QuantityLimitExceeded, 
    [v0.NotForSale] = Enum.MarketplaceItemPurchaseStatus.NotForSale, 
    [v0.SoldOut] = Enum.MarketplaceItemPurchaseStatus.NotForSale
};
