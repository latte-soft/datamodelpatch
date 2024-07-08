local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_CorePackages_0.Promise);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromBundleItemAction);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.HandleTryOnFailure);
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleInfoFromCatalogItemAction);
local v11 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local v14 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local function _(v15)
    return v5.FetchBundleInfoKey .. tostring(v15);
end;
local function _(v17, v18)
    local v19 = v17.AvatarExperience.Common.AssetInfos[v18];
    if not v19 or not v19.receivedFromBundleItemData then
        return false;
    else
        return true;
    end;
end;
local function v30(v21, v22, v23)
    if v23.bundledItems then
        local v24 = v21:getState();
        local v25 = {};
        for _, v27 in v23.bundledItems, nil, nil do
            local v28 = tostring(v27.id);
            if v27.type == v6.ItemType.Asset then
                local v29 = v24.AvatarExperience.Common.AssetInfos[v28];
                if not (not not v29 and (v29.receivedFromBundleItemData and true or false)) then
                    table.insert(v25, v27);
                end;
            end;
        end;
        if #v25 > 0 then
            v21:dispatch(v7(v25));
        end;
    end;
    v21:dispatch(v10(v22, v23));
end;
return function(v31)
    v4.isType(v31, "string", "FetchBundleInfo thunk expects bundleId to be a string");
    return v14.convertAvatarEditorServiceThunk("FetchBundleInfo", function(v32, v33)
        local v34 = v32:getState().AvatarExperience.Common.BundleInfos[tostring(v31)];
        if not (v34 ~= nil) or not v34.receivedCatalogData then
            return l_PerformFetch_0.Single(v5.FetchBundleInfoKey .. tostring(v31), function(v35)
                return v3.new(function(v36, v37)
                    local l_status_0, l_result_0 = pcall(function()
                        return v33:GetItemDetails(v31, Enum.AvatarItemType.Bundle);
                    end);
                    if not l_status_0 then
                        if v13() then
                            v11(v12.Counter.AvatarEditorServiceErrors.FetchBundleInfo);
                        end;
                        v35:dispatch(v8(v31));
                        v37(l_result_0);
                        return ;
                    else
                        l_result_0 = v9.tableToCamelCaseKeys(l_result_0);
                        v30(v35, v31, l_result_0);
                        v36(l_result_0);
                        return ;
                    end;
                end);
            end)(v32);
        else
            return v3.resolve("We already have the bundle");
        end;
    end);
end;
