local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v2 = require(l_Parent_0.Roact);
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v5 = v2.PureComponent:extend("SystemMessage");
v5.defaultProps = {
    LayoutOrder = nil, 
    Text = "PLACEHOLDER This message could not be displayed", 
    maxWidth = 250
};
v5.init = function(v6)
    v6.calculateSize = l_memoize_0(function(v7, v8, v9, v10)
        return l_Text_0.GetTextBounds(v7, v9, v10, Vector2.new(v8, 1000));
    end);
end;
v5.render = function(v11)
    return l_withStyle_0(function(v12)
        local l_CaptionBody_0 = v12.Font.CaptionBody;
        local v14 = v12.Font.BaseSize * l_CaptionBody_0.RelativeSize;
        local v15 = v11.calculateSize(v11.props.Text, v11.props.maxWidth, l_CaptionBody_0.Font, v14);
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v11.props.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, (30 + v15.Y) + 8)
        }, {
            UiListLayout = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 20)
            }), 
            GreyBox = v2.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BorderSizePixel = 0, 
                Image = "rbxasset://textures/ui/LuaChat/9-slice/system-message.png", 
                ImageColor3 = v12.Theme.BackgroundContrast.Color, 
                ImageTransparency = v12.Theme.BackgroundContrast.Transparency, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                ScaleType = Enum.ScaleType.Slice, 
                Size = UDim2.new(0, math.min(v11.props.maxWidth, v15.X) + 12, 0, v15.Y + 8), 
                SliceCenter = Rect.new(3, 3, 4, 4)
            }, {
                SystemText = v2.createElement("TextLabel", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Font = l_CaptionBody_0.Font, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v11.props.Text, 
                    TextColor3 = v12.Theme.TextDefault.Color, 
                    TextSize = v14, 
                    TextTransparency = v12.Theme.TextDefault.Transparency, 
                    TextWrapped = true
                })
            })
        });
    end);
end;
return v5;
