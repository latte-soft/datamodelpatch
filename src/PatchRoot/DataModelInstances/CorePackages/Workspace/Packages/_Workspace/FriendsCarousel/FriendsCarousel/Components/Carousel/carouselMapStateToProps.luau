local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_isSubjectTo10ftPolicies_0 = v1.isSubjectTo10ftPolicies;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local l_RODUX_KEY_0 = require(l_Parent_0.Common.Constants).RODUX_KEY;
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_Parent_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local v7 = require(script.Parent.getFriendsList);
local v8 = require(script.Parent.getRecommendationsList);
local v9 = require(script.Parent.getCarouselList);
local v10 = require(script.Parent.getCarouselFetchingStatus);
local v11 = require(l_Parent_0.Utils.showRecommendations);
local l_NetworkStatus_0 = v1.RoduxNetworking.Enum.NetworkStatus;
local l_getSessionIdByKey_0 = v1.RoduxAnalytics.Selectors.getSessionIdByKey;
local v14 = game:DefineFastFlag("FFlagFriendCarouselLocalShowRecommendationsLogic", false);
return function(v15, v16)
    local v17 = tostring(v15.LocalUserId);
    local v18 = v7(v15, l_RODUX_KEY_0, v16);
    local v19 = l_getDeepValue_0(v15, string.format("%s.Friends.countsByUserId.%s", l_RODUX_KEY_0, v17)) or 0;
    local v20 = if not if not v14 then v16.showRecommendations else v11(v19) then {} else v8(v15, l_RODUX_KEY_0, v16);
    local v21 = v9(v18, v20, not l_isSubjectTo10ftPolicies_0() and "allFriendsThenRecommendations" or "onlineFriendsThenRecommendationsThenOfflineFriends");
    local v22 = l_getDeepValue_0(v15, string.format("%s.Friends.requests.receivedCount", l_RODUX_KEY_0)) or 0;
    local v23 = v10(v15, v17, v11(v19));
    v21 = v21 or {};
    if v23 ~= l_NetworkStatus_0.Done then
        table.insert(v21, {
            isLoading = true
        });
    end;
    return {
        localUserId = v17, 
        friendCount = v19, 
        friendRequestCount = v22, 
        fetchingStatus = v23, 
        friendsAndRecList = v21, 
        recommendationCount = not not v20 and #v20 or 0, 
        recommendationSessionId = l_getSessionIdByKey_0(v15)(l_RECOMMENDATION_SESSION_ID_KEY_0)
    };
end;
