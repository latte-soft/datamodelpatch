local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local v5 = l_Roact_0.PureComponent:extend("AlertViewButton");
v5.defaultProps = {
    LayoutOrder = 0, 
    secondary = false, 
    onActivated = function()
    end, 
    Size = UDim2.new(1, 0, 1, 0), 
    Text = ""
};
v5.render = function(v6)
    local l_PrimarySystem_0 = l_ButtonType_0.PrimarySystem;
    if v6.props.secondary then
        l_PrimarySystem_0 = l_ButtonType_0.Secondary;
    end;
    return l_Roact_0.createElement(l_Button_0, {
        buttonType = l_PrimarySystem_0, 
        size = v6.props.Size, 
        layoutOrder = v6.props.LayoutOrder, 
        text = v6.props.Text, 
        onActivated = v6.props.onActivated
    });
end;
return v5;
