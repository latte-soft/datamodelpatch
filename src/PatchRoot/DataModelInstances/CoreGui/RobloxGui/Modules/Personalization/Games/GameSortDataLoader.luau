local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.ApolloClient);
local l_useQuery_0 = v3.useQuery;
local l_gql_0 = v3.gql;
local l_Object_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Object;
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v8 = require(l_Modules_0.Personalization.Games.GameSortContainer);
local _ = require(l_CorePackages_0.Workspace.Packages.GameTile);
local v10 = l_gql_0("  query OmniFeedItem($sortId: String $sortId) {\n      topicId\n      topic\n      treatmentType\n      hasMoreRows @client\n      experiences {\n        universeId\n        name\n        placeId\n        playerCount\n        totalDownVotes\n        totalUpVotes\n        under9\n        under13\n        adId\n        isSponsored\n        thumbnails {\n          url\n        }\n      }\n    }\n  }\n");
return function(v11)
    local v12 = l_useQuery_0(v10, {
        variables = {
            sortId = v11.gameSortId
        }
    });
    return v2.createElement(v11.containerComponent or v8, (l_Object_0.assign(table.clone(v11.containerProps), {
        gameSortContents = if not not v12.data and v12.data.omniFeedItem then {
            entries = v12.data.omniFeedItem.experiences, 
            hasMoreRows = v12.data.omniFeedItem.hasMoreRows
        } else nil, 
        sort = if not not v12.data and v12.data.omniFeedItem then {
            displayName = v12.data.omniFeedItem.topic, 
            topicId = v12.data.omniFeedItem.topicId, 
            treatmentType = v12.data.omniFeedItem.treatmentType
        } else nil
    })));
end;
