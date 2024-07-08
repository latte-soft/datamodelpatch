local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.ReactRoblox);
local v3 = require(l_CorePackages_0.Workspace.Packages.SocialTestHelpers);
local v4 = require(l_CorePackages_0.JestGlobals);
local v5 = require(l_CorePackages_0.LuaSocialLibrariesDeps);
local l_expect_0 = v4.expect;
local l_ApolloClientTestUtils_0 = require(l_CorePackages_0.Workspace.Packages.GraphQLServer).ApolloClientTestUtils;
l_expect_0.extend(v5.CollisionMatchers.Jest);
return {
    CollisionMatchers = v5.CollisionMatchers, 
    UnitTestHelpers = v3.TestHelpers, 
    NumberLocalization = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization, 
    mockServices = require(l_Modules_0.LuaApp.TestHelpers.mockServices), 
    jestExpect = l_expect_0, 
    jest = v4.jest, 
    RhodiumHelpers = require(l_CorePackages_0.Workspace.Packages.RhodiumHelpers), 
    LuaUnitTestHelpers = require(l_CorePackages_0.Workspace.Packages.UnitTestHelpers), 
    RunService = game:GetService("RunService"), 
    Mock = v5.Mock, 
    DarkTheme = require(l_CorePackages_0.Workspace.Packages.Style).Themes.DarkTheme, 
    createTreeWithProviders = v3.TestHelpers.createTreeWithProviders, 
    findImageSet = v3.TestHelpers.findImageSet, 
    act = v2.act, 
    DeferredLuaHelpers = require(l_CorePackages_0.Workspace.Packages.TestUtils).DeferredLuaHelpers, 
    ReactRoblox = require(l_CorePackages_0.Packages.ReactRoblox), 
    ApolloClientTestUtils = l_ApolloClientTestUtils_0
};
