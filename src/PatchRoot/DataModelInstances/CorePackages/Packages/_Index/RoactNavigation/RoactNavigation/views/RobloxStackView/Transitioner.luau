local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.Otter);
local v7 = require(script.Parent.ScenesReducer);
local v8 = require(l_Parent_0.utils.invariant);
local v9 = {
    frequency = 4
};
local function v20(v10, v11)
    local l_navigation_0 = v10.navigation;
    local l_options_0 = v10.options;
    local l_layout_0 = v11.layout;
    local l_position_0 = v11.position;
    local l_scenes_0 = v11.scenes;
    local v17 = nil;
    for _, v19 in l_scenes_0, nil, nil do
        if v19.isActive then
            v17 = v19;
            break;
        end;
    end;
    v8(v17, "Could not find active scene");
    return {
        layout = l_layout_0, 
        navigation = l_navigation_0, 
        position = l_position_0, 
        scenes = l_scenes_0, 
        scene = v17, 
        options = l_options_0, 
        index = v17.index
    };
end;
local function _(v21)
    local v23 = l_Array_0.filter(v21, function(v22)
        return not v22.isStale;
    end);
    if #v23 == #v21 then
        return v21;
    else
        return v23;
    end;
end;
local v25 = v5.Component:extend("Transitioner");
v25.init = function(v26)
    local l_state_0 = v26.props.navigation.state;
    local l_descriptors_0 = v26.props.descriptors;
    v26._ref = v5.createRef();
    v26.state = {
        layout = {
            initWidth = 0, 
            initHeight = 0, 
            isMeasured = false
        }, 
        position = v6.createSingleMotor(l_state_0.index), 
        scenes = v7({}, l_state_0, nil, l_descriptors_0)
    };
    v26._doOnAbsoluteSizeChanged = function(...)
        return v26:_onAbsoluteSizeChanged(...);
    end;
    v26._positionLastValue = l_state_0.index;
    v26._prevTransitionProps = nil;
    v26._transitionProps = v20(v26.props, v26.state);
    v26._isMounted = false;
    v26._isTransitionRunning = false;
    v26._transitionQueue = {};
    v26._completeSignalDisconnector = v26.state.position:onComplete(function()
        if v26._isMounted then
            v26:_onTransitionEnd();
        end;
    end);
    v26._stepSignalDisconnector = v26.state.position:onStep(function(v29)
        if v26._isMounted then
            v26:_onPositionStep(v29);
        end;
    end);
end;
v25.didMount = function(v30)
    v30._isMounted = true;
end;
v25.willUnmount = function(v31)
    v31._isMounted = false;
    if v31._completeSignalDisconnector then
        v31._completeSignalDisconnector();
        v31._completeSignalDisconnector = nil;
    end;
    if v31._stepSignalDisconnector then
        v31._stepSignalDisconnector();
        v31._stepSignalDisconnector = nil;
    end;
end;
v25.didUpdate = function(v32, v33)
    if not (v32.state.layout.isMeasured or not v32._ref.current) then
        v32:_onAbsoluteSizeChanged(v32._ref.current);
    end;
    if v32.props ~= v33 then
        if not v32._isTransitionRunning then
            v32:_startTransition(v33, v32.props);
        else
            if (v32._transitionQueue[#v32._transitionQueue] or {}).prevProps ~= v33 then
                table.insert(v32._transitionQueue, {
                    prevProps = v33
                });
            end;
            return ;
        end;
    end;
end;
v25.render = function(v34)
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = false, 
        [v5.Change.AbsoluteSize] = v34._doOnAbsoluteSizeChanged, 
        ref = v34._ref
    }, {
        TransitionerScenes = v34.props.render(v34._transitionProps, v34._prevTransitionProps, v34)
    });
end;
v25._onAbsoluteSizeChanged = function(v35, v36)
    if v35._isMounted then
        local l_X_0 = v36.AbsoluteSize.X;
        local l_Y_0 = v36.AbsoluteSize.Y;
        if l_X_0 == v35.state.layout.initWidth and l_Y_0 == v35.state.layout.initHeight then
            return ;
        else
            local v39 = l_Object_0.assign(table.clone(v35.state.layout), {
                initWidth = l_X_0, 
                initHeight = l_Y_0, 
                isMeasured = true
            });
            v35._transitionProps = v20(v35.props, (l_Object_0.assign(table.clone(v35.state), {
                layout = v39
            })));
            v35:setState({
                layout = v39
            });
            return ;
        end;
    else
        return ;
    end;
