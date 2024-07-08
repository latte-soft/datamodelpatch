local l_Parent_0 = script:FindFirstAncestor("Squads").Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v2 = require(l_Parent_0.Dev.JestGlobals);
local l_expect_0 = v2.expect;
l_expect_0.extend(v1.CollisionMatchers.Jest);
return {
    DeferredLuaHelpers = require(l_Parent_0.Dev.TestUtils).DeferredLuaHelpers, 
    JestGlobals = v2, 
    Mock = v1.Mock, 
    ReactRoblox = require(l_Parent_0.Dev.ReactRoblox), 
    Rhodium = require(l_Parent_0.Dev.Rhodium), 
    RhodiumHelpers = function()
        return require(l_Parent_0.Dev.RhodiumHelpers);
    end, 
    UnitTestHelpers = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers, 
    createTreeWithProviders = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders, 
    findImageSet = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers.findImageSet, 
    jest = v2.jest, 
    jestExpect = l_expect_0
};
