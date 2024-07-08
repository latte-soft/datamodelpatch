local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_Modules_0.AvatarExperience.Common.Models.BundleInfo);
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetRecommendedBundlesAction);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleInfoFromCatalogItemAction);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleInfoFromSortResults);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBundleInfoFromAvatarEditorRecommendedItemsV2);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetHydratedWidgetData);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.SetBundleOwned);
local v14 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v3.createReducer({}, {
    [v9.name] = function(v16, v17)
        v4.isType(v17.bundleId, "string", "bundleId must be a string.");
        v4.isType(v17.bundleData, "table", "bundleData must be a table.");
        local v18 = tostring(v17.bundleId);
        return v5.Dictionary.join(v16, {
            [v18] = v6.fromGetCatalogItemData(v17.bundleData, v16[v18])
        });
    end, 
    [v11.name] = function(v19, v20)
        v4.isType(v20.bundles, "table", "bundles must be a table.");
        local v21 = {};
        for _, v23 in v20.bundles, nil, nil do
            local v24 = tostring(v23.id);
            v21[v24] = v6.fromGetRecommendedItemsDataV2(v23, v19[v24]);
        end;
        return v5.Dictionary.join(v19, v21);
    end, 
    [v12.name] = function(v25, v26)
        v4.isType(v26.payload, "table", "payload must be a table.");
        if v26.payload[v14.ContentType.Bundle] then
            local v27 = {};
            for _, v29 in v26.payload[v14.ContentType.Bundle], nil, nil do
                local v30 = tostring(v29.id);
                v27[v30] = v6.fromHydrateWidgetInfo(v29, v25[v30]);
            end;
            return v5.Dictionary.join(v25, v27);
        else
            return v25;
        end;
    end, 
    [v10.name] = function(v31, v32)
        v4.isType(v32.sortResults, "table", "sortResults must be a table.");
        local v33 = {};
        for _, v35 in v32.sortResults, nil, nil do
            local v36 = tostring(v35.id);
            v33[v36] = v6.fromSortResults(v35, v31[v36]);
        end;
        return v5.Dictionary.join(v31, v33);
    end, 
    [v8.name] = function(v37, v38)
        v4.isType(v38.bundleId, "string", "bundleId must be a string.");
        v4.isType(v38.recommendedItems, "table", "recommendedItems must be a table.");
        local v39 = tostring(v38.bundleId);
        local v40 = {};
        local v41 = {};
        for _, v43 in v38.recommendedItems, nil, nil do
            local v44 = tostring(v43.id);
            v40[v44] = v6.fromGetRecommendedItemsDataV2(v43, v37[v44]);
            v41[#v41 + 1] = {
                id = v44, 
                type = v7.ItemType.Bundle, 
                subType = tostring(v43.bundleType)
            };
        end;
        v40[v39] = v6.fromRecommendedItemSummaries(v41, v37[v39]);
        return v5.Dictionary.join(v37, v40);
    end, 
    [v13.name] = function(v45, v46)
        v4.isType(v46.bundleId, "string", "bundleId must be a string.");
        v4.isType(v46.isOwned, "boolean", "isOwned must be a bool.");
        local v47 = tostring(v46.bundleId);
        return v5.Dictionary.join(v45, {
            [v47] = v6.fromIsOwned(v46.isOwned, v45[v47])
        });
    end
});
