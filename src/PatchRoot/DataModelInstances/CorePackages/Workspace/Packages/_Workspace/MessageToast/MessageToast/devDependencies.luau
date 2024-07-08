local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Dev.JestGlobals);
v1.expect.extend(require(l_Parent_0.Dev.LuaSocialLibrariesDeps).CollisionMatchers.Jest);
return {
    JestGlobals = v1, 
    UnitTestHelpers = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers, 
    Rhodium = require(l_Parent_0.Dev.Rhodium), 
    RhodiumHelpers = function()
        return require(l_Parent_0.Dev.RhodiumHelpers);
    end, 
    createTreeWithProviders = require(l_Parent_0.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders
};
