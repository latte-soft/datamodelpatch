local v0 = require(script.Parent.Parent.Parent.Parent.React);
local v1 = require(script.Parent.Parent.SceneView);
return function(v2)
    local l_state_0 = v2.navigation.state;
    local v4 = v2.descriptors[l_state_0.routes[l_state_0.index].key];
    return v0.createElement(v1, {
        component = v4.getComponent(), 
        navigation = v4.navigation, 
        screenProps = v2.screenProps
    });
end;
