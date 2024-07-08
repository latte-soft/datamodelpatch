local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v7 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v8 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetFavorite);
local v10 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local function _(v13)
    return v5.SetFavoriteAssetKey .. v13;
end;
return function(v15, v16)
    v3.isType(v15, "string", "SetAssetFavorite thunk expects assetId");
    v3.isType(v16, "boolean", "SetAssetFavorite thunk expects isFavorited");
    return v8.convertAvatarEditorServiceThunk("SetAssetFavorite", function(v17, v18)
        return l_PerformFetch_0.Single(v5.SetFavoriteAssetKey .. v15, function(v19)
            return v2.new(function(v20, v21)
                local v22 = v18:NoPromptSetFavorite(v15, Enum.AvatarItemType.Asset, v16);
                while not v22 do
                    v18.PromptSetFavoriteCompleted:Wait();
                    v22 = v18:NoPromptSetFavorite(v15, Enum.AvatarItemType.Asset, v16);
                    v10(v11.Counter.AvatarEditorServiceErrors.NoPromptSetFavorite);
                end;
                if v18.PromptSetFavoriteCompleted:Wait() == Enum.AvatarPromptResult.Success then
                    v19:dispatch(v9(v15, v16));
                    v20();
                    return ;
                else
                    if v12() then
                        v10(v11.Counter.AvatarEditorServiceErrors.SetAssetFavorite);
                    end;
                    v19:dispatch(v7({
                        HttpError = Enum.HttpError.OK
                    }));
                    v21();
                    return ;
                end;
            end);
        end)(v17);
    end);
end;
