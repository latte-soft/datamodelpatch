local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Logging);
local v4 = require(l_CorePackages_0.Promise);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v12 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v13 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v14 = require(l_Modules_0.LuaApp.Thunks.SetPurchaseErrorToast);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v16 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v17 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.CheckAndGenerateTwoStep);
local v19 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAssetOwned);
local v20 = require(l_Modules_0.AvatarExperience.Common.Actions.SetBundleOwned);
local v21 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetResellers);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSellPageData);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v27 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v28 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveFromTryOn);
local v29 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v30 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v33 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableSpendFrictionTwoFactor);
local v34 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableKeywordAnalyticsForSearch);
local v35 = {
    HttpError = Enum.HttpError.OK
};
local v36 = {
    toastMessage = "Feature.Catalog.Label.Purchased", 
    isLocalized = false, 
    toastType = v17.SuccessConfirmation
};
local function _(v37, v38)
    local l_LocalUserId_0 = v38:getState().LocalUserId;
    v5.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v38:dispatch(v12(v37, l_LocalUserId_0, true));
    end;
end;
local function v51(v41, v42)
    local v43 = v41:getState();
    local l_TryOnItems_0 = v43.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local l_assetId_0 = v42.assetId;
    if not (l_assetId_0 or not v42.productId) then
        for v46, v47 in l_TryOnItems_0, nil, nil do
            if v47.itemType ~= v10.ItemType.Asset then
                local v48 = v43.AvatarExperience.Common.BundleInfos[v46];
                local v49 = v48 and v48.product.id;
                if v49 and v49 == tostring(v42.productId) then
                    l_assetId_0 = v46;
                    break;
                end;
            end;
        end;
    end;
    local v50 = nil;
    if l_assetId_0 then
        v50 = l_TryOnItems_0[tostring(l_assetId_0)];
        v41:dispatch(v28((tostring(l_assetId_0))));
    end;
    return v50;
end;
local function _(v52)
    return v9.PurchaseProductKey .. tostring(v52);
