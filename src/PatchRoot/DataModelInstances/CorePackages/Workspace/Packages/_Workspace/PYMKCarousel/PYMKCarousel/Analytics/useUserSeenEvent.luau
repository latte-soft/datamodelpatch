local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Common.Constants);
local v2 = require(l_Parent_0.dependencies);
local l_llama_0 = v2.llama;
local l_React_0 = v2.React;
local l_useSelector_0 = v2.Hooks.useSelector;
local l_getDeepValue_0 = v2.SocialLibraries.Dictionary.getDeepValue;
local v7 = require(script.Parent.EventNames);
local v8 = require(script.Parent.getFriendStatus);
local l_RecommendationContextType_0 = v2.RoduxFriends.Enums.RecommendationContextType;
local l_getFFlagPYMKAddFriendsEntry_0 = v2.getFFlagPYMKAddFriendsEntry;
local v11 = require(l_Parent_0.Flags.FFlagFixContactRecsCTRAnalytics);
return function(v12)
    local v13 = l_React_0.useRef({});
    local v15 = l_useSelector_0(function(v14)
        return l_getDeepValue_0(v14, string.format("%s.Friends.friendshipStatus", v1.RODUX_KEY)) or {};
    end);
    local v17 = l_useSelector_0(function(v16)
        return l_getDeepValue_0(v16, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", v1.RODUX_KEY));
    end) or {};
    return l_React_0.useMemo(function()
        return {
            {
                viewabilityConfig = {
                    itemVisiblePercentThreshold = 50, 
                    waitForInteraction = false
                }, 
                onViewableItemsChanged = function(v18)
                    for _, v20 in pairs(v18.changed) do
                        local l_item_0 = v20.item;
                        local v22 = v13.current or {};
                        local v23 = not v22[l_item_0.id];
                        if l_getFFlagPYMKAddFriendsEntry_0() then
                            v23 = (not v22[l_item_0.id] and not l_item_0.isTooltip) and not l_item_0.isButtonTile;
                        end;
                        if v23 then
                            v12(v7.UserSeen, {
                                userId = l_item_0.id, 
                                contactId = if not not v11 and l_item_0.recommendationContextType == l_RecommendationContextType_0.Contacts then l_item_0.id else nil, 
                                friendStatus = v8(v15[l_item_0.id], v17[l_item_0.id]), 
                                recommendationContextType = l_item_0.recommendationContextType, 
                                recommendationRank = l_item_0.recommendationRank, 
                                absolutePosition = l_item_0.absolutePosition
                            });
                            v13.current = l_llama_0.Dictionary.join(v13.current, {
                                [l_item_0.id] = true
                            });
                        end;
                    end;
                end
            }
        };
    end, {});
end;
