local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local v4 = require(l_Parent_1.Roact);
local v5 = require(l_Parent_1.t);
local v6 = require(l_Parent_1.Otter);
local l_Button_0 = require(l_Core_0.ImageSet.ImageSetComponent).Button;
local v8 = require(l_Core_0.Style.withStyle);
local v9 = require(script.Parent.NavigationDirection);
local v10 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v11 = v4.PureComponent:extend("ArrowNav");
v11.validateProps = v5.intersection(v5.strictInterface({
    AnchorPoint = v5.optional(v5.Vector2), 
    Position = v5.optional(v5.UDim2), 
    Image = v5.table, 
    Visible = v5.optional(v5.union(v5.boolean, v5.table)), 
    navDirection = v5.optional(v5.userdata), 
    onPressHoldInputBegan = v5.optional(v5.callback), 
    onPressHoldInputEnded = v5.optional(v5.callback), 
    defaultUseProps = v5.optional(v5.strictInterface({
        scrollingFrameRef = v5.table, 
        buttonRefs = v5.optional(v5.table), 
        buttonWidth = v5.optional(v5.number), 
        numButtons = v5.optional(v5.number), 
        padOutsideEdges = v5.optional(v5.boolean), 
        buttonPadding = v5.number, 
        updateCanvasPosition = v5.callback
    }))
}), function(v12)
    if v12.defaultUseProps then
        if v12.defaultUseProps.buttonRefs ~= nil then
            if v12.defaultUseProps.buttonWidth ~= nil then
                return false, "Cannot set both buttonWidth and buttonRefs";
            elseif v12.defaultUseProps.numButtons ~= nil then
                return false, "Cannot set both numButtons and buttonRefs";
            end;
        end;
        if v12.defaultUseProps.buttonWidth ~= nil and v12.defaultUseProps.numButtons == nil then
            return false, "If setting buttonWidth must also set numButtons";
        elseif v12.defaultUseProps.buttonWidth == nil and v12.defaultUseProps.numButtons ~= nil then
            return false, "If setting numButtons must also set buttonWidth";
        elseif (v12.defaultUseProps.buttonRefs == nil and v12.defaultUseProps.buttonWidth == nil) and v12.defaultUseProps.numButtons == nil then
            return false, "Must set either buttonRefs or (buttonWidth and numButtons)";
        end;
    end;
    return true;
end);
v11.defaultProps = {
    AnchorPoint = Vector2.new(0, 0), 
    Position = UDim2.new(0, 0, 0, 0), 
    Visible = true
};
v11.init = function(v13)
    v13.holdConn = nil;
    v13.timeOfInputBegan = 0;
    v13.handleInputBegan = function(_, v15)
        local l_navDirection_0 = v13.props.navDirection;
        if not v13.props.onPressHoldInputBegan then
            v13:onPressHoldInputBegan(v15, l_navDirection_0);
            return ;
        else
            v13.props.onPressHoldInputBegan(v15, l_navDirection_0);
            return ;
        end;
    end;
    v13.handleInputEnded = function(_, v18)
        local l_navDirection_1 = v13.props.navDirection;
        if not v13.props.onPressHoldInputEnded then
            v13:onPressHoldInputEnded(v18, l_navDirection_1);
            return ;
        else
            v13.props.onPressHoldInputEnded(v18, l_navDirection_1);
            return ;
        end;
    end;
end;
v11.getGoal = function(v20, v21)
    return v6.spring(v20:getScrollToLocation(v21), v10);
end;
v11.didMount = function(v22)
    v22:setMotor(0);
end;
v11.setMotor = function(v23, v24)
    v23.motor = v6.createSingleMotor(v24);
    v23.motor:onStep(function(v25)
        v23.props.defaultUseProps.updateCanvasPosition(Vector2.new(v25, 0));
    end);
    v23.motor:onComplete(function(v26)
        v23.props.defaultUseProps.updateCanvasPosition(Vector2.new(v26, 0));
    end);
end;
v11.render = function(v27)
    return v8(function(v28)
        return v4.createElement(l_Button_0, {
            AnchorPoint = v27.props.AnchorPoint, 
            Position = v27.props.Position, 
            Image = v27.props.Image, 
            Visible = v27.props.Visible, 
            BackgroundTransparency = 1, 
            ImageColor3 = v28.Theme.IconEmphasis.Color, 
            Size = UDim2.fromOffset(36, 36), 
            [v4.Event.InputBegan] = v27.handleInputBegan, 
            [v4.Event.InputEnded] = v27.handleInputEnded
        });
    end);
