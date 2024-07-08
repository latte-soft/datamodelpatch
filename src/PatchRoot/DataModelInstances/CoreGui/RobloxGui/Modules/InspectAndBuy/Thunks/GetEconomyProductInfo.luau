local l_PerformFetch_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Thunk);
local v3 = require(l_Parent_0.Models.AssetInfo);
local v4 = require(l_Parent_0.Models.BundleInfo);
local v5 = require(l_Parent_0.Services.Network);
local v6 = require(l_Parent_0.Actions.SetAssets);
local v7 = require(l_Parent_0.Actions.SetBundles);
local v8 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v9 = require(l_Parent_0.Thunks.SendCounter);
local v10 = require(l_Parent_0.Flags.GetFFlagIBEnableSendCounters);
local v11 = require(l_Parent_0.Constants);
local v12 = {
    v5
};
local v13 = v8("getEconomyProductInfo");
return function(v14, v15, v16)
    return v2.new(script.Name, v12, function(v17, v18)
        local v19 = v18[v5];
        return l_PerformFetch_0.Single(v13(v17:getState().storeId, v14), function()
            return v19.getEconomyProductInfo(v14):andThen(function(v20)
                local v21;
                if not v20.purchasable then
                    v21 = true;
                    if not (v20.reason ~= "AlreadyOwned") then
                        goto label0;
                    end;
                end;
                v21 = false;
                ::label0::;
                local v22 = v20.price or 0;
                local l_purchasable_0 = v20.purchasable;
                local l_premiumPricing_0 = v20.premiumPricing;
                if not v20.purchasable and v20.reason == "InsufficientFunds" then
                    l_purchasable_0 = true;
                end;
                if v15 then
                    v17:dispatch(v7({
                        (v4.fromGetEconomyProductInfo(v21, v16, v22, l_purchasable_0))
                    }));
                else
                    v17:dispatch(v6({
                        (v3.fromGetEconomyProductInfo(v20, v21, v22, l_purchasable_0, l_premiumPricing_0))
                    }));
                end;
                if v10() then
                    v17:dispatch(v9(v11.Counters.GetEconomyProductInfo .. v11.CounterSuffix.RequestSucceeded));
                end;
            end, if not v10() then nil else function(_)
                v17:dispatch(v9(v11.Counters.GetEconomyProductInfo .. v11.CounterSuffix.RequestRejected));
            end);
        end)(v17):catch(function(_)
            if v10() then
                v17:dispatch(v9(v11.Counters.GetEconomyProductInfo .. v11.CounterSuffix.RequestFailed));
            end;
        end);
    end);
end;
