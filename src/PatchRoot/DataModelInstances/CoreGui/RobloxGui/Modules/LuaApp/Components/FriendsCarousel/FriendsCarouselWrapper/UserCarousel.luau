local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LuaApp_0 = l_Modules_0.LuaApp;
local v3 = require(l_CorePackages_0.Roact);
local _ = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v7 = require(l_Modules_0.LuaApp.withLocalization);
local v8 = require(l_Modules_0.Common.Text);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v11 = require(l_LuaApp_0.FitChildren);
local v12 = require(l_Modules_0.LuaApp.Components.Generic.CarouselWidget);
local v13 = require(l_Modules_0.LuaApp.AppPage);
local v14 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v15 = require(l_Modules_0.LuaApp.Components.FriendsCarousel.api);
local l_setupFireEvent_0 = v15.setupFireEvent;
local l_EventNames_0 = v15.EventNames;
local v18 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_getFStringSocialFriendsLandingLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFStringSocialFriendsLandingLayer;
local l_getFFlagNoFriendsUIEnabled_DEV_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagNoFriendsUIEnabled_DEV;
local l_FIntFriendsCarouselFetchPageDistance_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntFriendsCarouselFetchPageDistance;
local l_FFlagFriendsCarouselPagination_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFriendsCarouselPagination;
local l_FFlagMoveCarouselHeader_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagMoveCarouselHeader;
local v24 = v3.PureComponent:extend("UserCarousel");
v24.defaultProps = {
    friendCount = 0, 
    cardPadding = 12, 
    friendThumbnailSize = 96, 
    renderFindFriendsTile = function()
    end, 
    renderFindFriendsHint = function()
    end, 
    renderItem = function()
    end
};
local function v25()
end;
v24.init = function(v26)
    v26.state = {
        cardWindowStart = 1, 
        cardWindowIndex = 1, 
        cardsInWindow = 0, 
        cardWidth = 0, 
        canvasWidth = if not l_FFlagFriendsCarouselPagination_0 then nil else 0, 
        items = nil
    };
    v26.fireAnalyticsEvent = if not l_FFlagMoveCarouselHeader_0 then l_setupFireEvent_0({
        analytics = {
            EventStream = v26.props.eventIngestService
        }, 
        infoForAllEvents = {
            uid = v26.props.localUserId
        }
    }) else nil;
    v26.onSeeAllFriends = not l_FFlagMoveCarouselHeader_0 and function()
        v26.fireAnalyticsEvent(l_EventNames_0.ViewAllFriends, {
            friendCount = v26.props.friendCount, 
            recommendationLimit = true
        });
        v26.props.navigateDown({
            name = v13.ViewFriends, 
            extraProps = {
                navigateToFriendsLandingEventStart = {
                    startPage = v13.Home, 
                    startTime = os.clock()
                }
            }
        });
    end or nil;
    v26.scrollingFrameRefCallback = function(v27)
        v26.scrollingFrameRef = v27;
    end;
    v26.updateCardWindowBounds = function()
        local l_screenSize_0 = v26.props.screenSize;
        local v29 = v26.props.friendThumbnailSize + v26.props.cardPadding;
        local v30 = math.ceil(l_screenSize_0.X / v29) + 2;
        if v26.scrollingFrameRef then
            local v31 = v26.scrollingFrameRef.CanvasPosition.X - v29;
            local v32 = math.max(1, (math.floor(v31 / v29)));
            local v33 = math.max(0, (math.floor((v31 + v29) / v29))) + 1;
            local v34 = true;
            if v32 == v26.state.cardWindowStart then
                v34 = true;
                if v33 == v26.state.cardWindowIndex then
                    v34 = true;
                    if v30 == v26.state.cardsInWindow then
                        v34 = v29 ~= v26.state.cardWidth;
                    end;
                end;
            end;
            if v34 then
                v26:setState({
                    cardWindowStart = v32, 
                    cardWindowIndex = v33, 
                    cardsInWindow = v30, 
                    cardWidth = v29
                });
            end;
            return ;
        else
            return ;
        end;
    end;
    v26.identifier = function(v35)
        return v35.absoluteIndex;
    end;
    v26.updateFriendsCanvas = function(v36)
        if v36 < v26.scrollingFrameRef.CanvasPosition.X + l_FIntFriendsCarouselFetchPageDistance_0 * v26.props.screenSize.X then
            v26:setState({
                canvasWidth = v36
            });
            if v26.props.fetchNext then
                v26.props.fetchNext();
            end;
        end;
    end;
    v26.createItemEntry = function(v37, v38)
        return v26.props.renderItem({
            data = v37.data, 
            absoluteIndex = v37.absoluteIndex, 
            layoutOrder = v37.layoutOrder, 
            tileInfoHeight = v38.Y + 8, 
            setPeopleListFrozen = v26.props.setPeopleListFrozen
        });
    end;
