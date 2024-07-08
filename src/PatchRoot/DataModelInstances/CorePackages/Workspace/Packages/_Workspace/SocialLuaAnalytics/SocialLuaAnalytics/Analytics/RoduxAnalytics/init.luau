local v0 = require(script.Actions);
local v1 = require(script.Selectors);
local v2 = require(script.Reducers);
local _ = require(script.AnalyticsTypes);
return {
    config = function(v4)
        return {
            installReducer = function()
                return v2(v4);
            end, 
            Actions = v0(v4), 
            Selectors = v1(v4)
        };
    end
};
