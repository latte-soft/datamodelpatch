local v0 = require(script.connect);
local v1 = require(script.Provider);
local v2 = require(script.Logger);
local l_getPolicyImplementations_0 = script.getPolicyImplementations;
return {
    withGetPolicyImplementation = function(v4)
        assert(v4.read, "expected getPolicyImpl to have `read` function");
        assert(v4.onPolicyChanged, "expected getPolicyImpl to have `onPolicyChanged` function");
        return {
            connect = v0(v4), 
            Provider = v1()
        };
    end, 
    GetPolicyImplementations = {
        MemStorageService = require(l_getPolicyImplementations_0.fromMemStorageService)(), 
        PolicyService = require(l_getPolicyImplementations_0.fromPolicyService)(), 
        Static = require(l_getPolicyImplementations_0.fromStaticSource)()
    }, 
    Logger = v2, 
    AppPolicyContext = require(script.AppPolicyContext)
};
