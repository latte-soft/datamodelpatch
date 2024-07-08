local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v2.Style.withStyle;
local v5 = v1.PureComponent:extend(script.Name);
v5.render = function(v6)
    local l_helpText_0 = v6.props.helpText;
    local l_iconImage_0 = v6.props.iconImage;
    return l_withStyle_0(function(v9)
        local v10 = v9.Font.CaptionBody.RelativeSize * v9.Font.BaseSize;
        return v1.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 0)
        }, {
            ListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Icon = v1.createElement(l_ImageSetLabel_0, {
                LayoutOrder = 1, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = l_iconImage_0, 
                ImageColor3 = v9.Theme.SystemPrimaryDefault.Color, 
                Size = UDim2.fromOffset(v10, v10)
            }), 
            Text = v1.createElement("TextLabel", {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Font = v9.Font.CaptionBody.Font, 
                Size = UDim2.new(1, -v10, 0, 0), 
                Text = l_helpText_0, 
                TextColor3 = v9.Theme.SystemPrimaryDefault.Color, 
                TextSize = v9.Font.CaptionBody.RelativeSize * v9.Font.BaseSize, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 2)
                })
            })
        });
    end);
end;
return v5;
