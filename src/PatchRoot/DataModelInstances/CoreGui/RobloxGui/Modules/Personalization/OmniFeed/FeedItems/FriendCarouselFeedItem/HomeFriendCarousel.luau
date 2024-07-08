local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v5 = require(l_Modules_0.LuaApp.Constants);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Components.FriendsCarousel.api);
local l_CarouselWithLoadingTimer_0 = v8.CarouselWithLoadingTimer;
local l_setupFireEvent_0 = v8.setupFireEvent;
local v11 = require(l_Modules_0.LuaApp.Components.FriendsCarousel.FriendsCarouselWrapper.Container);
local v12 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_FFlagFriendsCarouselPassRefreshSignalDown_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFriendsCarouselPassRefreshSignalDown;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v5.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v5.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local v16 = v2.PureComponent:extend("HomeFriendCarousel");
v16.init = function(v17)
    v17.fireAnalyticsEvent = l_setupFireEvent_0({
        infoForAllEvents = {
            uid = v17.props.localUserId
        }, 
        analytics = {
            EventStream = v17.props.eventIngestService
        }
    });
end;
v16.render = function(v18)
    if v18.props.showHomeFriendSection then
        local l_formFactor_0 = v18.props.formFactor;
        local l_layoutOrder_0 = v18.props.layoutOrder;
        local v21 = nil;
        v21 = if l_formFactor_0 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
        return v2.createElement(l_CarouselWithLoadingTimer_0, {
            renderComponent = function(v22)
                return v2.createElement(v11, {
                    carouselProps = {
                        LayoutOrder = l_layoutOrder_0, 
                        formFactor = l_formFactor_0, 
                        sideMargin = v21, 
                        refreshSignal = if not l_FFlagFriendsCarouselPassRefreshSignalDown_0 then nil else v18.props.refreshSignal
                    }, 
                    onSuccessfulRender = v22.onSuccessfulRender
                });
            end, 
            fireEvent = v18.fireAnalyticsEvent
        });
    else
        return nil;
    end;
end;
return (l_RoactServices_0.connect({
    eventIngestService = v12
})((l_RoactAppPolicy_0.connect(function(v23, _)
    return {
        showHomeFriendSection = v23.getHomePageFriendSection()
    };
end)((v3.connect(function(v25, _)
    return {
        formFactor = v25.FormFactor, 
        localUserId = tostring(v25.LocalUserId) or ""
    };
end)(v16))))));
