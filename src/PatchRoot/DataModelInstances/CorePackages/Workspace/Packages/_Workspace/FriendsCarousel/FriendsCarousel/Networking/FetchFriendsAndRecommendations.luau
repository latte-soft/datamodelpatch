local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_NetworkingFriends_0 = v2.NetworkingFriends;
local l_NetworkingAliases_0 = v2.NetworkingAliases;
local l_RoduxFriends_0 = v2.RoduxFriends;
local l_RoduxAnalytics_0 = v2.RoduxAnalytics;
local l_Promise_0 = v2.Promise;
local l_Dash_0 = v2.Dash;
local v9 = require(l_Parent_0.Utils.showRecommendations);
local v10 = require(l_Parent_0.Analytics);
local l_EventNames_0 = v10.EventNames;
local l_setupFireEvent_0 = v10.setupFireEvent;
local l_Analytics_0 = require(l_Parent_0.Analytics).Analytics;
local v14 = require(l_Parent_0.Analytics.FetchNames);
local l_RetrievalStatus_0 = require(l_Parent_1.UIBlox).App.Loading.Enum.RetrievalStatus;
local l_AnalyticsService_0 = v2.AnalyticsService;
local v17 = require(l_Parent_0.Common.UserSorts);
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_Parent_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local l_SocialCommon_0 = v2.SocialCommon;
local l_RecommendationSourceEnum_0 = l_SocialCommon_0.Enums.RecommendationSourceEnum;
local l_ContextualInfoTypes_0 = l_SocialCommon_0.Enums.ContextualInfoTypes;
local l_Timers_0 = require(l_Parent_1.SocialLuaAnalytics).Analytics.Timing.Timers;
local v23 = v2.logger:new("FriendsCarousel/" .. script.Name);
local l_FFlagContactRecs_0 = require(l_Parent_1.SharedFlags).FFlagContactRecs;
local v25 = require(l_Parent_0.Flags.FFlagFriendsCarouselOldFriendEndpointLoadingTime);
local l_isSubjectToDesktopPolicies_0 = v2.isSubjectToDesktopPolicies;
local function _(v27)
    return v9(v27) and not l_isSubjectToDesktopPolicies_0();
end;
local v29 = 0;
return function(v30)
    return function(v31)
        local v32 = tostring(v31:getState().LocalUserId);
        local v33 = if not v25 then l_setupFireEvent_0({
            infoForAllEvents = {
                uid = v32
            }, 
            analytics = if not not v30 and v30.analytics then v30.analytics else l_AnalyticsService_0
        }) else l_Analytics_0({
            infoForAllEvents = {
                uid = v32
            }
        }).fireAnalyticsEvent;
        local v34 = if not v25 then nil else l_Timers_0();
        local v35 = if not v25 then nil else v34.start();
        return v31:dispatch(l_NetworkingFriends_0.GetFriendsFromUserId.API(v32, {
            userSort = v17.StatusFrequents
        })):andThen(function(v36)
            local l_data_0 = v36.responseBody.data;
            local v38 = not not l_data_0 and #l_data_0 or 0;
            v29 = if not not v30 and v30.refresh then v29 + 1 else v29;
            local v40 = if not l_data_0 then {} else l_Dash_0.map(l_data_0, function(v39)
                return v39.id;
            end);
            if v25 then
                v33(l_EventNames_0.FriendsEndpointLoadingTime, {
                    status = l_RetrievalStatus_0.Done.rawValue(), 
                    loadingTime = v34.stop(v35), 
                    fetch = v14.OldAllFriends
                });
            end;
            v31:dispatch(l_NetworkingAliases_0.GetTagsFromUserIds.API(v40)):andThen(function()
                return l_Promise_0.resolve();
            end):catch(function(v41)
                v23:info((("GetTagsFromUserIds failed: %*"):format(v41)));
            end);
            if not (v9(v38) and not l_isSubjectToDesktopPolicies_0()) then
                if v33 then
                    v33(l_EventNames_0.CarouselLoadedWithUsers, {
                        friendCount = v38, 
                        recommendationCount = 0, 
                        recommendationLimit = true, 
                        refreshCount = v29, 
                        fetchedRecommendations = false
                    });
                end;
            else
                v31:dispatch(l_NetworkingFriends_0.GetFriendRecommendationsFromUserId.API({
                    targetUserId = v32
                })):andThen(function(v42)
                    v31:dispatch(l_RoduxFriends_0.Actions.RecommendationSourceCreated({
                        source = l_RecommendationSourceEnum_0.HomepageFriendsCarousel, 
                        recommendationIds = l_Dash_0.map(v42.responseBody.data, function(v43)
                            if l_FFlagContactRecs_0 and v43.contextType == l_ContextualInfoTypes_0.Contacts then
                                return v43.contactId;
                            else
                                return v43.id;
                            end;
                        end)
                    }));
                    v31:dispatch(l_RoduxAnalytics_0.Actions.SessionIdUpdated({
                        sessionKey = l_RECOMMENDATION_SESSION_ID_KEY_0, 
                        sessionId = v42.responseBody.recommendationRequestId
                    }));
                    return l_Promise_0.resolve(v42):andThen(function(v44)
                        if v33 then
                            local l_data_1 = v44.responseBody.data;
                            v33(l_EventNames_0.CarouselLoadedWithUsers, {
                                friendCount = v38, 
                                recommendationCount = not not l_data_1 and #l_data_1 or 0, 
                                recommendationLimit = true, 
                                refreshCount = v29, 
                                fetchedRecommendations = true, 
                                recommendationSessionId = v44.responseBody.recommendationRequestId
                            });
                        end;
                    end);
                end):catch(function(v46)
                    v23:info((("GetFriendRecommendationsFromUserId failed: %*"):format(v46)));
                end);
            end;
            return l_Promise_0.resolve(l_data_0);
        end);
    end;
end;
