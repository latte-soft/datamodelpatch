local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v7 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleFavorite);
local v9 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local function _(v12)
    return v4.SetFavoriteBundleKey .. v12;
end;
return function(v14, v15)
    v3.isType(v14, "string", "SetBundleFavorite thunk expects assetId");
    v3.isType(v15, "boolean", "SetBundleFavorite thunk expects isFavorited");
    return v7.convertAvatarEditorServiceThunk("SetBundleFavorite", function(v16, v17)
        return l_PerformFetch_0.Single(v4.SetFavoriteBundleKey .. v14, function(v18)
            return v2.new(function(v19, v20)
                local v21 = v17:NoPromptSetFavorite(v14, Enum.AvatarItemType.Bundle, v15);
                while not v21 do
                    v17.PromptSetFavoriteCompleted:Wait();
                    v21 = v17:NoPromptSetFavorite(v14, Enum.AvatarItemType.Bundle, v15);
                end;
                if v17.PromptSetFavoriteCompleted:Wait() == Enum.AvatarPromptResult.Success then
                    v18:dispatch(v8(v14, v15));
                    v19();
                    return ;
                else
                    if v11() then
                        v9(v10.Counter.AvatarEditorServiceErrors.SetBundleFavorite);
                    end;
                    v18:dispatch(v6({
                        HttpError = Enum.HttpError.OK
                    }));
                    v20();
                    return ;
                end;
            end);
        end)(v16);
    end);
end;
