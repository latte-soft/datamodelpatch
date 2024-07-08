local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Thunk);
local v5 = require(l_Parent_0.Services.Network);
local v6 = require(l_Parent_0.Services.Analytics);
local v7 = require(l_Parent_0.Actions.SetFavoriteAsset);
local v8 = require(l_Parent_0.Actions.SetAssets);
local v9 = require(l_Parent_0.Models.AssetInfo);
local v10 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v11 = require(l_Parent_0.Thunks.SendCounter);
local v12 = require(l_Parent_0.Constants);
local v13 = require(l_Parent_0.Flags.GetFFlagIBEnableSendCounters);
local v14 = {
    v5, 
    v6
};
local v15 = v10("createFavoriteForAsset");
return function(v16)
    return v4.new(script.Name, v14, function(v17, v18)
        local v19 = v18[v5];
        local v20 = v18[v6];
        return l_PerformFetch_0.Single(v15(v17:getState().storeId, v16), function(_)
            return v19.createFavoriteForAsset(v16):andThen(function()
                v17:dispatch(v7(v16, true));
                local l_numFavorites_0 = v17:getState().assets[v16].numFavorites;
                v17:dispatch(v8({
                    (v9.fromGetAssetFavoriteCount(v16, l_numFavorites_0 + 1))
                }));
                v20.reportFavoriteItem("Asset", v16, true, true, "", l_numFavorites_0 + 1);
                if v13() then
                    v17:dispatch(v11(v12.Counters.CreateFavoriteForAsset .. v12.CounterSuffix.RequestSucceeded));
                end;
                return v1.resolve();
            end, function(v23)
                if v13() then
                    v17:dispatch(v11(v12.Counters.CreateFavoriteForAsset .. v12.CounterSuffix.RequestRejected));
                end;
                return v1.reject((tostring(v23.StatusMessage)));
            end);
        end)(v17):catch(function(v24)
            v20.reportFavoriteItem("Asset", v16, true, false, v24, v17:getState().assets[v16].numFavorites);
            if v13() then
                v17:dispatch(v11(v12.Counters.CreateFavoriteForAsset .. v12.CounterSuffix.RequestFailed));
            end;
        end);
    end);
end;
