local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local v5 = require(l_CorePackages_0.Packages.t);
local l_InteractiveAlert_0 = require(l_CorePackages_0.UIBlox).App.Dialog.Alert.InteractiveAlert;
local v7 = v2.PureComponent:extend("SimpleTextAlertPrompt");
v7.validateProps = v5.strictInterface({
    titleKey = v5.string, 
    bodyTextKey = v5.string, 
    confirmButtonTextKey = v5.string, 
    confirmButtonCallback = v5.callback, 
    screenSize = v5.Vector2
});
v7.render = function(v8)
    local l_titleKey_0 = v8.props.titleKey;
    local l_bodyTextKey_0 = v8.props.bodyTextKey;
    local l_confirmButtonTextKey_0 = v8.props.confirmButtonTextKey;
    local l_confirmButtonCallback_0 = v8.props.confirmButtonCallback;
    local l_screenSize_0 = v8.props.screenSize;
    return v4({
        title = l_titleKey_0, 
        bodyText = l_bodyTextKey_0, 
        confirmButtonText = l_confirmButtonTextKey_0
    })(function(v14)
        return v2.createElement(l_InteractiveAlert_0, {
            title = v14.title, 
            bodyText = v14.bodyText, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = l_confirmButtonCallback_0, 
                            text = v14.confirmButtonText
                        }
                    }
                }
            }, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = l_screenSize_0
        });
    end);
end;
return v3.connect(function(v15)
    return {
        screenSize = v15.ScreenSize
    };
end, function(_)
    return {};
end)(v7);
