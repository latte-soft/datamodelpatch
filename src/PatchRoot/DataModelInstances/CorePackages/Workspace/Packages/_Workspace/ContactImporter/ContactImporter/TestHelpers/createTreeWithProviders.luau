local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dev.JestGlobals);
local l_createTreeWithProviders_0 = require(l_Parent_1.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders;
local v4 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v5 = require(l_Parent_0.dependencies);
local v6 = require(l_Parent_0.TestHelpers.mockAnalytics);
local v7 = require(l_Parent_0.Analytics);
local l_Roact_0 = v5.Roact;
local l_React_0 = v5.React;
local l_RoactExperimentProvider_0 = v5.RoactExperimentProvider;
local l_MagicMock_0 = v4.Mock.MagicMock;
local l_RoactNavigation_0 = v5.RoactNavigation;
local v13 = require(l_Parent_1.RoactRodux);
local v14 = require(l_Parent_1.Rodux);
local v15 = v14.Store.new(function()
    return {};
end, {}, {
    v14.thunkMiddleware
});
return function(v16, v17)
    local v18 = v6({
        uid = "123"
    }, v2.jest);
    return l_Roact_0.createElement(l_RoactNavigation_0.Provider, {
        value = v17.navigation or l_MagicMock_0.new()
    }, {
        storeProvider = l_Roact_0.createElement(v13.StoreProvider, {
            store = v17.store or v15
        }, {
            l_React_0.createElement(l_RoactExperimentProvider_0, {
                value = if not v17.experiment then l_MagicMock_0.new() else v17.experiment
            }, {
                Element = l_Roact_0.createElement(v7.Context.Provider, {
                    value = if not v17.mockAnalytics then v18.value else v17.mockAnalytics
                }, {
                    Element = l_createTreeWithProviders_0(v16, v17)
                })
            })
        })
    }), v18;
end;
