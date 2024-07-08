local v0 = require(game:GetService("CorePackages").Roact);
local v1 = v0.Component:extend("App");
v1.init = function(v2)
    v2.ref = v0.createRef();
end;
v1.render = function(v3)
    return v0.createElement("Frame", {
        Size = UDim2.new(0, 123, 0, 123), 
        [v0.Ref] = v3.ref
    });
end;
v1.didMount = function(v4)
    print("Roblox Instance:", v4.ref.current);
    print("Roblox Instance Size:", v4.ref.current.Size);
end;
return function()
    v0.mount(v0.createElement(v1), nil, "SomeName");
end;
