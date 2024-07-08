local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Constants);
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local v4 = require(l_Modules_0.LuaApp.Thunks.ApiPreloadContentProviderThumbnail);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v6 = require(l_Modules_0.LuaApp.Util.Omni.OmniUtils);
local v7 = require(l_Modules_0.LuaApp.PromiseUtilities);
local l_GetFFlagApolloClientFetchThumbnails_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagApolloClientFetchThumbnails;
return function(v9, v10)
    return function(v11)
        local v12 = {};
        for v13, v14 in pairs(v10) do
            local v15 = {};
            for v16, _ in pairs(v14) do
                table.insert(v15, v16);
            end;
            if v13 == v2.OmniRecommendationsContentType.Game then
                if not l_GetFFlagApolloClientFetchThumbnails_0() then
                    table.insert(v12, v11:dispatch(l_ApiFetchGameIcons_0(v9, v15)));
                end;
            elseif not (v13 ~= v2.OmniRecommendationsContentType.CatalogAsset) or v13 == v2.OmniRecommendationsContentType.CatalogBundle then
                table.insert(v12, v11:dispatch(v4(v15, v5.GetRbxThumbType(v6.contentTypeToCatalogType(v13)), v2.HomeItemCardThumbnailSize)));
            end;
        end;
        return v7.Batch(v12);
    end;
end;
