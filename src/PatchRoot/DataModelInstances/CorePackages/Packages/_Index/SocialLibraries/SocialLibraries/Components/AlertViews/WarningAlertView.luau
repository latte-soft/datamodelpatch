local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_ButtonType_0 = v1.UIBlox.App.Button.Enum.ButtonType;
local v5 = require(l_Components_0.AlertViewBuilder.AlertViewBuilder);
local v6 = l_Roact_0.Component:extend("WarningAlertView");
v6.defaultProps = {
    titleText = "TestTitle", 
    bodyText = "TestBody", 
    cancelText = "TestCancel", 
    confirmText = "TestConfirm", 
    failureTitleText = "failure title", 
    failureBodyText = "Thing failure", 
    failureButtonText = "failure Placeholder", 
    screenSize = Vector2.new(0, 0), 
    width = UDim.new(0.5, 0), 
    displayFailed = false, 
    onActivated = function()
    end, 
    onModalClose = function()
    end, 
    soakAreaColor3 = Color3.fromRGB(0, 0, 255), 
    soakAreaTransparency = 0.9
};
local function v7()
end;
v6.render = function(v8)
    local l_props_0 = v8.props;
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    if not l_props_0.displayFailed then
        v11 = v8.props.titleText;
        v12 = v8.props.bodyText;
        v10 = {
            {
                buttonType = l_ButtonType_0.Secondary, 
                props = {
                    text = l_props_0.cancelText, 
                    onActivated = v7
                }
            }, 
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    text = l_props_0.confirmText, 
                    onActivated = l_props_0.onActivated
                }
            }
        };
    else
        v11 = v8.props.failureTitleText;
        v12 = v8.props.failureBodyText;
        v10 = {
            {
                buttonType = l_ButtonType_0.Alert, 
                props = {
                    text = l_props_0.failureButtonText, 
                    onActivated = v7
                }
            }
        };
    end;
    return l_Roact_0.createElement(v5, {
        title = v11, 
        bodyText = v12, 
        screenSize = v8.props.screenSize, 
        width = v8.props.width, 
        onModalClose = v8.props.onModalClose, 
        buttons = v10, 
        soakAreaColor3 = l_props_0.soakAreaColor3, 
        soakAreaTransparency = l_props_0.soakAreaTransparency
    });
end;
return v6;
