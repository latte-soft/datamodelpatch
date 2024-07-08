local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.BundleFavorites);
local v2 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.AssetFavorites);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.Categories);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SearchCategories);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.MarketplaceFee);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.Sell);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortsContents);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.Topics);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.TopicsFetchTimes);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.UserAssets);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.ResellerCursor);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortAndFilters);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SponsoredItems);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.Metadata);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.ResultsList);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSearchResultsCategories);
return function(v17, v18)
    v17 = v17 or {};
    return {
        AssetFavorites = v2(v17.AssetFavorites, v18), 
        BundleFavorites = v1(v17.BundleFavorites, v18), 
        Categories = v3(v17.Categories, v18), 
        SearchCategories = if not v16() then nil else v4(v17.SearchCategories, v18), 
        Topics = v8(v17.Topics, v18), 
        TopicsFetchTimes = v9(v17.TopicsFetchTimes, v18), 
        MarketplaceFee = v5(v17.MarketplaceFee, v18), 
        Sell = v6(v17.Sell, v18), 
        SortsContents = v7(v17.SortsContents, v18), 
        ResellerCursor = v11(v17.ResellerCursor, v18), 
        UserAssets = v10(v17.UserAssets, v18), 
        SortAndFilters = v12(v17.SortAndFilters, v18), 
        SponsoredItems = v13(v17.SponsoredItems, v18), 
        Metadata = v14(v17.Metadata, v18), 
        ResultsList = v15(v17.ResultsList, v18)
    };
end;
