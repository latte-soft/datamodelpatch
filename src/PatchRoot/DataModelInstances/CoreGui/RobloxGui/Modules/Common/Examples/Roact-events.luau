local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Roact);
local v2 = v1.Component:extend("App");
v2.render = function(_)
    return v1.createElement("ScreenGui", {}, {
        Button = v1.createElement("TextButton", {
            Size = UDim2.new(0.5, 0, 0.5, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            [v1.Event.Activated] = function(_)
                print("The button was clicked");
            end
        })
    });
end;
return function()
    v1.mount(v1.createElement(v2), l_CoreGui_0, "Roact-events");
end;
