local l_CorePackages_0 = game:GetService("CorePackages");
local l_gql_0 = require(l_CorePackages_0.Packages.ApolloClient).gql;
local l_reactiveVars_0 = require(l_CorePackages_0.Workspace.Packages.ApolloLocalState).reactiveVars;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_omniSessionId_0 = l_reactiveVars_0.omniSessionId;
local v5 = require(script.Parent.parseGameIconsFromGraphqlData);
local _ = require(l_CorePackages_0.Workspace.Packages.GraphQLServer);
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.Personalization.DataStoreTypes);
local v8 = l_gql_0("  query OmniFeedItemMetadata($sessionId: String String [OmniFeedRecommendationDescriptor]) {\n    refreshOmniFeedItem(sessionId: $sessionId, topicId: $topicId, recommendations: $recommendations) {\n      metadata {\n        GameJSON\n      }\n      sort {\n        topicId\n        experiences {\n          universeId\n          name\n          placeId\n          playerCount\n          totalDownVotes\n          totalUpVotes\n          under9\n          under13\n          thumbnails {\n            url\n          }\n        }\n      }\n    }\n  }\n");
return function(v9, v10, v11)
    return v9:query({
        query = v8, 
        variables = {
            recommendations = v3.List.map(v11, function(v12)
                return {
                    contentType = v12.contentType, 
                    contentId = v12.contentId
                };
            end), 
            topicId = tostring(v10), 
            sessionId = l_omniSessionId_0()
        }
    }):andThen(function(v13)
        local v14 = if not not v13.data and v13.data.refreshOmniFeedItem then v13.data.refreshOmniFeedItem else nil;
        local v15 = if not not v14 and v14.metadata then v14.metadata else {};
        return {
            data = {
                contentMetadata = {
                    Game = v15.GameJSON, 
                    CatalogAsset = v15.CatalogAssetJSON, 
                    CatalogBundle = v15.CatalogBundleJSON, 
                    RecommendedFriend = v15.RecommendedFriendJSON
                }, 
                icons = v5(if not not v14.sort and v14.sort.experiences then v14.sort.experiences else {})
            }
        };
    end);
end;
