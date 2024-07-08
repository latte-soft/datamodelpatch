local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.Components.Analytics.PageHeartbeatTimer);
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAppRouter);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = v2.Component:extend("RouterAnalyticsReporter");
v7.render = function(v8)
    local l_currentPage_0 = v8.props.currentPage;
    local l_l_currentPage_0_0 = l_currentPage_0;
    if l_l_currentPage_0_0 then
        l_l_currentPage_0_0 = false;
        if l_currentPage_0 ~= v4.None then
            l_l_currentPage_0_0 = v2.createElement(v3, {
                currentPageGoal = l_currentPage_0
            });
        end;
    end;
    return l_l_currentPage_0_0;
end;
v7.didUpdate = function(v11, v12)
    local l_currentPage_1 = v11.props.currentPage;
    local l_analytics_0 = v11.props.analytics;
    if not (not (l_currentPage_1 ~= v12.currentPage) or not l_analytics_0) then
        l_analytics_0.reportPageChanged(l_currentPage_1);
    end;
end;
return l_RoactServices_0.connect({
    analytics = v5
})(v7);
