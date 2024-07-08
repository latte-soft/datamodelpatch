local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local v3 = require(l_Parent_0.Common.TextKeys);
local l_FriendshipOriginSourceType_0 = v2.NetworkingFriendsEnums.FriendshipOriginSourceType;
local v5 = require(l_Parent_1.SocialCommon);
local l_Images_0 = v2.UIBlox.App.ImageSet.Images;
local l_React_0 = v2.React;
local l_useDispatch_0 = v2.Hooks.useDispatch;
local l_useSelector_0 = v2.Hooks.useSelector;
local l_NetworkingFriends_0 = v2.NetworkingFriends;
local l_NetworkStatus_0 = v2.RoduxNetworking.Enum.NetworkStatus;
local l_RoduxFriends_0 = v2.RoduxFriends;
local l_getDeepValue_0 = v2.SocialLibraries.Dictionary.getDeepValue;
local l_EventNames_0 = require(l_Parent_0.Analytics).EventNames;
local l_ContextualInfoTypes_0 = v5.Enums.ContextualInfoTypes;
local v16 = require(l_Parent_0.Flags.getFFlagPYMKDisableButtonsOnFetch);
local l_FFlagContactRecs_0 = require(l_Parent_1.SharedFlags).FFlagContactRecs;
local l_FFlagFixContactRecsFriendRequestLogging_0 = require(l_Parent_1.SharedFlags).FFlagFixContactRecsFriendRequestLogging;
local function _(v19, v20, v21)
    return v20.getStatus(v19, v21) == l_NetworkStatus_0.Fetching;
end;
return function(v23)
    return function()
        local v24 = tostring(v23.userId);
        local v25 = l_useDispatch_0();
        local v27 = l_useSelector_0(function(v26)
            return (tostring(v26.LocalUserId));
        end);
        local v29 = l_useSelector_0(function(v28)
            return l_RoduxFriends_0.Selectors.selectFriendshipStatusesByUserIds(v28)({
                v24
            })[v24] or nil;
        end);
        local v31 = l_useSelector_0(function(v30)
            return l_RoduxFriends_0.Selectors.selectRecommendationsForUserId(v30)(v27)[v24] or {};
        end);
        local v33 = l_useSelector_0(function(v32)
            return l_getDeepValue_0(v32, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", v24)) or false;
        end);
        local v35 = if not v16() then nil else l_useSelector_0(function(v34)
            return {
                RequestFriendshipFromUserId = l_NetworkingFriends_0.RequestFriendshipFromUserId.getStatus(v34, v24) == l_NetworkStatus_0.Fetching, 
                AcceptFriendRequestFromUserId = l_NetworkingFriends_0.AcceptFriendRequestFromUserId.getStatus(v34, v24) == l_NetworkStatus_0.Fetching
            };
        end);
        return l_React_0.useMemo(function()
            if v29 == Enum.FriendStatus.FriendRequestSent then
                return {
                    {
                        icon = l_Images_0["icons/actions/friends/friendpending"], 
                        isSecondary = true, 
                        isDisabled = true
                    }
                };
            elseif not v33 then
                if not v29 or v29 == Enum.FriendStatus.NotFriend then
                    return {
                        {
                            icon = l_Images_0["icons/actions/friends/friendAdd"], 
                            isSecondary = false, 
                            isDisabled = not not v16() and if v35 then v35.RequestFriendshipFromUserId else false, 
                            onActivated = function()
                                v23.fireAnalyticsEvent(l_EventNames_0.RequestFriendship, {
                                    recommendationContextType = v31.contextType, 
                                    requestedId = v24, 
                                    contactId = if not l_FFlagFixContactRecsFriendRequestLogging_0 then nil else v23.contactId, 
                                    recommendationRank = v31.rank, 
                                    absolutePosition = v23.absolutePosition
                                });
                                v25(if not not l_FFlagContactRecs_0 and v23.contactId then l_NetworkingFriends_0.RequestFriendshipFromContactId.API({
                                    currentUserId = v27, 
                                    targetUserId = v24, 
                                    contactId = v23.contactId, 
                                    contextType = l_ContextualInfoTypes_0.Contacts, 
                                    friendshipOriginSourceType = l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue()
                                }) else l_NetworkingFriends_0.RequestFriendshipFromUserId.API({
                                    currentUserId = v27, 
                                    targetUserId = v24, 
                                    friendshipOriginSourceType = l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue()
                                })):andThen(function()
                                    v23.showToast(v3.FriendRequestSentToast);
                                end):catch(function()
                                    v23.showToast(v3.SomethingIsWrongToast);
                                end);
                            end
                        }
                    };
                else
                    return {};
                end;
            else
                return {
                    {
                        icon = l_Images_0["icons/actions/friends/friendAdd"], 
                        isSecondary = false, 
                        isDisabled = not not v16() and if v35 then v35.AcceptFriendRequestFromUserId else false, 
                        onActivated = function()
                            v23.fireAnalyticsEvent(l_EventNames_0.AcceptFriendship, {
                                recommendationContextType = v31.contextType, 
                                requestedId = v24, 
                                recommendationRank = v31.rank, 
                                absolutePosition = v23.absolutePosition
                            });
                            v25(l_NetworkingFriends_0.AcceptFriendRequestFromUserId.API({
                                currentUserId = v27, 
                                targetUserId = v24
                            })):andThen(function()
                                v23.showToast(v3.FriendAddedToast);
                            end):catch(function()
                                v23.showToast(v3.SomethingIsWrongToast);
                            end);
                        end
                    }
                };
            end;
        end, {
            v29, 
            v24
        });
    end;
end;
