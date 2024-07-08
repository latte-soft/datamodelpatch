local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local l_createTreeWithProviders_0 = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactAppExperiment);
local l_MagicMock_0 = require(l_Parent_0.LuaSocialLibrariesDeps).Mock.MagicMock;
local l_mockPolicyProvider_0 = require(l_Parent_0.Dev.UnitTestHelpers).mockPolicyProvider;
return function(v6, v7)
    return v2.createElement(v3.Provider, {
        value = l_MagicMock_0.new()
    }, {
        Element = l_mockPolicyProvider_0(l_createTreeWithProviders_0(v6, v7), v7.mockPolicy)
    });
end;
