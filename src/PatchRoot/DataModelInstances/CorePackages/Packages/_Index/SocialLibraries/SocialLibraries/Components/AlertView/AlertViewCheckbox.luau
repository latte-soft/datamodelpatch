local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local v3 = require(script.Parent.CheckIcon);
local v4 = l_Roact_0.Component:extend("AlertViewCheckbox");
v4.defaultProps = {
    Text = "", 
    LayoutOrder = 0, 
    onActivated = function()
    end, 
    checked = false
};
v4.render = function(v5)
    return l_UIBlox_0.Style.withStyle(function(v6)
        return l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v5.props.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, 35)
        }, {
            List = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 10)
            }), 
            Checkbox = l_Roact_0.createElement(v3, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                checked = v5.props.checked, 
                onActivated = v5.props.onActivated
            }), 
            Label = l_Roact_0.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Size = UDim2.new(0.7, 0, 1, 0), 
                Text = v5.props.Text, 
                TextColor3 = v5.props.TextColor3 or v6.Theme.TextDefault.Color, 
                TextSize = v5.props.TextSize or v6.Font.Body.RelativeSize * v6.Font.BaseSize, 
                Font = v5.props.Font or v6.Font.CaptionSubHeader.Font, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        });
    end);
end;
return v4;
