local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_0.Actions.SetPromptState);
local v5 = require(l_Parent_0.Actions.ErrorOccurred);
local v6 = require(l_Parent_0.Actions.BundleProductInfoReceived);
local v7 = require(l_Parent_0.Actions.AccountInfoReceived);
local v8 = require(l_Parent_0.Actions.BalanceInfoRecieved);
local v9 = require(l_Parent_0.Actions.PromptNativeUpsell);
local v10 = require(l_Parent_0.Enums.PromptState);
local v11 = require(l_Parent_0.Enums.PurchaseError);
local v12 = require(l_Parent_0.Enums.UpsellFlow);
local _ = require(l_Parent_0.Models.RobuxUpsell);
local v14 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local v15 = require(l_Parent_0.Network.getRobuxUpsellProduct);
local v16 = require(l_Parent_0.Services.Analytics);
local v17 = require(l_Parent_0.Services.Network);
local v18 = require(l_Parent_0.Utils.getPaymentPlatform);
local v19 = require(l_Parent_0.Utils.getPaymentFromPlatformLegacy);
local v20 = require(l_Parent_0.Utils.getHasAmazonUserAgent);
local v21 = require(l_Parent_0.Flags.GetFFlagEnableQuestPaymentPlatformType);
local v22 = require(l_Parent_0.Flags.GetFFlagRespectBalanceInfoForBundleUpsellInStudio);
local v23 = require(l_Parent_0.Thunk);
local v24 = require(l_Parent_0.Flags.GetFFlagEnableLuobuInGameUpsell);
local v25 = require(l_Parent_0.Flags.GetFFlagEnableInsufficientRobuxForBundleUpsellFix);
local v26 = require(l_Parent_0.Parent.Flags.FFlagEnableUGC4ACollectiblePurchaseSupport);
local v27 = require(l_Parent_0.Parent.Flags.FFlagFixNonCollectibleBundleOwnedCheck);
local v28 = require(l_Parent_0.Parent.Flags.FFlagEnableBundlePurchaseChecks);
local function _(v29)
    local l_reason_0 = v29.reason;
    if l_reason_0 == "InsufficientFunds" then
        return v11.NotEnoughRobux;
    elseif l_reason_0 == "AlreadyOwned" then
        return v11.AlreadyOwn;
    elseif l_reason_0 == "NotForSale" then
        return v11.NotForSale;
    elseif l_reason_0 == "ContentRatingRestricted" then
        return v11.Under13;
    else
        return v11.UnknownFailure;
    end;
end;
local function _(v32, v33)
    if v32 and v32.product ~= nil then
        if v33 and v32.product.premiumPricing ~= nil then
            return v32.product.premiumPricing.premiumPriceInRobux or 0;
        else
            return v32.product.priceInRobux or 0;
        end;
    else
        return 0;
    end;
end;
local function v45(v35, v36, v37, v38)
    local l_collectibleItemDetail_0 = v35.collectibleItemDetail;
    local l_l_collectibleItemDetail_0_0 = l_collectibleItemDetail_0;
    if l_l_collectibleItemDetail_0_0 then
        l_l_collectibleItemDetail_0_0 = false;
        if l_collectibleItemDetail_0.collectibleItemId ~= nil then
            l_l_collectibleItemDetail_0_0 = l_collectibleItemDetail_0.collectibleItemId ~= "";
        end;
    end;
    if v28 then
        local l_l_collectibleItemDetail_0_1 = l_collectibleItemDetail_0;
        if l_l_collectibleItemDetail_0_1 then
            l_l_collectibleItemDetail_0_1 = false;
            if l_collectibleItemDetail_0.collectibleItemType ~= nil then
                l_l_collectibleItemDetail_0_1 = l_collectibleItemDetail_0.collectibleItemType == "Limited";
            end;
        end;
        if not l_l_collectibleItemDetail_0_0 then
            if v38 then
                return false, v11.AlreadyOwn;
            end;
        elseif not (l_l_collectibleItemDetail_0_1 or not v38) then
            return false, v11.AlreadyOwn;
        end;
    end;
    local _ = nil;
    if if not l_l_collectibleItemDetail_0_0 then v35.product and v35.product.isForSale else l_collectibleItemDetail_0.saleStatus == "OnSale" then
        if v28 then
            if (v37 ~= nil and v36.robux ~= nil) and v36.robux < v37 then
                return false, v11.NotEnoughRobux;
            elseif v35.itemRestrictions ~= nil then
                for _, v44 in v35.itemRestrictions, nil, nil do
                    if v44 == "ThirteenPlus" then
                        if not l_Players_0.LocalPlayer:GetUnder13() then
                            break;
                        else
                            return false, v11.Under13;
                        end;
                    end;
                end;
            end;
        end;
        return true, nil;
    else
        return false, v11.NotForSale;
    end;
