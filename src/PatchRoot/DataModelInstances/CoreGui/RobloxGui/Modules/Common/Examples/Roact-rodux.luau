local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = v2.Component:extend("App");
v5.render = function(v6)
    return v2.createElement("ScreenGui", nil, {
        Label = v2.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            Text = "Count: " .. tostring(v6.props.count), 
            TextSize = 48, 
            AutoButtonColor = false, 
            [v2.Event.Activated] = v6.props.onClick
        })
    });
end;
v5 = v4.connect(function(v7, _)
    return {
        count = v7.count
    };
end, function(v9)
    print("hello?");
    return {
        onClick = function()
            v9({
                type = "increment"
            });
        end
    };
end)(v5);
local function v12(v10, v11)
    v10 = v10 or {
        count = 0
    };
    if v11.type == "increment" then
        return {
            count = v10.count + 1
        };
    else
        return v10;
    end;
end;
return function()
    v2.mount(v2.createElement(v4.StoreProvider, {
        store = v3.Store.new(v12)
    }, {
        App = v2.createElement(v5)
    }), l_CoreGui_0, "Roact-demo-rodux");
end;
