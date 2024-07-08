local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.SetPromptState);
local v2 = require(l_Parent_0.Actions.BalanceInfoRecieved);
local v3 = require(l_Parent_0.Actions.PurchaseCompleteRecieved);
local v4 = require(l_Parent_0.Actions.ErrorOccurred);
local v5 = require(l_Parent_0.Actions.PromptNativeUpsell);
local v6 = require(l_Parent_0.Enums.PurchaseFlow);
local v7 = require(l_Parent_0.Enums.UpsellFlow);
local v8 = require(l_Parent_0.Enums.PurchaseError);
local v9 = require(l_Parent_0.Enums.PromptState);
local v10 = require(l_Parent_0.Enums.RequestType);
local v11 = require(l_Parent_0.Enums.Counter);
local v12 = require(l_Parent_0.Thunks.sendCounter);
local _ = require(l_Parent_0.Models.RobuxUpsell);
local v14 = require(l_Parent_0.Network.getRobuxUpsellProduct);
local v15 = require(l_Parent_0.Network.getBalanceInfo);
local v16 = require(l_Parent_0.Services.Network);
local v17 = require(l_Parent_0.Services.Analytics);
local v18 = require(l_Parent_0.Services.ExternalSettings);
local v19 = require(l_Parent_0.Thunks.completeRequest);
local v20 = require(l_Parent_0.Utils.getPlayerPrice);
local v21 = require(l_Parent_0.Utils.hasPendingRequest);
local v22 = require(l_Parent_0.Utils.getPaymentPlatform);
local v23 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local v24 = require(l_Parent_0.Thunk);
local v25 = require(script.Parent.purchaseItem);
local v26 = game:DefineFastInt("UpsellAccountBalanceRetryAttemps", 3);
local v27 = game:DefineFastInt("UpsellAccountBalanceRetryIntervalSec", 1);
local v28 = {
    v17, 
    v16, 
    v18
};
local function v29(v30)
    v30 = v30 or v26;
    return v24.new(script.Name, v28, function(v31, v32)
        local v33 = v32[v17];
        local v34 = v32[v16];
        local v35 = v32[v18];
        local v36 = v31:getState();
        local l_requestType_0 = v36.promptRequest.requestType;
        local l_promptState_0 = v36.promptState;
        local l_purchaseFlow_0 = v36.purchaseFlow;
        local v40 = v23(v35.getPlatform());
        if l_requestType_0 == v10.None then
            return ;
        elseif l_promptState_0 ~= v9.UpsellInProgress and l_promptState_0 ~= v9.PollingBalance then
            return ;
        elseif not (l_requestType_0 ~= v10.Premium) or l_requestType_0 == v10.Subscription then
            if l_promptState_0 == v9.UpsellInProgress then
                v31:dispatch(v3());
                v31:dispatch(v19());
                return ;
            else
                return ;
            end;
        else
            if not (l_purchaseFlow_0 ~= v6.RobuxUpsellV2) or l_purchaseFlow_0 == v6.LargeRobuxUpsell then
                v31:dispatch(v1(v9.PollingBalance));
            end;
            return v15(v34, v35):andThen(function(v41)
                local v42 = v31:getState();
                local v43 = v20(v42.productInfo, v42.accountInfo.membershipType == 4);
                if v21(v31:getState()) then
                    local l_balance_0 = v42.accountInfo.balance;
                    local l_robux_0 = v41.robux;
                    v31:dispatch(v2(v41));
                    if l_balance_0 ~= l_robux_0 then
                        if v43 ~= nil and l_robux_0 < v43 then
                            if l_purchaseFlow_0 == v6.LargeRobuxUpsell then
                                return v14(v34, v43, l_robux_0, (v22((v35.getPlatform())))):andThen(function(v46)
                                    if v21(v31:getState()) then
                                        v31:dispatch(v5(v46.providerId, v46.id, v46.robuxAmount));
                                        v31:dispatch(v12(v11.UpsellModalShownAgain));
                                        return ;
                                    else
                                        return ;
                                    end;
                                end, function()
                                    if v21(v31:getState()) then
                                        v31:dispatch(v1(v9.LargeRobuxUpsell));
                                        v31:dispatch(v12(v11.UpsellGenericModalShownAgain));
                                        return ;
                                    else
                                        return ;
                                    end;
                                end);
                            else
                                if v40 == v7.Web then
                                    v31:dispatch(v4(v8.InvalidFundsUnknown));
                                else
                                    v31:dispatch(v4(v8.InvalidFunds));
                                end;
                                v31:dispatch(v12(v11.UpsellFailedNotEnoughRobux));
                                return ;
                            end;
                        else
                            v31:dispatch(v25());
                            return ;
                        end;
                    elseif v30 > 0 then
                        delay(v27, function()
                            v31:dispatch(v29(v30 - 1));
                        end);
                        return ;
                    else
                        v33.signalFailedPurchasePostUpsell();
                        if v40 == v7.Web then
                            v31:dispatch(v4(v8.InvalidFundsUnknown));
                            return ;
                        else
                            v31:dispatch(v4(v8.InvalidFunds));
                            return ;
                        end;
                    end;
                else
                    return ;
                end;
            end):catch(function(v47)
                v31:dispatch(v4(v47));
            end);
        end;
    end);
end;
return v29;