end;
v25._computeScenes = function(v40, v41, v42)
    local v43 = v7(v40.state.scenes, v42.navigation.state, v41.navigation.state, v42.descriptors);
    if not v42.navigation.state.isTransitioning then
        local l_v43_0 = v43;
        local v46 = l_Array_0.filter(l_v43_0, function(v45)
            return not v45.isStale;
        end);
        v43 = if #v46 == #l_v43_0 then l_v43_0 else v46;
    end;
    if v42.screenProps ~= v40.props.screenProps then
        v40:setState({
            scenes = v43
        });
    end;
    if v43 == v40.state.scenes then
        return nil;
    else
        return v43;
    end;
end;
v25._startTransition = function(v47, v48, v49)
    local v50 = v48.navigation.state.index ~= v49.navigation.state.index;
    local v51 = v47:_computeScenes(v48, v49);
    if v51 then
        local v52 = l_Object_0.assign(table.clone(v47.state), {
            scenes = v51
        });
        local l_position_1 = v52.position;
        local l_index_0 = v49.navigation.state.index;
        v47._prevTransitionProps = v47._transitionProps;
        v47._transitionProps = v20(v49, v52);
        local l_isTransitioning_0 = v47._transitionProps.navigation.state.isTransitioning;
        if not (not l_isTransitioning_0 or not v50) then
            v47._isTransitionRunning = true;
        end;
        v47:setState(v52, function()
            if not l_isTransitioning_0 or not v50 then
                if v49.onTransitionStart then
                    v49.onTransitionStart(v47._transitionProps, v47._prevTransitionProps);
                end;
                l_position_1:setGoal(v6.instant(l_index_0));
                return ;
            else
                if v49.onTransitionStart then
                    v49.onTransitionStart(v47._transitionProps, v47._prevTransitionProps);
                end;
                if not (v47._positionLastValue ~= l_index_0) then
                    l_position_1:setGoal(v6.instant(v49.navigation.state.index));
                    return ;
                else
                    local v56 = {};
                    if v49.configureTransition then
                        v56 = v49.configureTransition(v47._transitionProps, v47._prevTransitionProps) or {};
                    end;
                    l_position_1:setGoal(v6.spring(v49.navigation.state.index, (l_Object_0.assign(table.clone(v9), v56))));
                    return ;
                end;
            end;
        end);
        return ;
    else
        v47._prevTransitionProps = v47._transitionProps;
        if v47._isTransitionRunning then
            v47:_onTransitionEnd();
        end;
        return ;
    end;
end;
v25._onTransitionEnd = function(v57)
    local l__prevTransitionProps_0 = v57._prevTransitionProps;
    v57._prevTransitionProps = nil;
    local l_scenes_1 = v57.state.scenes;
    local v61 = l_Array_0.filter(l_scenes_1, function(v60)
        return not v60.isStale;
    end);
    l_scenes_1 = l_Object_0.assign(table.clone(v57.state), {
        scenes = if #v61 == #l_scenes_1 then l_scenes_1 else v61
    });
    v57._transitionProps = v20(v57.props, l_scenes_1);
    v57:setState(l_scenes_1, function()
        if v57.props.onTransitionEnd then
            v57.props.onTransitionEnd(v57._transitionProps, l__prevTransitionProps_0);
        end;
        local v62 = v57._transitionQueue[1];
        if not v62 then
            v57._isTransitionRunning = false;
            return ;
        else
            local l_prevProps_0 = v62.prevProps;
            v57._transitionQueue = table.clone(v57._transitionQueue);
            table.remove(v57._transitionQueue, 1);
            v57:_startTransition(l_prevProps_0, v57.props);
            return ;
        end;
    end);
end;
v25._onPositionStep = function(v64, v65)
    v64._positionLastValue = v65;
    local l_index_1 = v64._transitionProps.index;
    local l_l_index_1_0 = l_index_1;
    if v64._prevTransitionProps then
        l_l_index_1_0 = v64._prevTransitionProps.index;
    end;
    if v64.props.onTransitionStep and l_l_index_1_0 ~= l_index_1 then
        v64.props.onTransitionStep(v64._transitionProps, v64._prevTransitionProps, (v65 - l_l_index_1_0) / (l_index_1 - l_l_index_1_0));
    end;
end;
return v25;
