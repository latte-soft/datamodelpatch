local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local v2 = require(l_Parent_0.Actions.ErrorOccurred);
local v3 = require(l_Parent_0.Actions.RequestBundlePurchase);
local v4 = require(l_Parent_0.Enums.PurchaseError);
local v5 = require(l_Parent_0.Network.getBundleDetails);
local v6 = require(l_Parent_0.Network.getProductPurchasableDetails);
local v7 = require(l_Parent_0.Network.getAccountInfo);
local v8 = require(l_Parent_0.Network.getBalanceInfo);
local v9 = require(l_Parent_0.Network.getIsAlreadyOwned);
local v10 = require(l_Parent_0.Services.Network);
local v11 = require(l_Parent_0.Services.ExternalSettings);
local v12 = require(l_Parent_0.Utils.hasPendingRequest);
local v13 = require(l_Parent_0.Promise);
local v14 = require(l_Parent_0.Thunk);
local v15 = require(script.Parent.resolveBundlePromptState);
local v16 = require(l_Parent_0.Parent.Flags.FFlagEnableUGC4ACollectiblePurchaseSupport);
local v17 = require(l_Parent_0.Parent.Flags.FFlagEnableBundlePurchaseChecks);
local v18 = {
    v10, 
    v11
};
local v19 = require(l_Parent_0.Flags.GetFFlagReturnNotForSaleOnInvalidBundleId);
return function(v20, v21, v22, v23, v24, v25, v26)
    return v14.new(script.Name, v18, function(v27, v28)
        local v29 = v28[v10];
        local v30 = v28[v11];
        if not v12(v27:getState()) then
            if not v16 then
                v27:dispatch(v3(v20));
            else
                v27:dispatch(v3(v20, v21, v22, v23, v24, v25, v26));
            end;
            if not v30.isStudio() and l_Players_0.LocalPlayer.UserId <= 0 then
                v27:dispatch(v2(v4.Guest));
                return nil;
            elseif not v30.getFlagOrder66() then
                return v13.all({
                    bundleDetails = v5(v29, v20), 
                    accountInfo = v7(v29, v30), 
                    balanceInfo = v8(v29, v30), 
                    alreadyOwned = if not v17 then nil else v9(v29, v20, Enum.InfoType.Bundle)
                }):andThen(function(v31)
                    if not v19() then
                        v6(v29, v31.bundleDetails.product.id):andThen(function(v32)
                            v27:dispatch(v15(v32, v31.bundleDetails, v31.accountInfo, v31.balanceInfo, if not v16 then nil else v26));
                        end);
                        return ;
                    elseif not v31.bundleDetails.product then
                        v27:dispatch(v2(v4.NotForSale));
                        return ;
                    else
                        v6(v29, v31.bundleDetails.product.id):andThen(function(v33)
                            v27:dispatch(v15(v33, v31.bundleDetails, v31.accountInfo, v31.balanceInfo, if not v16 then nil else v26, if not v17 then nil else v31.alreadyOwned));
                        end);
                        return ;
                    end;
                end):catch(function(v34)
                    v27:dispatch(v2(v34));
                end);
            else
                v27:dispatch(v2(v4.PurchaseDisabled));
                return nil;
            end;
        else
            return nil;
        end;
    end);
end;
