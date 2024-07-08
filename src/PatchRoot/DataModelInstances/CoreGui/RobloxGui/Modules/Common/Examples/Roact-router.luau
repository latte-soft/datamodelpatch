local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Rodux);
local v5 = require(l_CorePackages_0.RoactRodux);
local v13 = v5.connect(function(v6, _)
    return {
        location = v6.location
    };
end, function(v8)
    return {
        onClick = function(v9)
            v8({
                type = "Navigate", 
                location = v9
            });
        end
    };
end)(function(v10)
    local l_text_0 = v10.text;
    local l_onClick_0 = v10.onClick;
    return v3.createElement("TextButton", {
        Size = UDim2.new(0, 100, 0, 30), 
        Text = l_text_0, 
        [v3.Event.Activated] = function()
            l_onClick_0(v10.target);
        end
    });
end);
local v20 = v5.connect(function(v14, _)
    return {
        enabled = #v14.history > 0
    };
end, function(v16)
    return {
        onClick = function()
            v16({
                type = "Back"
            });
        end
    };
end)(function(v17)
    local l_onClick_1 = v17.onClick;
    local l_enabled_0 = v17.enabled;
    return v3.createElement("TextButton", {
        Size = UDim2.new(0, 30, 0, 30), 
        Text = "<", 
        AutoButtonColor = l_enabled_0, 
        BackgroundColor3 = not not l_enabled_0 and Color3.new(0.8, 0.8, 0.8) or Color3.new(0.5, 0.5, 0.5), 
        [v3.Event.Activated] = l_onClick_1
    });
end);
local v27 = v5.connect(function(v21, _)
    return {
        current = v21.current
    };
end, nil)(function(v23)
    local l_current_0 = v23.current;
    local l_match_0 = v23.match;
    local l_component_0 = v23.component;
    if l_current_0 == l_match_0 then
        return v3.createElement(l_component_0);
    else
        return nil;
    end;
end);
local function v28()
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 30), 
        Position = UDim2.new(0, 0, 1, 0), 
        BackgroundColor3 = Color3.new(1, 1, 1)
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal
        }), 
        Back = v3.createElement(v20), 
        GoHome = v3.createElement(v13, {
            text = "Go to Home", 
            target = "home"
        }), 
        GoAbout = v3.createElement(v13, {
            text = "Go to About", 
            target = "about"
        }), 
        GoContact = v3.createElement(v13, {
            text = "Go to Contact", 
            target = "contact"
        })
    });
end;
local function v29()
    return v3.createElement("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = Color3.new(0.5, 0.3, 0.7), 
        Text = "Home", 
        TextSize = 30, 
        TextColor3 = Color3.new(0.95, 0.95, 0.95)
    });
end;
local function v30()
    return v3.createElement("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = Color3.new(0.5, 0.6, 0.2), 
        Text = "About", 
        TextSize = 30, 
        TextColor3 = Color3.new(0.95, 0.95, 0.95)
    });
end;
local function v31()
    return v3.createElement("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = Color3.new(0.8, 0.3, 0.4), 
        Text = "Contact", 
        TextSize = 30, 
        TextColor3 = Color3.new(0.95, 0.95, 0.95)
    });
end;
local v32 = v3.Component:extend("App");
v32.render = function(_)
    return v3.createElement("ScreenGui", {}, {
        Body = v3.createElement("Frame", {
            Size = UDim2.new(0, 600, 0, 400), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1
        }, {
            Home = v3.createElement(v27, {
                match = "home", 
                component = v29
            }), 
            About = v3.createElement(v27, {
                match = "about", 
                component = v30
            }), 
            Contact = v3.createElement(v27, {
                match = "contact", 
                component = v31
            }), 
            NavBar = v3.createElement(v28)
        })
    });
end;
local function v37(v34, v35)
    v34 = v34 or {
        current = "home", 
        history = {}
    };
    if v35.type == "Navigate" then
        if v34.current ~= v35.location then
            return {
                current = v35.location, 
                history = v2.List.join(v34.history, {
                    v34.current
                })
            };
        end;
    elseif v35.type == "Back" then
        local v36 = #v34.history;
        if v36 == 0 then
            return v34;
        else
            return {
                current = v34.history[v36], 
                history = v2.List.removeIndex(v34.history, v36)
            };
        end;
    end;
    return v34;
end;
return function()
    v3.mount(v3.createElement(v5.StoreProvider, {
        store = v4.Store.new(v37)
    }, {
        App = v3.createElement(v32)
    }), l_CoreGui_0, "Roact-router");
end;
