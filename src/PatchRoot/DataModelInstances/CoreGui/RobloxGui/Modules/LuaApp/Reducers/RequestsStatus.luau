local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Reducers.Games.GameSortTokenFetchingStatus);
local v2 = require(l_Modules_0.LuaApp.Reducers.Games.GameSortsStatus);
local v3 = require(l_Modules_0.LuaApp.Reducers.SearchesInGamesStatus);
local v4 = require(l_Modules_0.LuaApp.Reducers.OmniRecommendationsRetrievalStatus);
local v5 = require(l_Modules_0.LuaApp.Reducers.OmniRecommendationsMetadataRetrievalStatus);
return function(v6, v7)
    v6 = v6 or {};
    return {
        GameSortTokenFetchingStatus = v1(v6.GameSortTokenFetchingStatus, v7), 
        GameSortsStatus = v2(v6.GameSortsStatus, v7), 
        SearchesInGamesStatus = v3(v6.SearchesInGamesStatus, v7), 
        OmniRecommendationsRetrievalStatus = v4(v6.OmniRecommendationsRetrievalStatus, v7), 
        OmniRecommendationsMetadataRetrievalStatus = v5(v6.OmniRecommendationsMetadataRetrievalStatus, v7)
    };
end;
