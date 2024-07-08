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
local v9 = v4("getHumanoidDescriptionFromCostumeId");
return function(v10, v11)
    return v2.new(script.Name, v8, function(v12, v13)
        local v14 = v13[v3];
        return l_PerformFetch_0.Single(v9(v12:getState().storeId, v10), function()
            return v14.getHumanoidDescriptionFromCostumeId(v10):andThen(function(v15)
                v11(v15);
                if v6() then
                    v12:dispatch(v5(v7.Counters.GetHumanoidDescriptionFromCostumeId .. v7.CounterSuffix.RequestSucceeded));
                end;
            end, if not v6() then nil else function(_)
                v12:dispatch(v5(v7.Counters.GetHumanoidDescriptionFromCostumeId .. v7.CounterSuffix.RequestRejected));
            end);
        end)(v12):catch(function(_)
            if v6() then
                v12:dispatch(v5(v7.Counters.GetHumanoidDescriptionFromCostumeId .. v7.CounterSuffix.RequestFailed));
            end;
        end);
    end);
end;
