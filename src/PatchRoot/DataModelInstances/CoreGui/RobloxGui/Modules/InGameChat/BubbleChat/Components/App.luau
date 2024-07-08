local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(script.Parent.BubbleChatBillboards);
local v5 = v1.Component:extend("App");
v5.validateProps = v2.strictInterface({
    store = v2.table
});
v5.render = function(v6)
    return v1.createElement(v3.StoreProvider, {
        store = v6.props.store
    }, {
        BubbleChatBillboards = v1.createElement(v4)
    });
end;
return v5;
