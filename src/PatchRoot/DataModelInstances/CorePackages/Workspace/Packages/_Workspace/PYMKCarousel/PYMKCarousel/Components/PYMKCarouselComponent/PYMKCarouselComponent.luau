local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = v1.Roact;
local l_React_0 = v1.React;
local v5 = require(l_Parent_0.SocialCommon);
local l_useSelector_0 = v1.Hooks.useSelector;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_UIBlox_0 = v1.UIBlox;
local l_FreeFlowCarousel_0 = l_UIBlox_0.App.Container.Carousel.FreeFlowCarousel;
local l_calculateContextualMaxHeight_0 = v5.Components.CarouselUserTile.calculateContextualMaxHeight;
local v11 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v11.EventNames;
local l_useUserSeenEvent_0 = v11.useUserSeenEvent;
local v14 = require(l_script_FirstAncestor_0.Components.PYMKCarouselUserTile);
local v15 = require(l_script_FirstAncestor_0.Components.PYMKCarouselButtonTile);
local v16 = require(l_script_FirstAncestor_0.Components.PYMKCarouselFindFriendsTooltip);
local v17 = require(script.Parent.usePYMKCarouselItemList);
local v18 = require(l_script_FirstAncestor_0.installReducer.Selectors.getPYMKSortedRecommendationIds);
local l_getFFlagPYMKAddFriendsEntry_0 = v1.getFFlagPYMKAddFriendsEntry;
local function v21(v20)
    return v20.id;
end;
local v22 = 0;
return function(v23)
    local v24, v25 = l_React_0.useState({});
    local v27 = l_useSelector_0(v18((l_useSelector_0(function(v26)
        return (tostring(v26.LocalUserId));
    end))));
    local v28 = not not v27 and #v27 or 0;
    local l_recommendationSessionId_0 = v23.recommendationSessionId;
    l_React_0.useEffect(function()
        v25(v27);
    end, l_dependencyArray_0(v28, l_recommendationSessionId_0));
    local l_fireAnalyticsEvent_0 = v23.fireAnalyticsEvent;
    l_React_0.useEffect(function()
        l_fireAnalyticsEvent_0(l_EventNames_0.CarouselLoadedWithUsers, {
            recommendationCount = v28, 
            refreshCount = v22, 
            findFriendsTileEnabled = v23.findFriendsTileEnabled
        });
        v22 = v22 + 1;
    end, {
        l_recommendationSessionId_0
    });
    local v31 = l_useUserSeenEvent_0(l_fireAnalyticsEvent_0);
    local v32 = l_UIBlox_0.Core.Style.useStyle();
    return l_Roact_0.createElement(l_FreeFlowCarousel_0, {
        headerText = v23.carouselTitle, 
        identifier = v21, 
        itemList = if not l_getFFlagPYMKAddFriendsEntry_0() then v24 else if not l_getFFlagPYMKAddFriendsEntry_0() then nil else v17({
            recommendationIds = v24, 
            recommendationCount = v28, 
            findFriendsTileEnabled = v23.findFriendsTileEnabled, 
            seeAllTileEnabled = v23.seeAllTileEnabled
        }), 
        renderItem = function(v33)
            if not l_getFFlagPYMKAddFriendsEntry_0() or not v33.isButtonTile then
                if not l_getFFlagPYMKAddFriendsEntry_0() or not v33.isTooltip then
                    return l_Roact_0.createElement(v14, {
                        userId = v33.id, 
                        tileWidth = 100, 
                        contextualInfoLines = 2, 
                        openProfilePeekView = v23.openProfilePeekView, 
                        showToast = v23.showToast, 
                        fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                        absolutePosition = v33.absolutePosition, 
                        recommendationSessionId = l_recommendationSessionId_0
                    });
                else
                    return l_Roact_0.createElement(v16);
                end;
            else
                return (l_Roact_0.createElement(v15, {
                    id = v33.id, 
                    goToAddFriendsPage = v23.goToAddFriendsPage, 
                    fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                    shouldShowContactImporterBadge = v23.shouldShowContactImporterBadge
                }));
            end;
        end, 
        itemSize = Vector2.new(100, 100 + l_React_0.useMemo(function()
            return l_calculateContextualMaxHeight_0({
                font = v32.Font
            });
        end, {
            v32.Font
        })), 
        carouselMargin = v23.sideMargin, 
        viewabilityConfigCallbackPairs = v31
    });
end;
