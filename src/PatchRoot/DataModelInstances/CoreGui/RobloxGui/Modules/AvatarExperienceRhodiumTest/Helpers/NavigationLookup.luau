local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactNavigation);
local v4 = {};
v4.__index = v4;
v4.new = function()
    local v5 = {
        routeToNavProp = {}
    };
    setmetatable(v5, v4);
    return v5;
end;
v4.reset = function(v6)
    v6.routeToNavProp = {};
end;
v4.onRender = function(v7, v8)
    local l_navigation_0 = v8.navigation;
    v7.routeToNavProp[l_navigation_0.state.routeName] = l_navigation_0;
end;
v4.makeComponent = function(v10)
    return v3.withNavigation(function(v11)
        v10:onRender(v11);
        return nil;
    end);
end;
v4.waitForRoute = function(v12, v13)
    for _ = 1, 10 do
        local v15 = v12.routeToNavProp[v13];
        if not (not (not v15 or not v15.state) and v15.state.routeName == v13) or not v15.isFocused() then
            l_RunService_0.Stepped:Wait();
        else
            return v15;
        end;
    end;
    return nil;
end;
v4.dump = function(v16)
    print("NavigationLookup encountered routes:");
    for v17, _ in v16.routeToNavProp, nil, nil do
        print("    " .. tostring(v17));
    end;
    print();
end;
v4.createAppContainerWrapper = function(v19, v20)
    local v21 = ("NavLookup(%s)"):format((tostring(v19)));
    local v22 = {
        navigation = nil, 
        component = nil
    };
    local v23 = v2.Component:extend(v21);
    v23.render = function(v24)
        v22.navigation = v24.props.navigation;
        return v2.createElement(v19, {
            navigation = v24.props.navigation
        });
    end;
    v23.router = v20 or v19.router;
    v22.component = function()
        return v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            AppContainer = v2.createElement(v3.createAppContainer(v23))
        });
    end;
    return v22;
end;
return v4;
