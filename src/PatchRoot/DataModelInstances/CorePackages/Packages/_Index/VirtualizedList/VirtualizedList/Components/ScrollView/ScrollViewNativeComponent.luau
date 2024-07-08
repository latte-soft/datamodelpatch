local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_console_0 = v1.console;
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v5 = require(l_Parent_0.React);
local l_Change_0 = v5.Change;
local l_Event_0 = v5.Event;
local v8 = require(l_Parent_0.Otter);
local v9 = {
    restingPositionLimit = 1, 
    restingVelocityLimit = 10
};
local v10 = v5.Component:extend("ScrollViewNativeComponent");
v10.init = function(v11, v12)
    v11.props = v12;
    v11._nativeRef = v5.createRef();
    v11.lastScrollEventTime = 0;
    v11.animationConfig = if not v11.props.animationConfig then v9 else v11.props.animationConfig;
    v11.motor = v8.createGroupMotor({
        x = 0, 
        y = 0
    });
    v11.motorStepDisconnect = v11.motor:onStep(function(v13)
        v11._nativeRef.current.CanvasPosition = Vector2.new(v13.x, v13.y);
    end);
    v11._nativeRef.animateScrollTo = function(v14, v15)
        v11:_startAnimatedScroll(v14, v15);
    end;
end;
v10._validateAnimatedScrollInputs = function(v16, v17, v18)
    if not v16._nativeRef.current then
        l_console_0.error("scrollTo animation failed: ScrollViewNativeComponent._nativeRef instance is undefined");
    end;
    if v16._nativeRef.current.ScrollingDirection == Enum.ScrollingDirection.X then
        if v16._nativeRef.current.AbsoluteCanvasSize.X < v17 then
            l_console_0.warn("scrollTo animation goal out of bounds, setting X goal to: " .. tostring(v16._nativeRef.current.AbsoluteCanvasSize.X - v16._nativeRef.current.AbsoluteWindowSize.X));
            return ;
        elseif v17 < 0 then
            l_console_0.warn("scrollTo animation goal out of bounds, setting X goal to: 0");
            return ;
        end;
    elseif v16._nativeRef.current.AbsoluteCanvasSize.Y < v18 then
        l_console_0.warn("scrollTo animation goal out of bounds, setting Y goal to: " .. tostring(v16._nativeRef.current.AbsoluteCanvasSize.Y - v16._nativeRef.current.AbsoluteWindowSize.Y));
        return ;
    elseif v18 < 0 then
        l_console_0.warn("scrollTo animation goal out of bounds, setting Y goal to: 0");
    end;
end;
v10._startAnimatedScroll = function(v19, v20, v21)
    if _G.__DEV__ then
        v19:_validateAnimatedScrollInputs(v20, v21);
    end;
    local l_CanvasPosition_0 = v19._nativeRef.current.CanvasPosition;
    v19.motor:setGoal({
        x = v8.instant(l_CanvasPosition_0.X), 
        y = v8.instant(l_CanvasPosition_0.Y)
    });
    v19.motor:step(0);
    v19.motor:setGoal({
        x = v8.spring(v20, v19.animationConfig), 
        y = v8.spring(v21, v19.animationConfig)
    });
end;
v10.render = function(v23)
    return v5.createElement("ScrollingFrame", l_Object_0.assign({
        Name = "RCTScrollView", 
        ScrollingEnabled = not (v23.props.scrollEnabled ~= nil) or v23.props.scrollEnabled, 
        Size = UDim2.new(1, 0, 1, 0), 
        CanvasPosition = v23.props.CanvasPosition, 
        CanvasSize = v23.props.CanvasSize or UDim2.new(0, 0, 0, 0), 
        AutomaticCanvasSize = v23.props.AutomaticCanvasSize or Enum.AutomaticSize.XY, 
        ScrollBarThickness = (not (not v23.props.horizontal or v23.props.showsHorizontalScrollIndicator ~= false) or not v23.props.horizontal and v23.props.showsVerticalScrollIndicator == false) and 0 or nil, 
        ref = v23._nativeRef, 
        [l_Change_0.AbsoluteWindowSize] = v23.props.onLayout, 
        [l_Change_0.CanvasPosition] = function(v24)
            local v25 = os.clock() * 1000;
            if (v23.props.scrollEventThrottle or 0) < v25 - v23.lastScrollEventTime then
                v23.props.onScroll(v24);
                v23.lastScrollEventTime = v25;
            end;
        end, 
        [l_Event_0.InputBegan] = function(v26, v27)
            if (not (v27.UserInputType ~= Enum.UserInputType.MouseWheel) or v27.UserInputType == Enum.UserInputType.Touch) and v23.motor ~= nil then
                v23.motor:stop();
            end;
            if v27.UserInputType == Enum.UserInputType.Touch then
                v23.props.onTouchStart(v26, v27);
            end;
        end, 
        [l_Event_0.InputEnded] = function(v28, v29)
            if v29.UserInputType == Enum.UserInputType.Touch then
                v23.props.onTouchEnd(v28, v29);
            end;
        end, 
        [l_Event_0.InputChanged] = function(v30, v31)
            if v31.UserInputType == Enum.UserInputType.Touch then
                v23.props.onTouchMove(v30, v31);
            end;
        end, 
        [l_Event_0.SelectionChanged] = if not v23.props.onSelectionChanged then nil else function(v32, v33, v34, v35)
            v23.props.onSelectionChanged(v32, v33, v34, v35);
        end
    }, if not l_Array_0.isArray(v23.props.style) then v23.props.style else l_Array_0.reduce(v23.props.style, function(v36, v37)
        return l_Object_0.assign(v36, v37);
    end, {})), {
        Layout = if not v23.props.inverted or v23.props.getItemLayout then nil else v5.createElement("UIListLayout", {
            HorizontalAlignment = if not v23.props.horizontal then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Right, 
            VerticalAlignment = if not v23.props.horizontal then Enum.VerticalAlignment.Bottom else Enum.VerticalAlignment.Center
        }), 
        [1] = v23.props.children
    });
end;
v10.willUnmount = function(v38)
    if v38.motor ~= nil then
        v38.motor:destroy();
    end;
    if v38.motorStepDisconnect ~= nil then
        v38.motorStepDisconnect();
    end;
end;
return v10;
