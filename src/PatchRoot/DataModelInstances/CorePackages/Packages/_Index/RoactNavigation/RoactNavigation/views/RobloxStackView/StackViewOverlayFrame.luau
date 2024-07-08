local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.utils.lerp);
local v3 = v1.Component:extend("StackViewOverlayFrame");
v3.init = function(v4)
    v4._signalDisconnect = nil;
    v4._ref = v1.createRef();
end;
v3.render = function(v5)
    local l_navigationOptions_0 = v5.props.navigationOptions;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_navigationOptions_0.overlayColor3, 
        BackgroundTransparency = v2(1, l_navigationOptions_0.overlayTransparency, v5.props.initialTransitionValue), 
        BorderSizePixel = 0, 
        ref = v5._ref
    });
end;
v3.didUpdate = function(v7, v8)
    local l_transitionChangedSignal_0 = v7.props.transitionChangedSignal;
    if l_transitionChangedSignal_0 ~= v8.transitionChangedSignal then
        if v7._signalDisconnect then
            v7._signalDisconnect();
        end;
        v7._signalDisconnect = l_transitionChangedSignal_0(function(...)
            v7:_transitionChanged(...);
        end);
    end;
end;
v3.didMount = function(v10)
    v10._isMounted = true;
    v10._signalDisconnect = v10.props.transitionChangedSignal(function(...)
        v10:_transitionChanged(...);
    end);
end;
v3.willUnmount = function(v11)
    v11._isMounted = false;
    if v11._signalDisconnect then
        v11._signalDisconnect();
        v11._signalDisconnect = nil;
    end;
end;
v3._transitionChanged = function(v12, v13)
    if v12._isMounted then
        if v12._ref.current then
            v12._ref.current.BackgroundTransparency = v2(1, v12.props.navigationOptions.overlayTransparency, v13);
        end;
        return ;
    else
        return ;
    end;
end;
return v3;