end;
v11.willUnmount = function(v29)
    v29:disconnectHoldConn();
    if v29.motor then
        v29.motor:destroy();
        v29.motor = nil;
    end;
end;
v11.getNewCanvasPosition = function(v30, v31)
    return v30.props.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new(v31, 0);
end;
v11.disconnectHoldConn = function(v32)
    if v32.holdConn == nil then
        return ;
    else
        v32.holdConn:Disconnect();
        v32.holdConn = nil;
        return ;
    end;
end;
v11.onPressHoldInputBegan = function(v33, v34, v35)
    if v34.UserInputState ~= Enum.UserInputState.Begin then
        return ;
    else
        v33.timeOfInputBegan = tick();
        v33:disconnectHoldConn();
        v33.holdConn = l_RunService_0.RenderStepped:connect(function(v36)
            v33.props.defaultUseProps.updateCanvasPosition((v33:getNewCanvasPosition((((v35 == v9.IsLeft and -1 or 1) * 500) * v36) * (tick() - v33.timeOfInputBegan) ^ 2)));
        end);
        return ;
    end;
end;
v11.onPressHoldInputEnded = function(v37, v38, v39)
    if v38.UserInputState ~= Enum.UserInputState.End then
        return ;
    else
        local l_current_0 = v37.props.defaultUseProps.scrollingFrameRef.current;
        if tick() - v37.timeOfInputBegan <= 0.5 then
            if v37.motor then
                v37.motor:destroy();
            end;
            v37:setMotor(l_current_0.CanvasPosition.X);
            v37.motor:setGoal(v37:getGoal(v39));
        else
            v37.motor:setGoal(v6.instant(l_current_0.CanvasPosition.X));
        end;
        v37:disconnectHoldConn();
        return ;
    end;
end;
v11.getScrollToLocation = function(v41, v42)
    local v43 = v41:getButtonSizes();
    if v42 == v9.IsLeft then
        return v41:getScrollToLeftLocation(v43);
    else
        return v41:getScrollToRightLocation(v43);
    end;
end;
v11.getButtonSizes = function(v44)
    local l_buttonRefs_0 = v44.props.defaultUseProps.buttonRefs;
    local l_buttonWidth_0 = v44.props.defaultUseProps.buttonWidth;
    local l_numButtons_0 = v44.props.defaultUseProps.numButtons;
    if not l_buttonWidth_0 or not l_numButtons_0 then
        local v48 = {};
        for _, v50 in ipairs(l_buttonRefs_0) do
            table.insert(v48, not not v50.current and v50.current.AbsoluteSize.X or 0);
        end;
        return v48;
    else
        return table.create(l_numButtons_0, l_buttonWidth_0);
    end;
end;
v11.getScrollToLeftLocation = function(v51, v52)
    local l_current_1 = v51.props.defaultUseProps.scrollingFrameRef.current;
    local l_buttonPadding_0 = v51.props.defaultUseProps.buttonPadding;
    local v55 = l_current_1.CanvasPosition.X - l_current_1.AbsoluteSize.X * 0.4;
    local v56 = 0;
    for _, v58 in ipairs(v52) do
        if v55 <= (v56 + v58) + l_buttonPadding_0 then
            return v56;
        else
            v56 = v56 + (v58 + l_buttonPadding_0);
        end;
    end;
    return v56;
end;
v11.getScrollToRightLocation = function(v59, v60)
    local l_current_2 = v59.props.defaultUseProps.scrollingFrameRef.current;
    local l_buttonPadding_1 = v59.props.defaultUseProps.buttonPadding;
    local l_padOutsideEdges_0 = v59.props.defaultUseProps.padOutsideEdges;
    local v64 = l_current_2.CanvasPosition.X + l_current_2.AbsoluteSize.X * 0.4;
    local v65 = -l_current_2.AbsoluteSize.X;
    if l_padOutsideEdges_0 then
        v65 = v65 + l_buttonPadding_1;
    end;
    for _, v67 in ipairs(v60) do
        if v64 < v65 then
            return v65;
        else
            v65 = v65 + (v67 + l_buttonPadding_1);
        end;
    end;
    return v65;
end;
return v11;
