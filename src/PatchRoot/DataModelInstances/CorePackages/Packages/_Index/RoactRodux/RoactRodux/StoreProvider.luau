local v0 = require(script.Parent.Parent.Roact);
local v1 = require(script.Parent.StoreContext);
local v2 = v0.Component:extend("StoreProvider");
v2.validateProps = function(v3)
    if v3.store == nil then
        return false, "Error initializing StoreProvider. Expected a `store` prop to be a Rodux store.";
    else
        return true;
    end;
end;
v2.init = function(v4, v5)
    v4.store = v5.store;
end;
v2.render = function(v6)
    return v0.createElement(v1.Provider, {
        value = v6.store
    }, v0.oneChild(v6.props[v0.Children]));
end;
return v2;
