local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.Rodux);
local v6 = require(l_Modules_0.AvatarExperience.Common.Models.AssetInfo);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetRecommendedAssetsAction);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromInventoryFetch);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromOutfitDetails);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromCatalogItemAction);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromBundleItemAction);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromSortResults);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromAvatarEditorRecommendedItemsV2);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetHydratedWidgetData);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AppendAssetResellersList);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetResellersList);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetLowestPrice);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetResaleData);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetVersionData);
local v20 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v21 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAssetOwned);
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantAsset);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v24 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
return v5.createReducer({}, {
    [v10.name] = function(v25, v26)
        v3.isType(v26.assetId, "string", "assetId must be a string.");
        v3.isType(v26.assetData, "table", "assetData must be a table.");
        local v27 = tostring(v26.assetId);
        return v4.Dictionary.join(v25, {
            [v27] = v6.fromGetCatalogItemData(v26.assetData, v25[v27])
        });
    end, 
    [v11.name] = function(v28, v29)
        v3.isType(v29.assets, "table", "assets data must be a table.");
        local v30 = {};
        for _, v32 in v29.assets, nil, nil do
            local v33 = tostring(v32.id);
            v30[v33] = v6.fromBundleItemData(v32, v28[v33]);
        end;
        return v4.Dictionary.join(v28, v30);
    end, 
    [v12.name] = function(v34, v35)
        v3.isType(v35.sortResults, "table", "sortResults must be a table.");
        local v36 = {};
        for _, v38 in v35.sortResults, nil, nil do
            local v39 = tostring(v38.id);
            v36[v39] = v6.fromSortResults(v38, v34[v39]);
        end;
        return v4.Dictionary.join(v34, v36);
    end, 
    [v7.name] = function(v40, v41)
        v3.isType(v41.recommendedItems, "table", "recommendedItems must be a table.");
        local v42 = tostring(v41.assetId);
        local v43 = {};
        local v44 = {};
        for _, v46 in v41.recommendedItems, nil, nil do
            local v47 = tostring(v46.item.assetId);
            local v48 = v6.fromGetRecommendedItemsData(v46, v41.assetTypeId, v40[v47]);
            local l_assetTypeId_0 = v41.assetTypeId;
            v43[v47] = v48;
            table.insert(v44, {
                id = v47, 
                type = v20.ItemType.Asset, 
                subType = l_assetTypeId_0
            });
        end;
        v43[v42] = v6.fromRecommendedItemSummaries(v44, v40[v42]);
        return v4.Dictionary.join(v40, v43);
    end, 
    [v18.name] = function(v50, v51)
        v3.isType(v51.assetResaleData, "table", "assetResaleData must be a table.");
        local v52 = tostring(v51.assetId);
        return v4.Dictionary.join(v50, {
            [v52] = v6.fromResaleData(v51.assetResaleData, v50[v52])
        });
    end, 
    [v8.name] = function(v53, v54)
        v3.isType(v54.assets, "table", "assets must be a table.");
        local v55 = {};
        for _, v57 in v54.assets, nil, nil do
            local v58 = tostring(v57.assetId);
            v55[v58] = v6.fromInventoryFetch(v57, v53[v58]);
        end;
        return v4.Dictionary.join(v53, v55);
    end, 
    [v9.name] = function(v59, v60)
        v3.isType(v60.assets, "table", "assets must be a table.");
        local v61 = {};
        for _, v63 in v60.assets, nil, nil do
            local v64 = tostring(v63.id);
            v61[v64] = v6.fromOutfitDetails(v63, v59[v64]);
        end;
        return v4.Dictionary.join(v59, v61);
    end, 
    [v16.name] = function(v65, v66)
        v3.isType(v66.assetId, "string", "assetId must be a sting.");
        v3.isType(v66.userAssetIds, "table", "userAssetIds must be a table.");
        local v67 = tostring(v66.assetId);
        return v4.Dictionary.join(v65, {
            [v67] = v6.fromGetResellers(v66.userAssetIds, v65[v67])
        });
    end, 
    [v15.name] = function(v68, v69)
        v3.isType(v69.assetId, "string", "assetId must be a sting.");
        v3.isType(v69.userAssetIds, "table", "userAssetIds must be a table.");
        local v70 = tostring(v69.assetId);
        local v71 = if not v68[v70] then v6.mock() else v68[v70];
        local l_resellerUserAssetIds_0 = v71.resellerUserAssetIds;
        local _ = nil;
        return v4.Dictionary.join(v68, {
            [v70] = v4.Dictionary.join(v71, (v6.fromGetResellers(if not l_resellerUserAssetIds_0 then v69.userAssetIds else v4.List.join(l_resellerUserAssetIds_0, v69.userAssetIds), v71)))
        });
    end, 
    [v17.name] = function(v74, v75)
        v3.isType(v75.assetId, "string", "assetId must be a sting.");
        v3.isType(v75.priceInRobux, "number", "price must be a number.");
        local l_assetId_0 = v75.assetId;
        return v4.Dictionary.join(v74, {
            [l_assetId_0] = v6.fromLowestPrice(v75.priceInRobux, v74[l_assetId_0])
        });
    end, 
    [v13.name] = function(v77, v78)
        v3.isType(v78.assets, "table", "assets must be a table.");
        v3.isType(v78.assetTypeId, "string", "assetTypeId must be a string.");
        local l_assetTypeId_1 = v78.assetTypeId;
        local v80 = {};
        for _, v82 in v78.assets, nil, nil do
            local v83 = tostring(v82.id);
            v80[v83] = v6.fromGetRecommendedItemsDataV2(v82, l_assetTypeId_1, v77[v83]);
        end;
        return v4.Dictionary.join(v77, v80);
    end, 
    [v14.name] = function(v84, v85)
        v3.isType(v85.payload, "table", "payload must be a table.");
        if v85.payload[v24.ContentType.Asset] then
            local v86 = {};
            for _, v88 in v85.payload[v24.ContentType.Asset], nil, nil do
                local v89 = tostring(v88.id);
                local v90 = v6.fromHydrateWidgetInfo(v88, v84[v89]);
                v86[v89] = v4.Dictionary.join(v90, v90);
            end;
            return v4.Dictionary.join(v84, v86);
        else
            return v84;
        end;
    end, 
    [v21.name] = function(v91, v92)
        v3.isType(v92.assetId, "string", "assetId must be a string.");
        v3.isType(v92.isOwned, "boolean", "isOwned must be a bool.");
        local v93 = tostring(v92.assetId);
        return v4.Dictionary.join(v91, {
            [v93] = v6.fromIsOwned(v92.isOwned, v91[v93])
        });
    end, 
    [v22.name] = function(v94, v95)
        local v96 = tostring(v95.assetTypeId);
        local v97 = tostring(v95.assetId);
        local v98 = v6.fromAssetGrant(v97, v96);
        local v99 = v94[v97];
        if not v99 or not v99.assetType then
            if v99 then
                v98 = v4.Dictionary.join(v99, v98);
            end;
            return v4.Dictionary.join(v94, {
                [v97] = v98
            });
        else
            return v94;
        end;
    end, 
    [require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData).name] = function(v100, v101)
        local l_assets_0 = v101.avatarData.assets;
        if l_assets_0 == nil then
            return v100;
        else
            local v103 = {};
            for _, v105 in l_assets_0, nil, nil do
                local v106 = tostring(v105.id);
                local v107 = v6.fromReceivedAvatarData(v105);
                local v108 = v100[v106];
                if v108 then
                    v103[v106] = v4.Dictionary.join(v107, v108);
                else
                    v103[v106] = v107;
                end;
            end;
            return v4.Dictionary.join(v100, v103);
        end;
    end, 
    [v19.name] = function(v109, v110)
        v3.isType(v110.assetVersionData, "table", "assetVersionData must be a table.");
        local v111 = tostring(v110.assetId);
        return v4.Dictionary.join(v109, {
            [v111] = v6.fromVersionData(v110.assetVersionData, v109[v111])
        });
    end
});
