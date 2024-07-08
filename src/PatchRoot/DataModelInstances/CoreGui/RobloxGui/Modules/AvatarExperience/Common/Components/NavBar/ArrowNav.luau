local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_CorePackages_0.Otter);
local l_ImageSetButton_0 = v6.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = v6.Style.withStyle;
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v12 = v4.PureComponent:extend("ArrowNav");
v12.validateProps = v5.intersection(v5.strictInterface({
    AnchorPoint = v5.optional(v5.Vector2), 
    Position = v5.optional(v5.UDim2), 
    Image = v5.table, 
    Visible = v5.optional(v5.union(v5.boolean, v5.table)), 
    navDirection = v5.optional(v5.string), 
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
}), function(v13)
    if v13.defaultUseProps then
        if v13.defaultUseProps.buttonRefs ~= nil then
            if v13.defaultUseProps.buttonWidth ~= nil then
                return false, "Cannot set both buttonWidth and buttonRefs";
            elseif v13.defaultUseProps.numButtons ~= nil then
                return false, "Cannot set both numButtons and buttonRefs";
            end;
        end;
        if v13.defaultUseProps.buttonWidth ~= nil and v13.defaultUseProps.numButtons == nil then
            return false, "If setting buttonWidth must also set numButtons";
        elseif v13.defaultUseProps.buttonWidth == nil and v13.defaultUseProps.numButtons ~= nil then
            return false, "If setting numButtons must also set buttonWidth";
        elseif (v13.defaultUseProps.buttonRefs == nil and v13.defaultUseProps.buttonWidth == nil) and v13.defaultUseProps.numButtons == nil then
            return false, "Must set either buttonRefs or (buttonWidth and numButtons)";
        end;
    end;
    return true;
end);
v12.defaultProps = {
    AnchorPoint = Vector2.new(0, 0), 
    Position = UDim2.new(0, 0, 0, 0), 
    Visible = true
};
v12.init = function(v14)
    v14.holdConn = nil;
    v14.timeOfInputBegan = 0;
    v14.handleInputBegan = function(_, v16)
        (v14.props.onPressHoldInputBegan or v14.onPressHoldInputBegan)(v16, v14.props.navDirection);
    end;
    v14.handleInputEnded = function(_, v18)
        (v14.props.onPressHoldInputEnded or v14.onPressHoldInputEnded)(v18, v14.props.navDirection);
    end;
    v14.getNewCanvasPosition = function(v19)
        return v14.props.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new(v19, 0);
    end;
    v14.disconnectHoldConn = function()
        if v14.holdConn == nil then
            return ;
        else
            v14.holdConn:Disconnect();
            v14.holdConn = nil;
            return ;
        end;
    end;
    v14.onPressHoldInputBegan = function(v20, v21)
        if v20.UserInputState ~= Enum.UserInputState.Begin then
            return ;
        else
            v14.timeOfInputBegan = tick();
            v14.disconnectHoldConn();
            v14.holdConn = l_RunService_0.RenderStepped:connect(function(v22)
                v14.props.defaultUseProps.updateCanvasPosition((v14.getNewCanvasPosition((((v21 == v10.NavigationDirection.IS_LEFT and -1 or 1) * 500) * v22) * (tick() - v14.timeOfInputBegan) ^ 2)));
            end);
            return ;
        end;
    end;
    v14.onPressHoldInputEnded = function(v23, v24)
        if v23.UserInputState ~= Enum.UserInputState.End then
            return ;
        else
            local l_current_0 = v14.props.defaultUseProps.scrollingFrameRef.current;
            if tick() - v14.timeOfInputBegan <= 0.5 then
                if v14.motor then
                    v14.motor:destroy();
                end;
                v14:setMotor(l_current_0.CanvasPosition.X);
                v14.motor:setGoal(v14:getGoal(v24));
            else
                v14.motor:setGoal(v7.instant(l_current_0.CanvasPosition.X));
            end;
            v14.disconnectHoldConn();
            return ;
        end;
    end;
end;
v12.getGoal = function(v26, v27)
    return v7.spring(v26:getScrollToLocation(v27), v11);
end;
v12.didMount = function(v28)
    v28:setMotor(0);
end;
v12.setMotor = function(v29, v30)
    v29.motor = v7.createSingleMotor(v30);
    v29.motor:onStep(function(v31)
        v29.props.defaultUseProps.updateCanvasPosition(Vector2.new(v31, 0));
    end);
    v29.motor:onComplete(function(v32)
        v29.props.defaultUseProps.updateCanvasPosition(Vector2.new(v32, 0));
    end);
end;
v12.render = function(v33)
    return l_withStyle_0(function(v34)
        return v4.createElement(l_ImageSetButton_0, {
            AnchorPoint = v33.props.AnchorPoint, 
            Position = v33.props.Position, 
            Image = v33.props.Image, 
            Visible = v33.props.Visible, 
            BackgroundTransparency = 1, 
            ImageColor3 = v34.Theme.IconEmphasis.Color, 
            Size = UDim2.fromOffset(36, 36), 
            [v4.Event.InputBegan] = v33.handleInputBegan, 
            [v4.Event.InputEnded] = v33.handleInputEnded
        });
    end);
end;
v12.willUnmount = function(v35)
    v35.disconnectHoldConn();
    if v35.motor then
        v35.motor:destroy();
        v35.motor = nil;
    end;
end;
v12.getScrollToLocation = function(v36, v37)
    local l_current_1 = v36.props.defaultUseProps.scrollingFrameRef.current;
    local l_buttonPadding_0 = v36.props.defaultUseProps.buttonPadding;
    local v40 = {};
    local l_buttonRefs_0 = v36.props.defaultUseProps.buttonRefs;
    local l_buttonWidth_0 = v36.props.defaultUseProps.buttonWidth;
    local l_numButtons_0 = v36.props.defaultUseProps.numButtons;
    local l_padOutsideEdges_0 = v36.props.defaultUseProps.padOutsideEdges;
    if not l_buttonWidth_0 or not l_numButtons_0 then
        for _, v46 in l_buttonRefs_0, nil, nil do
            table.insert(v40, not not v46.current and v46.current.Size.X.Offset or 0);
        end;
    else
        v40 = table.create(l_numButtons_0, l_buttonWidth_0);
    end;
    local v47 = 0;
    if v37 == v10.NavigationDirection.IS_LEFT then
        local v48 = l_current_1.CanvasPosition.X - l_current_1.AbsoluteSize.X * 0.4;
        for _, v50 in v40, nil, nil do
            if (v47 + v50) + l_buttonPadding_0 < v48 then
                v47 = (v47 + v50) + l_buttonPadding_0;
            else
                goto label0;
            end;
        end;
        return v47;
    else
        local v51 = l_current_1.CanvasPosition.X + l_current_1.AbsoluteSize.X * 0.4;
        v47 = -l_current_1.AbsoluteSize.X;
        if l_padOutsideEdges_0 then
            v47 = v47 + l_buttonPadding_0;
        end;
        for _, v53 in v40, nil, nil do
            if v51 < v47 then
                return v47;
            else
                v47 = (v47 + v53) + l_buttonPadding_0;
            end;
        end;
    end;
    ::label0::;
    return v47;
end;
return v12;
