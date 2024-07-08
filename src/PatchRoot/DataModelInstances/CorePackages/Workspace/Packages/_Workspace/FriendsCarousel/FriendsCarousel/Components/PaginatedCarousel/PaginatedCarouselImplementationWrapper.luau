local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(script.Parent.useCarouselList);
local v5 = require(script.Parent.RefreshCarouselWrapper);
local l_Analytics_0 = require(l_script_FirstAncestor_0.Analytics).Analytics;
local l_FFlagFriendsCarouselIXPfriendsSort_0 = v3.FFlagFriendsCarouselIXPfriendsSort;
return function(v8)
    local v9 = v2.useMemo(function()
        return l_Analytics_0({
            infoForAllEvents = {
                uid = v8.localUserId
            }
        });
    end, {
        v8.localUserId
    });
    local v10, v11, v12 = v4({
        userId = v8.localUserId, 
        fireAnalyticsEvent = v9 and v9.fireAnalyticsEvent, 
        friendsSortVariant = if not l_FFlagFriendsCarouselIXPfriendsSort_0 then nil else v8.friendsSortVariant
    });
    return v2.createElement(v5, {
        refreshSignal = v8.carouselProps.refreshSignal, 
        refetchData = v12, 
        renderChildComponent = function()
            return v8.renderChildComponent({
                carouselList = v10, 
                fetchMoreFriends = v11
            });
        end
    });
end;
