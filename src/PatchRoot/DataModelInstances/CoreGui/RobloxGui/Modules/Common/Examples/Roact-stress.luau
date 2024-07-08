local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(game:GetService("CorePackages").Roact);
local v3 = v2.Component:extend("Node");
v3.render = function(v4)
    local l_x_0 = v4.props.x;
    local l_y_0 = v4.props.y;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 10, 0, 10), 
        Position = UDim2.new(0, 10 * l_x_0, 0, 10 * l_y_0), 
        BackgroundColor3 = Color3.new(0.5 + 0.5 * math.sin((v4.props.time + l_x_0 / 10) + l_y_0 / 10), 0.5, 0.5)
    });
end;
local v7 = v2.Component:extend("App");
v7.init = function(v8)
    v8.state = {
        time = tick()
    };
end;
v7.render = function(v9)
    local l_time_0 = v9.state.time;
    local v11 = {};
    local v12 = 0;
    for v13 = 0, 49 do
        for v14 = 0, 49 do
            v12 = v12 + 1;
            v11[v12] = v2.createElement(v3, {
                x = v13, 
                y = v14, 
                time = l_time_0
            });
        end;
    end;
    return v2.createElement("ScreenGui", nil, v11);
end;
v7.didMount = function(v15)
    l_RunService_0.Stepped:Connect(function()
        v15:setState({
            time = tick()
        });
    end);
end;
return function()
    v2.mount(v2.createElement(v7), l_CoreGui_0);
end;
