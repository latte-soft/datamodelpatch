local v0 = {};
local l_jest_0 = require(game:GetService("CorePackages").JestGlobals).jest;
v0.new = function()
    local v2 = {
        reportOpenInspectMenu = l_jest_0.fn(), 
        reportTryOnButtonClicked = l_jest_0.fn(), 
        reportFavoriteItem = l_jest_0.fn(), 
        reportPurchaseAttempt = l_jest_0.fn(), 
        reportPurchaseSuccess = l_jest_0.fn()
    };
    setmetatable(v2, {
        __tostring = function()
            return "Service(MockAnalytics)";
        end
    });
    return v2;
end;
return v0;
