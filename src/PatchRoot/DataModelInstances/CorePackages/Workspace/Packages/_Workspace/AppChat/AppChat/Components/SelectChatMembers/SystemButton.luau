local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v4 = v1.PureComponent:extend("SystemButton");
v4.defaultProps = {
    text = "Text", 
    enabled = false, 
    onActivated = nil
};
v4.render = function(v5)
    return v2.Style.withStyle(function(v6)
        local l_text_0 = v5.props.text;
        local l_Font_0 = v6.Font.Header1.Font;
        local v9 = l_Text_0.GetTextWidth(l_text_0, l_Font_0, 24);
        local _ = nil;
        return v1.createElement("TextButton", {
            BackgroundTransparency = 1, 
            Text = "", 
            Size = UDim2.new(0, v9 + 8, 1, 0), 
            [v1.Event.Activated] = v5.props.onActivated
        }, {
            layout = v1.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            label = v1.createElement("TextLabel", {
                Size = UDim2.new(0, v9, 0, 24), 
                BackgroundTransparency = 1, 
                Text = l_text_0, 
                Font = l_Font_0, 
                TextSize = 24, 
                TextColor3 = v6.Theme.SystemPrimaryDefault.Color, 
                TextTransparency = not v5.props.enabled and 0.7 or 0
            })
        });
    end);
end;
return v4;
