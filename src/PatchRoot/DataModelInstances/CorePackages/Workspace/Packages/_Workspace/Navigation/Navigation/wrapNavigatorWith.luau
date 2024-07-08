local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.React);
local _ = require(l_Parent_0.NavigationTypes);
return function(v3, v4)
    local v5 = v1.Component:extend("WrappedNavigator");
    v5.router = v3.router;
    v5.render = function(v6)
        return v1.createElement(v1.Fragment, nil, {
            Navigator = v1.createElement(v3, v6.props), 
            Component = v1.createElement(v4)
        });
    end;
    return v5;
end;
