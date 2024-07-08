local l_PerformFetch_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Thunk);
local v3 = require(l_Parent_0.Services.Network);
local v4 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v5 = require(l_Parent_0.Thunks.SendCounter);
local v6 = require(l_Parent_0.Flags.GetFFlagIBEnableSendCounters);
local v7 = require(l_Parent_0.Constants);
local v8 = {
    v3
};
local v9 = v4("getPlayerModel");
return function(v10, v11, v12)
    return v2.new(script.Name, v8, function(v13, v14)
        local v15 = v14[v3];
        return l_PerformFetch_0.Single(v9(v13:getState().storeId, v10, v11), function()
            return v15.getModelFromUserId(v10):andThen(function(v16)
                v12(v16);
                if v6() then
                    v13:dispatch(v5(v7.Counters.GetCharacterModelFromUserId .. v7.CounterSuffix.RequestSucceeded));
                end;
            end, if not v6() then nil else function(_)
                v13:dispatch(v5(v7.Counters.GetCharacterModelFromUserId .. v7.CounterSuffix.RequestRejected));
            end);
        end)(v13):catch(function(_)
            if v6() then
                v13:dispatch(v5(v7.Counters.GetCharacterModelFromUserId .. v7.CounterSuffix.RequestFailed));
            end;
        end);
    end);
end;
