local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
require(l_script_FirstAncestor_0.devDependencies).JestGlobals.beforeAll(function()
    v1.RoduxNetworking.setNetworkImpl(function(v2)
        error(string.format("\240\159\148\165 Should have replaced network implementation for url: %s", (tostring(v2))));
    end);
end);
