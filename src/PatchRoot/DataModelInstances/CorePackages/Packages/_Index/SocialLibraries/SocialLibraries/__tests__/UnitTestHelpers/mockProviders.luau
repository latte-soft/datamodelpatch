local v0 = require(script:FindFirstAncestor("Packages").Dev.RoactRodux);
local v1 = require(script.Parent.Parent.Parent.dependencies);
local l_Roact_0 = v1.Roact;
local l_Rodux_0 = v1.Rodux;
local v4 = require(script.Parent.mockStyle);
local v5 = require(script.Parent.mockNavigation);
local v6 = l_Rodux_0.Store.new(function()
    return {};
end, {}, {
    l_Rodux_0.thunkMiddleware
});
return function(v7, v8)
    v8 = v8 or {};
    return l_Roact_0.createElement(v0.StoreProvider, {
        store = v8.store or v6
    }, {
        children = v4((v8.mockNavigation or v5)(v7))
    });
end;
