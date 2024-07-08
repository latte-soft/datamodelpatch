local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.utils.invariant);
local v3 = v1.Component:extend("StackViewCard");
v3.init = function(v4)
    local l_index_0 = v4.props.navigation.state.index;
    v4._isMounted = false;
    v4._positionLastValue = l_index_0;
    v4._ref = v1.createRef();
end;
v3.render = function(v6)
    local l_forceHidden_0 = v6.props.forceHidden;
    local l_cardColor3_0 = v6.props.cardColor3;
    local l_initialPosition_0 = v6.props.initialPosition;
    local l_renderScene_0 = v6.props.renderScene;
    local l_scene_0 = v6.props.scene;
    v2(type(l_renderScene_0) == "function", "renderScene must be a function");
    return v1.createElement("Frame", {
        Position = l_initialPosition_0, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_cardColor3_0, 
        BackgroundTransparency = l_cardColor3_0 == nil and 1 or nil, 
        BorderSizePixel = 0, 
        ClipsDescendants = false, 
        Visible = not l_forceHidden_0, 
        ref = v6._ref
    }, {
        Content = l_renderScene_0(l_scene_0)
    });
end;
v3.didMount = function(v12)
    v12._isMounted = true;
    v12._positionDisconnector = v12.props.position:onStep(function(...)
        v12:_onPositionStep(...);
    end);
end;
v3.willUnmount = function(v13)
    v13._isMounted = false;
    if v13._positionDisconnector then
        v13._positionDisconnector();
        v13._positionDisconnector = nil;
    end;
end;
v3.didUpdate = function(v14, v15)
    local l_position_0 = v14.props.position;
    local l_positionStep_0 = v14.props.positionStep;
    if l_position_0 ~= v15.position then
        v14._positionDisconnector();
        v14._positionDisconnector = l_position_0:onStep(function(...)
            v14:_onPositionStep(...);
        end);
    end;
    if l_positionStep_0 ~= v15.positionStep then
        v14:_onPositionStep(v14._positionLastValue);
    end;
end;
v3._onPositionStep = function(v18, v19)
    if v18._isMounted then
        local l_positionStep_1 = v18.props.positionStep;
        if l_positionStep_1 then
            l_positionStep_1(v18._ref, v19);
        end;
        v18._positionLastValue = v19;
        return ;
    else
        return ;
    end;
end;
return v3;
