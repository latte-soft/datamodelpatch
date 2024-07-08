local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Promise);
local v4 = require(l_CorePackages_0.Logging);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AppendSearchInCatalog);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSearchInCatalog);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromSortResults);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleInfoFromSortResults);
local v10 = require(l_Modules_0.LuaApp.Actions.SetSearchTime);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v14 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v15 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v16 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local function v34(v19, v20, v21, v22, v23, v24)
    local l_searchUuid_0 = v19.searchUuid;
    local l_searchKeyword_0 = v19.searchKeyword;
    local v27 = v20:getState().Search.SearchesInCatalog[l_searchUuid_0];
    if v12.selectSortAndFiltersKey(v20:getState()) ~= v24 then
        v23("Search with Uuid " .. l_searchUuid_0 .. " has been terminated");
    end;
    local v28 = v14.tableToCamelCaseKeys((v21:GetCurrentPage()));
    local v29 = {};
    local v30 = {};
    local v31 = {
        items = {}, 
        keyword = l_searchKeyword_0, 
        hasMoreEntries = not v21.IsFinished
    };
    for v32, v33 in v28, nil, nil do
        if v33.itemType == v6.ItemType.Asset then
            v33.assetType = v6.AssetTypeIdStrings[v33.assetType];
            table.insert(v29, v33);
        elseif v33.itemType == v6.ItemType.Bundle then
            v33.bundleType = v6.BundleTypeIdStrings[v33.bundleType];
            table.insert(v30, v33);
        end;
        v31.items[v32] = {
            id = tostring(v33.id), 
            type = tostring(v33.itemType), 
            productId = v33.productId
        };
    end;
    if not v27 then
        v20:dispatch(v7(l_searchUuid_0, v31));
    else
        v20:dispatch(v5(l_searchUuid_0, v31));
    end;
    if v19.recordSearchTime then
        v20:dispatch(v10(l_searchUuid_0, tick()));
    end;
    if #v29 > 0 then
        v20:dispatch(v8(v29));
    end;
    if #v30 > 0 then
        v20:dispatch(v9(v30));
    end;
    v22:storePageObject(l_searchUuid_0, v21);
    v23();
end;
local function v45(v35, v36, v37, v38, v39, v40, v41)
    local v42 = v14.getSearchParams(v35, v36:getState().AvatarExperience.Catalog.SortAndFilters);
    local l_status_0, l_result_0 = pcall(function()
        return v38:SearchCatalog(v42);
    end);
    if not l_status_0 then
        if v18() then
            v16(v17.Counter.AvatarEditorServiceErrors.SearchCatalog);
        end;
        v4.warn("ApiFetchCatalogSearch failure: " .. tostring(l_result_0));
        v40({
            HttpError = Enum.HttpError.OK
        });
        return ;
    else
        v34(v35, v36, l_result_0, v37, v39, v41);
        return ;
    end;
end;
local function v55(v46, v47, v48, v49, v50, v51, v52)
    local l_status_1, l_result_1 = pcall(function()
        v46:AdvanceToNextPageAsync();
    end);
    if not l_status_1 then
        v4.warn("ApiFetchCatalogSearch failure: " .. l_result_1);
        v51({
            HttpError = Enum.HttpError.OK
        });
        return ;
    else
        v34(v47, v48, v46, v49, v50, v52);
        return ;
    end;
end;
return function(v56)
    return v15.convertPaginatedFetchThunk("ApiFetchCatalogSearch", function(v57, v58, v59)
        local l_searchUuid_1 = v56.searchUuid;
        local v61 = v12.selectSortAndFiltersKey(v57:getState());
        return l_PerformFetch_0.Single(v14.getSearchKey(v57:getState(), l_searchUuid_1), function(v62)
            local v63 = v58:getPageObject(l_searchUuid_1);
            if not v63 or not v63.IsFinished then
                return v3.new(function(v64, v65)
                    if not l_searchUuid_1 then
                        v65("Must have a searchUuid.");
                    end;
                    if v63 == nil then
                        v45(v56, v62, v58, v59, v64, v65, v61);
                        return ;
                    else
                        v55(v63, v56, v62, v58, v64, v65, v61);
                        return ;
                    end;
                end);
            else
                return v3.resolve();
            end;
        end)(v57);
    end);
end;
