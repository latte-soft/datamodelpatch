local l_PerformFetch_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Thunk);
local v3 = require(l_Parent_0.Services.Network);
local v4 = require(l_Parent_0.Actions.SetBundles);
local v5 = require(l_Parent_0.Models.BundleInfo);
local v6 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v7 = require(l_Parent_0.Thunks.SendCounter);
local v8 = require(l_Parent_0.Flags.GetFFlagIBEnableSendCounters);
local v9 = require(l_Parent_0.Constants);
local v10 = {
    v3
};
local v11 = v6("getBundleFavoriteCount");
return function(v12)
    return v2.new(script.Name, v10, function(v13, v14)
        local v15 = v14[v3];
        return l_PerformFetch_0.Single(v11(v13:getState().storeId, v12), function(_)
            return v15.getBundleFavoriteCount(v12):andThen(function(v17)
                if v17 then
                    v13:dispatch(v4({
                        (v5.fromGetBundleFavoriteCount(v12, v17))
                    }));
                end;
                if v8() then
                    v13:dispatch(v7(v9.Counters.GetBundleFavoriteCount .. v9.CounterSuffix.RequestSucceeded));
                end;
            end, if not v8() then nil else function(_)
                v13:dispatch(v7(v9.Counters.GetBundleFavoriteCount .. v9.CounterSuffix.RequestRejected));
            end);
        end)(v13):catch(function(_)
            if v8() then
                v13:dispatch(v7(v9.Counters.GetBundleFavoriteCount .. v9.CounterSuffix.RequestFailed));
            end;
        end);
    end);
end;
