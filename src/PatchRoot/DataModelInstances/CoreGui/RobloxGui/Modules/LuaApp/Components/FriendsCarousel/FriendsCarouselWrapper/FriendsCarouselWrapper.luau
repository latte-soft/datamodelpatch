local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local l_llama_0 = require(l_CorePackages_0.LuaSocialLibrariesDeps).llama;
local v4 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v5 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(script.Parent.FreezableUserCarousel);
local l_FriendsCarousel_0 = require(l_Modules_0.LuaApp.Components.FriendsCarousel.api).FriendsCarousel;
local v9 = v2.Component:extend("FriendsCarouselWrapper");
v9.defaultProps = {
    carousel = v7
};
v9.render = function(v10)
    local l_props_0 = v10.props;
    return v2.createElement(l_FriendsCarousel_0, l_llama_0.Dictionary.join(l_props_0, {
        roactAnalytics = l_llama_0.None, 
        diagService = l_props_0.roactAnalytics.Diag, 
        eventIngestService = l_props_0.eventIngestService, 
        eventStreamService = l_props_0.eventIngestService
    }));
end;
return (l_RoactServices_0.connect({
    roactAnalytics = v4, 
    eventIngestService = v5
})(v9));
