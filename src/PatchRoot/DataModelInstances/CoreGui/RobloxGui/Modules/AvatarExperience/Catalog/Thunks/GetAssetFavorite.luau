local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Promise);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_CorePackages_0.Logging);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v8 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetFavorite);
local v10 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local function _(v13)
    return v6.GetFavoriteAssetKey .. v13;
end;
return function(v15)
    v4.isType(v15, "string", "GetAssetFavorite thunk expects assetId");
    return v8.convertAvatarEditorServiceThunk("GetAssetFavorite", function(v16, v17)
        return l_PerformFetch_0.Single(v6.GetFavoriteAssetKey .. v15, function(v18)
            return v2.new(function(v19, v20)
                local l_status_0, l_result_0 = pcall(function()
                    return v17:GetFavorite(v15, Enum.AvatarItemType.Asset);
                end);
                if not l_status_0 then
                    if v12() then
                        v10(v11.Counter.AvatarEditorServiceErrors.GetAssetFavorite);
                    end;
                    v5.warn("GetAssetFavorite failure: " .. tostring(l_result_0));
                    v20();
                    return ;
                else
                    v18:dispatch(v9(v15, l_result_0));
                    v19();
                    return ;
                end;
            end);
        end)(v16);
    end);
end;
