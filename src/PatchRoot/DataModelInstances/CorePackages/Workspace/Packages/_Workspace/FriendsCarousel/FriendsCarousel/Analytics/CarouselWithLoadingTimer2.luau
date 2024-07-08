local l_Parent_0 = script:FindFirstAncestor("FriendsCarousel").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.RobloxAppHooks);
local v4 = require(l_Parent_0.SocialLuaAnalytics);
local l_useLocalUserId_0 = v3.useLocalUserId;
local l_useLoadingTimers_0 = v4.Analytics.Timing.useLoadingTimers;
local l_RetrievalStatus_0 = v2.App.Loading.Enum.RetrievalStatus;
local v8 = require(script.Parent.AnalyticsSetup);
local v9 = require(script.Parent.EventNames);
local v10 = require(script.Parent.UILoadingEvents);
return function(v11)
    local v12 = l_useLocalUserId_0();
    local v13 = l_useLoadingTimers_0({});
    local v14 = v1.useRef({});
    local v15 = v1.useMemo(function()
        return v8({
            infoForAllEvents = {
                uid = if not v12 then nil else tostring(v12)
            }
        });
    end, {
        v12
    });
    v1.useEffect(function()
        v13.start("carouselLoadingTime");
    end, {});
    local function v18(v16, v17)
        v15.fireAnalyticsEvent(v9.FriendsCarouselUILoadingTime, {
            loadingTime = (not (not not v17 and typeof(v17) == "number") or v17 < 0) and 0 or v17, 
            fetch = v16, 
            status = l_RetrievalStatus_0.Done.rawValue()
        });
    end;
    return v11.renderComponent({
        onSuccessfulRender = function(v19)
            if not v14.current[v10.EmptyHint] and not v14.current[("%*%*"):format(v10.EmptyHint, v10.ExperimentSuffix)] then
                if v19 and not v14.current[v19] then
                    v14.current[v19] = true;
                    v18(v19, (v13.getTime("carouselLoadingTime")));
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        end
    });
end;
