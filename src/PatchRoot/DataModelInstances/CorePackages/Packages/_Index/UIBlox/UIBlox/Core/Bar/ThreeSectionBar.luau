local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.t);
local v3 = require(l_Parent_1.Cryo);
local v4 = require(l_Parent_1.Roact);
local v5 = require(l_Parent_1.FitFrame);
local v6 = require(l_Parent_0.Utility.bindingValidator);
local v7 = v4.PureComponent:extend("ThreeSectionBar");
v7.validateProps = v2.strictInterface({
    BackgroundColor3 = v2.optional(v2.Color3), 
    BackgroundTransparency = v2.optional(v2.union(v2.number, v6(v2.number))), 
    barHeight = v2.optional(v2.number), 
    contentPaddingLeft = v2.optional(v2.UDim), 
    contentPaddingRight = v2.optional(v2.UDim), 
    estimatedCenterWidth = v2.optional(v2.number), 
    marginLeft = v2.optional(v2.number), 
    marginRight = v2.optional(v2.number), 
    onWidthChange = v2.optional(v2.callback), 
    renderCenter = v2.optional(v2.callback), 
    renderLeft = v2.optional(v2.callback), 
    renderRight = v2.optional(v2.callback), 
    automaticHeight = v2.optional(v2.boolean), 
    sectionSpacing = v2.optional(v2.number)
});
v7.defaultProps = {
    barHeight = 32, 
    BackgroundTransparency = 0, 
    marginLeft = 0, 
    marginRight = 0, 
    contentPaddingLeft = UDim.new(0, 0), 
    contentPaddingRight = UDim.new(0, 0), 
    renderLeft = nil, 
    renderRight = nil, 
    renderCenter = nil, 
    onWidthChange = function()
        return nil;
    end, 
    estimatedCenterWidth = math.huge, 
    automaticHeight = false, 
    sectionSpacing = 8
};
v7.init = function(v8)
    local v9, v10 = v4.createBinding(0);
    v8.leftWidth = v9;
    v8.updateLeftWidth = v10;
    v9, v10 = v4.createBinding(0);
    v8.rightWidth = v9;
    v8.updateRightWidth = v10;
    v9, v10 = v4.createBinding(0);
    v8.fullWidth = v9;
    v8.updateFullWidth = v10;
    v8.computeCenteredSize = function(v11)
        local v12 = v11[1];
        local v13 = v11[2];
        local v14 = v11[3];
        local v15 = math.max(v12, v13);
        local l_magnitude_0 = (Vector2.new(v14 / 2, 0) - Vector2.new(v15, 0)).magnitude;
        if v8.props.renderLeft and v8.props.renderRight then
            return UDim2.new(0, l_magnitude_0 * 2, 1, 0);
        else
            return UDim2.new(1, -v15, 1, 0);
        end;
    end;
    v8.computeBumpedPosition = function(v17)
        local v18 = v17[1];
        return UDim2.new(0, v18 + ((v17[3] - v18) - v17[2]) / 2, 0.5, 0);
    end;
    v8.computeBumpedSize = function(v19)
        return UDim2.new(1, -v19[1] - v19[2], 1, 0);
    end;
end;
v7.didUpdate = function(v20)
    if not v20.props.renderLeft then
        v20.updateLeftWidth(0);
    end;
    if not v20.props.renderRight then
        v20.updateRightWidth(0);
    end;
end;
v7.render = function(v21)
    local v22 = Vector2.new(0.5, 0.5);
    local v23 = nil;
    v23 = if not v21.props.renderLeft and v21.props.renderRight then UDim2.fromScale(0, 0.5) else if not v21.props.renderLeft or v21.props.renderRight then UDim2.fromScale(0.5, 0.5) else UDim2.fromScale(1, 0.5);
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v21.props.barHeight), 
        BackgroundColor3 = v21.props.BackgroundColor3, 
        BackgroundTransparency = v21.props.BackgroundTransparency, 
        BorderSizePixel = 0, 
        AutomaticSize = if not v21.props.automaticHeight then nil else Enum.AutomaticSize.Y, 
        [v4.Change.AbsoluteSize] = function(v24)
            v21.props.onWidthChange(v24.AbsoluteSize.X);
            v21.updateFullWidth(v24.AbsoluteSize.X);
        end
    }, {
        leftFrame = v21.props.renderLeft and v4.createElement(v5.FitFrameHorizontal, {
            AnchorPoint = Vector2.new(0, 0), 
            Position = UDim2.fromScale(0, 0), 
            BackgroundTransparency = 1, 
            minimumSize = UDim.new(0, 200), 
            height = UDim.new(1, 0), 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            contentPadding = v21.props.contentPaddingLeft, 
            margin = {
                top = 0, 
                left = v21.props.marginLeft, 
                right = v21.props.sectionSpacing, 
                bottom = 0
            }, 
            [v4.Change.AbsoluteSize] = function(v25)
                v21.updateLeftWidth(v25.AbsoluteSize.X);
            end
        }, {
            leftContent = v21.props.renderLeft(v3.Dictionary.join(v21.props, {
                [v4.Children] = {
                    sizeConstraint = v4.createElement("UISizeConstraint", {
                        MaxSize = v4.joinBindings({
                            v21.leftWidth, 
                            v21.rightWidth, 
                            v21.fullWidth
                        }):map(function(v26)
                            local _ = v26[1];
                            return Vector2.new(math.max(0, (v26[3] - v26[2]) - v21.props.marginLeft), math.huge);
                        end)
                    })
                }
            }))
        }), 
        centerFrame = v21.props.renderCenter and v4.createElement("Frame", {
            AnchorPoint = v22, 
            BackgroundTransparency = 1, 
            Position = v4.joinBindings({
                v21.leftWidth, 
                v21.rightWidth, 
                v21.fullWidth
            }):map(function(v28)
                if math.abs(v21.computeCenteredSize(v28).X.Offset) <= v21.props.estimatedCenterWidth then
                    return v21.computeBumpedPosition(v28);
                else
                    return v23;
                end;
            end), 
            Size = v4.joinBindings({
                v21.leftWidth, 
                v21.rightWidth, 
                v21.fullWidth
            }):map(function(v29)
                local v30 = v21.computeCenteredSize(v29);
                if math.abs(v30.X.Offset) <= v21.props.estimatedCenterWidth then
                    return v21.computeBumpedSize(v29);
                else
                    return v30;
                end;
            end)
        }, {
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = not not v21.props.renderLeft and UDim.new(0, 0) or UDim.new(0, v21.props.marginLeft), 
                PaddingRight = not not v21.props.renderRight and UDim.new(0, 0) or UDim.new(0, v21.props.marginRight)
            }), 
            ["$layout"] = v4.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            centerContent = v21.props.renderCenter(v21.props)
        }), 
        rightFrame = v21.props.renderRight and v4.createElement(v5.FitFrameHorizontal, {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            minimumSize = UDim.new(0, 200), 
            height = UDim.new(1, 0), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            contentPadding = v21.props.contentPaddingRight, 
            margin = {
                top = 0, 
                left = v21.props.sectionSpacing, 
                right = v21.props.marginRight, 
                bottom = 0
            }, 
            [v4.Change.AbsoluteSize] = function(v31)
                v21.updateRightWidth(v31.AbsoluteSize.X);
            end
        }, {
            rightContent = v21.props.renderRight(v21.props)
        })
    });
end;
return v7;
