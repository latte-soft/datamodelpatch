local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
return function(v6)
    return v2.createElement(l_PartialPageModal_0, {
        title = v4({
            alertTitle = "Authentication.CrossDevice.Heading.QuickLogin"
        }).alertTitle, 
        screenSize = v6.screenSize, 
        onCloseClicked = v6.onCloseClicked, 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        anchorPoint = Vector2.new(0.5, 0.5)
    }, {
        ViewContainer = v6.loginCode
    });
end;
