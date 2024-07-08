local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Enums.PurchaseWarning);
local function v3()
    return v1.resolve(false);
end;
local function v6(_, _)
    return v1.resolve({
        AssetId = 1, 
        AssetTypeId = 2, 
        ContentRatingTypeId = 0, 
        Creator = {
            CreatorType = "Group", 
            CreatorTargetId = 1, 
            Name = "ROBLOX", 
            Id = 1
        }, 
        Description = "This item isn't real", 
        IconImageAssetId = 1, 
        IsForSale = true, 
        IsLimited = false, 
        IsLimitedUnique = false, 
        IsNew = false, 
        IsPublicDomain = false, 
        MinimumMembershipLevel = 0, 
        Name = "Test Item", 
        PriceInRobux = 100, 
        ProductId = 1
    });
end;
local function v10(_, _, _)
    return v1.resolve(false);
end;
local function v15(_, _, _, _)
    return v1.resolve({
        success = true, 
        purchased = true, 
        receipt = "fake-receipt-hash"
    });
end;
local function v17(_)
    return v1.resolve(Instance.new("Tool"));
end;
local function v18()
    return v1.resolve({
        isPremium = false
    });
end;
local function v19()
    return v1.resolve({
        robux = 2147483647
    });
end;
local function v21(_)
    return v1.resolve({
        id = 1, 
        name = "mock-name", 
        description = "mock-description", 
        items = {
            [1] = {
                id = 1, 
                name = "outfit-name", 
                type = "UserOutfit"
            }
        }, 
        creator = {
            id = 1, 
            name = "ROBLOX", 
            type = "User"
        }, 
        product = {
            id = 1, 
            isForSale = true, 
            priceInRobux = 100
        }
    });
end;
local function v23(_)
    return v1.resolve({
        purchasable = false, 
        reason = "mock-reason", 
        price = 100
    });
end;
local function v27(_, _, _)
    return v1.resolve({
        roblox_product_id = 50, 
        provider_product_id = "robux50", 
        roblox_product_name = "providerRobux50", 
        robux_amount = 500
    });
end;
local function v28()
    return v1.resolve();
end;
local function v29()
    return v1.resolve(true);
end;
local function v31(_)
    return v1.resolve({
        action = v2.NoAction
    });
end;
local function v32()
    return v1.resolve();
end;
local v33 = {};
v33.__index = v33;
v33.new = function(v34, v35)
    local v36 = nil;
    if not v35 and not v34 then
        v36 = {
            getABTestGroup = v3, 
            getProductInfo = v6, 
            getPlayerOwns = v10, 
            performPurchase = v15, 
            loadAssetForEquip = v17, 
            getAccountInfo = v18, 
            getBalanceInfo = v19, 
            getBundleDetails = v21, 
            getProductPurchasableDetails = v23, 
            getRobuxUpsellProduct = v27, 
            postPremiumImpression = v28, 
            getPremiumUpsellPrecheck = v29, 
            getPurchaseWarning = v31, 
            postPurchaseWarningAcknowledge = v32
        };
    else
        local function v37()
            if not v34 then
                return v1.reject(v35);
            else
                return v1.resolve(v34);
            end;
        end;
        v36 = {
            getABTestGroup = v37, 
            getProductInfo = v37, 
            getPlayerOwns = v37, 
            performPurchase = v37, 
            loadAssetForEquip = v37, 
            getAccountInfo = v37, 
            getBalanceInfo = v37, 
            getBundleDetails = v37, 
            getProductPurchasableDetails = v37, 
            getRobuxUpsellProduct = v37, 
            postPremiumImpression = v37, 
            getPremiumUpsellPrecheck = v37, 
            getPurchaseWarning = v37, 
            postPurchaseWarningAcknowledge = v37
        };
    end;
    setmetatable(v36, {
        __tostring = function()
            return "MockService(Network)";
        end
    });
    return v36;
end;
return v33;
