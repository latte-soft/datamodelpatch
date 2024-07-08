local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.AddFriends.dependencies);
local l_llama_0 = v2.llama;
local l_RoduxFriends_0 = v2.RoduxFriends;
local l_RoduxAnalytics_0 = v2.RoduxAnalytics;
local l_FriendsNetworking_0 = v2.FriendsNetworking;
local l_GamesNetworking_0 = v2.GamesNetworking;
local l_Promise_0 = v2.Promise;
local l_NetworkingAccountInformation_0 = v2.NetworkingAccountInformation;
local l_NetworkingUserSettings_0 = v2.NetworkingUserSettings;
local v11 = require(l_script_FirstAncestor_0.installReducer.Actions.ContactImporterWarningSeen);
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local l_SocialCommon_0 = v2.SocialCommon;
local l_RecommendationSourceEnum_0 = l_SocialCommon_0.Enums.RecommendationSourceEnum;
local l_ContextualInfoTypes_0 = l_SocialCommon_0.Enums.ContextualInfoTypes;
local v16 = require(l_script_FirstAncestor_0.Flags.getFFlagShowContactImporterTooltipOnce);
local l_FFlagContactRecs_0 = require(l_Parent_0.SharedFlags).FFlagContactRecs;
local function v24(v18)
    local v19 = {};
    local v20 = {};
    for _, v22 in pairs(v18) do
        table.insert(v19, v22.id);
        local l_sourceUniverseId_0 = v22.friendRequest.sourceUniverseId;
        if l_sourceUniverseId_0 ~= nil and l_sourceUniverseId_0 ~= 0 then
            table.insert(v20, l_sourceUniverseId_0);
        end;
    end;
    return {
        userIds = v19, 
        universeIds = v20
    };
end;
return function(v25)
    return {
        acceptFriendRequest = function(v26)
            return v25(l_FriendsNetworking_0.AcceptFriendRequestFromUserId.API(v26));
        end, 
        declineFriendRequest = function(v27)
            return v25(l_FriendsNetworking_0.DeclineFriendRequestFromUserId.API(v27));
        end, 
        ignoreAllFriendsRequests = function(v28)
            return v25(l_FriendsNetworking_0.DeclineAllFriendRequests.API(v28));
        end, 
        requestFriendship = function(v29)
            if l_FFlagContactRecs_0 and v29.contextType == l_ContextualInfoTypes_0.Contacts then
                return v25(l_FriendsNetworking_0.RequestFriendshipFromContactId.API(v29));
            else
                return v25(l_FriendsNetworking_0.RequestFriendshipFromUserId.API(v29));
            end;
        end, 
        getFriendRequestsCount = function(v30)
            return v25(l_FriendsNetworking_0.GetFriendRequestsCount.API(v30));
        end, 
        getPhoneInformation = function()
            return v25(l_NetworkingAccountInformation_0.GetPhoneInformation.API({}));
        end, 
        getFriendRequests = function(v31)
            return l_Promise_0.new(function(v32, v33)
                v31 = l_llama_0.Dictionary.join(v31 or {}, {
                    currentUserId = v31.localUserId
                });
                v25(l_FriendsNetworking_0.GetFriendRequests.API(v31)):andThen(function(v34)
                    local v35 = v24(v34.responseBody.data);
                    local v36 = {};
                    if not l_llama_0.isEmpty(v35.userIds) then
                        table.insert(v36, v25(l_FriendsNetworking_0.GetFollowingExists.API({
                            targetUserIds = v35.userIds
                        })));
                    end;
                    if not l_llama_0.isEmpty(v35.universeIds) then
                        table.insert(v36, v25(l_GamesNetworking_0.GetExperiencesDetails.API(v35.universeIds)));
                    end;
                    l_Promise_0.all(v36):andThen(function()
                        v32(v34);
                    end):catch(v33);
                end):catch(v33);
            end);
        end, 
        getFriendRecommendations = function(v37)
            return v25(l_FriendsNetworking_0.GetFriendRecommendationsFromUserId.API({
                targetUserId = v37.localUserId, 
                source = l_RecommendationSourceEnum_0.AddFriendsPage
            })):andThen(function(v38)
                v25(l_RoduxFriends_0.Actions.RecommendationSourceCreated({
                    source = l_RecommendationSourceEnum_0.AddFriendsPage, 
                    recommendationIds = l_llama_0.List.map(v38.responseBody.data, function(v39)
                        if l_FFlagContactRecs_0 and v39.contextType == l_ContextualInfoTypes_0.Contacts then
                            return v39.contactId;
                        else
                            return v39.id;
                        end;
                    end)
                }));
                v25(l_RoduxAnalytics_0.Actions.SessionIdUpdated({
                    sessionKey = l_RECOMMENDATION_SESSION_ID_KEY_0, 
                    sessionId = v38.responseBody.recommendationRequestId
                }));
                return l_Promise_0.resolve(v38);
            end);
        end, 
        contactImporterWarningSeen = not v16() and function()
            v25(v11());
        end or nil, 
        getUserSettingsMetadata = function()
            return v25(l_NetworkingUserSettings_0.GetUserSettingsMetadata.API());
        end
    };
end;