end;
return function(v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71)
    return l_PerformFetch_0.Single(v9.PurchaseProductKey .. tostring(v55), function(v72)
        local v73 = nil;
        if not v30 then
            v73 = v15.DEPRECATED_IsResellable((v16(v72:getState().AvatarExperience.Common, v58, v59)));
        else
            local v74 = v29(v72:getState().AvatarExperience, v58, v59);
            if v74 then
                v73 = v74.isResellable;
            end;
        end;
        local v75 = nil;
        local l_Collectibles_0 = v72:getState().AvatarExperience.Common.Collectibles;
        local l_CollectiblesItemInfo_0 = l_Collectibles_0.CollectiblesItemInfo;
        if not v68 or not l_CollectiblesItemInfo_0[v68] then
            v75 = v7.PurchaseProduct(v54, v55, v56, v57, v62);
        else
            local l_LocalUserId_1 = v72:getState().LocalUserId;
            local v79 = l_HttpService_0:GenerateGUID(false);
            if v69 ~= nil then
                local v80 = l_Collectibles_0.CollectiblesResellersInstances[v68];
                local v81 = v80 and v80.Instances[v69];
                local v82 = v81 and v81.collectibleProductId;
                v75 = if v82 then v7.PurchaseCollectibleItemResale(v54, v68, v69, v82, v56, v57, v70, l_LocalUserId_1, v79) else v4.reject({
                    reason = "CollectibleProductIdNotFound", 
                    HttpError = Enum.HttpError.OK
                });
            else
                local v83 = l_CollectiblesItemInfo_0[v68];
                local _ = nil;
                v75 = v7.PurchaseCollectibleItem(v54, v68, v83.collectibleProductId, if v83.unitsAvailableForConsumption > 0 then v83.price else v83.lowestPrice, v57, v70, l_LocalUserId_1, v79);
            end;
        end;
        return v75:andThen(function(v85)
            local l_responseBody_0 = v85.responseBody;
            if type(l_responseBody_0) == "table" then
                local l_l_responseBody_0_0 = l_responseBody_0;
                if v73 then
                    if not v68 then
                        v72:dispatch(v22(v54, v58, nil, v9.MaxResellersPerPage, true));
                        v72:dispatch(v23(v54, v58, v72:getState().LocalUserId));
                    else
                        v72:dispatch(v24(v54, v68, nil, v9.MaxResellersPerPage));
                        v72:dispatch(v25(v54, v68, v72:getState().LocalUserId));
                    end;
                end;
                if not l_l_responseBody_0_0.purchased then
                    if v33 and l_responseBody_0.reason == v9.PurchaseErrorReason.TwoStepVerificationRequired then
                        return v72:dispatch(v18(v54, v72:getState().LocalUserId)):andThen(function(v88)
                            return v4.resolve({
                                purchased = false, 
                                is2SVEnabled = v88.is2SVEnabled, 
                                challengeToken = v88.challengeToken
                            });
                        end, function(_)
                            local l_v35_0 = v35;
                            v3.warn("Failed to check and generate two factor requirement");
                            if not v66 then
                                v72:dispatch(v13(l_v35_0));
                            end;
                            return v4.reject({
                                reason = v9.PurchaseErrorReason.TwoStepVerificationRequired, 
                                HttpError = Enum.HttpError.OK
                            });
                        end);
                    else
                        if not v66 then
                            v72:dispatch(v14(l_l_responseBody_0_0));
                        end;
                        return v4.reject(l_l_responseBody_0_0);
                    end;
                else
                    if v59 == v10.ItemType.Asset then
                        v72:dispatch(v19(v58, true));
                    else
                        v72:dispatch(v20(v58, true));
                    end;
                    local l_v54_0 = v54;
                    local l_v72_0 = v72;
                    local l_LocalUserId_2 = l_v72_0:getState().LocalUserId;
                    v5.isNonEmptyString(l_LocalUserId_2, "Thunk.PurchaseProduct.updateRobux.localUserId");
                    if typeof(l_LocalUserId_2) == "string" and l_LocalUserId_2 ~= "" then
                        l_v72_0:dispatch(v12(l_v54_0, l_LocalUserId_2, true));
                    end;
                    if v59 == v10.ItemType.Asset then
                        v63.purchaseAsset(v58, v60, v56, v65);
                    elseif v59 == v10.ItemType.Bundle then
                        v63.purchaseBundle(v58, v60, v56, v65);
                    end;
                    if v71 then
                        v63.widgetInteractionV2(v6.Dictionary.join(v71, {
                            totalRobux = v56
                        }), v11.ActionType.PURCHASE_SUCCESS);
                    end;
                    if not v66 then
                        l_v54_0 = v72:getState().AvatarExperience.Common.Widgets.WidgetInfo.RequestId;
                        l_v72_0 = nil;
                        l_LocalUserId_2 = nil;
                        local v94 = nil;
                        if v34() then
                            l_v72_0 = v72:getState();
                            local v95 = l_v72_0.Navigation and l_v72_0.Navigation.currentRoute;
                            local v96 = (v95 and v95.params) and v95.params.fromAvatarRoute;
                            local v97 = v96 and v96.current;
                            if v97 and v97.name == v32.CatalogSearch then
                                v94 = v97.key;
                                l_LocalUserId_2 = (l_v72_0.Search and l_v72_0.Search.SearchesInCatalog[v94]) and l_v72_0.Search.SearchesInCatalog[v94].keyword;
                            end;
                        end;
                        v63.avatarShopBuyItem(v58, v59, v56, v67, l_v54_0, if not v34() then nil else l_LocalUserId_2);
                        v72:dispatch(v27(v36));
                    end;
                    if v66 then
                        l_v54_0 = v51(v72, l_l_responseBody_0_0);
                        if l_v54_0 then
                            if l_l_responseBody_0_0.assetIsWearable == false and l_v54_0.itemId ~= nil then
                                l_l_responseBody_0_0 = v6.Dictionary.join(l_l_responseBody_0_0, {
                                    bundleId = l_v54_0.itemId, 
                                    tryOnBundleInfo = l_v54_0.bundleInfo
                                });
                            end;
                            l_l_responseBody_0_0 = v6.Dictionary.join(l_l_responseBody_0_0, {
                                itemSubType = v60, 
                                overrideOrder = l_v54_0.order
                            });
                        end;
                    end;
                    v72:dispatch(v21(v64));
                    if (v61 and v59 == v10.ItemType.Asset) and v60 ~= v10.AssetTypeIdStrings.EmoteAnimation then
                        l_v54_0 = v72:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
                        v72:dispatch(v26(v60, v58, v64, false, l_v54_0[v58] and l_v54_0[v58].order));
                    end;
                    return v4.resolve(l_l_responseBody_0_0);
                end;
            else
                local l_v35_1 = v35;
                v3.warn("Response from PurchaseProduct is malformed");
                if not v66 then
                    v72:dispatch(v13(l_v35_1));
                end;
                return v4.reject(l_v35_1);
            end;
        end, function(v99)
            if not (type(v99) == "table") or v99.HttpError == nil then
                v99 = v35;
            end;
            if not v66 then
                v72:dispatch(v13(v99));
            end;
            return v4.reject(v99);
        end);
    end);
end;
