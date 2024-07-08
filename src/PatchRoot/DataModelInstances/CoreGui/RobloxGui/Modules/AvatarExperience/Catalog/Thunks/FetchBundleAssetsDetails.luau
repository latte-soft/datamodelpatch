local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_CorePackages_0.Promise);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromCatalogItemAction);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetResellers);
local v10 = require(l_Modules_0.AvatarExperience.Common.Models.AssetInfo);
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v12 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.ReceivedBundleInfoForTryOn);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.HandleTryOnFailure);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.UpdateSortOrderDueToLCBundleLoaded);
local v16 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v17 = require(l_Modules_0.AvatarExperience.Common.Models.ItemInfo);
local v18 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v19 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v20 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local function _(v21)
    return v8.GetBatchItemDetailsKey(v21);
end;
local function v34(v23, v24, _, v26, v27)
    local v28 = v26:getState();
    for _, v30 in v27, nil, nil do
        local v31 = tostring(v30.id);
        v26:dispatch(v6(v31, v30));
        local v32 = v10.fromGetCatalogItemData(v30);
        local _ = nil;
        if if not v16 then v8.DEPRECATED_IsResellable(v32) else v17.fromAssetInfo(v32).isResellable then
            v26:dispatch(v9(v23, v31, nil, v5.MaxResellersPerPage));
        end;
    end;
    if v28.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems[v24] then
        v26:dispatch(v13(v24));
        v26:dispatch(v15(v24));
    end;
end;
return function(v35, v36, v37)
    v4.isType(v37, "table", "FetchBundleAssetsDetails request expects itemIds");
    return v12.convertAvatarEditorServiceThunk("FetchOutfitAssetDetails", function(v38, v39)
        return l_PerformFetch_0.Single(v8.GetBatchItemDetailsKey(v37), function(v40)
            return v3.new(function(v41, v42)
                local l_status_0, l_result_0 = pcall(function()
                    return v39:GetBatchItemDetails(v37, Enum.AvatarItemType.Asset);
                end);
                if not l_status_0 then
                    if v20() then
                        v18(v19.Counter.AvatarEditorServiceErrors.GetBatchItemDetails);
                    end;
                    v2.warn("FetchBundleAssetsDetails failure: " .. tostring(l_result_0));
                    v40:dispatch(v14(v36));
                    v42();
                    return ;
                else
                    l_result_0 = v11.tableToCamelCaseKeys(l_result_0);
                    v34(v35, v36, v37, v40, l_result_0);
                    v41(l_result_0);
                    return ;
                end;
            end);
        end)(v38);
    end);
end;
