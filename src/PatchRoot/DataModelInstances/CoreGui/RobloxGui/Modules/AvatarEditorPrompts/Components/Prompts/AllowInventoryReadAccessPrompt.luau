local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v8 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local v9 = require(script.Parent.Parent.Parent.Thunks.SetAllowInventoryReadAccess);
local v10 = v2.PureComponent:extend("AllowInventoryReadAccessPrompt");
v10.validateProps = v4.strictInterface({
    gameName = v4.string, 
    screenSize = v4.Vector2, 
    setAvatarReadAccessAllowed = v4.callback, 
    setAvatarReadAccessDenied = v4.callback
});
v10.render = function(v11)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptTitle"), 
        bodyText = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptText", {
            RBX_NAME = v11.props.gameName
        }), 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v11.props.setAvatarReadAccessDenied, 
                        text = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptNo")
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v11.props.setAvatarReadAccessAllowed, 
                        text = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptYes")
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v11.props.screenSize
    });
end;
return v3.connect(function(v12)
    return {
        gameName = v12.gameName, 
        screenSize = v12.screenSize
    };
end, function(v13)
    return {
        setAvatarReadAccessDenied = function()
            return v13(v9(false));
        end, 
        setAvatarReadAccessAllowed = function()
            return v13(v9(true));
        end
    };
end)(v10);
