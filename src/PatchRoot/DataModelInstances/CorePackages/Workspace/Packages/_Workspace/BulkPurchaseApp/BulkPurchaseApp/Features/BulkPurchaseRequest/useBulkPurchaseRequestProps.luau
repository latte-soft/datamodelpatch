local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_script_FirstAncestor_0.Store.Selectors.selectPurchaseResults);
local v7 = require(l_script_FirstAncestor_0.Store.Selectors.selectOrderRequest);
local v8 = require(l_script_FirstAncestor_0.Store.Selectors.selectItemData);
local v9 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseEnded);
local v10 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseFailed);
local v11 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseSucceeded);
local v12 = require(l_script_FirstAncestor_0.Enums.BulkPurchasePromptStateEnum);
local v13 = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
local v14 = require(l_script_FirstAncestor_0.Enums.PurchasableStateEnum);
local v15 = require(l_script_FirstAncestor_0.Enums.ItemStatusToErrorCodeMap);
local v16 = require(l_script_FirstAncestor_0.Enums.PurchasableStateToItemPurchaseStatusMap);
local v17 = require(l_script_FirstAncestor_0.Utils.getThumbnailUrl);
local _ = require(l_script_FirstAncestor_0.Store.Types);
local v19 = require(l_script_FirstAncestor_0.Enums.PaymentPlatformEnum);
local v20 = require(l_script_FirstAncestor_0.Utils.getPaymentPlatform);
local v21 = require(l_script_FirstAncestor_0.Utils.getRobuxStoreUrl);
local _ = require(script.Parent.BulkPurchaseRequest);
local v23 = {
    INSUFFICIENT_ROBUX = Enum.MarketplaceItemPurchaseStatus.InsufficientRobux, 
    QUOTA_EXCEEDED = Enum.MarketplaceItemPurchaseStatus.QuotaExceeded, 
    NOT_FOR_SALE = Enum.MarketplaceItemPurchaseStatus.NotForSale, 
    NOT_AVAILABLE_FOR_PURCHASER = Enum.MarketplaceItemPurchaseStatus.NotAvailableForPurchaser, 
    PRICE_MISMATCH = Enum.MarketplaceItemPurchaseStatus.PriceMismatch, 
    SOLD_OUT = Enum.MarketplaceItemPurchaseStatus.SoldOut, 
    PURCHASER_IS_SELLER = Enum.MarketplaceItemPurchaseStatus.PurchaserIsSeller, 
    QUANTITY_LIMIT_EXCEEDED = Enum.MarketplaceItemPurchaseStatus.QuantityLimitExceeded, 
    ALREADY_OWNED = Enum.MarketplaceItemPurchaseStatus.AlreadyOwned, 
    INSUFFICIENT_MEMBERSHIP = Enum.MarketplaceItemPurchaseStatus.InsufficientMembership, 
    PURCHASE_PLACE_INVALID = Enum.MarketplaceItemPurchaseStatus.PlaceInvalid
};
local function _(v24)
    local v25 = v23[v24.errorReason];
    if v24.status == "SUCCEEDED" then
        return Enum.MarketplaceItemPurchaseStatus.Success;
    elseif not v25 then
        return Enum.MarketplaceItemPurchaseStatus.SystemError;
    else
        return v25;
    end;
end;
local function _(v27)
    if not v27.fulfillmentGroups[1] then
        return {};
    else
        return v27.fulfillmentGroups[1].lineItems;
    end;
end;
local function v33(v29)
    local v30 = {};
    for _, v32 in v29, nil, nil do
        if v32.purchasableState == v14.Purchasable then
            table.insert(v30, v32);
        end;
    end;
    return v30;
end;
local function v42(v34, v35)
    local v36 = v33(v35);
    local v37 = if not v34.fulfillmentGroups[1] then {} else v34.fulfillmentGroups[1].lineItems;
    local v38 = {};
    for v39, v40 in v36, nil, nil do
        local v41 = v37[v39];
        if v41 then
            v38[v40.id] = if v41.status == "SUCCEEDED" then Enum.MarketplaceItemPurchaseStatus.Success else v23[v41.errorReason] or Enum.MarketplaceItemPurchaseStatus.SystemError;
        end;
    end;
    return v38;
