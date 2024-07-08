local l_PerformFetch_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Thunk);
local v3 = require(l_Parent_0.Services.Network);
local v4 = require(l_Parent_0.Actions.SetFavoriteBundle);
local v5 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v6 = require(l_Parent_0.Thunks.SendCounter);
local v7 = require(l_Parent_0.Flags.GetFFlagIBEnableSendCounters);
local v8 = require(l_Parent_0.Constants);
local v9 = {
    v3
};
local v10 = v5("getFavoriteForBundle");
return function(v11)
    return v2.new(script.Name, v9, function(v12, v13)
        local v14 = v13[v3];
        return l_PerformFetch_0.Single(v10(v12:getState().storeId, v11), function(_)
            return v14.getFavoriteForBundle(v11):andThen(function(v16)
                if v16 == "null" then
                    v12:dispatch(v4(tostring(v11), false));
                else
                    v12:dispatch(v4(tostring(v11), true));
                end;
                if v7() then
                    v12:dispatch(v6(v8.Counters.GetFavoriteForBundle .. v8.CounterSuffix.RequestSucceeded));
                end;
            end, if not v7() then nil else function(_)
                v12:dispatch(v6(v8.Counters.GetFavoriteForBundle .. v8.CounterSuffix.RequestRejected));
            end);
        end)(v12):catch(function(_)
            if v7() then
                v12:dispatch(v6(v8.Counters.GetFavoriteForBundle .. v8.CounterSuffix.RequestFailed));
            end;
        end);
    end);
end;
