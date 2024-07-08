local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_StyledTextLabel_0 = require(l_Parent_0.UIBlox).App.Text.StyledTextLabel;
local v6 = require(l_script_FirstAncestor_0.Components.AlertPrompt);
local v7 = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
local function v10(v8)
    local v9 = l_useDesignTokens_0();
    return v2.createElement(l_StyledTextLabel_0, {
        size = UDim2.fromScale(1, 0), 
        automaticSize = Enum.AutomaticSize.Y, 
        fontStyle = v9.Semantic.Typography.Body, 
        colorStyle = v9.Semantic.Color.Text.Default, 
        textXAlignment = Enum.TextXAlignment.Center, 
        text = v8.text, 
        layoutOrder = v8.layoutOrder
    });
end;
local v11 = {
    [v7.InsufficientRobux] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonInsufficientRobux", 
    [v7.QuotaExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonQuotaExceeded", 
    [v7.NotForSale] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonNotForSale", 
    [v7.AlreadyOwned] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonAlreadyOwned", 
    [v7.PurchaserIsSeller] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonPurchaserIsSeller", 
    [v7.NotAvailableForPurchaser] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonNotAvailableForPurchaser", 
    [v7.PriceMismatch] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonPriceMismatch", 
    [v7.QuantityLimitExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonQuantityLimitExceeded", 
    [v7.InsufficientMembership] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonInsufficientMembership", 
    [v7.Generic] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonGeneric", 
    [v7.SoldOut] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonSoldOut", 
    [v7.TwoStepVerificationRequired] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReason2SV", 
    [v7.PlaceInvalid] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonNotAvailableInExperience"
};
local v12 = {
    [v7.InsufficientRobux] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainMoreRobux", 
    [v7.QuotaExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainWait", 
    [v7.NotForSale] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems", 
    [v7.AlreadyOwned] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems", 
    [v7.PurchaserIsSeller] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems", 
    [v7.NotAvailableForPurchaser] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems", 
    [v7.PriceMismatch] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainNow", 
    [v7.QuantityLimitExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems", 
    [v7.InsufficientMembership] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems", 
    [v7.Generic] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainLater", 
    [v7.SoldOut] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainNow", 
    [v7.TwoStepVerificationRequired] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems", 
    [v7.PlaceInvalid] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems"
};
return function(v13)
    local v14 = l_useDesignTokens_0();
    local v15 = l_useLocalization_0({
        title = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorHeading", 
        errorReason = v11[v13.errorCode], 
        tryAgain = v12[v13.errorCode], 
        dismissCTA = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.DismissCTA"
    });
    return v2.createElement(v6, {
        title = v15.title, 
        dismissCTA = v15.dismissCTA, 
        onDismiss = v13.onDismiss, 
        middleContent = function()
            return v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, v14.Global.Space_200)
                }), 
                ErrorReason = v2.createElement(v10, {
                    text = v15.errorReason, 
                    layoutOrder = 1
                }), 
                TryAgain = if not v15.tryAgain then nil else v2.createElement(v10, {
                    text = v15.tryAgain, 
                    layoutOrder = 2
                })
            });
        end
    });
end;
