return (require(game:GetService("CorePackages").PurchasePromptDeps).Rodux.createReducer({}, {
    [require(script.Parent.Parent.Actions.PromptNativeUpsell).name] = function(_, v1)
        return {
            robuxProductId = v1.robuxProductId, 
            productId = v1.productId, 
            robuxPurchaseAmount = v1.robuxPurchaseAmount
        };
    end
}));
