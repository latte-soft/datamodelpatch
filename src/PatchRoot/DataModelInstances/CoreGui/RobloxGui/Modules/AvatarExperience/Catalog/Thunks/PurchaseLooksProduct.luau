local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Promise);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAssetOwned);
local v10 = require(l_Modules_0.AvatarExperience.Common.Actions.SetBundleOwned);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.UpdateLookDetailsAfterSuccessfulPurchase);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v14 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v15 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksAnalyticsFixes);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksAnalyticsEmptyItemsFixes);
local v17 = game:DefineFastFlag("EnablePartialPurchaseForLooksSupport", false);
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksRefreshDetailsAfterPurchase);
local v19 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRefactorTryOnItems);
local v20 = {
    HttpError = Enum.HttpError.OK
};
local v21 = {
    Unspecified = "Unspecified", 
    Success = "Success", 
    Failure = "Failure", 
    PartialSuccess = "PartialSuccess"
};
local v22 = {
    Unspecified = "Unspecified", 
    Success = "Success", 
    Throttled = "Throttled", 
    ExceptionOccured = "ExceptionOccured", 
    ExpectedPriceIncreased = "ExpectedPriceIncreased", 
    TwoStepVerificationRequired = "TwoStepVerificationRequired", 
    AlreadyOwned = "AlreadyOwned", 
    InsufficientFunds = "InsufficientFunds", 
    InsufficientMembership = "InsufficientMembership", 
    NotForSale = "NotForSale", 
    PriceChanged = "PriceChanged", 
    NotAttempted = "NotAttempted", 
    SaleExpired = "SaleExpired", 
    SupplyExausted = "SupplyExausted", 
    ContentRatingRestricted = "ContentRatingRestricted", 
    UnknownBirthday = "UnknownBirthday", 
    AffiliateSalesDisabled = "AffiliateSalesDisabled", 
    BadAffiliateSaleProduct = "BadAffiliateSaleProduct", 
    IOSOnlyItem = "IOSOnlyItem", 
    InvalidArguments = "InvalidArguments", 
    Unauthorized = "Unauthorized", 
    AccountRestrictionsRestricted = "AccountRestrictionsRestricted", 
    PendingTransactionAlreadyExists = "PendingTransactionAlreadyExists", 
    SaleUnavailableAtSaleLocation = "SaleUnavailableAtSaleLocation", 
    UnexpectedSeller = "UnexpectedSeller", 
    EconomyDisabled = "EconomyDisabled"
};
local function _(v23, v24)
    local l_LocalUserId_0 = v24:getState().LocalUserId;
    v5.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v24:dispatch(v14(v23, l_LocalUserId_0, true));
    end;
end;
local function v35(v27, v28, v29, v30, v31, v32)
    for v33, v34 in v28, nil, nil do
        if not (v34 ~= v22.Success) or v34 == v22.AlreadyOwned then
            v30 = v30 + 1;
            v27:dispatch(v29(v33, true));
            if v15() and v34 == v22.Success then
                table.insert(v32, (tonumber(v33)));
            end;
        else
            v31 = v31 + 1;
        end;
    end;
    return v30, v31, v32;
end;
local function _(v36)
    local l_LocalUserId_1 = v36.LocalUserId;
    return if not v36.Users[l_LocalUserId_1] then Enum.MembershipType.None else v36.Users[l_LocalUserId_1].membership == Enum.MembershipType.Premium;
end;
local function _(v39, v40)
    local v41 = v39:getState().AvatarExperience.AvatarScene.Looks[v40];
    if not v41 then
        return nil;
    else
        return v41.lookType;
    end;
end;
local function v60(v43, v44)
    local v45 = v43:getState();
    local v46 = {};
    local v47 = {};
    local v48 = {};
    local v49 = 0;
    local l_LocalUserId_2 = v45.LocalUserId;
    local v51 = if not v45.Users[l_LocalUserId_2] then Enum.MembershipType.None else v45.Users[l_LocalUserId_2].membership == Enum.MembershipType.Premium;
    l_LocalUserId_2 = v45.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v52 = v45.AvatarExperience.AvatarScene.Looks[v44];
    if not (l_LocalUserId_2 ~= nil) or v52 == nil then
        return v49, v46, v48;
    else
        for _, v54 in l_LocalUserId_2, nil, nil do
            local v55 = v52.lookAssetInfos[tostring(v54.itemId)];
            local v56 = nil;
            if not v19() then
                assert(v55, "itemInfo should not be nil");
            else
                v56 = v52.lookBundleInfos[tostring(v54.itemId)];
                assert(v55 or v56, "itemInfo should not be nil");
            end;
            local v57 = nil;
            v57 = if not v19() then v55 else v55 or v56;
            if (not v54.selectedInTryOnManager or not v57.isPurchasable) or v57.quantityOwned > 0 then
                if not v19() then
                    table.insert(v46, v54.itemId);
                elseif v54.itemType == v12.ItemType.Bundle then
                    table.insert(v47, v54.itemId);
                elseif v54.itemType == v12.ItemType.Asset then
                    table.insert(v46, v54.itemId);
                end;
            else
                local v58 = nil;
                if v19() then
                    local v59 = v43:getState().AvatarExperience.AvatarScene.Looks[v44];
                    if if not v59 then nil else v59.lookType == v12.LookType.Avatar then
                        v58 = v57.priceInRobux;
                        goto label0 --[[  true, true  ]];
                    end;
                end;
                v58 = if not v51 then v55.priceInRobux else v55.premiumPriceInRobux;
                ::label0::;
                v49 = v49 + v58;
                if v15() then
                    table.insert(v48, (tonumber(v54.itemId)));
                end;
            end;
        end;
        if not v19() then
            return v49, v46, v48;
        else
            return v49, v46, v47, v48;
        end;
    end;
