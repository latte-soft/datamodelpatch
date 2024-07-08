local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_ButtonType_0 = v1.UIBlox.App.Button.Enum.ButtonType;
local v5 = require(l_Components_0.AlertViewBuilder.AlertViewBuilder);
local v6 = l_Roact_0.Component:extend("InfoAlertView");
v6.defaultProps = {
    titleText = "TestTitle", 
    bodyText = "TestBody", 
    confirmText = "TestConfirm", 
    width = UDim.new(0.5, 0), 
    screenSize = Vector2.new(0, 0), 
    onModalClose = function()
    end, 
    soakAreaColor3 = Color3.fromRGB(0, 0, 255), 
    soakAreaTransparency = 0.9
};
v6.render = function(v7)
    local l_props_0 = v7.props;
    return l_Roact_0.createElement(v5, {
        title = l_props_0.titleText, 
        bodyText = l_props_0.bodyText, 
        width = l_props_0.width, 
        screenSize = l_props_0.screenSize, 
        onModalClose = l_props_0.onModalClose, 
        buttons = {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    text = l_props_0.confirmText, 
                    onActivated = l_props_0.onModalClose
                }
            }
        }, 
        soakAreaColor3 = l_props_0.soakAreaColor3, 
        soakAreaTransparency = l_props_0.soakAreaTransparency
    });
end;
return v6;
