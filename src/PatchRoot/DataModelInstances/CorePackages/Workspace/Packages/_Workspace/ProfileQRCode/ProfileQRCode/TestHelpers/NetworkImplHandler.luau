local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_beforeAll_0 = require(l_script_FirstAncestor_0.Parent.Dev.JestGlobals).beforeAll;
local v2 = require(l_script_FirstAncestor_0.Networking.configuredRoduxNetworking);
l_beforeAll_0(function()
    v2.setNetworkImpl(function(v3)
        error(string.format("\240\159\148\165 Should have replaced network implementation for url: %s", (tostring(v3))));
    end);
end);
