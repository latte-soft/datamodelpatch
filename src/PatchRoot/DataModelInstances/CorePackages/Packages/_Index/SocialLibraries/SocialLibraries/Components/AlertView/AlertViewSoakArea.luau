local l_Roact_0 = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact;
local v1 = l_Roact_0.PureComponent:extend("AlertViewSoakArea");
v1.defaultProps = {
    Visible = true, 
    BackgroundTransparency = 0.75, 
    BackgroundColor3 = Color3.fromRGB(255, 0, 255)
};
v1.render = function(v2)
    return l_Roact_0.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v2.props.BackgroundTransparency, 
        BackgroundColor3 = v2.props.BackgroundColor3, 
        Active = true, 
        AutoButtonColor = false, 
        Visible = v2.props.Visible
    }, v2.props[l_Roact_0.Children]);
end;
return v1;
