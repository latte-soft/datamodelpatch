local l_Parent_0 = script.Parent.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_Parent_0.Actions.SetPromptState);
local v5 = require(l_Parent_0.Actions.StartPurchase);
local v6 = require(l_Parent_0.Actions.ErrorOccurred);
local v7 = require(l_Parent_0.Enums.PurchaseFlow);
local v8 = require(l_Parent_0.Enums.PromptState);
local v9 = require(l_Parent_0.Enums.ItemType);
local v10 = require(l_Parent_0.Enums.PurchaseError);
local v11 = require(l_Parent_0.Network.getToolAsset);
local v12 = require(l_Parent_0.Network.performPurchase);
local v13 = require(l_Parent_0.Network.performPurchaseV2);
local v14 = require(l_Parent_0.Services.Network);
local v15 = require(l_Parent_0.Services.Analytics);
local v16 = require(l_Parent_0.Services.ExternalSettings);
local v17 = require(l_Parent_0.Utils.getPlayerPrice);
local v18 = require(l_Parent_0.Thunk);
local v19 = require(l_Parent_0.Promise);
local v20 = require(script.Parent.completePurchase);
local v21 = require(l_Parent_0.Parent.Flags.FFlagEnableCollectibleCheckToPurchaseItem);
local v22 = {
    v14, 
    v15, 
    v16
};
return function()
    return v18.new(script.Name, v22, function(v23, v24)
        local v25 = v24[v14];
        local v26 = v24[v16];
        local v27 = v24[v15];
        local l_purchaseFlow_0 = v23:getState().purchaseFlow;
        local v29 = v26.getPlatform();
        v23:dispatch(v5(l_Workspace_0.DistributedGameTime));
        if not (l_purchaseFlow_0 ~= v7.RobuxUpsellV2) or l_purchaseFlow_0 == v7.LargeRobuxUpsell then
            v23:dispatch(v4(v8.PurchaseInProgress));
        end;
        local v30 = v23:getState();
        local v31 = l_HttpService_0:GenerateGUID(false);
        local l_id_0 = v30.promptRequest.id;
        local l_infoType_0 = v30.promptRequest.infoType;
        local l_equipIfPurchased_0 = v30.promptRequest.equipIfPurchased;
        local l_isRobloxPurchase_0 = v30.promptRequest.isRobloxPurchase;
        local l_purchaseAuthToken_0 = v30.promptRequest.purchaseAuthToken;
        local l_idempotencyKey_0 = v30.promptRequest.idempotencyKey;
        local l_collectibleItemId_0 = v30.promptRequest.collectibleItemId;
        local l_collectibleItemInstanceId_0 = v30.promptRequest.collectibleItemInstanceId;
        local l_collectibleProductId_0 = v30.promptRequest.collectibleProductId;
        local l_expectedPrice_0 = v30.promptRequest.expectedPrice;
        local v42 = v17(v30.productInfo, v30.accountInfo.membershipType == 4);
        if l_collectibleItemInstanceId_0 and l_collectibleItemInstanceId_0 ~= "" then
            v42 = l_expectedPrice_0;
        end;
        local l_assetTypeId_0 = v30.productInfo.assetTypeId;
        local l_productId_0 = v30.productInfo.productId;
        local l_collectibleItemId_1 = v30.productInfo.collectibleItemId;
        local l_collectibleProductId_1 = v30.productInfo.collectibleProductId;
        local l_itemType_0 = v30.productInfo.itemType;
        v27.signalProductPurchaseConfirmed(l_productId_0, v30.requestType);
        local v48 = false;
        if v21 then
            local l_l_collectibleItemId_0_0 = l_collectibleItemId_0;
            if l_l_collectibleItemId_0_0 then
                l_l_collectibleItemId_0_0 = false;
                if l_collectibleItemId_0 ~= "" then
                    l_l_collectibleItemId_0_0 = l_infoType_0 == Enum.InfoType.Bundle;
                end;
            end;
            v48 = l_l_collectibleItemId_0_0;
        end;
        if v21 and v48 or l_collectibleItemInstanceId_0 and l_collectibleItemInstanceId_0 ~= "" then
            return v13(v25, l_infoType_0, l_productId_0, v42, v31, l_isRobloxPurchase_0, l_collectibleItemId_0, l_collectibleProductId_0, l_idempotencyKey_0, l_purchaseAuthToken_0, l_collectibleItemInstanceId_0):andThen(function(v50)
                v23:dispatch(v20());
                v27.signalPurchaseSuccess(l_id_0, l_infoType_0, v42, v50);
                return v19.resolve();
            end):catch(function(v51)
                if v51 == v10.TwoFactorNeeded then
                    v27.signalTwoSVSettingsErrorShown(l_productId_0, l_infoType_0);
                    if not (v29 ~= Enum.Platform.Windows) or v29 == Enum.Platform.OSX then
                        v51 = v10.TwoFactorNeededSettings;
                    end;
                end;
                v23:dispatch(v6(v51));
            end);
        else
            return v12(v25, l_infoType_0, l_productId_0, v42, v31, l_isRobloxPurchase_0, l_collectibleItemId_1, l_collectibleProductId_1, l_idempotencyKey_0, l_purchaseAuthToken_0):andThen(function(v52)
                v23:dispatch(v20());
                if l_itemType_0 ~= v9.Bundle then
                    v27.signalPurchaseSuccess(l_id_0, l_infoType_0, v42, v52);
                end;
                if l_equipIfPurchased_0 and l_assetTypeId_0 == 19 then
                    return v11(v25, l_id_0):andThen(function(v53)
                        if v53 then
                            v53.Parent = l_Players_0.LocalPlayer.Backpack;
                        end;
                    end);
                else
                    return v19.resolve();
                end;
            end):catch(function(v54)
                if v54 == v10.TwoFactorNeeded then
                    v27.signalTwoSVSettingsErrorShown(l_productId_0, l_infoType_0);
                    if not (v29 ~= Enum.Platform.Windows) or v29 == Enum.Platform.OSX then
                        v54 = v10.TwoFactorNeededSettings;
                    end;
                end;
                v23:dispatch(v6(v54));
            end);
        end;
    end);
end;
