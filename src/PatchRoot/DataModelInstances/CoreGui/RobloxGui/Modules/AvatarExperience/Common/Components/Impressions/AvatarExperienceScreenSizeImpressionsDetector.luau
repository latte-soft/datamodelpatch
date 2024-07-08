local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.AvatarExperienceImpressionsDetector);
local v6 = v2.PureComponent:extend("AvatarExperienceScreenSizeImpressionsDetector");
v6.validateProps = v4.strictInterface({
    parentRef = v4.table, 
    onRequestImpressionsSignal = v4.table, 
    appPage = v4.optional(v4.string), 
    pageFilter = v4.optional(v4.callback), 
    collectObjectsFunc = v4.optional(v4.callback), 
    filterImpressionFunc = v4.optional(v4.callback), 
    onImpressionsDetected = v4.callback, 
    screenSize = v4.Vector2, 
    globalGuiInset = v4.table, 
    topBarHeight = v4.number
});
v6.render = function(v7)
    local l_screenSize_0 = v7.props.screenSize;
    return v2.createElement(v5, {
        parentRef = v7.props.parentRef, 
        onRequestImpressionsSignal = v7.props.onRequestImpressionsSignal, 
        viewPortBounds = {
            min = Vector2.new(0, v7.props.topBarHeight), 
            max = Vector2.new(l_screenSize_0.X, l_screenSize_0.Y - v7.props.globalGuiInset.bottom)
        }, 
        appPage = v7.props.appPage, 
        pageFilter = v7.props.pageFilter, 
        collectObjectsFunc = v7.props.collectObjectsFunc, 
        filterImpressionFunc = v7.props.filterImpressionFunc, 
        onImpressionsDetected = v7.props.onImpressionsDetected
    });
end;
return (v3.connect(function(v9, _)
    return {
        topBarHeight = v9.TopBar.topBarHeight, 
        globalGuiInset = v9.GlobalGuiInset, 
        screenSize = v9.ScreenSize
    };
end)(v6));
