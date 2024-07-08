local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Result);
local v3 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.OmniRecommendationsMetadata);
local v4 = require(l_CorePackages_0.Cryo);
local l_Object_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Object;
local _ = require(l_CorePackages_0.Workspace.Packages.GraphQLServer);
local l_gql_0 = require(l_CorePackages_0.Packages.ApolloClient).gql;
local v8 = require(l_Modules_0.LuaApp.Constants);
local v9 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.DiscoveryGame);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v11 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local l_GetFFlagApolloClientFetchExperiences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagApolloClientFetchExperiences;
local v13 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomePartialOmniResponse);
local l_FFlagContactRecs_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagContactRecs;
local l_GetFFlagLuaAppSortSubtitlesEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppSortSubtitlesEnabled;
local v16 = {
    new = function()
        return {};
    end
};
v16.mock = function()
    local v17 = v16.new();
    v17.pageType = v8.OmniRecommendationsPageType.PAGE_TYPE_HOME;
    v17.nextPageToken = "eyJzdGFydCI6MTAsImNvdW50IjoxMCwiZW5kT2ZQYWdlIjpmYWxzZX0=";
    v17.isSessionExpired = false;
    local v18 = v9.mock();
    v17.metadata = {
        [v8.OmniRecommendationsContentType.Game] = {
            [v18.universeId] = v18
        }
    };
    v17.sorts = {
        {
            topic = "topic1", 
            topicId = "100000003", 
            recommendations = {
                {
                    contentType = v8.OmniRecommendationsContentType.Game, 
                    contentId = v18.universeId
                }
            }, 
            treatmentType = v11.Carousel, 
            numberOfRows = -1
        }
    };
    v17.recommendationsId = "3d14d9e6-cea3-4eec-bcdc-cfdc906f61cb";
    v17.omniSessionId = "d3240862-f901-419c-8780-5160e05d8473";
    return v17;
end;
v16.mockEndpointResponse = function(v19)
    local v20 = v9.mockEndpointResponse();
    return {
        contentMetadata = {
            [v8.OmniRecommendationsContentType.Game] = {
                [v20.universeId] = v20
            }
        }, 
        sorts = {
            {
                topic = v19 or "topic123", 
                topicId = 100000003, 
                recommendationList = {
                    {
                        contentType = v8.OmniRecommendationsContentType.Game, 
                        contentId = v20.universeId
                    }
                }, 
                treatmentType = v11.Carousel
            }
        }, 
        pageType = v8.OmniRecommendationsPageType.PAGE_TYPE_HOME, 
        requestId = "123avcd3-1431-35bd-24db-452abcde65abf35", 
        nextPageToken = "eyJzdGFydCI6MTAsImNvdW50IjoxMCwiZW5kT2ZQYWdlIjpmYWxzZX0=", 
        isSessionExpired = false
    };
end;
v16.fromJsonData = function(v21, v22)
    local v23 = v3.fromJsonData(v21);
    local v24 = nil;
    local v25 = nil;
    v23:match(function(v26)
        v26.pageType = v21.pageType;
        if v21.sortsRefreshInterval and v21.sortsRefreshInterval > 0 then
            v26.sortsExpirationTime = tick() + v21.sortsRefreshInterval;
        end;
        v26.nextPageToken = v21.nextPageToken;
        v26.isSessionExpired = v21.isSessionExpired;
        v26.recommendationsId = v21.requestId;
        v26.omniSessionId = v22 or "Invalid_OmniSessionId";
        v26.sorts = v4.List.map(v21.sorts, function(v27)
            return {
                topic = v27.topic, 
                topicId = if not v27.topicId then nil else tostring(v27.topicId), 
                subtitle = if not l_GetFFlagLuaAppSortSubtitlesEnabled_0() then nil else v27.subtitle, 
                retrievalStatus = if not v13() then nil else v27.retrievalStatus, 
                recommendations = if not v27.recommendationList then nil else v4.List.map(v27.recommendationList, function(v28)
                    return {
                        contentType = v28.contentType, 
                        contentId = v28.contentId, 
                        contentStringId = if not l_FFlagContactRecs_0 then nil else v28.contentStringId, 
                        contentMetadata = v28.contentMetadata
                    };
                end), 
                treatmentType = v27.treatmentType, 
                numberOfRows = not not v27.numberOfRows and v27.numberOfRows or -1, 
                topicLayoutData = v27.topicLayoutData
            };
        end);
        v26.globalLayoutData = v21.globalLayoutData or {};
        v25 = v26;
    end):matchError(function(v29)
        v24 = v29;
    end);
    if v24 ~= nil then
        return v2.error(v24);
    else
        return v2.success(v25);
    end;
end;
local v30 = l_gql_0("\tfragment FeedItem on OmniFeedItem {\n\t\ttopicId\n\t\texperiences {\n\t\t\tuniverseId\n\t\t\tname\n\t\t\tplaceId\n\t\t\tplayerCount\n\t\t\ttotalDownVotes\n\t\t\ttotalUpVotes\n\t\t\tunder9\n\t\t\tunder13\n\t\t}\n\t}\n");
v16.fromGraphqlData = function(v31, v32)
    local v33 = v31.metadata or {};
    local v34 = {};
    if l_GetFFlagApolloClientFetchExperiences_0() then
        local v35 = v33.GameJSON or {};
        local v36 = v31.sorts or {};
        for _, v38 in v36, nil, nil do
            if not (not (v38.topicId and v38.treatmentType == v11.Carousel) or not v38.recommendations) then
                local v39 = {};
                for _, v41 in v38.recommendations, nil, nil do
                    if v41.contentId then
                        local v42 = tostring(v41.contentId);
                        local v43 = v35[v42];
                        if v43 then
                            local v44 = {
                                __typename = "Experience", 
                                universeId = v42, 
                                name = v43.name, 
                                placeId = tostring(v43.rootPlaceId), 
                                playerCount = v43.playerCount, 
                                totalDownVotes = v43.totalDownVotes, 
                                totalUpVotes = v43.totalUpVotes, 
                                under9 = v43.under9 or false, 
                                under13 = v43.under13 or false
                            };
                            v34[v42] = v44;
                            table.insert(v39, v44);
                        end;
                    end;
                end;
                task.defer(function()
                    v32:writeFragment({
                        id = string.format("OmniFeedItem:{\"topicId\":\"%s\"}", v38.topicId), 
                        fragment = v30, 
                        data = {
                            topicId = v38.topicId, 
                            experiences = v39
                        }
                    });
                end);
            end;
        end;
    end;
    local v45 = nil;
    local v46 = nil;
    v3.fromJsonData({
        contentMetadata = {
            Game = if not l_GetFFlagApolloClientFetchExperiences_0() then v33.GameJSON else nil, 
            CatalogAsset = v33.CatalogAssetJSON, 
            CatalogBundle = v33.CatalogBundleJSON, 
            RecommendedFriend = v33.RecommendedFriendJSON
        }
    }):match(function(v47)
        v45 = l_Object_0.assign(table.clone(v31), {
            metadata = if not l_GetFFlagApolloClientFetchExperiences_0() then v47.metadata else l_Object_0.assign(v47.metadata, {
                Game = v34
            })
        });
    end):matchError(function(v48)
        v46 = v48;
    end);
    if v46 ~= nil then
        return v2.error(v46);
    else
        return v2.success(v45);
    end;
end;
return v16;
