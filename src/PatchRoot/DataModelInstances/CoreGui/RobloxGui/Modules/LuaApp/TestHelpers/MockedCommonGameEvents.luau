local l_jest_0 = require(game:GetService("CorePackages").JestGlobals).jest;
return {
    new = function()
        return {
            reportOpenGameDetailWithId = l_jest_0.fn(), 
            reportFilterChangeWithId = l_jest_0.fn()
        };
    end
};
