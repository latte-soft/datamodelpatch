local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.Parent.Immutable);
local v2 = require(script.Parent.Parent.Constants);
local l_LineWidth_0 = v2.GeneralFormatting.LineWidth;
local l_LineColor_0 = v2.GeneralFormatting.LineColor;
local l_ArrowWidth_0 = v2.GeneralFormatting.ArrowWidth;
local l_RightArrow_0 = v2.Image.RightArrow;
local l_DownArrow_0 = v2.Image.DownArrow;
local v8 = v0.Component:extend("BannerButton");
v8.render = function(v9)
    local v10 = v9.props[v0.Children] or {};
    local l_size_0 = v9.props.size;
    local l_pos_0 = v9.props.pos;
    local l_isExpandable_0 = v9.props.isExpandable;
    local l_isExpanded_0 = v9.props.isExpanded;
    local l_layoutOrder_0 = v9.props.layoutOrder;
    local v16 = v9.props.inset or 0;
    local l_onButtonPress_0 = v9.props.onButtonPress;
    return v0.createElement("ImageButton", {
        Size = l_size_0, 
        Position = l_pos_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        [v0.Event.Activated] = l_onButtonPress_0, 
        [v0.Event.MouseEnter] = v9.props.onMouseEnter, 
        [v0.Event.MouseLeave] = v9.props.onMouseLeave, 
        [v0.Event.MouseMoved] = v9.props.onMouseMove, 
        [v0.Event.MouseButton2Click] = v9.props.onMouse2Click
    }, v1.JoinDictionaries({
        BannerButtonArrow = l_onButtonPress_0 and v0.createElement("ImageLabel", {
            Visible = l_isExpandable_0, 
            Image = not not l_isExpanded_0 and l_DownArrow_0 or l_RightArrow_0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_ArrowWidth_0, 0, l_ArrowWidth_0), 
            Position = UDim2.new(0, v16, 0.5, -l_ArrowWidth_0 / 2)
        }), 
        HorizontalLineTop = v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        }), 
        HorizontalLineBottom = v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            Position = UDim2.new(0, 0, 1, -l_LineWidth_0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    }, v10));
end;
return v8;
