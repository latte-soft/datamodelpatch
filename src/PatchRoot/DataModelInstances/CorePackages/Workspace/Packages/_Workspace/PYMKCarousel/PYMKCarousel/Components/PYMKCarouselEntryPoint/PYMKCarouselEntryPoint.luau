local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v2.React;
local v4 = require(l_Parent_0.RobloxAppHooks);
local l_useSelector_0 = v2.Hooks.useSelector;
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_useLocalUserId_0 = v4.useLocalUserId;
local l_setupFireEvent_0 = require(l_script_FirstAncestor_0.Analytics).setupFireEvent;
local l_getSessionIdByKey_0 = v2.RoduxAnalytics.Selectors.getSessionIdByKey;
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local v11 = require(l_script_FirstAncestor_0.Components.PYMKCarouselComponent);
return function(v12)
    local v13 = l_useLocalUserId_0();
    local v15 = l_useSelector_0(function(v14)
        return l_getSessionIdByKey_0(v14)(l_RECOMMENDATION_SESSION_ID_KEY_0);
    end);
    local v16 = l_React_0.useMemo(function()
        return l_setupFireEvent_0({
            infoForAllEvents = {
                uid = v13, 
                recommendationSessionId = v15
            }, 
            analytics = {
                Diag = v12.diagService, 
                EventStream = v12.eventIngestService
            }
        });
    end, l_dependencyArray_0(v13, v15));
    if v13 then
        if not v15 and not v12.findFriendsTileEnabled then
            return nil;
        else
            return l_React_0.createElement(v11, {
                findFriendsTileEnabled = v12.findFriendsTileEnabled, 
                seeAllTileEnabled = v12.seeAllTileEnabled, 
                recommendationSessionId = v15, 
                carouselTitle = v12.carouselTitle, 
                sideMargin = v12.sideMargin, 
                openProfilePeekView = v12.openProfilePeekView, 
                showToast = v12.showToast, 
                goToAddFriendsPage = v12.goToAddFriendsPage, 
                shouldShowContactImporterBadge = v12.shouldShowContactImporterBadge, 
                fireAnalyticsEvent = v16
            });
        end;
    else
        return nil;
    end;
end;
