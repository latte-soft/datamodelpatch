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
local v13 = v8("getItemDetails");
return function(v14, v15)
    return v2.new(script.Name, v12, function(v16, v17)
        local v18 = v17[v5];
        return l_PerformFetch_0.Single(v13(v16:getState().storeId, v14, v15), function()
            return v18.getItemDetails(v14, v15):andThen(function(v19)
                if v15 == Enum.AvatarItemType.Asset then
                    v16:dispatch(v6({
                        (v3.fromGetItemDetails(v19))
                    }));
                elseif v15 == Enum.AvatarItemType.Bundle then
                    v16:dispatch(v7({
                        (v4.fromGetItemDetails(v19))
                    }));
                elseif v10() then
                    v16:dispatch(v9(v11.Counters.GetItemDetailsRespondedWithUnknownItemType));
                end;
                if v10() then
                    v16:dispatch(v9(v11.Counters.GetItemDetails .. v11.CounterSuffix.RequestSucceeded));
                end;
            end, if not v10() then nil else function(_)
                v16:dispatch(v9(v11.Counters.GetItemDetails .. v11.CounterSuffix.RequestRejected));
            end);
        end)(v16):catch(function(_)
            if v10() then
                v16:dispatch(v9(v11.Counters.GetItemDetails .. v11.CounterSuffix.RequestFailed));
            end;
        end);
    end);
end;
