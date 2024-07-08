local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v3 = require(l_Parent_0.Actions.CompleteRequest);
local v4 = require(l_Parent_0.Enums.PromptState);
local v5 = require(l_Parent_0.Enums.RequestType);
local v6 = require(l_Parent_0.Enums.PurchaseError);
local v7 = require(l_Parent_0.Enums.Counter);
local v8 = require(l_Parent_0.Thunks.sendCounter);
local v9 = require(l_Parent_0.Services.Analytics);
local v10 = require(l_Parent_0.Thunk);
local v11 = {
    v9
};
return function()
    return v10.new(script.Name, v11, function(v12, v13)
        local v14 = v13[v9];
        local v15 = v12:getState();
        local l_requestType_0 = v15.promptRequest.requestType;
        local l_purchaseError_0 = v15.purchaseError;
        local l_id_0 = v15.promptRequest.id;
        local l_hasCompletedPurchase_0 = v15.hasCompletedPurchase;
        local v20 = v15.nativeUpsell and v15.nativeUpsell.robuxProductId;
        local v21 = v15.productInfo and v15.productInfo.productId;
        if v15.promptState == v4.U13PaymentModal then
            v14.signalScaryModalCanceled(v21, "U13PaymentModal", v20);
        elseif v15.promptState == v4.U13MonthlyThreshold1Modal then
            v14.signalScaryModalCanceled(v21, "U13MonthlyThreshold1Modal", v20);
        elseif v15.promptState == v4.U13MonthlyThreshold2Modal then
            v14.signalScaryModalCanceled(v21, "U13MonthlyThreshold2Modal", v20);
        elseif v15.promptState == v4.ParentalConsentWarningPaymentModal13To17 then
            v14.signalScaryModalCanceled(v21, "ParentalConsentWarningPaymentModal13To17", v20);
        end;
        if v15.promptState == v4.PurchaseComplete then
            v12:dispatch(v8(v7.Success));
        elseif v15.promptState == v4.Error then
            v12:dispatch(v8(v7.Failed));
        else
            v12:dispatch(v8(v7.Cancelled));
        end;
        if l_requestType_0 == v5.Product then
            l_MarketplaceService_0:SignalPromptProductPurchaseFinished(l_Players_0.LocalPlayer.UserId, l_id_0, l_hasCompletedPurchase_0);
        elseif l_requestType_0 == v5.GamePass then
            l_MarketplaceService_0:SignalPromptGamePassPurchaseFinished(l_Players_0.LocalPlayer, l_id_0, l_hasCompletedPurchase_0);
        elseif l_requestType_0 == v5.Bundle then
            l_MarketplaceService_0:SignalPromptBundlePurchaseFinished(l_Players_0.LocalPlayer, l_id_0, l_hasCompletedPurchase_0);
        elseif l_requestType_0 == v5.Asset then
            l_MarketplaceService_0:SignalPromptPurchaseFinished(l_Players_0.LocalPlayer, l_id_0, l_hasCompletedPurchase_0);
            local l_assetTypeId_0 = v15.productInfo.assetTypeId;
            if not (not l_hasCompletedPurchase_0 or not l_assetTypeId_0) then
                pcall(function()
                    l_MarketplaceService_0:SignalAssetTypePurchased(l_Players_0.LocalPlayer, l_assetTypeId_0);
                end);
            end;
        elseif l_requestType_0 == v5.Premium then
            l_MarketplaceService_0:SignalPromptPremiumPurchaseFinished(l_hasCompletedPurchase_0 or l_purchaseError_0 == v6.AlreadyPremium);
        elseif l_requestType_0 == v5.Subscription then
            l_MarketplaceService_0:SignalPromptSubscriptionPurchaseFinished(l_id_0, l_hasCompletedPurchase_0 or l_purchaseError_0 == v6.AlreadySubscribed);
        end;
        return v12:dispatch(v3());
    end);
end;
