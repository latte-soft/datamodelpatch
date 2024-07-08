local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Thunk);
local v3 = require(l_Parent_0.Enums.PurchaseError);
local v4 = require(l_Parent_0.Actions.RequestPremiumPurchase);
local v5 = require(l_Parent_0.Actions.ErrorOccurred);
local v6 = require(l_Parent_0.Network.getPremiumUpsellPrecheck);
local v7 = require(l_Parent_0.Network.getPremiumProductInfo);
local v8 = require(l_Parent_0.Network.getAccountInfo);
local v9 = require(l_Parent_0.Network.getBalanceInfo);
local v10 = require(l_Parent_0.Services.Network);
local v11 = require(l_Parent_0.Services.ExternalSettings);
local v12 = require(l_Parent_0.Thunks.resolvePremiumPromptState);
local v13 = require(l_Parent_0.Utils.hasPendingRequest);
local v14 = {
    v10, 
    v11
};
return function(_, _, _)
    return v2.new(script.Name, v14, function(v18, v19)
        local v20 = v19[v10];
        local v21 = v19[v11];
        if not v13(v18:getState()) then
            v18:dispatch(v4());
            if not v21.getFlagOrder66() then
                return v1.all({
                    canShowUpsell = not not not v21.isStudio() and v6(v20) or v1.resolve(true), 
                    premiumProductInfo = v7(v20), 
                    accountInfo = v8(v20, v21), 
                    balanceInfo = v9(v20, v21)
                }):andThen(function(v22)
                    v18:dispatch(v12(v22.accountInfo, v22.balanceInfo, v22.premiumProductInfo, v22.canShowUpsell));
                end):catch(function(v23)
                    v18:dispatch(v5(v23));
                end);
            else
                v18:dispatch(v5(v3.PurchaseDisabled));
                return nil;
            end;
        else
            return nil;
        end;
    end);
end;
