local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(script.Parent.RouterAnalyticsReporter);
return v2.connect(function(v4, _)
    return {
        routeHistory = v4.Navigation.history
    };
end)(function(v6)
    local l_routeHistory_0 = v6.routeHistory;
    local v8 = l_routeHistory_0[#l_routeHistory_0];
    return v1.createElement(v3, {
        currentPage = v8[#v8].name
    });
end);
