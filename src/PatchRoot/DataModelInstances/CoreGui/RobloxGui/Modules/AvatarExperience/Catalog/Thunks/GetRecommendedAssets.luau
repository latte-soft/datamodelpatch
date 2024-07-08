local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_CorePackages_0.Promise);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetRecommendedAssetsAction);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v10 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v11 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v12 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v13 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local function _(v15)
    return v8.RecommendedItemsForAssetsKey .. tostring(v15);
end;
return function(v17, v18, v19, v20)
    v5.isType(v17, "string", "GetRecommendedAssets thunk expects assetId to be a string");
    v5.isType(v18, "string", "GetRecommendedAssets thunk expects assetTypeId to be a string");
    v5.isType(v19, "number", "GetRecommendedAssets thunk expects numItems to be a number");
    v5.isType(v20, "boolean", "GetRecommendedAssets thunk expects details to be a boolean");
    return v11.convertAvatarEditorServiceThunk("GetRecommendedAssets", function(v21, v22)
        return l_PerformFetch_0.Single(v8.RecommendedItemsForAssetsKey .. tostring(v17), function(v23)
            local v24 = v23:getState().AvatarExperience.Common.AssetInfos[v17];
            if not (v24 ~= nil) or not v24.receivedRecommendedData then
                return v3.new(function(v25, v26)
                    local l_status_0, l_result_0 = pcall(function()
                        return v22:GetRecommendedAssets(v10.AssetTypeIdStringToEnumValue(v18), v17, v19, v20);
                    end);
                    if not l_status_0 then
                        if v14() then
                            v12(v13.Counter.AvatarEditorServiceErrors.GetRecommendedAssets);
                        end;
                        v2.warn("GetRecommendedAssets failed: " .. l_result_0);
                        v26({
                            HttpError = Enum.HttpError.OK
                        });
                        return ;
                    else
                        local v29 = v4.List.getRange(v10.tableToCamelCaseKeys(l_result_0), 1, v9.NumRecommendedItems);
                        v23:dispatch(v7(v17, v18, v29));
                        v25(v29);
                        return ;
                    end;
                end);
            else
                return v3.resolve();
            end;
        end)(v21);
    end);
end;
