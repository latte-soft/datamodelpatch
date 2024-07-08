local l_PerformFetch_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Thunk);
local v3 = require(l_Parent_0.Services.Network);
local v4 = require(l_Parent_0.Actions.SetCollectibleResellableInstances);
local v5 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v6 = require(l_Parent_0.Thunks.SendCounter);
local v7 = require(l_Parent_0.Flags.GetFFlagIBEnableSendCounters);
local v8 = require(l_Parent_0.Constants);
local v9 = {
    v3
};
local v10 = v5("getCollectibleResellableInstances");
return function(v11, v12)
    return v2.new(script.Name, v9, function(v13, v14)
        local v15 = v14[v3];
        return l_PerformFetch_0.Single(v10(v13:getState().storeId, v11, v12), function()
            return v15.getCollectibleResellableInstances(v11, v12):andThen(function(v16)
                local v17 = v16 and v16.itemInstances;
                if v17 then
                    v13:dispatch(v4(v11, v17));
                end;
                if v7() then
                    if not v17 then
                        v13:dispatch(v6(v8.Counters.GetCollectibleResellableInstancesRequestSucceededWithoutResult));
                    else
                        v13:dispatch(v6(v8.Counters.GetCollectibleResellableInstances .. v8.CounterSuffix.RequestSucceeded));
                        return ;
                    end;
                end;
            end, if not v7() then nil else function(_)
                v13:dispatch(v6(v8.Counters.GetCollectibleResellableInstances .. v8.CounterSuffix.RequestRejected));
            end);
        end)(v13):catch(function(_)
            if v7() then
                v13:dispatch(v6(v8.Counters.GetCollectibleResellableInstances .. v8.CounterSuffix.RequestFailed));
            end;
        end);
    end);
end;
