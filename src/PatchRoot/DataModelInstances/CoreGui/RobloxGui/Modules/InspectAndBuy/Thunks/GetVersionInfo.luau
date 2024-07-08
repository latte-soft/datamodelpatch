local l_PerformFetch_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Thunk);
local v3 = require(l_Parent_0.Services.Network);
local v4 = require(l_Parent_0.Models.AssetInfo);
local v5 = require(l_Parent_0.Actions.SetAssets);
local v6 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v7 = require(l_Parent_0.Thunks.GetExperiencePlayability);
local v8 = require(l_Parent_0.Thunks.GetExperienceInfo);
local v9 = require(l_Parent_0.Thunks.SendCounter);
local v10 = require(l_Parent_0.Flags.GetFFlagIBEnableSendCounters);
local v11 = require(l_Parent_0.Constants);
local v12 = {
    v3
};
local v13 = v6("getVersionInfo");
return function(v14)
    return v2.new(script.Name, v12, function(v15, v16)
        local v17 = v16[v3];
        return l_PerformFetch_0.Single(v13(v15:getState().storeId, v14), function()
            return v17.getVersionInfo(v14):andThen(function(v18)
                local v19 = v18.data[1];
                local v20 = if not v19 then nil else v19.creatingUniverseId;
                if v20 then
                    v20 = tostring(v20);
                    v15:dispatch(v5({
                        (v4.fromGetVersionInfo(v14, v19))
                    }));
                    v15:dispatch(v7(v20));
                    v15:dispatch(v8(v20));
                end;
                if v10() then
                    v15:dispatch(v9(v11.Counters.GetVersionInfo .. v11.CounterSuffix.RequestSucceeded));
                end;
            end, if not v10() then nil else function(_)
                v15:dispatch(v9(v11.Counters.GetVersionInfo .. v11.CounterSuffix.RequestRejected));
            end);
        end)(v15):catch(function(_)
            if v10() then
                v15:dispatch(v9(v11.Counters.GetVersionInfo .. v11.CounterSuffix.RequestFailed));
            end;
        end);
    end);
end;
