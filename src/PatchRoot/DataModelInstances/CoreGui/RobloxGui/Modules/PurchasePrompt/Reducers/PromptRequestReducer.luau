local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Rodux_0 = require(l_CorePackages_0.PurchasePromptDeps).Rodux;
local v4 = require(l_Parent_0.Actions.RequestAssetPurchase);
local v5 = require(l_Parent_0.Actions.RequestBundlePurchase);
local v6 = require(l_Parent_0.Actions.RequestGamepassPurchase);
local v7 = require(l_Parent_0.Actions.RequestProductPurchase);
local v8 = require(l_Parent_0.Actions.RequestPremiumPurchase);
local v9 = require(l_Parent_0.Actions.RequestSubscriptionPurchase);
local v10 = require(l_Parent_0.Actions.RequestAvatarCreationFeePurchase);
local v11 = require(l_Parent_0.Actions.CompleteRequest);
local v12 = require(l_Parent_0.Enums.RequestType);
local v13 = require(l_Parent_0.Parent.Flags.FFlagEnableUGC4ACollectiblePurchaseSupport);
local v14 = {
    requestType = v12.None
};
return (l_Rodux_0.createReducer(v14, {
    [v4.name] = function(_, v16)
        local l_idempotencyKey_0 = v16.idempotencyKey;
        if not (l_idempotencyKey_0 ~= nil) or l_idempotencyKey_0 == "" then
            l_idempotencyKey_0 = l_HttpService_0:GenerateGUID(false);
        end;
        return {
            id = v16.id, 
            infoType = Enum.InfoType.Asset, 
            requestType = v12.Asset, 
            equipIfPurchased = v16.equipIfPurchased, 
            isRobloxPurchase = v16.isRobloxPurchase, 
            idempotencyKey = l_idempotencyKey_0, 
            purchaseAuthToken = v16.purchaseAuthToken or "", 
            collectibleItemId = v16.collectibleItemId or "", 
            collectibleItemInstanceId = v16.collectibleItemInstanceId or "", 
            collectibleProductId = v16.collectibleProductId or "", 
            expectedPrice = v16.expectedPrice or 0
        };
    end, 
    [v6.name] = function(_, v19)
        return {
            id = v19.id, 
            infoType = Enum.InfoType.GamePass, 
            requestType = v12.GamePass, 
            isRobloxPurchase = false
        };
    end, 
    [v7.name] = function(_, v21)
        return {
            id = v21.id, 
            infoType = Enum.InfoType.Product, 
            requestType = v12.Product, 
            isRobloxPurchase = false
        };
    end, 
    [v5.name] = function(_, v23)
        if not v13 then
            return {
                id = v23.id, 
                infoType = Enum.InfoType.Bundle, 
                requestType = v12.Bundle, 
                isRobloxPurchase = true
            };
        else
            local l_idempotencyKey_1 = v23.idempotencyKey;
            if not (l_idempotencyKey_1 ~= nil) or l_idempotencyKey_1 == "" then
                l_idempotencyKey_1 = l_HttpService_0:GenerateGUID(false);
            end;
            return {
                id = v23.id, 
                infoType = Enum.InfoType.Bundle, 
                requestType = v12.Bundle, 
                isRobloxPurchase = true, 
                idempotencyKey = l_idempotencyKey_1, 
                purchaseAuthToken = v23.purchaseAuthToken or "", 
                collectibleItemId = v23.collectibleItemId or "", 
                collectibleItemInstanceId = v23.collectibleItemInstanceId or "", 
                collectibleProductId = v23.collectibleProductId or "", 
                expectedPrice = v23.expectedPrice or 0
            };
        end;
    end, 
    [v8.name] = function(_, _)
        return {
            requestType = v12.Premium
        };
    end, 
    [v9.name] = function(_, v28)
        return {
            id = v28.id, 
            requestType = v12.Subscription
        };
    end, 
    [v10.name] = function(_, v30)
        return {
            requestType = v12.AvatarCreationFee, 
            serializedModel = v30.serializedModel
        };
    end, 
    [v11.name] = function(_, _)
        return v14;
    end
}));
