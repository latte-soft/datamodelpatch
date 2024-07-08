local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v1 = require(game:GetService("CorePackages").Packages.Dash);
local v2 = require(script.Parent.Parent.Actions.SetActiveTab);
local v3 = require(script.Parent.Parent.Actions.SetDevConsoleVisibility);
local v4 = require(script.Parent.Parent.Actions.SetDevConsoleMinimized);
local v5 = game:DefineFastInt("ReportDevConsoleTabEventsThrottleHundredthsPercent", 0);
local v6 = game:DefineFastFlag("DevConsoleUseThrottledMetrics", false);
ReportDevConsoleOpenClose = function(v7, v8)
    if v8.type == v3.name then
        local l_isVisible_0 = v7:getState().DisplayOptions.isVisible;
        local l_visibleStartTime_0 = v7:getState().DisplayOptions.visibleStartTime;
        if v8.isVisible ~= l_isVisible_0 then
            if not v8.isVisible then
                l_RbxAnalyticsService_0:ReportStats("DevConsoleSessionTime", tick() - l_visibleStartTime_0);
            else
                l_RbxAnalyticsService_0:ReportCounter("DevConsoleStartVisible", 1);
                return ;
            end;
        end;
    end;
end;
getTabAnalyticsKeyName = function(v11, v12)
    if v12 ~= nil then
        return string.format("%s_%s", v11, not v12 and "Server" or "Client");
    else
        return string.format("%s", v11);
    end;
end;
dispatchTabAnalytics = function(v13)
    if not v6 then
        l_RbxAnalyticsService_0:SendEventImmediately("client", "devConsoleMetric", "devConsoleTabChange", v13);
        return ;
    else
        l_RbxAnalyticsService_0:ReportInfluxSeries("devConsoleMetric", v1.join({
            placeId = game.PlaceId, 
            calledFrom = "devConsoleTabChange"
        }, v13), v5);
        return ;
    end;
end;
ReportTabChange = function(v14, v15)
    if v15.type == v2.name then
        local l_MainView_0 = v14:getState().MainView;
        local l_newTabIndex_0 = v15.newTabIndex;
        local l_isClientView_0 = v15.isClientView;
        if not (l_newTabIndex_0 == l_MainView_0.currTabIndex) or l_isClientView_0 ~= nil and l_isClientView_0 ~= l_MainView_0.isClientView then
            dispatchTabAnalytics({
                initTab = getTabAnalyticsKeyName(l_MainView_0.currTabIndex, l_MainView_0.isClientView), 
                endTab = getTabAnalyticsKeyName(l_newTabIndex_0, l_isClientView_0)
            });
            return ;
        end;
    elseif v15.type == v3.name then
        local l_MainView_1 = v14:getState().MainView;
        local l_DisplayOptions_0 = v14:getState().DisplayOptions;
        local _ = nil;
        dispatchTabAnalytics(if not v15.isVisible then if l_DisplayOptions_0.isMinimized then {
            initTab = "Minimized", 
            endTab = "EndVisible"
        } else {
            initTab = getTabAnalyticsKeyName(l_MainView_1.currTabIndex, l_MainView_1.isClientView), 
            endTab = "EndVisible"
        } else {
            initTab = "StartVisible", 
            endTab = getTabAnalyticsKeyName(l_MainView_1.currTabIndex, l_MainView_1.isClientView)
        });
        return ;
    elseif v15.type == v4.name then
        local l_MainView_2 = v14:getState().MainView;
        local _ = nil;
        dispatchTabAnalytics(if not v15.isMinimized then {
            initTab = "Minimized", 
            endTab = getTabAnalyticsKeyName(l_MainView_2.currTabIndex, l_MainView_2.isClientView)
        } else {
            initTab = getTabAnalyticsKeyName(l_MainView_2.currTabIndex, l_MainView_2.isClientView), 
            endTab = "Minimized"
        });
    end;
end;
return function(v24, v25)
    return function(v26)
        ReportTabChange(v25, v26);
        ReportDevConsoleOpenClose(v25, v26);
        v24(v26);
    end;
end;
