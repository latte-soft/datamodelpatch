local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_NetworkingFriends_0 = v1.NetworkingFriends;
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local l_EventNames_0 = require(l_Parent_0.Analytics).EventNames;
local v7 = require(l_Parent_0.Analytics.withLoadingTimer);
local v8 = require(l_Parent_0.Flags.getFIntFriendsCarouselLoadingTimeThresholdSec);
local v9 = require(script.Parent.CarouselWithLoadingTimer2);
local v10 = require(l_Parent_0.Flags.FFlagFriendsCarouselUILoadingTime);
local function v13(v11, v12)
    return l_EventNames_0.CarouselLoadingTime, {
        friendsFetchingStatus = v11.friendsFetchingStatus, 
        recommendationFetchingStatus = v11.recommendationFetchingStatus, 
        loadingThreshold = v8(), 
        loadingTime = v12.loadingTime, 
        reachedThreshold = v12.reachedThreshold
    };
end;
local v14 = l_Roact_0.Component:extend("CarouselWithLoadingTimer");
v14.init = function(v15)
    v15.onSuccessfulRender = function()
        v15.props.loadingTimerProps.stopTimer();
    end;
end;
v14.didMount = function(v16)
    v16.props.loadingTimerProps.startTimer();
end;
v14.willUnmount = function(v17)
    v17.props.loadingTimerProps.resetTimer();
end;
v14.render = function(v18)
    return v18.props.renderComponent({
        onSuccessfulRender = v18.onSuccessfulRender
    });
end;
v14 = v7(v14, {
    loadingThreshold = v8(), 
    onReachingThreshold = function(v19, v20)
        v20.fireEvent(v13(v20, {
            reachedThreshold = true, 
            loadingTime = v19
        }));
    end, 
    onLoaded = function(v21, v22)
        v22.fireEvent(v13(v22, {
            reachedThreshold = false, 
            loadingTime = v21
        }));
    end
});
if not v10 then
    return (l_compose_0(l_RoactRodux_0.connect(function(v23)
        local v24 = tostring(v23.LocalUserId);
        return {
            friendsFetchingStatus = l_NetworkingFriends_0.GetFriendsFromUserId.getStatus(v23, v24), 
            recommendationFetchingStatus = l_NetworkingFriends_0.GetFriendRecommendationsFromUserId.getStatus(v23, v24)
        };
    end, nil))(v14));
else
    return v9;
end;
