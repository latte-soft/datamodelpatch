local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_1.Events);
local v6 = require(l_Parent_0.withNavigation);
local function _(v7)
    local v8 = type(v7);
    local v9 = true;
    if v8 ~= "function" then
        v9 = v8 == "table";
    end;
    return v9;
end;
return function(v11)
    local v12 = type(v11);
    local v13 = true;
    if v12 ~= "function" then
        v13 = v12 == "table";
    end;
    assert(v13, "withNavigationFocus must be called with a Roact component (stateful or functional)");
    local v14 = v4.Component:extend("NavigationFocusComponent");
    v14.init = function(v15)
        v15.state = {
            isFocused = v15.props.navigation.isFocused()
        };
    end;
    v14.didMount = function(v16)
        local l_navigation_0 = v16.props.navigation;
        v16.subscriptions = {
            l_navigation_0.addListener(v5.WillFocus, function()
                v16:setState({
                    isFocused = true
                });
            end), 
            l_navigation_0.addListener(v5.WillBlur, function()
                v16:setState({
                    isFocused = false
                });
            end)
        };
    end;
    v14.willUnmount = function(v18)
        for _, v20 in v18.subscriptions, nil, nil do
            v20.remove();
        end;
    end;
    v14.render = function(v21)
        return v4.createElement(v11, l_Object_0.assign(table.clone(v21.props), {
            isFocused = v21.state.isFocused
        }));
    end;
    return v6(v14, {
        forwardRef = false
    });
end;