end;
v24.render = function(v39)
    local l_props_0 = v39.props;
    local l_LayoutOrder_0 = v39.props.LayoutOrder;
    local l_friendCount_0 = v39.props.friendCount;
    local l_friendThumbnailSize_0 = v39.props.friendThumbnailSize;
    local l_cardPadding_0 = v39.props.cardPadding;
    local l_sideMargin_0 = v39.props.sideMargin;
    local l_items_0 = v39.state.items;
    local l_cardsInWindow_0 = v39.state.cardsInWindow;
    local l_cardWindowStart_0 = v39.state.cardWindowStart;
    local l_cardWindowIndex_0 = v39.state.cardWindowIndex;
    local v50 = math.min(#l_items_0, (l_cardWindowStart_0 + l_cardsInWindow_0) - 1);
    local v51 = nil;
    if not l_FFlagMoveCarouselHeader_0 then
        v51 = l_friendCount_0 == 0 and "CommonUI.Features.Label.Friends" or {
            "Feature.Home.HeadingFriends"; 
            friendCount = l_friendCount_0
        };
    end;
    return v7({
        headerText = if not l_FFlagMoveCarouselHeader_0 then v51 else nil
    })(function(v52)
        return l_withStyle_0(function(v53)
            local l_Font_0 = v53.Font;
            local v55 = v8.GetTextBounds("SampleText", l_Font_0.CaptionHeader.Font, l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize, Vector2.new(10000, 10000));
            local v56 = Vector2.new(l_friendThumbnailSize_0, (l_friendThumbnailSize_0 + v55.Y) + 8);
            local function _()
                return v39.props.renderFindFriendsTile();
            end;
            local v58 = {};
            local v59 = 1;
            if l_cardWindowStart_0 == 1 then
                v58.AddFriend = v39.props.renderFindFriendsTile();
                v59 = v59 + 1;
                local v60 = false;
                if l_friendCount_0 == 0 then
                    v60 = #l_items_0 == 0;
                end;
                if v60 then
                    v58.AddFriendHint = v39.props.renderFindFriendsHint({
                        layoutOrder = v59
                    });
                    v59 = v59 + 1;
                end;
            end;
            for v61 = l_cardWindowStart_0, v50 do
                v58[v61] = v39.createItemEntry({
                    layoutOrder = v59, 
                    absoluteIndex = v61 + 1, 
                    data = l_items_0[v61]
                }, v55);
                v59 = v59 + 1;
            end;
            v58.Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, l_cardPadding_0)
            });
            local v62 = l_friendThumbnailSize_0 + l_cardPadding_0;
            local v63 = l_cardWindowStart_0 > 1 and l_cardWindowStart_0 * v62 or 0;
            if v63 > 0 then
                v58.Padding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v63)
                });
            end;
            local v64 = #l_items_0 + 1;
            return v3.createElement(v11.FitFrame, {
                fitAxis = v11.FitAxis.Height, 
                LayoutOrder = l_LayoutOrder_0, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_sideMargin_0)
                }), 
                Layout = v3.createElement("UIListLayout"), 
                UserCarousel = v3.createElement(v12, {
                    title = if not l_FFlagMoveCarouselHeader_0 then v52.headerText else l_props_0.title, 
                    items = v58, 
                    index = math.min(l_cardWindowIndex_0, v64), 
                    itemCount = v64, 
                    itemWidth = v56.X, 
                    itemPadding = l_cardPadding_0, 
                    carouselMargin = l_sideMargin_0, 
                    onSeeAll = if not l_FFlagMoveCarouselHeader_0 then v39.onSeeAllFriends else v39.props.onActivateHeader, 
                    carouselHeight = v56.Y, 
                    canvasWidth = v64 * v62, 
                    onChangeCanvasPosition = v39.updateCardWindowBounds, 
                    onRefCallback = v39.scrollingFrameRefCallback, 
                    showSeeAll = v39.props.newEmptyPageEnabled or l_friendCount_0 > 0, 
                    onRetry = v25
                })
            });
        end);
    end);
end;
v24.getDerivedStateFromProps = function(v65, _)
    if v65.peopleListFrozen then
        return ;
    else
        return {
            items = v65.items
        };
    end;
end;
v24.didMount = function(v67)
    v67.updateCardWindowBounds();
end;
v24.didUpdate = function(v68, v69)
    local v70 = true;
    if v68.props.screenSize == v69.screenSize then
        v70 = v68.props.formFactor ~= v69.formFactor;
    end;
    if v70 then
        v68.updateCardWindowBounds();
    end;
    if l_FFlagFriendsCarouselPagination_0 then
        local l_Offset_0 = v68.scrollingFrameRef.CanvasSize.X.Offset;
        local v72 = l_Offset_0 ~= v68.state.canvasWidth;
        local v73 = l_Offset_0 <= v68.scrollingFrameRef.CanvasPosition.X + v68.props.screenSize.X;
        if not (not (v72 or v70) and not v73) then
            v68.updateFriendsCanvas(l_Offset_0);
        end;
    end;
end;
v24 = v5.connect(function(v74, _)
    return {
        screenSize = v74.ScreenSize, 
        localUserId = if not l_FFlagMoveCarouselHeader_0 then v74.LocalUserId else nil
    };
end, function(v76)
    return {
        navigateDown = not l_FFlagMoveCarouselHeader_0 and function(v77)
            v76(v14(v77));
        end or nil
    };
end)(v24);
if not l_FFlagMoveCarouselHeader_0 then
    v24 = l_RoactServices_0.connect({
        eventIngestService = v10
    })(v24);
end;
return (v18.connectUserLayer({
    l_getFStringSocialFriendsLandingLayer_0()
}, function(v78, _)
    return {
        newEmptyPageEnabled = (v78[l_getFStringSocialFriendsLandingLayer_0()] or {}).new_empty_page or l_getFFlagNoFriendsUIEnabled_DEV_0()
    };
end, false)(v24));
