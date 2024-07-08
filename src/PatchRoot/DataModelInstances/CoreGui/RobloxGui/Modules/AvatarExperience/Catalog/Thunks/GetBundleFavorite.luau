local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Logging);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v8 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v9 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleFavorite);
local function _(v13)
    return v6.GetFavoriteBundleKey .. v13;
end;
return function(v15)
    v3.isType(v15, "string", "GetBundleFavorite thunk expects bundleId");
    return v8.convertAvatarEditorServiceThunk("GetBundleFavorite", function(v16, v17)
        return l_PerformFetch_0.Single(v6.GetFavoriteBundleKey .. v15, function(v18)
            return v2.new(function(v19, v20)
                local l_status_0, l_result_0 = pcall(function()
                    return v17:GetFavorite(v15, Enum.AvatarItemType.Bundle);
                end);
                if not l_status_0 then
                    if v11() then
                        v9(v10.Counter.AvatarEditorServiceErrors.GetBundleFavorite);
                    end;
                    v4.warn("GetBundleFavorite failure: " .. tostring(l_result_0));
                    v20();
                    return ;
                else
                    v18:dispatch(v12(v15, l_result_0));
                    v19();
                    return ;
                end;
            end);
        end)(v16);
    end);
end;
