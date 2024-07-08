local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Style.withStyle);
local v6 = require(l_Parent_1.Core.Text.GetTextSize);
local v7 = require(l_Parent_1.App.ImageSet.Images);
local v8 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v9 = require(l_Parent_0.Enum.ItemTileEnums);
local v10 = v3.PureComponent:extend("ItemTileStatus");
local v11 = Vector2.new(50, 20);
local v12 = Vector2.new(10, 6);
v10.validateProps = v4.strictInterface({
    statusText = v4.string, 
    statusStyle = v9.StatusStyle.isEnumValue
});
local function v15(v13, v14)
    if v14 == v9.StatusStyle.Info then
        return {
            Background = v13.SystemPrimaryDefault, 
            Text = v13.SystemPrimaryContent
        };
    elseif v14 == v9.StatusStyle.Alert then
        return {
            Background = v13.Alert, 
            Text = v13.TextEmphasis
        };
    else
        return {
            Background = v13.SystemPrimaryDefault, 
            Text = v13.SystemPrimaryContent
        };
    end;
end;
v10.render = function(v16)
    return v5(function(v17)
        local l_Theme_0 = v17.Theme;
        local l_Font_0 = v17.Font;
        local l_statusText_0 = v16.props.statusText;
        local l_statusStyle_0 = v16.props.statusStyle;
        local l_Font_1 = l_Font_0.CaptionHeader.Font;
        local v23 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
        local v24 = v6(l_statusText_0, v23, l_Font_1, v11);
        local v25 = v15(l_Theme_0, l_statusStyle_0);
        return v3.createElement(v8.Label, {
            BackgroundTransparency = 1, 
            Image = v7["component_assets/circle_17"], 
            ImageColor3 = v25.Background.Color, 
            ImageTransparency = v25.Background.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            Position = UDim2.new(0, 12, 0, 12), 
            Size = UDim2.new(0, v24.X + v12.X, 0, v24.Y + v12.Y)
        }, {
            Text = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                TextSize = v23, 
                Text = l_statusText_0, 
                TextColor3 = v25.Text.Color, 
                TextTransparency = v25.Text.TextTransparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(1, 0, 1, 0)
            })
        });
    end);
end;
return v10;
