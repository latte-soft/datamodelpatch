local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Symbol);
local v2 = require(l_CorePackages_0.Packages.t);
return {
    interface = v2.strictInterface({
        feedItemPosition = v2.number, 
        scrollViewPositionChangedSignal = v2.table, 
        refreshSignal = v2.table, 
        appPage = v2.string
    }), 
    key = v1.named("OmniFeedProps"), 
    new = function(v3, v4, v5, v6)
        return {
            feedItemPosition = v3, 
            scrollViewPositionChangedSignal = v4, 
            refreshSignal = v5, 
            appPage = v6
        };
    end
};
