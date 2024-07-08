local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Thunk);
local v2 = require(l_Parent_0.Services.Analytics);
local v3 = require(l_Parent_0.UtilityFunctions);
local v4 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v5 = require(l_Parent_0.Thunks.SendCounter);
local v6 = require(l_Parent_0.Flags.GetFFlagIBEnableSendCounters);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedBundle);
local v9 = {
    v2
};
return function(v10)
    return v1.new(script.Name, v9, function(v11, v12)
        local v13 = v12[v2];
        local v14 = (v10 and v10.bundlesAssetIsIn) and #v10.bundlesAssetIsIn == 1;
        if v4() then
            v14 = v10 and v10.parentBundleId ~= nil;
        end;
        local v15 = v14 and not v10.isForSale;
        if v8() then
            v15 = v14;
        end;
        local v16 = nil;
        local v17 = nil;
        if not v15 then
            v16 = "Asset";
            v17 = v10.assetId;
        else
            v16 = "Bundle";
            v17 = v3.getBundleId(v10);
        end;
        v13.reportItemDetailPageOpened(v16, v17);
        if v6() then
            v11:dispatch(v5(v7.Counters.ItemDetailPageOpened));
        end;
    end);
end;
