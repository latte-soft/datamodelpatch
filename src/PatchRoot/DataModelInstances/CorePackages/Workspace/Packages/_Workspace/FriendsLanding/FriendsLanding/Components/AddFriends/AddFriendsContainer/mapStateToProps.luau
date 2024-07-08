local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v2 = require(l_script_FirstAncestor_0.AddFriends.dependencies);
local l_llama_0 = v2.llama;
local l_RoduxPresence_0 = v2.RoduxPresence;
local l_getDeepValue_0 = v2.SocialLibraries.Dictionary.getDeepValue;
local v6 = require(l_script_FirstAncestor_0.Utils.contactImporterTooltip);
local v7 = require(script.Parent.getFriendRecommendationsFromState);
local l_getSessionIdByKey_0 = v2.RoduxAnalytics.Selectors.getSessionIdByKey;
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagShowContactImporterTooltipOnce);
local v11 = require(script.Parent.sortFriendRequests);
local v12 = require(script.Parent.sortFriendRequestsByOrder);
local function v19(v13, v14)
    local v15 = l_getDeepValue_0(v13, "FriendsLanding.Friends.requests.byUserId");
    if v15 then
        local v17 = l_llama_0.List.map(l_llama_0.Dictionary.keys(v15), function(v16)
            return l_llama_0.Dictionary.join(l_getDeepValue_0(v13, string.format("FriendsLanding.Users.byUserId.%s", v16)), l_RoduxPresence_0.Selectors.getUserPresenceByUserId(v13, v16), {
                sentAt = l_getDeepValue_0(v13, string.format("FriendsLanding.Friends.requests.sentAt.%s", v16))
            }, {
                mutualFriends = l_getDeepValue_0(v13, string.format("FriendsLanding.Friends.requests.mutualFriends.%s", v16))
            }, {
                contactName = l_getDeepValue_0(v13, string.format("FriendsLanding.Friends.contactNamesByUserId.%s", v16))
            }, {
                order = l_getDeepValue_0(v13, string.format("FriendsLanding.Friends.requests.order.requestsById.%s", v16))
            });
        end);
        local v18 = true;
        if v14 ~= "largerWindow" then
            v18 = v14 == "sortByOrder";
        end;
        if not v18 then
            return v11(v17);
        else
            return v12(v17);
        end;
    else
        return {};
    end;
end;
local function _(v20)
    return l_getSessionIdByKey_0(v20)(l_RECOMMENDATION_SESSION_ID_KEY_0);
end;
return function(v22, v23)
    local v24 = nil;
    local v25 = nil;
    local v26 = l_getDeepValue_0(v22, "FriendsLanding.ShowContactImporterParams") or {};
    v24 = v26.shouldShowContactImporterFeature;
    v25 = v26.shouldShowContactImporterUpsellModal;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    v28 = v26.isPhoneVerified;
    v29 = v26.hasOSPermissions;
    v27 = v26.canUploadContacts;
    v30 = v26.isDiscoverabilityUnset;
    local v31 = l_getDeepValue_0(v22, "FriendsLanding.ContactImporterWarning.contactImporterFriendRequests") or {};
    local v32 = l_getDeepValue_0(v22, "FriendsLanding.ContactImporterWarning.seenContactImporterFriendRequest") or false;
    local v33 = not l_llama_0.isEmpty(v31);
    if v10() then
        v32 = v6.getKey(l_AppStorageService_0);
    end;
    return {
        screenSize = v22.ScreenSize, 
        localUserId = v22.LocalUserId, 
        globalGuiInset = v22.GlobalGuiInset, 
        friendRecommendations = v7(v22) or {}, 
        friendRecommendationsSessionId = l_getSessionIdByKey_0(v22)(l_RECOMMENDATION_SESSION_ID_KEY_0), 
        friendRequests = v19(v22, v23.friendRequestScoringVariant), 
        receivedCount = l_getDeepValue_0(v22, "FriendsLanding.Friends.requests.receivedCount") or 0, 
        nextPageCursor = l_getDeepValue_0(v22, "FriendsLanding.Friends.requests.nextPageCursor"), 
        amIFollowingUser = function(v34)
            local v35 = l_getDeepValue_0(v22, "FriendsLanding.IsUserFollowing") or {};
            return not not v35[v34.id] and (v35[v34.id].isFollowing or false);
        end, 
        isUserFollowingMe = function(v36)
            local v37 = l_getDeepValue_0(v22, "FriendsLanding.IsUserFollowing") or {};
            return not not v37[v36.id] and (v37[v36.id].isFollowed or false);
        end, 
        getFriendshipRequestSentFromExperience = function(v38)
            local v39 = l_getDeepValue_0(v22, "FriendsLanding.Friends.requests.sourceUniverseIds")[v38.id];
            if v39 ~= nil and v39 ~= 0 then
                return (l_getDeepValue_0(v22, string.format("FriendsLanding.Games.byGameId.%s", (tostring(v39)))) or {}).name;
            else
                return nil;
            end;
        end, 
        shouldShowContactImporterFeature = v24, 
        shouldShowContactImporterUpsellModal = v25, 
        isPhoneVerified = v28, 
        hasOSPermissions = v29, 
        canUploadContacts = v27, 
        isDiscoverabilityUnset = v30, 
        showTooltip = v33 and not v32
    };
end;
