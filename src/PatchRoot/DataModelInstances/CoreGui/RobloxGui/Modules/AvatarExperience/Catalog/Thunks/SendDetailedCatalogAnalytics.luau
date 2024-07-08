local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v4 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v6 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v7 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
return function(v8, v9, v10, v11, v12, v13, v14)
    return function(v15)
        local v16 = v15:getState();
        local l_detail_0 = v16.AvatarExperience.AvatarScene.AvatarRoute.opaque.params.detail;
        local v18 = nil;
        local v19 = nil;
        local v20 = nil;
        local v21 = nil;
        if v8 ~= v3.AnalyticsContext.ItemDetailsRecommendedItem then
            v20 = v16.Search.SearchesInCatalog[l_detail_0];
            if v8 == v3.AnalyticsContext.CatalogSearch then
                v5.isNotNil(v20, "searchInCatalog");
            else
                v18 = v16.AvatarExperience.Catalog.Categories.category;
                v19 = v16.AvatarExperience.Catalog.Categories.subcategory;
            end;
            v21 = if not v7 then v2.DEPRECATED_GetItemSubType(v11, (v4(v16.AvatarExperience.Common, v10, v11))) else v6(v16.AvatarExperience, v10, v11).itemSubType;
        end;
        v9(v8, math.ceil(v12 / v13), v18, v19, nil, {
            keyword = v20 and v20.keyword
        }, v12, v10, v11, v21, v14, v16.AvatarExperience.Common.Widgets.WidgetInfo.RequestId);
    end;
end;
