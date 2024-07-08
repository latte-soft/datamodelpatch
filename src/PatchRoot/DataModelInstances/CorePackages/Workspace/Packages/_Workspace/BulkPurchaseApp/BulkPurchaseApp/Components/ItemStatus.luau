local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_StyledTextLabel_0 = require(l_Parent_0.UIBlox).App.Text.StyledTextLabel;
local v5 = {
    itemStatusNotForSale = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemStatusNotForSale", 
    itemStatusPriceMismatch = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemStatusPriceMismatch", 
    itemStatusSoldOut = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemStatusSoldOut", 
    itemStatusInsufficientRobux = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemStatusInsufficientRobux", 
    itemStatusQuotaExceeded = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemStatusQuotaExceeded", 
    itemStatusNotAvailableForPurchaser = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemStatusNotAvailableForPurchaser", 
    itemStatusAlreadyOwned = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemStatusAlreadyOwned", 
    itemStatusPurchaserIsSeller = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemStatusPurchaserIsSeller", 
    itemStatusQuantityLimitExceeded = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemStatusQuantityLimitExceeded", 
    itemStatusInsufficientMembership = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemStatusInsufficientMembership", 
    itemStatusSuccess = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemStatusSuccess", 
    itemStatusGeneric = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemStatusGeneric", 
    itemStatusPlaceInvalid = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemStatusPlaceInvalid"
};
local v6 = {
    [Enum.MarketplaceItemPurchaseStatus.NotForSale] = "itemStatusNotForSale", 
    [Enum.MarketplaceItemPurchaseStatus.PriceMismatch] = "itemStatusPriceMismatch", 
    [Enum.MarketplaceItemPurchaseStatus.SoldOut] = "itemStatusSoldOut", 
    [Enum.MarketplaceItemPurchaseStatus.InsufficientRobux] = "itemStatusInsufficientRobux", 
    [Enum.MarketplaceItemPurchaseStatus.QuotaExceeded] = "itemStatusQuotaExceeded", 
    [Enum.MarketplaceItemPurchaseStatus.NotAvailableForPurchaser] = "itemStatusNotAvailableForPurchaser", 
    [Enum.MarketplaceItemPurchaseStatus.AlreadyOwned] = "itemStatusAlreadyOwned", 
    [Enum.MarketplaceItemPurchaseStatus.PurchaserIsSeller] = "itemStatusPurchaserIsSeller", 
    [Enum.MarketplaceItemPurchaseStatus.QuantityLimitExceeded] = "itemStatusQuantityLimitExceeded", 
    [Enum.MarketplaceItemPurchaseStatus.InsufficientMembership] = "itemStatusInsufficientMembership", 
    [Enum.MarketplaceItemPurchaseStatus.Success] = "itemStatusSuccess", 
    [Enum.MarketplaceItemPurchaseStatus.SystemError] = "itemStatusGeneric", 
    [Enum.MarketplaceItemPurchaseStatus.PlaceInvalid] = "itemStatusPlaceInvalid"
};
local function v8(v7)
    return {
        successColor = v7.Semantic.Color.Common.Success, 
        failureColor = v7.Semantic.Color.Common.Alert, 
        fontStyle = v7.Semantic.Typography.CaptionBody
    };
end;
return function(v9)
    local v10 = l_useDesignTokens_0(v8);
    return v1.createElement(l_StyledTextLabel_0, {
        fontStyle = v10.fontStyle, 
        colorStyle = if v9.status == Enum.MarketplaceItemPurchaseStatus.Success then v10.successColor else v10.failureColor, 
        text = l_useLocalization_0(v5)[v6[v9.status]], 
        textWrapped = true, 
        size = UDim2.fromScale(1, 1), 
        textXAlignment = Enum.TextXAlignment.Right, 
        textYAlignment = Enum.TextYAlignment.Top, 
        lineHeight = v10.fontStyle.LineHeight
    });
end;