end;
local function _(v61)
    return v7.PurchaseProductKey .. v61;
end;
return function(v63, v64, v65, v66)
    return l_PerformFetch_0.Single(v7.PurchaseProductKey .. v64, function(v67)
        local v68 = nil;
        local v69 = {};
        local v70 = {};
        local v71 = {};
        if not v19() then
            local v72, v73, v74 = v60(v67, v64);
            v68 = v72;
            v69 = v73;
            v71 = v74;
        else
            local v75, v76, v77, v78 = v60(v67, v64);
            v68 = v75;
            v69 = v76;
            v70 = v77;
            v71 = v78;
        end;
        local v79 = l_HttpService_0:GenerateGUID(false);
        local v80 = nil;
        if v15() then
            local l_LookAnalyticsInfo_0 = v67:getState().AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
            v80 = if not l_LookAnalyticsInfo_0 then nil else v3.Dictionary.join(l_LookAnalyticsInfo_0, {
                totalRobux = v65, 
                assetIds = v71
            });
            if v80 then
                if not v16() then
                    v66.widgetInteractionV2(v80, v13.ActionType.PURCHASE_ATTEMPT);
                elseif #v71 > 0 then
                    v66.widgetInteractionV2(v80, v13.ActionType.PURCHASE_ATTEMPT);
                end;
            end;
        end;
        local v82 = nil;
        if v19() then
            local v83 = v67:getState().AvatarExperience.AvatarScene.Looks[v64];
            if if not v83 then nil else v83.lookType == v12.LookType.Avatar then
                v82 = v8.PurchaseLookV2(v63, v64, v79, v65, 0, v69, v70);
                goto label1 --[[  true, true  ]];
            end;
        end;
        v82 = v8.PurchaseLook(v63, v64, v79, v65, 0, v69);
        ::label1::;
        return v82:andThen(function(v84)
            local l_responseBody_0 = v84.responseBody;
            local v86 = true;
            if l_responseBody_0.purchaseLookStatus ~= v21.Success then
                v86 = v17 and l_responseBody_0.purchaseLookStatus == v21.PartialSuccess;
            end;
            if v86 and type(l_responseBody_0) == "table" then
                local l_l_responseBody_0_0 = l_responseBody_0;
                local v88 = 0;
                local v89 = 0;
                local v90 = {};
                local v91 = {};
                if v19() then
                    local v92 = v67:getState().AvatarExperience.AvatarScene.Looks[v64];
                    if if not v92 then nil else v92.lookType == v12.LookType.Avatar then
                        local v93, v94, v95 = v35(v67, l_l_responseBody_0_0.assetPurchaseStatus, v9, v88, v89, v90);
                        v88 = v93;
                        v89 = v94;
                        v90 = v95;
                        v93, v94, v95 = v35(v67, l_l_responseBody_0_0.bundlePurchaseStatus, v10, v88, v89, v91);
                        v88 = v93;
                        v89 = v94;
                        v91 = v95;
                        goto label2 --[[  true, true  ]];
                    end;
                end;
                for v96, v97 in l_l_responseBody_0_0.itemPurchaseStatus, nil, nil do
                    if not (v97 ~= v22.Success) or v97 == v22.AlreadyOwned then
                        v88 = v88 + 1;
                        v67:dispatch(v9(v96, true));
                        if v15() and v97 == v22.Success then
                            table.insert(v90, (tonumber(v96)));
                        end;
                    else
                        v89 = v89 + 1;
                    end;
                end;
                ::label2::;
                local l_v63_0 = v63;
                local l_v67_0 = v67;
                local l_LocalUserId_3 = l_v67_0:getState().LocalUserId;
                v5.isNonEmptyString(l_LocalUserId_3, "Thunk.PurchaseProduct.updateRobux.localUserId");
                if typeof(l_LocalUserId_3) == "string" and l_LocalUserId_3 ~= "" then
                    l_v67_0:dispatch(v14(l_v63_0, l_LocalUserId_3, true));
                end;
                l_l_responseBody_0_0 = v3.Dictionary.join(l_l_responseBody_0_0, {
                    successCount = v88, 
                    failureCount = v89
                });
                if not (not v15() or not v80) then
                    v80 = v3.Dictionary.join(v80, {
                        assetIds = v90
                    });
                    if not v16() then
                        v66.widgetInteractionV2(v80, v13.ActionType.PURCHASE_SUCCESS);
                    elseif #v90 > 0 then
                        v66.widgetInteractionV2(v80, v13.ActionType.PURCHASE_SUCCESS);
                    end;
                end;
                if not v19() then
                    if v18() and #v90 > 0 then
                        v67:dispatch(v11(v64, v90));
                    end;
                elseif v18() and (not (#v90 <= 0) or #v91 > 0) then
                    v67:dispatch(v11(v64, v90, v91));
                end;
                return v4.resolve(l_l_responseBody_0_0);
            else
                return v4.reject(v20);
            end;
        end, function(v101)
            if not (type(v101) == "table") or v101.HttpError == nil then
                v101 = v20;
            end;
            return v4.reject(v101);
        end);
    end);
end;
