local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Models.AssetInfo);
local v5 = require(l_Parent_0.Actions.SetAssets);
local v6 = require(l_Parent_0.Actions.SetBundlesAssetIsPartOf);
local v7 = require(l_Parent_0.Actions.SetAssetFromBundleInfo);
local v8 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v9 = require(l_Parent_0.Flags.GetFFlagIBFixBuyingFromResellers);
return v2.createReducer({}, {
    [v5.name] = function(v10, v11)
        local v12 = {};
        for _, v14 in ipairs(v11.assets) do
            assert(v14.assetId ~= nil, "Expected an asset id when setting an asset's information.");
            v12[v14.assetId] = v1.Dictionary.join(v10[v14.assetId] or {}, v14);
            if v9() then
                local v15 = v12[v14.assetId];
                if v15 then
                    v12[v14.assetId] = v4.getSaleDetailsForCollectibles(v15);
                end;
            end;
        end;
        return (v1.Dictionary.join(v10, v12));
    end, 
    [v6.name] = function(v16, v17)
        local v18 = tostring(v17.assetId);
        return v1.Dictionary.join(v16, {
            [v18] = v1.Dictionary.join(v16[v18] or {}, (v4.fromGetAssetBundles(v18, v17.bundleIds)))
        });
    end, 
    [v7.name] = if not v8() then nil else function(v19, v20)
        local l_bundleInfo_0 = v20.bundleInfo;
        local v22 = tostring(v20.assetId);
        return v1.Dictionary.join(v19, {
            [v22] = v1.Dictionary.join(v19[v22] or {}, (v4.fromBundleInfo(v22, l_bundleInfo_0)))
        });
    end
});
