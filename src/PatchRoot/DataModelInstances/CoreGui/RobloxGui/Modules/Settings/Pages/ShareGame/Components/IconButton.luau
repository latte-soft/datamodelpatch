local v0 = require(game:GetService("CorePackages").Roact);
local v1 = v0.PureComponent:extend("IconButton");
v1.render = function(v2)
    local l_visible_0 = v2.props.visible;
    local l_anchorPoint_0 = v2.props.anchorPoint;
    local l_position_0 = v2.props.position;
    local l_size_0 = v2.props.size;
    local l_zIndex_0 = v2.props.zIndex;
    local l_onClick_0 = v2.props.onClick;
    local v9 = v2.props.iconHorizontalAlignment or Enum.HorizontalAlignment.Center;
    local v10 = v2.props.iconVerticalAlignment or Enum.VerticalAlignment.Center;
    local l_iconSpritePath_0 = v2.props.iconSpritePath;
    local l_iconSpriteFrame_0 = v2.props.iconSpriteFrame;
    local v13 = v2.props.horizontalInset or 12;
    local v14 = 0;
    local v15 = 1;
    if v9 == Enum.HorizontalAlignment.Center then
        v13 = 0;
    elseif v9 == Enum.HorizontalAlignment.Left then
        l_position_0 = UDim2.new(l_position_0.X.Scale, l_position_0.X.Offset - v13, l_position_0.Y.Scale, l_position_0.Y.Offset);
    elseif v9 == Enum.HorizontalAlignment.Right then
        l_position_0 = UDim2.new(l_position_0.X.Scale, l_position_0.X.Offset + v13, l_position_0.Y.Scale, l_position_0.Y.Offset);
        v14 = 1;
        v15 = 0;
    end;
    return v0.createElement("ImageButton", {
        Visible = l_visible_0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AnchorPoint = l_anchorPoint_0, 
        Position = l_position_0, 
        Size = UDim2.new(l_size_0.X.Scale, l_size_0.X.Offset + v13, l_size_0.Y.Scale, l_size_0.Y.Offset), 
        ZIndex = l_zIndex_0, 
        [v0.Event.Activated] = l_onClick_0
    }, {
        IconLayout = v0.createElement("UIListLayout", {
            HorizontalAlignment = v9, 
            VerticalAlignment = v10, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Offset = v0.createElement("Frame", {
            BorderSizePixel = 0, 
            LayoutOrder = v14, 
            Size = UDim2.new(0, v13, 0, 0)
        }), 
        BackIcon = v0.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, l_iconSpriteFrame_0.size.X, 0, l_iconSpriteFrame_0.size.Y), 
            Image = l_iconSpritePath_0, 
            ImageRectOffset = l_iconSpriteFrame_0.offset, 
            ImageRectSize = l_iconSpriteFrame_0.size, 
            ZIndex = l_zIndex_0, 
            LayoutOrder = v15
        })
    });
end;
return v1;
