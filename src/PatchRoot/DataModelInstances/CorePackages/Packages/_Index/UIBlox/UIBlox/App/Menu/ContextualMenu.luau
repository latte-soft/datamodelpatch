local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Otter);
local v6 = require(l_Parent_0.Core.Style.withStyle);
local v7 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v8 = require(l_Parent_0.UIBloxConfig);
local v9 = require(script.Parent.BaseMenu);
local v10 = require(script.Parent.MenuDirection);
local v11 = require(script.Parent.validateButtonProps);
local v12 = require(script.Parent.validateMotorOptionProps);
local v13 = {
    open = {
        targetValue = 1, 
        springParams = {
            frequency = 4, 
            dampingRatio = 1
        }
    }, 
    close = {
        targetValue = 0, 
        springParams = {
            frequency = 2.6, 
            dampingRatio = 1
        }
    }
};
local v14 = v3.PureComponent:extend("ContextualMenu");
v14.validateProps = v4.strictInterface({
    buttonProps = v11, 
    zIndex = v4.optional(v4.integer), 
    open = v4.boolean, 
    menuDirection = v4.optional(v10.isEnumValue), 
    openPositionY = v4.UDim, 
    closeBackgroundVisible = v4.optional(v4.boolean), 
    screenSize = v4.Vector2, 
    stayOnActivated = v4.optional(v4.boolean), 
    onDismiss = v4.optional(v4.callback), 
    setFrameRef = v4.optional(v4.union(v4.callback, v4.table)), 
    setFirstItemRef = v4.optional(v4.union(v4.callback, v4.table)), 
    motorOverrideOptions = v4.optional(v4.strictInterface({
        motorCallback = v4.callback, 
        open = v12, 
        close = v12
    })), 
    horizontalAlignment = v4.optional(v4.enum(Enum.HorizontalAlignment)), 
    openPositionX = v4.optional(v4.UDim), 
    contextMenuWidthOverride = v4.optional(v4.UDim), 
    anchorPointOverride = v4.optional(v4.Vector2), 
    topElementRounded = v4.optional(v4.boolean), 
    bottomElementRounded = v4.optional(v4.boolean), 
    isElementBackgroundVisible = v4.optional(v4.boolean), 
    isElementDividerVisible = v4.optional(v4.boolean), 
    elementHeight = v4.optional(v4.number), 
    borderCornerRadius = v4.optional(v4.integer), 
    background = v4.optional(v7), 
    enableTokenOverride = v4.optional(v4.boolean), 
    renderHeader = v4.optional(v4.callback), 
    headerHeight = v4.optional(v4.number)
});
v14.defaultProps = {
    menuDirection = v10.Up, 
    zIndex = 2, 
    closeBackgroundVisible = true, 
    horizontalAlignment = Enum.HorizontalAlignment.Center, 
    openPositionX = UDim.new(0, 0)
};
v14.init = function(v15)
    v15.wasDismissed = false;
    local v16, v17 = v3.createBinding(0);
    v15.positionPercentBinding = v16;
    v15.positionPercentBindingUpdate = v17;
    v15.motor = v5.createSingleMotor(0);
    v15.motor:onStep(v15.positionPercentBindingUpdate);
    v15.motor:onComplete(function()
        if v15.wasDismissed then
            v15.wasDismissed = false;
            if v15.props.onDismiss then
                v15.props.onDismiss();
            end;
        end;
    end);
    v15.motorType = v5.spring;
    v15.motorOptions = v13;
    if v15.props.motorOverrideOptions then
        v15.motorType = v15.props.motorOverrideOptions.motorCallback;
        v15.motorOptions = v15.props.motorOverrideOptions;
    end;
    v15.state = {
        absoluteSize = Vector2.new(0, 0), 
        absolutePosition = Vector2.new(0, 0)
    };
    v15.visibleBinding = v15.positionPercentBinding:map(function(v18)
        return v18 ~= 0;
    end);
