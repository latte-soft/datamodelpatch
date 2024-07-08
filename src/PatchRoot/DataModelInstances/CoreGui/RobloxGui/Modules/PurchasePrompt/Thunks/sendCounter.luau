local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.Counter);
local v2 = require(l_Parent_0.Enums.PurchaseFlow);
local v3 = require(l_Parent_0.Enums.PaymentPlatform);
local v4 = require(l_Parent_0.Services.Analytics);
local v5 = require(l_Parent_0.Services.ExternalSettings);
local v6 = require(l_Parent_0.Utils.getPaymentPlatform);
local v7 = require(l_Parent_0.Utils.getCounterCombinations);
local v8 = require(l_Parent_0.Thunk);
local v9 = {
    v4, 
    v5
};
return function(v10)
    return v8.new(script.Name, v9, function(v11, v12)
        local v13 = v12[v4];
        local v14 = v12[v5];
        local v15 = v1.toRawValue(v10);
        local v16 = v11:getState();
        local l_purchaseFlow_0 = v16.purchaseFlow;
        local v18 = if l_purchaseFlow_0 ~= nil then v2.toRawValue(l_purchaseFlow_0) else nil;
        for _, v20 in (v7("PurchasePrompt", v15, v3.toRawValue((v6((v14.getPlatform())))), v18, v16.nativeUpsell.robuxPurchaseAmount)), nil, nil do
            v13.sendCounter(v20);
        end;
    end);
end;
