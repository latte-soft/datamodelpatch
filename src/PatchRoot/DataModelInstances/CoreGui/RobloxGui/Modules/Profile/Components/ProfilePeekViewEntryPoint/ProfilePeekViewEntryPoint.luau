local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local v3 = require(l_Parent_0.ProfileContext);
local v4 = require(l_Parent_0.Navigator);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v6 = require(l_Parent_0.Common.ProfileTypes);
local v7 = require(l_Parent_0.Components.ProfileEventReceiver);
local l_Logger_0 = v1.Logger;
local v9 = require(l_Parent_0.Analytics);
local v10 = l_Roact_0.PureComponent:extend("ProfilePeekViewEntryPoint");
v10.defaultProps = {
    profileType = v6.Default
};
v10.init = function(v11)
    local l_props_0 = v11.props;
    local v13 = l_props_0.profileType or v6.Default;
    if not (l_props_0.profileUserId ~= l_props_0.localUserId) or l_props_0.friendStatus == Enum.FriendStatus.Friend then
        v13 = v6.Default;
    end;
    v11.state = {
        profileType = v13
    };
    v11.resetProfileType = function()
        v11:setState({
            profileType = v6.Default
        });
    end;
    v11.analytics = l_props_0.getAnalytics(l_props_0.localUserId, l_props_0.profileUserId);
end;
v10.didUpdate = function(v14, v15)
    if v14.props.friendStatus == Enum.FriendStatus.Friend and v15.friendStatus ~= Enum.FriendStatus.Friend then
        v14.resetProfileType();
    end;
end;
v10.didMount = function(v16)
    local l_props_1 = v16.props;
    v16.analytics:pageLoaded();
    if l_props_1.profileType == v6.FromContacts then
        l_props_1.getContactEntities({
            l_props_1.contactProps.contactId
        });
        return ;
    else
        l_props_1.fetchProfilePageData():andThen(function(v18)
            v16.analytics:pageLoadedWithData({
                friendStatus = v18.friendStatus, 
                playerPresence = v18.playerPresence, 
                isRecommendation = l_props_1.navigationParams.isRecommendation, 
                isHomePageCarousel = l_props_1.navigationParams.isHomePageCarousel, 
                absolutePosition = l_props_1.navigationParams.absolutePosition, 
                recommendationContextType = l_props_1.navigationParams.recommendationContextType, 
                recommendationRank = l_props_1.navigationParams.recommendationRank, 
                source = l_props_1.navigationParams.source, 
                profileType = l_props_1.profileType, 
                shareLinkId = l_props_1.navigationParams.shareLinkId
            });
        end);
        return ;
    end;
end;
v10.willUnmount = function(v19)
    l_Logger_0:info("ProfilePeekView unmounted");
    v19.props.resetProfilePageDataStatus();
end;
v10.render = function(v20)
    local l_props_2 = v20.props;
    return l_Roact_0.createElement(v9.Context.Provider, {
        value = v20.analytics
    }, {
        l_Roact_0.createElement(v3.Provider, {
            value = {
                profileType = v20.state.profileType, 
                resetProfileType = v20.resetProfileType, 
                profileUserId = l_props_2.profileUserId, 
                navigateToLuaAppPages = l_props_2.navigateToLuaAppPages, 
                peekViewProps = l_props_2.peekViewProps, 
                abbreviateCount = l_props_2.abbreviateCount, 
                localUserId = l_props_2.localUserId, 
                catalogAnalytics = l_props_2.catalogAnalytics, 
                wideMode = l_props_2.wideMode, 
                navigationParams = l_props_2.navigationParams, 
                contactProps = l_props_2.contactProps
            }
        }, {
            navigation = l_Roact_0.createElement(v4, {
                navigation = l_props_2.navigation
            }), 
            eventReceiver = l_Roact_0.createElement(v7, {
                robloxEventReceiver = l_props_2.robloxEventReceiver
            }), 
            androidBackButtonNavigationHandler = l_props_2.renderAndroidBackButtonNavigationHandler(l_props_2.navigation)
        })
    });
end;
v10.router = v4.router;
return v10;
