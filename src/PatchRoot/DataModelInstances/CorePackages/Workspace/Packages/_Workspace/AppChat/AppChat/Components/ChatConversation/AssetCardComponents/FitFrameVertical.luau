local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local v3 = v1.PureComponent:extend("FitFrameVertical");
v3.defaultProps = {
    AnchorPoint = Vector2.new(0, 0), 
    Position = UDim2.new(0, 0, 0, 0), 
    width = UDim.new(0, 0), 
    contentPadding = UDim.new(0, 0), 
    FillDirection = Enum.FillDirection.Vertical, 
    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
    VerticalAlignment = Enum.VerticalAlignment.Top, 
    marginTop = 0, 
    marginBottom = 0, 
    marginLeft = 0, 
    marginRight = 0
};
v3.init = function(v4)
    v4.layoutRef = v1.createRef();
    v4.frameRef = v1.createRef();
    v4.onResize = function()
        local l_current_0 = v4.layoutRef.current;
        local l_current_1 = v4.frameRef.current;
        if l_current_1 and l_current_0 then
            l_current_1.Size = UDim2.new(v4.props.width, UDim.new(0, (l_current_0.AbsoluteContentSize.Y + v4.props.marginTop) + v4.props.marginBottom));
            return ;
        else
            return ;
        end;
    end;
end;
v3.render = function(v7)
    local l_BackgroundColor3_0 = v7.props.BackgroundColor3;
    local v9 = v7.props[v1.Children] or {};
    local l_width_0 = v7.props.width;
    local l_HorizontalAlignment_0 = v7.props.HorizontalAlignment;
    local l_BackgroundTransparency_0 = v7.props.BackgroundTransparency;
    local l_contentPadding_0 = v7.props.contentPadding;
    local l_LayoutOrder_0 = v7.props.LayoutOrder;
    local l_FillDirection_0 = v7.props.FillDirection;
    local l_VerticalAlignment_0 = v7.props.VerticalAlignment;
    local v17 = 0;
    if v7.layoutRef.current then
        v17 = v7.layoutRef.current.AbsoluteContentSize.Y;
    end;
    return v1.createElement("Frame", {
        AnchorPoint = v7.props.AnchorPoint, 
        Position = v7.props.Position, 
        BackgroundColor3 = l_BackgroundColor3_0, 
        BackgroundTransparency = l_BackgroundTransparency_0, 
        Size = UDim2.new(l_width_0.Scale, l_width_0.Offset, 0, v17), 
        LayoutOrder = l_LayoutOrder_0, 
        [v1.Ref] = v7.frameRef, 
        Visible = v7.props.Visible, 
        BorderSizePixel = 0
    }, l_Immutable_0.JoinDictionaries(v9, {
        layout = v1.createElement("UIListLayout", {
            Padding = l_contentPadding_0, 
            FillDirection = l_FillDirection_0, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = l_HorizontalAlignment_0, 
            VerticalAlignment = l_VerticalAlignment_0, 
            [v1.Ref] = v7.layoutRef, 
            [v1.Change.AbsoluteContentSize] = v7.onResize
        }), 
        padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v7.props.marginLeft), 
            PaddingRight = UDim.new(0, v7.props.marginRight), 
            PaddingTop = UDim.new(0, v7.props.marginTop), 
            PaddingBottom = UDim.new(0, v7.props.marginBottom)
        })
    }));
end;
v3.didMount = function(v18)
    v18.onResize();
end;
v3.didUpdate = function(v19)
    v19.onResize();
end;
return v3;
