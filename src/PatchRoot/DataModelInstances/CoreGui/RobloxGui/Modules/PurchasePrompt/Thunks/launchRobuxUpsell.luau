local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local v2 = require(l_Parent_0.Actions.ErrorOccurred);
local v3 = require(l_Parent_0.Actions.SetPromptState);
local v4 = require(l_Parent_0.Enums.UpsellFlow);
local v5 = require(l_Parent_0.Enums.PromptState);
local v6 = require(l_Parent_0.Enums.PurchaseError);
local v7 = require(l_Parent_0.Enums.PurchaseFlow);
local v8 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local v9 = require(l_Parent_0.Misc.Constants);
local v10 = require(l_Parent_0.Network.postPurchaseWarningAcknowledge);
local v11 = require(l_Parent_0.Services.Analytics);
local v12 = require(l_Parent_0.Services.ExternalSettings);
local v13 = require(l_Parent_0.Services.Network);
local v14 = require(l_Parent_0.Services.PlatformInterface);
local v15 = require(l_Parent_0.Thunk);
local v16 = require(l_Parent_0.Promise);
local v17 = require(script.Parent.retryAfterUpsell);
local v18 = {
    v11, 
    v12, 
    v13, 
    v14
};
return function()
    return v15.new(script.Name, v18, function(v19, v20)
        local v21 = v20[v11];
        local v22 = v20[v12];
        local v23 = v20[v13];
        local v24 = v20[v14];
        local v25 = v19:getState();
        local v26 = v8(v22.getPlatform());
        local v27 = false;
        if v26 ~= v4.Web then
            v27 = v25.nativeUpsell.robuxProductId;
        end;
        local l_productId_0 = v25.productInfo.productId;
        if v25.promptState == v5.U13PaymentModal then
            v21.signalScaryModalConfirmed(l_productId_0, "U13PaymentModal", v27);
        elseif v25.promptState == v5.U13MonthlyThreshold1Modal then
            v21.signalScaryModalConfirmed(l_productId_0, "U13MonthlyThreshold1Modal", v27);
        elseif v25.promptState == v5.U13MonthlyThreshold2Modal then
            v21.signalScaryModalConfirmed(l_productId_0, "U13MonthlyThreshold2Modal", v27);
        elseif v25.promptState == v5.ParentalConsentWarningPaymentModal13To17 then
            v21.signalScaryModalConfirmed(l_productId_0, "ConfirmedParentalConsentWarningPaymentModal13To17", v27);
        end;
        if v25.promptState == v5.U13PaymentModal then
            v10.Post(v23, v10.UserActionType.ConfirmedU13PaymentModal);
        elseif v25.promptState == v5.U13MonthlyThreshold1Modal then
            v10.Post(v23, v10.UserActionType.ConfirmedU13MonthlyThreshold1Modal);
        elseif v25.promptState == v5.U13MonthlyThreshold2Modal then
            v10.Post(v23, v10.UserActionType.ConfirmedU13MonthlyThreshold2Modal);
        elseif v25.promptState == v5.ParentalConsentWarningPaymentModal13To17 then
            v10.Post(v23, v10.UserActionType.ConfirmedParentalConsentWarningPaymentModal13To17);
        end;
        if not v22.getFFlagDisableRobuxUpsell() then
            if v26 == v4.Web then
                v21.signalProductPurchaseUpsellConfirmed(l_productId_0, v25.requestType, v25.nativeUpsell.productId);
                local l_purchaseFlow_0 = v25.purchaseFlow;
                if not (l_purchaseFlow_0 ~= v7.RobuxUpsellV2) or l_purchaseFlow_0 == v7.LargeRobuxUpsell then
                    v24.startRobuxUpsellWeb(v25.nativeUpsell.productId);
                else
                    v24.startRobuxUpsellWeb();
                end;
                v19:dispatch(v3(v5.UpsellInProgress));
                return ;
            elseif v26 == v4.Mobile then
                local l_robuxProductId_0 = v25.nativeUpsell.robuxProductId;
                local l_productId_1 = v25.productInfo.productId;
                local l_requestType_0 = v25.requestType;
                local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                v21.signalProductPurchaseUpsellConfirmed(l_productId_1, l_requestType_0, l_robuxProductId_0);
                if not game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
                    v24.promptNativePurchase(l_LocalPlayer_0, l_robuxProductId_0);
                else
                    v24.promptNativePurchaseWithLocalPlayer(l_robuxProductId_0);
                end;
                v19:dispatch(v3(v5.UpsellInProgress));
                return ;
            elseif v26 == v4.Xbox then
                local l_robuxProductId_1 = v25.nativeUpsell.robuxProductId;
                local l_productId_2 = v25.productInfo.productId;
                local l_requestType_1 = v25.requestType;
                v21.signalProductPurchaseUpsellConfirmed(l_productId_2, l_requestType_1, l_robuxProductId_1);
                v19:dispatch(v3(v5.UpsellInProgress));
                return v16.new(function(v37, v38)
                    local v39 = nil;
                    local v40 = nil;
                    local v41 = nil;
                    local l_status_0, l_result_0 = pcall(function()
                        v39 = v24.beginPlatformStorePurchase(l_robuxProductId_1);
                    end);
                    v40 = l_status_0;
                    v41 = l_result_0;
                    if not v40 then
                        v38(v41);
                    else
                        v37(v39);
                    end;
                end):andThen(function(v44)
                    if v44 == v9.PlatformPurchaseResult.PurchaseResult_Success then
                        v21.signalXboxInGamePurchaseSuccess(l_productId_2, l_requestType_1, l_robuxProductId_1);
                    elseif v44 == v9.PlatformPurchaseResult.PurchaseResult_UserCancelled then
                        v21.signalXboxInGamePurchaseCanceled(l_productId_2, l_requestType_1, l_robuxProductId_1);
                    else
                        v21.signalXboxInGamePurchaseFailure(l_productId_2, l_requestType_1, l_robuxProductId_1);
                    end;
                    if not (v44 ~= v9.PlatformPurchaseResult.PurchaseResult_Success) or v44 == v9.PlatformPurchaseResult.PurchaseResult_RobuxUpdated then
                        return v19:dispatch(v17());
                    else
                        return v19:dispatch(v2(v6.UnknownFailure));
                    end;
                end);
            elseif v26 == v4.Unavailable then
                v19:dispatch(v2(v6.NotEnoughRobuxNoUpsell));
                return ;
            else
                warn("Need more Robux: platform not supported for Robux purchase");
                return ;
            end;
        else
            v19:dispatch(v2(v6.NotEnoughRobuxNoUpsell));
            return ;
        end;
    end);
end;
