local l_ReactCurrentBatchConfig_0 = require(script.Parent.Parent.Shared).ReactSharedInternals.ReactCurrentBatchConfig;
return {
    NoTransition = 0, 
    requestCurrentTransition = function()
        return l_ReactCurrentBatchConfig_0.transition;
    end
};
