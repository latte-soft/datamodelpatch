local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local _ = require(l_Parent_0.Actions.SetABVariation);
local v3 = require(l_Parent_0.Actions.ErrorOccurred);
local v4 = require(l_Parent_0.Actions.RequestAssetPurchase);
local v5 = require(l_Parent_0.Actions.RequestGamepassPurchase);
local v6 = require(l_Parent_0.Actions.RequestProductPurchase);
local v7 = require(l_Parent_0.Enums.PurchaseError);
local _ = require(l_Parent_0.Misc.Constants);
local v9 = require(l_Parent_0.Services.Network);
local v10 = require(l_Parent_0.Network.getProductInfo);
local v11 = require(l_Parent_0.Network.getBalanceInfo);
local v12 = require(l_Parent_0.Network.getIsAlreadyOwned);
local v13 = require(l_Parent_0.Network.getAccountInfo);
local v14 = require(l_Parent_0.Services.ExternalSettings);
local v15 = require(l_Parent_0.Utils.hasPendingRequest);
local v16 = require(l_Parent_0.Promise);
local v17 = require(l_Parent_0.Thunk);
local v18 = require(script.Parent.resolvePromptState);
local v19 = {
    v9, 
    v14
};
return function(v20, v21, v22, v23, v24, v25, v26, v27, v28, v29)
    return v17.new(script.Name, v19, function(v30, v31)
        local v32 = v31[v9];
        local v33 = v31[v14];
        if not v15(v30:getState()) then
            if v21 == Enum.InfoType.Asset then
                v30:dispatch(v4(v20, v22, v23, v24, v25, v26, v27, v28, v29));
            elseif v21 == Enum.InfoType.GamePass then
                v30:dispatch(v5(v20));
            elseif v21 == Enum.InfoType.Product then
                v30:dispatch(v6(v20, v22));
            else
                assert(false, "Invalid product type");
                return nil;
            end;
            if not v33.isStudio() and l_Players_0.LocalPlayer.UserId <= 0 then
                v30:dispatch(v3(v7.Guest));
                return nil;
            elseif not v33.getFlagOrder66() then
                return v16.all({
                    productInfo = v10(v32, v20, v21), 
                    accountInfo = v13(v32, v33), 
                    alreadyOwned = v12(v32, v20, v21), 
                    balanceInfo = v11(v32, v33)
                }):andThen(function(v34)
                    v30:dispatch(v18(v34.productInfo, v34.accountInfo, v34.balanceInfo, v34.alreadyOwned, v23, v29));
                end):catch(function(v35)
                    v30:dispatch(v3(v35));
                end);
            else
                v30:dispatch(v3(v7.PurchaseDisabled));
                return nil;
            end;
        else
            return nil;
        end;
    end);
end;
