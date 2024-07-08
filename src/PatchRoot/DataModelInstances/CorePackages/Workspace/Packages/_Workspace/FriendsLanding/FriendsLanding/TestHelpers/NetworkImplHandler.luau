local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_RoduxNetworking_0 = require(l_script_FirstAncestor_0.dependencies).RoduxNetworking;
require(l_script_FirstAncestor_0.devDependencies).JestGlobals.beforeAll(function()
    l_RoduxNetworking_0.setNetworkImpl(function(v2)
        error(string.format("\n\240\159\148\165 Should have replaced network implementation for url: %s\n", (tostring(v2))));
    end);
end);
