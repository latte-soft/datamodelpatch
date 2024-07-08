local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_CorePackages_0.Promise);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleInfoFromCatalogItemAction);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromCatalogItemAction);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromBundleItemAction);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetResellers);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleItemData);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResaleData);
local v16 = require(l_Modules_0.AvatarExperience.Common.Models.AssetInfo);
local v17 = require(l_Modules_0.AvatarExperience.Common.Models.BundleInfo);
local v18 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v20 = require(l_Modules_0.LuaApp.mutedError);
local v21 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v22 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v23 = require(l_Modules_0.AvatarExperience.Common.Models.ItemInfo);
local v24 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v25 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v26 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v27 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local l_FVariable_0 = settings():GetFVariable("LuaAppsPageLoadTimeItemDetails");
local v29 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local function _(v30, v31)
    return v11.GetItemDetailsKey(v30, v31);
end;
local function _(v33, v34)
    local v35 = v33.AvatarExperience.Common.AssetInfos[v34];
    if not v35 or not v35.receivedFromBundleItemData then
        return false;
    else
        return true;
    end;
end;
local v42 = if not v29() then nil else function(v37, v38, v39, v40)
    local v41 = {
        v37:dispatch(v13(v38, v39))
    };
    if v40 then
        table.insert(v41, v37:dispatch(v14(v38, v39, nil, v5.MaxResellersPerPage)));
        table.insert(v41, v37:dispatch(v15(v38, v39)));
    end;
    return v3.all(v41);
end;
local v46 = if v29() then nil else function(v43, v44, v45)
    return v3.all({
        v43:dispatch(v13(v44, v45)), 
        v43:dispatch(v14(v44, v45, nil, v5.MaxResellersPerPage)), 
        v43:dispatch(v15(v44, v45))
    });
end;
local function v67(v47, v48, v49, v50, v51)
    local v52 = v50:getState();
    if v49 == v6.ItemType.Bundle then
        v50:dispatch(v7(v48, v51));
        local v53 = {};
        if v51.bundledItems then
            for _, v55 in v51.bundledItems, nil, nil do
                local v56 = tostring(v55.id);
                if v55.Type == v6.ItemType.Asset then
                    local v57 = v52.AvatarExperience.Common.AssetInfos[v56];
                    if not (not not v57 and (v57.receivedFromBundleItemData and true or false)) then
                        table.insert(v53, v55);
                    end;
                end;
            end;
            if #v53 > 0 then
                v50:dispatch(v10(v53));
            end;
        end;
        if v29() then
            local v58 = v17.fromGetCatalogItemData(v51);
            local v59 = nil;
            local v60 = nil;
            if not v21 then
                v59 = v58.collectibleItemId;
                v60 = v11.DEPRECATED_isLimitedCollectible(v58);
            else
                local v61 = v23.fromBundleInfo(v58);
                v59 = v61 and v61.collectibleItemId;
                v60 = v61 and v61.isLimitedCollectible;
            end;
            if v59 then
                v42(v50, v47, v59, v60);
                return ;
            end;
        end;
    elseif v49 == v6.ItemType.Asset then
        v50:dispatch(v8(v48, v51));
        local v62 = v16.fromGetCatalogItemData(v51);
        local v63 = nil;
        local v64 = nil;
        local v65 = nil;
        if not v21 then
            v63 = v11.DEPRECATED_IsResellable(v62);
            v64 = v62.collectibleItemId;
            if v29() then
                v65 = v11.DEPRECATED_isLimitedCollectible(v62);
            end;
        else
            local v66 = v23.fromAssetInfo(v62);
            v63 = v66.isResellable;
            if v29() then
                v64 = v66 and v66.collectibleItemId;
                v65 = v66 and v66.isLimitedCollectible;
            end;
        end;
        if not v64 then
            if v63 then
                v50:dispatch(v12(v47, v48, nil, v5.MaxResellersPerPage));
            end;
        elseif not v29() then
            v46(v50, v47, v64);
            return ;
        else
            v42(v50, v47, v64, v65);
            return ;
        end;
    end;
end;
return function(v68, v69, v70, v71)
    v4.isType(v70, "string", "FetchAssetOrBundleInfo request expects itemId");
    v4.isType(v71, "string", "FetchAssetOrBundleInfo request expects itemType");
    if v21 then
        local v72 = true;
        if v71 ~= v6.ItemType.Asset then
            v72 = v71 == v6.ItemType.Bundle;
        end;
        assert(v72, "Does not work with outfits");
    end;
    return v22.convertAvatarEditorServiceThunk("FetchAssetOrBundleInfo", function(v73, v74)
        local v75 = tick();
        local v76 = v73:getState();
        local v77 = nil;
        local v78 = nil;
        local v79 = nil;
        local v80 = nil;
        if not v21 then
            if v71 == v6.ItemType.Asset then
                v77 = v76.AvatarExperience.Common.AssetInfos[v70];
            elseif v71 == v6.ItemType.Bundle then
                v77 = v76.AvatarExperience.Common.BundleInfos[v70];
            end;
            if v29() then
                v79 = v77 and v77.collectibleItemId;
                v80 = v11.DEPRECATED_isLimitedCollectible(v77);
            end;
        else
            v78 = v24(v76.AvatarExperience, v70, v71);
            if v29() then
                v79 = v78 and v78.collectibleItemId;
                v80 = v78 and v78.isLimitedCollectible;
            end;
        end;
        return l_PerformFetch_0.Single(v11.GetItemDetailsKey(v70, v71), function(v81)
            if not v21 then
                if not (not (v77 ~= nil) or not v77.receivedCatalogData) then
                    if not v29() then
                        if v77.collectibleItemId then
                            return v46(v81, v68, v77.collectibleItemId);
                        end;
                    elseif v79 then
                        return v42(v81, v68, v79, v80);
                    end;
                    if not v11.DEPRECATED_IsResellable(v77) then
                        return v3.resolve();
                    else
                        return v81:dispatch(v12(v68, v70, nil, v5.MaxResellersPerPage));
                    end;
                end;
            elseif not (not (v78 ~= nil) or not v78.receivedCatalogData) then
                if not v29() then
                    if v78.collectibleItemId then
                        return v46(v81, v68, v78.collectibleItemId);
                    end;
                elseif v79 then
                    return v42(v81, v68, v79, v80);
                end;
                if v78 and v78.isResellable then
                    if v71 == v6.ItemType.Asset then
                        return v81:dispatch(v12(v68, v70, nil, v5.MaxResellersPerPage));
                    else
                        v20("Backend is saying a bundle is resellable.  Client-side is not set up to handle that properly.");
                    end;
                end;
                return v3.resolve();
            end;
            return v3.new(function(v82, v83)
                local l_status_0, l_result_0 = pcall(function()
                    return v74:GetItemDetails(tonumber(v70), v71);
                end);
                if not l_status_0 then
                    if v27() then
                        v25(v26.Counter.AvatarEditorServiceErrors.FetchAssetOrBundleInfo);
                    end;
                    v2.warn("FetchAssetOrBundleInfo failure: " .. l_result_0);
                    v83();
                else
                    l_result_0 = v18.tableToCamelCaseKeys(l_result_0);
                    v67(v68, v70, v71, v81, l_result_0);
                    v82(l_result_0);
                end;
                v69.Diag:reportStats(l_FVariable_0, (tick() - v75) * 1000);
            end);
        end)(v73);
    end);
end;
