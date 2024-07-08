local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Constants);
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.Common.Models.ModelsUtils);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v8 = {
    storeForContentType = function(v5, v6)
        if v6 == v1.OmniRecommendationsContentType.Game then
            return v5.Games;
        elseif v6 == v1.OmniRecommendationsContentType.GameCoPlay then
            return v5.GameCoPlay;
        elseif v6 == v1.OmniRecommendationsContentType.CatalogAsset then
            return v5.CatalogAssets;
        elseif v6 == v1.OmniRecommendationsContentType.CatalogBundle then
            return v5.CatalogBundles;
        else
            return nil;
        end;
    end, 
    createRestrictionInfo = function(v7)
        return v3.CreateRestrictionInfo(v7);
    end
};
local v9 = {
    [v1.OmniRecommendationsContentType.CatalogAsset] = v2.ItemType.Asset, 
    [v1.OmniRecommendationsContentType.CatalogBundle] = v2.ItemType.Bundle
};
v8.contentTypeToCatalogType = function(v10)
    return v9[v10];
end;
v8.getSortDataForTopicId = function(v11, v12)
    for v13 = 1, #v12 do
        if v12[v13].topicId == v11 then
            return v12[v13];
        end;
    end;
    return nil;
end;
return v8;
