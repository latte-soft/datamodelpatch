local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_withStyle_0 = require(game:GetService("CorePackages").UIBlox).Style.withStyle;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.FitChildren);
local v4 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v5 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v6 = v2.PureComponent:extend("ButtonStripSelectorButton");
v6.render = function(v7)
    local l_text_0 = v7.props.text;
    local l_layoutOrder_0 = v7.props.layoutOrder;
    local l_selected_0 = v7.props.selected;
    return l_withStyle_0(function(v11)
        local v12 = not not l_selected_0 and v11.Theme.TextEmphasis.Color or v11.Theme.TextDefault.Color;
        local v13 = not not l_selected_0 and v11.Theme.SystemPrimaryContent.Transparency or v11.Theme.TextDefault.Transparency;
        local l_Color_0 = v11.Theme.BackgroundOnHover.Color;
        local v15 = not not l_selected_0 and v11.Theme.BackgroundOnHover.Transparency or 1;
        local v16 = v11.Font.BaseSize * v11.Font.Header2.RelativeSize;
        return v2.createElement(v3.FitImageButton, {
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(0, 0, 1, 0), 
            BackgroundTransparency = v15, 
            BackgroundColor3 = l_Color_0, 
            BorderSizePixel = 0, 
            [v2.Event.Activated] = v7.props.handleClick
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 1000)
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 6), 
                PaddingTop = UDim.new(0, 6), 
                PaddingRight = UDim.new(0, 6), 
                PaddingBottom = UDim.new(0, 6)
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 4)
            }), 
            Image = not not v7.props.image and v2.createElement(v5, {
                Size = UDim2.new(0, v16, 0, v16), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v7.props.image, 
                ImageColor3 = v12, 
                ImageTransparency = v13, 
                LayoutOrder = 2, 
                BorderSizePixel = 0
            }) or nil, 
            Label = v2.createElement(v4, {
                Text = l_text_0, 
                LayoutOrder = 3, 
                Size = UDim2.new(0, 0, 1, 0), 
                BackgroundTransparency = 1, 
                TextSize = v16, 
                Font = v11.Font.Header2.Font, 
                TextColor3 = v12, 
                TextTransparency = v13, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                fitAxis = v3.FitAxis.Both, 
                BorderSizePixel = 0
            })
        });
    end);
end;
return v6;