end;
v14.render = function(v19)
    return v6(function(v20)
        local v21 = 0.5;
        local v22 = UDim.new(1, -24);
        local v23 = UDim.new(0, 0);
        local v24 = v19.state.absoluteSize.X > 640;
        if v24 then
            v22 = UDim.new(0, 300);
            v23 = v19.props.openPositionX;
            if v19.props.horizontalAlignment == Enum.HorizontalAlignment.Left then
                v21 = 0;
            elseif v19.props.horizontalAlignment == Enum.HorizontalAlignment.Right then
                v21 = 1;
            end;
        end;
        local v25 = 0;
        if v19.props.menuDirection == v10.Up then
            v25 = 1;
        end;
        local l_Transparency_0 = v20.Theme.Overlay.Transparency;
        if not v19.props.closeBackgroundVisible then
            l_Transparency_0 = 1;
        end;
        v22 = v19.props.contextMenuWidthOverride or v22;
        local v27 = v19.props.anchorPointOverride or Vector2.new(v21, v25);
        local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
        local v30 = v19.state.absolutePosition + l_l_GuiService_0_GuiInset_0;
        return v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Visible = v19.visibleBinding, 
            ZIndex = v19.props.zIndex, 
            [v3.Change.AbsoluteSize] = function(v31)
                v19:setState({
                    absoluteSize = v31.AbsoluteSize
                });
            end, 
            [v3.Change.AbsolutePosition] = function(v32)
                v19:setState({
                    absolutePosition = v32.AbsolutePosition
                });
            end
        }, {
            Background = v3.createElement("TextButton", {
                ZIndex = 1, 
                Text = "", 
                BorderSizePixel = 0, 
                BackgroundColor3 = v20.Theme.Overlay.Color, 
                BackgroundTransparency = l_Transparency_0, 
                AutoButtonColor = false, 
                Selectable = if not v8.enableNewMenuLayout then nil else false, 
                Position = UDim2.fromOffset(-v30.X, -v30.Y), 
                Size = UDim2.fromOffset(v19.props.screenSize.X, v19.props.screenSize.Y), 
                [v3.Event.Activated] = function()
                    if not v19.wasDismissed then
                        v19.wasDismissed = true;
                        v19.motor:setGoal(v19.motorType(v19.motorOptions.close.targetValue, v19.motorOptions.close.springParams));
                    end;
                end
            }), 
            PositionFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.new(v23.Scale, v23.Offset, v19.props.openPositionY.Scale, v19.props.openPositionY.Offset), 
                ZIndex = 2
            }, {
                BaseMenu = v3.createElement(v9, {
                    buttonProps = v19.props.buttonProps, 
                    setFirstItemRef = v19.props.setFirstItemRef, 
                    setFrameRef = v19.props.setFrameRef, 
                    width = v22, 
                    position = v19.positionPercentBinding:map(function(v33)
                        local v34 = 0.5;
                        if not (not v24 and not v19.props.anchorPointOverride) then
                            if v19.props.horizontalAlignment == Enum.HorizontalAlignment.Left then
                                v34 = 0;
                            elseif v19.props.horizontalAlignment == Enum.HorizontalAlignment.Right then
                                v34 = 1;
                            end;
                        end;
                        if v19.props.menuDirection == v10.Down then
                            return UDim2.fromScale(v34, v33 - 1);
                        else
                            return UDim2.fromScale(v34, 1 - v33);
                        end;
                    end), 
                    anchorPoint = v27, 
                    topElementRounded = v19.props.topElementRounded, 
                    bottomElementRounded = v19.props.bottomElementRounded, 
                    isElementBackgroundVisible = v19.props.isElementBackgroundVisible, 
                    isElementDividerVisible = v19.props.isElementDividerVisible, 
                    elementHeight = v19.props.elementHeight, 
                    borderCornerRadius = v19.props.borderCornerRadius, 
                    background = v19.props.background, 
                    enableTokenOverride = v19.props.enableTokenOverride, 
                    renderHeader = v19.props.renderHeader, 
                    headerHeight = v19.props.headerHeight
                })
            })
        });
    end);
end;
v14.didMount = function(v35)
    if v35.props.open then
        v35.wasDismissed = false;
        v35.motor:setGoal(v35.motorType(v35.motorOptions.open.targetValue, v35.motorOptions.open.springParams));
    end;
end;
v14.didUpdate = function(v36, v37, _)
    if v36.props.open ~= v37.open then
        if not v36.props.open then
            v36.motor:setGoal(v36.motorType(v36.motorOptions.close.targetValue, v36.motorOptions.close.springParams));
        else
            v36.wasDismissed = false;
            v36.motor:setGoal(v36.motorType(v36.motorOptions.open.targetValue, v36.motorOptions.open.springParams));
            return ;
        end;
    end;
end;
v14.wilUnmount = function(v39)
    v39.motor:destroy();
end;
return v14;
