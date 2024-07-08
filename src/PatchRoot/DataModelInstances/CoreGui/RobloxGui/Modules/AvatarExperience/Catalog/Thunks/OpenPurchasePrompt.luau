local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v4 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v6 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.PurchaseProduct);
local v8 = require(l_Modules_0.LuaApp.Components.RobuxUpsell.Enum.RobuxUpsellTriggerContext);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v10 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v11 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableKeywordAnalyticsForSearch);
local v14 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v15 = {
    toastMessage = "IAPExperience.RobuxUpsell.Title.InsufficientRobux", 
    isLocalized = false, 
    toastType = require(l_Modules_0.LuaApp.Enum.ToastType).InformationMessage
};
return function(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26)
    return function(v27)
        local v28 = v27:getState();
        local l_v22_0 = v22;
        local l_v23_0 = v23;
        local l_name_0 = v21.opaque.name;
        local v32 = nil;
        local v33 = nil;
        if not v11 then
            v32 = v4(v28.AvatarExperience.Common, l_v22_0, l_v23_0);
            if not v32 then
                return ;
            end;
        else
            v33 = v10(v28.AvatarExperience, l_v22_0, l_v23_0);
            if not v33 then
                return ;
            end;
        end;
        if v19 then
            local l_RequestId_0 = v28.AvatarExperience.Common.Widgets.WidgetInfo.RequestId;
            local v35 = nil;
            if v13() then
                local v36 = v28.Navigation and v28.Navigation.currentRoute;
                if v36 and v36.name == v3.CatalogSearch then
                    v35 = (v36.params and v36.params.searchParams) and v36.params.searchParams.searchKeyword;
                end;
            end;
            v19.clickPurchaseItemButton(l_v22_0, l_v23_0, v20, l_name_0, l_RequestId_0, if not v13() then nil else v35);
        end;
        local v37 = nil;
        v37 = if not v11 then v32.resellerUserAssetIds else v33.resellerUserAssetIds;
        local v38 = v28.AvatarExperience.Catalog.UserAssets[v37 and v37[1]];
        local v39 = v28.UserRobux[v28.LocalUserId];
        local v40 = (not not v28.Users[v28.LocalUserId] and v28.Users[v28.LocalUserId].membership or Enum.MembershipType.None) == Enum.MembershipType.Premium;
        local v41 = nil;
        local v42 = nil;
        local v43 = nil;
        local v44 = nil;
        local v45 = nil;
        local v46 = nil;
        local v47 = nil;
        if not v11 then
            v41 = v5.DEPRECATED_HasPremiumBenefits(v32);
            v42 = v32.lowestPrice or v32.priceInRobux;
            if not (not v40 or not v41) then
                v42 = v32.premiumPricing.premiumPriceInRobux;
            end;
            v43 = v5.DEPRECATED_IsResellable(v32);
            v44 = v32.expectedSellerId;
            v45 = v32.creator and v32.creator.name;
            v46 = v32.collectibleItemId;
            v47 = if not v12() then nil else v5.DEPRECATED_isLimitedCollectible(v32);
        else
            v41 = v33.hasPremiumBenefits;
            v42 = v33.lowestPrice or v33.priceInRobux;
            if not (not v40 or not v41) then
                v42 = v33.premiumPricing.premiumPriceInRobux;
            end;
            v43 = v33.isResellable;
            v44 = v33.expectedSellerId;
            v45 = v33.creator and v33.creator.name;
            v46 = v33.collectibleItemId;
            v47 = if not v12() then nil else v33 and v33.isLimitedCollectible;
        end;
        local v48 = nil;
        if not (not v43 or not v38) then
            v48 = v38.userAssetId;
            v44 = v38.userId;
            v45 = v38.userName;
        end;
        local v49 = nil;
        if v46 then
            local l_CollectiblesItemInfo_0 = v28.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
            local l_CollectiblesResellersInstances_0 = v28.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances;
            local l_CollectiblesResellableInstances_0 = v28.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances;
            local v53 = nil;
            v53 = if not v12() then v5.findCheapestCollectiblePurchaseInfo(v46, l_CollectiblesItemInfo_0, l_CollectiblesResellersInstances_0, l_CollectiblesResellableInstances_0) else v5.findCheapestCollectiblePurchaseInfoV2(v46, v47, l_CollectiblesItemInfo_0, l_CollectiblesResellersInstances_0, l_CollectiblesResellableInstances_0);
            if v53.price then
                v42 = v53.price;
            end;
            if v53.collectibleInstanceId then
                v49 = v53.collectibleInstanceId;
                v44 = v53.expectedSellerId;
                v45 = v53.sellerName;
            end;
        end;
        if v42 and v42 <= v39 then
            v27:dispatch(v6(function()
                v18.navigate(v3.PurchaseCatalogItem, {
                    itemId = l_v22_0, 
                    itemType = l_v23_0, 
                    priceInRobux = v42, 
                    sellerId = v44, 
                    sellerName = v45, 
                    userAssetId = v48, 
                    collectibleInstanceId = v49, 
                    onOverlayClosed = v17, 
                    fromProfile = v20, 
                    fromAvatarRoute = v21, 
                    widgetInfo = v26
                });
            end));
        elseif not v24 then
            local l_InsufficientRobuxPrompt_0 = v3.InsufficientRobuxPrompt;
            local v55 = {
                onOverlayClosed = v17
            };
            local v56 = l_getRbxthumbWithTypeSizeAndOptions_0(l_v22_0, v5.GetRbxThumbType(l_v23_0), 150);
            local v57 = nil;
            v57 = if not v11 then v32.name else v33.name;
            l_InsufficientRobuxPrompt_0 = v3.RobuxUpsellPrompt;
            v55.triggerContext = v8.UACatalog;
            v55.priceInRobux = v42;
            v55.userRobux = v39;
            v55.itemName = v57;
            v55.itemIcon = v56;
            v55.purchaseItem = function()
                local v58 = if not v18 then nil else v18.state.routeName;
                local v59 = nil;
                local v60 = nil;
                local v61 = nil;
                local v62 = nil;
                if not v11 then
                    v59 = (v32 and v32.product) and v32.product.id;
                    v60 = v5.DEPRECATED_GetItemSubType(l_v23_0, v32);
                    v61 = v32.collectibleItemId;
                    v62 = v32.creator and v32.creator.type;
                else
                    v59 = v33.productId;
                    v60 = v33.itemSubType;
                    v61 = v33.collectibleItemId;
                    v62 = v33.creator and v33.creator.type;
                end;
                return v27:dispatch(v7(v16, v59, v42, v44, l_v22_0, l_v23_0, v60, false, v48, v19, v18, v20, false, v58, v61, v49, v62, v26));
            end;
            do
                local l_l_InsufficientRobuxPrompt_0_0 = l_InsufficientRobuxPrompt_0;
                v27:dispatch(v6(function()
                    v18.navigate(l_l_InsufficientRobuxPrompt_0_0, v55);
                end));
            end;
        else
            v27:dispatch(v14(if not v25 then v15 else v25));
            return ;
        end;
    end;
end;
