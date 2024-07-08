local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Parent.React);
local v2 = require(l_Parent_0.NavigationContext);
local v3 = v1.PureComponent:extend("SceneView");
v3.render = function(v4)
    local l_screenProps_0 = v4.props.screenProps;
    local l_component_0 = v4.props.component;
    local l_navigation_0 = v4.props.navigation;
    return v1.createElement(v2.Provider, {
        value = l_navigation_0
    }, {
        Scene = v1.createElement(l_component_0, {
            screenProps = l_screenProps_0, 
            navigation = l_navigation_0
        })
    });
end;
return v3;
