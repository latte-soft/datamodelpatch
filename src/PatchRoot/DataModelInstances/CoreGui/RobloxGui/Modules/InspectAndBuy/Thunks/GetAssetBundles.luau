local l_PerformFetch_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Thunk);
local v3 = require(l_Parent_0.Services.Network);
local v4 = require(l_Parent_0.Models.BundleInfo);
local v5 = require(l_Parent_0.Actions.SetBundles);
local v6 = require(l_Parent_0.Actions.SetBundlesAssetIsPartOf);
local v7 = require(l_Parent_0.Thunks.GetProductInfo);
local v8 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v9 = require(l_Parent_0.Actions.SetAssetToBundlesMapping);
local v10 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v11 = require(l_Parent_0.Thunks.SendCounter);
local v12 = require(l_Parent_0.Flags.GetFFlagIBEnableSendCounters);
local v13 = require(l_Parent_0.Constants);
local v14 = {
    v3
};
local v15 = v8("getAssetBundles");
return function(v16)
    return v2.new(script.Name, v14, function(v17, v18)
        local v19 = v18[v3];
        return l_PerformFetch_0.Single(v15(v17:getState().storeId, v16), function(_)
            return v19.getAssetBundles(v16):andThen(function(v21)
                local v22 = {};
                local v23 = {};
                for _, v25 in pairs(v21.data) do
                    local v26 = v4.fromGetAssetBundles(v25);
                    table.insert(v23, v26);
                    table.insert(v22, (tostring(v26.bundleId)));
                    local v27 = false;
                    for _, v29 in pairs(v25.items) do
                        if v29.type == "UserOutfit" then
                            v27 = true;
                            break;
                        end;
                    end;
                    if not v27 then
                        for _, v31 in pairs(v25.items) do
                            if not v17:getState().assets[v31.id] then
                                coroutine.wrap(function()
                                    v17:dispatch(v7(v31.id));
                                end)();
                            end;
                        end;
                    end;
                end;
                v17:dispatch(v5(v23));
                if not v10() then
                    v17:dispatch(v6(tostring(v16), v22));
                else
                    v17:dispatch(v9(tostring(v16), v22));
                end;
                if v12() then
                    v17:dispatch(v11(v13.Counters.GetAssetBundles .. v13.CounterSuffix.RequestSucceeded));
                end;
            end, if not v12() then nil else function(_)
                v17:dispatch(v11(v13.Counters.GetAssetBundles .. v13.CounterSuffix.RequestRejected));
            end);
        end)(v17):catch(function(_)
            if v12() then
                v17:dispatch(v11(v13.Counters.GetAssetBundles .. v13.CounterSuffix.RequestFailed));
            end;
        end);
    end);
end;
