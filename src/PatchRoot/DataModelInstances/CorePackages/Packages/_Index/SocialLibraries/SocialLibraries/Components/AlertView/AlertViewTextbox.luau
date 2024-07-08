local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_Cryo_0 = v0.Cryo;
local v4 = require(script.Parent.Images);
local v5 = Color3.fromRGB(200, 200, 200);
local v6 = Rect.new(7, 8, 7, 8);
local v7 = l_Roact_0.PureComponent:extend("AlertViewTextbox");
v7.defaultProps = {
    LayoutOrder = 0, 
    Text = "", 
    PlaceholderText = nil
};
v7.render = function(v8)
    return l_UIBlox_0.Style.withStyle(function(v9)
        local v10 = Vector2.new(0, 0);
        local v11 = Vector2.new(0, 0);
        local _ = nil;
        local l_Font_0 = v9.Font;
        local l_LayoutOrder_0 = v8.props.LayoutOrder;
        local l_PlaceholderText_0 = v8.props.PlaceholderText;
        local l_Theme_0 = v9.Theme;
        return l_Roact_0.createElement("ImageLabel", {
            ImageRectSize = v11, 
            BackgroundTransparency = 1, 
            Image = v4.buttonStroke.Image, 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageRectOffset = v10, 
            LayoutOrder = l_LayoutOrder_0, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 0, 30), 
            SliceCenter = v6
        }, {
            Textbox = l_Roact_0.createElement("TextBox", {
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                Font = l_Font_0.Header2.Font, 
                PlaceholderText = l_PlaceholderText_0, 
                PlaceholderColor3 = v5, 
                Position = UDim2.new(0, 6, 0, 0), 
                Size = UDim2.new(1, -12, 1, 0), 
                Text = v8.props.Text, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                [l_Roact_0.Change.Text] = function(v17)
                    if v8.props.onTextChanged then
                        v8.props.onTextChanged(v17.Text);
                    end;
                end, 
                [l_Roact_0.Ref] = v8.props.forwardRef
            })
        });
    end);
end;
return l_Roact_0.forwardRef(function(v18, v19)
    return l_Roact_0.createElement(v7, l_Cryo_0.Dictionary.join(v18, {
        forwardRef = v19
    }));
end);
