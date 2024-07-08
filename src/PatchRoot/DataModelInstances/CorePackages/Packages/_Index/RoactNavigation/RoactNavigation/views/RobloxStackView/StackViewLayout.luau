local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_0.StackPresentationStyle);
local v6 = require(l_Parent_0.StackViewTransitionConfigs);
local v7 = require(l_Parent_0.StackViewOverlayFrame);
local v8 = require(l_Parent_0.StackViewCard);
local v9 = require(l_Parent_1.SceneView);
local v13 = {
    absorbInput = true, 
    absorbInputSelectable = true, 
    overlayEnabled = false, 
    overlayColor3 = Color3.new(0, 0, 0), 
    overlayTransparency = 0.7, 
    renderOverlay = function(v10, v11, v12)
        return v4.createElement(v7, {
            navigationOptions = v10, 
            initialTransitionValue = v11, 
            transitionChangedSignal = v12
        });
    end, 
    transparent = false
};
local function _(v14, v15)
    return (math.max(math.min((1 + v15) - v14, 1), 0));
end;
local v17 = v4.Component:extend("StackViewLayout");
v17.init = function(v18)
    v18:setState({});
    local l_index_0 = v18.props.transitionProps.navigation.state.index;
    v18._isMounted = false;
    v18._positionLastValue = l_index_0;
    v18._renderScene = function(v20)
        return v18:_renderInnerScene(v20);
    end;
    v18._subscribeToOverlayUpdates = function(v21)
        local l_position_0 = v18.props.transitionProps.position;
        local l_index_1 = v18.props.transitionProps.scene.index;
        return l_position_0:onStep(function(v24)
            v21((math.max(math.min((1 + v24) - l_index_1, 1), 0)));
        end);
    end;
end;
v17._renderCard = function(v25, v26, v27)
    local l_transitionProps_0 = v25.props.transitionProps;
    local l_lastTransitionProps_0 = v25.props.lastTransitionProps;
    local l_transitionConfig_0 = v25.state.transitionConfig;
    local l_cardColor3_0 = v27.cardColor3;
    local l_overlayEnabled_0 = v27.overlayEnabled;
    local l_transparent_0 = v27.transparent;
    local l_index_2 = l_transitionProps_0.scene.index;
    if l_lastTransitionProps_0 then
        l_index_2 = l_lastTransitionProps_0.scene.index;
    end;
    local v35 = {};
    local l_screenInterpolator_0 = l_transitionConfig_0.screenInterpolator;
    if l_screenInterpolator_0 then
        v35 = l_screenInterpolator_0(l_Object_0.assign(table.clone(l_transitionProps_0), {
            initialPositionValue = l_index_2, 
            scene = v26
        }));
    end;
    return v4.createElement(v8, l_Object_0.assign(table.clone(l_transitionProps_0), v35, {
        key = "card_" .. tostring(v26.key), 
        scene = v26, 
        renderScene = v25._renderScene, 
        cardColor3 = if l_overlayEnabled_0 or l_transparent_0 then nil else l_cardColor3_0
    }));
end;
v17._renderInnerScene = function(v37, v38)
    return v4.createElement(v9, {
        screenProps = v37.props.screenProps, 
        navigation = v38.descriptor.navigation, 
        component = v38.descriptor.getComponent()
    });
end;
v17.render = function(v39)
    local l_transitionProps_1 = v39.props.transitionProps;
    local l_topMostOpaqueSceneIndex_0 = v39.state.topMostOpaqueSceneIndex;
    local l_scenes_0 = l_transitionProps_1.scenes;
    local v43 = {};
    for _, v45 in l_scenes_0, nil, nil do
        local v46 = false;
        if v45.index < l_topMostOpaqueSceneIndex_0 then
            v46 = not v45.isActive;
        end;
        local v47 = if not v45.descriptor.options then table.clone(v13) else l_Object_0.assign(table.clone(v13), v45.descriptor.options);
        local l_overlayEnabled_1 = v47.overlayEnabled;
        local l_absorbInput_0 = v47.absorbInput;
        local l_absorbInputSelectable_0 = v47.absorbInputSelectable;
        local l_renderOverlay_0 = v47.renderOverlay;
        local v52 = nil;
        if l_overlayEnabled_1 then
            v52 = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                BorderSizePixel = 0, 
                ZIndex = 1
            }, {
                Overlay = l_renderOverlay_0(v47, math.max(math.min((1 + v39._positionLastValue) - v45.index, 1), 0), v39._subscribeToOverlayUpdates)
            });
        end;
        local v53 = nil;
        if not (v46 or not l_absorbInput_0) then
            v53 = v4.createElement("TextButton", {
                Active = true, 
                Selectable = l_absorbInputSelectable_0, 
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = " ", 
                ZIndex = 2 * v45.index - 1
            });
        end;
        v43[tostring(v45.key)] = v4.createElement(v4.Fragment, {}, {
            AbsorbInput = v53, 
            [tostring(v45.index)] = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClipsDescendants = false, 
                ZIndex = 2 * v45.index, 
                Visible = not v46
            }, {
                StationaryContent = v52, 
                DynamicContent = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = false, 
                    BorderSizePixel = 0, 
                    ZIndex = 2
                }, {
                    ["card_" .. v45.key] = v39:_renderCard(v45, v47)
                })
            })
        });
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        BorderSizePixel = 0
    }, v43);
end;
v17.getDerivedStateFromProps = function(v54, _)
    local l_transitionProps_2 = v54.transitionProps;
    local l_scenes_1 = l_transitionProps_2.scenes;
    local l_isTransitioning_0 = l_transitionProps_2.navigation.state.isTransitioning;
    local v59 = #l_scenes_1;
    local v60 = true;
    if v54.mode ~= v5.Modal then
        v60 = v54.mode == v5.Overlay;
    end;
    local v61 = 0;
    for v62 = v59, 1, -1 do
        local v63 = l_scenes_1[v62];
        local v64 = if not v63.descriptor.options then table.clone(v13) else l_Object_0.assign(table.clone(v13), v63.descriptor.options);
        if not (v64.transparent or v60 and v64.overlayEnabled) and (not l_isTransitioning_0 or v62 ~= v59) then
            v61 = v62;
            break;
        end;
    end;
    return {
        topMostOpaqueSceneIndex = v61, 
        transitionConfig = v6.getTransitionConfig(v54.transitionConfig, v54.transitionProps, v54.lastTransitionProps, v54.mode)
    };
end;
v17.didMount = function(v65)
    v65._isMounted = true;
    v65._positionDisconnector = v65.props.transitionProps.position:onStep(function(...)
        v65:_onPositionStep(...);
    end);
end;
v17.willUnmount = function(v66)
    v66._isMounted = false;
    if v66._positionDisconnector then
        v66._positionDisconnector();
        v66._positionDisconnector = nil;
    end;
end;
v17.didUpdate = function(v67, v68)
    local l_position_1 = v67.props.transitionProps.position;
    if l_position_1 ~= v68.transitionProps.position then
        v67._positionDisconnector();
        v67._positionDisconnector = l_position_1:onStep(function(...)
            v67:_onPositionStep(...);
        end);
    end;
end;
v17._onPositionStep = function(v70, v71)
    if v70._isMounted then
        v70._positionLastValue = v71;
    end;
end;
return v17;
