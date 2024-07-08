local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Roact);
local l_SceneView_0 = require(l_CorePackages_0.RoactNavigation).SceneView;
local v4 = {
    keepVisitedScreensMounted = false
};
local v5 = v2.Component:extend("PreloadingSwitchView");
local v6 = require(l_CorePackages_0.Packages.t);
v5.validateProps = v6.interface({
    navigation = v6.interface({
        state = v6.interface({
            index = v6.number, 
            routes = v6.array(v6.table)
        })
    }), 
    navigationConfig = v6.optional(v6.interface({
        keepVisitedScreensMounted = v6.optional(v6.boolean)
    })), 
    screenProps = v6.optional(v6.any), 
    descriptors = v6.table
});
v5.getDerivedStateFromProps = function(v7, v8)
    local l_state_0 = v7.navigation.state;
    local l_key_0 = l_state_0.routes[l_state_0.index].key;
    local l_descriptors_0 = v7.descriptors;
    local l_keepVisitedScreensMounted_0 = v1.Dictionary.join(v4, v7.navigationConfig or {}).keepVisitedScreensMounted;
    local v13 = {
        [l_key_0] = true
    };
    if l_keepVisitedScreensMounted_0 then
        local v14 = v8.visitedScreenKeys or {};
        for v15 in v14, nil, nil do
            if l_descriptors_0[v15] ~= nil then
                v13[v15] = true;
            end;
        end;
    end;
    return {
        visitedScreenKeys = v13
    };
end;
local function _(v16)
    return v16.options and v16.options.alwaysRendered;
end;
v5.render = function(v18)
    local l_state_1 = v18.props.navigation.state;
    local l_screenProps_0 = v18.props.screenProps;
    local l_descriptors_1 = v18.props.descriptors;
    local l_visitedScreenKeys_0 = v18.state.visitedScreenKeys;
    local l_key_1 = l_state_1.routes[l_state_1.index].key;
    local v24 = {};
    for v25, v26 in l_descriptors_1, nil, nil do
        local v27 = v25 == l_key_1;
        if not (l_visitedScreenKeys_0[v25] ~= true and not (v26.options and v26.options.alwaysRendered)) then
            v24["card_" .. v25] = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = false, 
                BorderSizePixel = 0, 
                Visible = v27
            }, {
                Content = v2.createElement(l_SceneView_0, {
                    component = v26.getComponent(), 
                    navigation = v26.navigation, 
                    screenProps = l_screenProps_0
                })
            });
        end;
    end;
    return v2.createElement("Folder", nil, v24);
end;
return v5;
