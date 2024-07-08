local l_Array_0 = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill).Array;
local v1 = {};
local v2 = require(script.Parent.Parent.Parent.connectors.OmniFeed.OmniFeedConnector);
local l_findOmniFeedBySessionId_0 = v2.findOmniFeedBySessionId;
local l_fetchMoreOmniRecommendationMetadata_0 = v2.fetchMoreOmniRecommendationMetadata;
local _ = require(script.Parent.Parent.Parent.generatedTypes);
v1.default = {
    OmniFeedItem = {
        experiences = function(v6)
            if not (not v6.metadata or not v6.metadata.Game) and v6.recommendations then
                local l_Game_0 = v6.metadata.Game;
                local v8 = {};
                for _, v10 in v6.recommendations, nil, nil do
                    if v10.contentId then
                        local v11 = l_Game_0[tostring(v10.contentId)];
                        local l_contentMetadata_0 = v10.contentMetadata;
                        local v13 = if not not l_contentMetadata_0 and l_contentMetadata_0.EncryptedAdTrackingData then l_contentMetadata_0.EncryptedAdTrackingData else nil;
                        if not (not v11 or not v11.universeId) then
                            local v14 = {
                                placeId = if not v11.rootPlaceId then nil else tostring(v11.rootPlaceId), 
                                name = v11.name, 
                                universeId = tostring(v11.universeId), 
                                totalUpVotes = v11.totalUpVotes, 
                                totalDownVotes = v11.totalDownVotes, 
                                playerCount = v11.playerCount, 
                                under9 = not not v11.under9 and v11.under9, 
                                under13 = not not v11.under13 and v11.under13, 
                                adId = v13 or ""
                            };
                            local v15 = false;
                            if v13 ~= nil then
                                v15 = v13 ~= "";
                            end;
                            v14.isSponsored = v15;
                            table.insert(v8, v14);
                        end;
                    end;
                end;
                return v8;
            else
                return nil;
            end;
        end
    }, 
    OmniFeedMetadata = {
        GameJSON = function(v16)
            return v16.Game;
        end, 
        CatalogAssetJSON = function(v17)
            return v17.CatalogAsset;
        end, 
        CatalogBundleJSON = function(v18)
            return v18.CatalogBundle;
        end, 
        RecommendedFriendJSON = function(v19)
            return v19.RecommendedFriend;
        end
    }, 
    OmniFeed = {
        metadata = function(v20)
            return v20.contentMetadata;
        end, 
        sortsExpirationTime = function(v21)
            if v21.sortsRefreshInterval then
                return math.floor((tick())) + v21.sortsRefreshInterval;
            else
                return nil;
            end;
        end, 
        recommendationsId = function(v22)
            return v22.requestId;
        end, 
        globalLayoutData = function(v23)
            return v23.globalLayoutData;
        end, 
        sorts = function(v24)
            if v24.sorts then
                return (l_Array_0.map(v24.sorts, function(v25)
                    return {
                        topic = v25.topic, 
                        topicId = v25.topicId, 
                        treatmentType = v25.treatmentType, 
                        recommendations = v25.recommendationList, 
                        metadata = v24.contentMetadata
                    };
                end));
            else
                return nil;
            end;
        end
    }, 
    OmniFeedItemWithMetadata = {
        metadata = function(v26)
            return v26.contentMetadata;
        end, 
        sort = function(v27)
            return {
                topicId = v27.topicId, 
                metadata = v27.contentMetadata, 
                recommendations = v27.recommendations
            };
        end
    }, 
    Query = {
        omniFeed = function(_, v29, v30)
            return l_findOmniFeedBySessionId_0(v29, v30.fetchImpl);
        end, 
        refreshOmniFeedItem = function(_, v32, v33)
            return l_fetchMoreOmniRecommendationMetadata_0(v32, v33.fetchImpl);
        end
    }
};
return v1;
