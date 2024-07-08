local v0 = require(game:GetService("CorePackages").Roact);
local v1 = v0.Component:extend("ContextProvider");
v1.init = function(v2)
    v2._context = {
        someValue = 5
    };
end;
v1.render = function(v3)
    return v0.oneChild(v3.props[v0.Children]);
end;
local v4 = v0.Component:extend("ContextReader");
v4.init = function(v5)
    print("Context value of", v5._context.someValue);
end;
v4.render = function(_)
    return nil;
end;
return function()
    v0.mount(v0.createElement(v1, {}, {
        SomeChild = v0.createElement(v4)
    }), nil, "SomeName");
end;
