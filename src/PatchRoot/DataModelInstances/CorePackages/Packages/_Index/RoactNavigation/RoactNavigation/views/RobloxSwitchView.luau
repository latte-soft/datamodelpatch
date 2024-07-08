local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_0.SceneView);
local v5 = {
    keepVisitedScreensMounted = false
};
local v6 = v3.Component:extend("RobloxSwitchView");
v6.getDerivedStateFromProps = function(v7, v8)
    local l_state_0 = v7.navigation.state;
    local l_key_0 = l_state_0.routes[l_state_0.index].key;
    local l_descriptors_0 = v7.descriptors;
    local l_keepVisitedScreensMounted_0 = l_Object_0.assign(table.clone(v5), v7.navigationConfig or {}).keepVisitedScreensMounted;
    local v13 = {
        [l_key_0] = true
    };
    if not (not l_keepVisitedScreensMounted_0 or not v8.visitedScreenKeys) then
        for v14 in v8.visitedScreenKeys, nil, nil do
            if l_descriptors_0[v14] ~= nil then
                v13[v14] = true;
            end;
        end;
    end;
    return {
        visitedScreenKeys = v13
    };
end;
v6.init = function(v15)
    v15.state = {};
end;
v6.render = function(v16)
    local l_state_1 = v16.props.navigation.state;
    local l_screenProps_0 = v16.props.screenProps;
    local l_descriptors_1 = v16.props.descriptors;
    local l_visitedScreenKeys_0 = v16.state.visitedScreenKeys;
    local l_key_1 = l_state_1.routes[l_state_1.index].key;
    local v22 = {};
    for v23, v24 in l_descriptors_1, nil, nil do
        local v25 = v23 == l_key_1;
        if l_visitedScreenKeys_0[v23] == true then
            v22["card_" .. v23] = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = false, 
                BorderSizePixel = 0, 
                Visible = v25
            }, {
                Content = v3.createElement(v4, {
                    component = v24.getComponent(), 
                    navigation = v24.navigation, 
                    screenProps = l_screenProps_0
                })
            });
        end;
    end;
    return v3.createElement("Folder", nil, v22);
end;
return v6;
