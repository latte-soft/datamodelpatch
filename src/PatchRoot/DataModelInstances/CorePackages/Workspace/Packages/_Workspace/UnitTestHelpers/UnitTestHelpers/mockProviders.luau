local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(script.Parent.mockPolicyProvider);
local v5 = require(script.Parent.mockStyle);
local v6 = require(script.Parent.mockLocale);
local v7 = require(script.Parent.mockNavigation);
local v8 = require(script.Parent.mockDesignTokens);
local v9 = v2.Store.new(function()
    return {};
end, {}, {
    v2.thunkMiddleware
});
return function(v10, v11)
    v11 = v11 or {};
    return v1.createElement(v3.StoreProvider, {
        store = v11.store or v9
    }, {
        children = v4(v5(v8(v6((v11.mockNavigation or v7)(v10)), v11.tokenMappers or {})), v11.appPolicy)
    });
end;
