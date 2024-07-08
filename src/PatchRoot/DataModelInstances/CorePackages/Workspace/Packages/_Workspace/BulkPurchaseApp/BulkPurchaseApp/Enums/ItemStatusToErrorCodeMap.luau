local v0 = require(script.Parent.ErrorCodeEnum);
return {
    [Enum.MarketplaceItemPurchaseStatus.NotForSale] = v0.NotForSale, 
    [Enum.MarketplaceItemPurchaseStatus.PriceMismatch] = v0.PriceMismatch, 
    [Enum.MarketplaceItemPurchaseStatus.SoldOut] = v0.SoldOut, 
    [Enum.MarketplaceItemPurchaseStatus.InsufficientRobux] = v0.InsufficientRobux, 
    [Enum.MarketplaceItemPurchaseStatus.QuotaExceeded] = v0.QuotaExceeded, 
    [Enum.MarketplaceItemPurchaseStatus.NotAvailableForPurchaser] = v0.NotAvailableForPurchaser, 
    [Enum.MarketplaceItemPurchaseStatus.AlreadyOwned] = v0.AlreadyOwned, 
    [Enum.MarketplaceItemPurchaseStatus.PurchaserIsSeller] = v0.PurchaserIsSeller, 
    [Enum.MarketplaceItemPurchaseStatus.QuantityLimitExceeded] = v0.QuantityLimitExceeded, 
    [Enum.MarketplaceItemPurchaseStatus.InsufficientMembership] = v0.InsufficientMembership, 
    [Enum.MarketplaceItemPurchaseStatus.Success] = v0.Generic, 
    [Enum.MarketplaceItemPurchaseStatus.SystemError] = v0.Generic, 
    [Enum.MarketplaceItemPurchaseStatus.PlaceInvalid] = v0.PlaceInvalid
};
