local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v6 = require(l_Parent_0.Reducers.InspectAndBuyReducer);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.CompactView);
local v9 = require(l_Parent_0.WideView);
local v10 = require(l_Parent_1.Common.renderWithCoreScriptsStyleProvider);
local v11 = require(l_Parent_0.Components.InspectAndBuyContext);
local v12 = v1.Component:extend("TestContainer");
v12.init = function(v13)
    v13.store = v13.props.overrideStore or v2.Store.new(v6, {}, {
        v2.thunkMiddleware
    });
    v13.views = {};
    v13.views[v7.View.Compact] = v8;
    v13.views[v7.View.Wide] = v9;
end;
v12.render = function(v14)
    local v15 = 0;
    for _, _ in v14.props[v1.Children], nil, nil do
        v15 = v15 + 1;
    end;
    assert(v15 > 0, "TestContainer: no children provided, nothing will be tested");
    return v1.createElement(v11.Provider, {
        value = v14.views
    }, {
        v1.createElement(v3.StoreProvider, {
            store = v14.store
        }, {
            ThemeProvider = v10({
                InspectMenu = v1.createElement("ScreenGui", {}, v14.props[v1.Children])
            })
        })
    });
end;
return v12;