end;
local _ = function(v43)
    local v44 = nil;
    for _, v46 in v43, nil, nil do
        if v44 ~= nil and v46 ~= v44 then
            return nil;
        elseif v44 == nil then
            v44 = v46;
        end;
    end;
    return v44;
end;
local function _(v48)
    return {
        id = v48.id, 
        name = v48.name, 
        image = v17(v48.id, v48.type), 
        ownedCount = v48.ownedCount
    };
end;
local function _(v50)
    return {
        id = v50.id, 
        cost = v50.priceRobux, 
        name = v50.name, 
        image = v17(v50.id, v50.type)
    };
end;
local function _(v52)
    return {
        id = v52.id, 
        name = v52.name, 
        image = v17(v52.id, v52.type), 
        status = v16[v52.purchasableState] or Enum.MarketplaceItemPurchaseStatus.SystemError
    };
end;
local function v60(v54)
    local v55 = {};
    local v56 = {};
    local v57 = {};
    if v54.itemData then
        for _, v59 in v54.itemData, nil, nil do
            if v59.purchasableState == v14.Purchasable then
                table.insert(v55, {
                    id = v59.id, 
                    cost = v59.priceRobux, 
                    name = v59.name, 
                    image = v17(v59.id, v59.type)
                });
                if v59.ownedCount and v59.ownedCount > 0 then
                    table.insert(v56, {
                        id = v59.id, 
                        name = v59.name, 
                        image = v17(v59.id, v59.type), 
                        ownedCount = v59.ownedCount
                    });
                end;
            else
                table.insert(v57, {
                    id = v59.id, 
                    name = v59.name, 
                    image = v17(v59.id, v59.type), 
                    status = v16[v59.purchasableState] or Enum.MarketplaceItemPurchaseStatus.SystemError
                });
            end;
        end;
    end;
    return {
        totalCost = v54.totalCost or 0, 
        items = v55, 
        ownedItems = v56, 
        unpurchasableItems = v57, 
        balance = v54.balance or 0
    };
end;
local function v62(v61)
    return v61.options;
end;
return function()
    local v63 = l_useDispatch_0();
    local v64 = l_useSelector_0(v60);
    local v65 = l_useSelector_0(v6);
    local v66 = l_useSelector_0(v7);
    local v67 = l_useSelector_0(v62);
    local v68 = l_useSelector_0(v8);
    return {
        currentBalance = v64.balance, 
        items = v64.items, 
        ownedItems = v64.ownedItems, 
        unpurchasableItems = v64.unpurchasableItems, 
        onClose = function()
            l_MarketplaceService_0:signalPromptBulkPurchaseFinished(2, v65);
            v63(v9());
        end, 
        onAccept = if v64.balance < v64.totalCost then function()
            local v69 = v20();
            if not (v69 ~= v19.Desktop) or v69 == v19.Mobile then
                l_BrowserService_0:OpenBrowserWindow(v21());
                v63(v9());
                return ;
            else
                v63(v10(v13.InsufficientRobux));
                return ;
            end;
        end else function()
            local l_status_0, l_result_0 = pcall(function()
                return l_MarketplaceService_0:PerformBulkPurchase(v66, v67);
            end);
            if not l_status_0 or not l_result_0 then
                if not string.find(l_result_0, "403") then
                    v63(v10(v13.Generic));
                    return ;
                else
                    v63(v10(v13.TwoStepVerificationRequired));
                    return ;
                end;
            else
                local v72 = v42(l_result_0, v68);
                local v73 = nil;
                local v74;
                for _, v76 in v72, nil, nil do
                    if v73 ~= nil and v76 ~= v73 then
                        v74 = nil;
                        goto label0 --[[  true, false  ]];
                    elseif v73 == nil then
                        v73 = v76;
                    end;
                end;
                v74 = v73;
                ::label0::;
                if v74 then
                    if v74 == Enum.MarketplaceItemPurchaseStatus.Success then
                        v63(v11(v12.Success, v72));
                        return ;
                    else
                        v63(v10(v15[v74]));
                        return ;
                    end;
                else
                    v63(v11(v12.PartialSuccess, v72));
                    return ;
                end;
            end;
        end, 
        totalCost = v64.totalCost
    };
end;
