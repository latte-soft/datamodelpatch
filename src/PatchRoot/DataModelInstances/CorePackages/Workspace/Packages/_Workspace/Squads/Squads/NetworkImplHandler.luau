local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
require(l_script_FirstAncestor_0.devDependencies).JestGlobals.beforeAll(function(_)
    v1.RoduxNetworking.setNetworkImpl(function(v3)
        error(string.format("Should have replaced network implementation for url: %s", (tostring(v3))));
    end);
end);
