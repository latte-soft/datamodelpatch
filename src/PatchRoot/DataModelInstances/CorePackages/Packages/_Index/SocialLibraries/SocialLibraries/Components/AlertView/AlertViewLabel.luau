local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local v3 = l_Roact_0.PureComponent:extend("AlertViewLabel");
v3.defaultProps = {
    BackgroundTransparency = 1, 
    Size = UDim2.new(1, 0, 0, 40), 
    Text = "", 
    TextXAlignment = Enum.TextXAlignment.Center
};
v3.render = function(v4)
    return l_UIBlox_0.Style.withStyle(function(v5)
        return l_Roact_0.createElement("TextLabel", {
            BackgroundTransparency = v4.props.BackgroundTransparency, 
            Font = v4.props.Font or v5.Font.Body.Font, 
            LayoutOrder = v4.props.LayoutOrder, 
            Size = v4.props.Size, 
            Text = v4.props.Text, 
            TextColor3 = v4.props.TextColor3 or v5.Theme.TextDefault.Color, 
            TextSize = v4.props.TextSize or v5.Font.Body.RelativeSize * v5.Font.BaseSize, 
            TextWrapped = true, 
            TextXAlignment = v4.props.TextXAlignment
        });
    end);
end;
return v3;
