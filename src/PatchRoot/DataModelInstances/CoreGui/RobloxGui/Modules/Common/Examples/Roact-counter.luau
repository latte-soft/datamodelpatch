local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Roact);
local function v3(v2)
    return v1.createElement("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0), 
        Text = ("Current tick is %dformat(v2.value), 
        TextSize = 48
    });
end;
local v4 = v1.Component:extend("App");
v4.init = function(v5)
    v5.running = false;
    v5.state = {
        count = 0
    };
end;
v4.render = function(v6)
    return v1.createElement("ScreenGui", {
        Name = "Roact-demo-counter"
    }, {
        Count = v1.createElement(v3, {
            value = v6.state.count
        })
    });
end;
v4.didMount = function(v7)
    spawn(function()
        v7.running = true;
        while v7.running do
            v7:setState({
                count = v7.state.count + 1
            });
            wait(1);
        end;
    end);
end;
v4.willUnmount = function(v8)
    v8.running = false;
end;
return function()
    v1.mount(v1.createElement(v4), l_CoreGui_0, "Roact-counter");
end;
