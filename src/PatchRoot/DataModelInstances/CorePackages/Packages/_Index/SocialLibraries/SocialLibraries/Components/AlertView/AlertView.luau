local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local v3 = require(script.Parent.Parent.FitFrameVertical);
local v4 = l_Roact_0.Component:extend("AlertView");
v4.defaultProps = {
    Visible = false, 
    width = UDim.new(0.5, 0), 
    contentPaddingLeft = 12, 
    contentPaddingRight = 12, 
    contentPaddingTop = 12, 
    contentPaddingBottom = 12
};
v4.render = function(v5)
    return l_UIBlox_0.Style.withStyle(function(v6)
        return l_Roact_0.createElement(v3, {
            Visible = v5.props.Visible, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = v6.Theme.BackgroundUIDefault.Color, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            width = v5.props.width
        }, {
            InnerFrame = l_Roact_0.createElement(v3, {
                margin = {
                    top = v5.props.contentPaddingTop, 
                    bottom = v5.props.contentPaddingBottom, 
                    left = v5.props.contentPaddingLeft, 
                    right = v5.props.contentPaddingRight
                }, 
                width = UDim.new(1, 0), 
                BackgroundTransparency = 1, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }, v5.props[l_Roact_0.Children])
        });
    end);
end;
return v4;