end;
local v46 = {
    v16, 
    v17
};
return function(v47, v48, v49, v50, v51, v52)
    return v23.new(script.Name, v46, function(v53, v54)
        local v55 = v53:getState();
        local v56 = v54[v16];
        local v57 = v54[v17];
        v53:dispatch(v6(v48));
        v53:dispatch(v7(v49));
        v53:dispatch(v8(v50));
        if v28 and v51 == nil then
            local l_isPremium_0 = v49.isPremium;
            local l_v48_0 = v48;
            v51 = if not not l_v48_0 and l_v48_0.product ~= nil then if l_isPremium_0 and l_v48_0.product.premiumPricing ~= nil then l_v48_0.product.premiumPricing.premiumPriceInRobux or 0 else l_v48_0.product.priceInRobux or 0 else 0;
        end;
        local v60 = nil;
        local v61 = nil;
        local v62 = nil;
        if not v26 then
            v60 = v47.purchasable;
            local l_reason_1 = v47.reason;
            v61 = if l_reason_1 == "InsufficientFunds" then v11.NotEnoughRobux else if l_reason_1 == "AlreadyOwned" then v11.AlreadyOwn else if l_reason_1 == "NotForSale" then v11.NotForSale else if l_reason_1 == "ContentRatingRestricted" then v11.Under13 else v11.UnknownFailure;
            v62 = v47.price;
        elseif not v27 or v28 then
            local v64, v65 = v45(v48, v50, v51, v52);
            v60 = v64;
            v61 = v65;
            v62 = v51;
        elseif v47.productId ~= nil and v47.productId ~= 0 then
            v60 = v47.purchasable;
            local l_reason_2 = v47.reason;
            v61 = if l_reason_2 == "InsufficientFunds" then v11.NotEnoughRobux else if l_reason_2 == "AlreadyOwned" then v11.AlreadyOwn else if l_reason_2 == "NotForSale" then v11.NotForSale else if l_reason_2 == "ContentRatingRestricted" then v11.Under13 else v11.UnknownFailure;
            v62 = v47.price;
        else
            local v67, v68 = v45(v48, v50, v51, v52);
            v60 = v67;
            v61 = v68;
            v62 = v51;
        end;
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v70 = v14(l_l_UserInputService_0_Platform_0);
        local v71 = v61 == v11.NotEnoughRobux;
        if not ((not l_RunService_0:IsStudio() or not v22()) or not v71) then
            v71 = v50.robux < v62;
            if not v60 then
                v60 = not v71;
            end;
        end;
        if v60 then
            return v53:dispatch(v4(v10.PromptPurchase));
        elseif not v71 then
            return v53:dispatch(v5(v61));
        elseif not v25() and v70 == v12.Web then
            return v53:dispatch(v4(v10.RobuxUpsell));
        else
            local _ = v62 - v50.robux;
            local _ = v49.isPremium;
            local _ = nil;
            return v15(v57, v62, v50.robux, if not v21() then v19(l_l_UserInputService_0_Platform_0, v24(), (v20())) else v18(l_l_UserInputService_0_Platform_0)):andThen(function(v75)
                v56.signalProductPurchaseUpsellShown(v75.id, v55.requestType, v75.providerId);
                v53:dispatch(v9(v75.providerId, v75.id, v75.robuxAmount));
            end, function()
                v53:dispatch(v5(v11.NotEnoughRobuxXbox));
            end);
        end;
    end);
end;
