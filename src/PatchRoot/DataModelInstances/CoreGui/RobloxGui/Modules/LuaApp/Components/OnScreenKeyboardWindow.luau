local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Common_0 = l_Modules_0.Common;
local v4 = require(l_Common_0.Roact);
local _ = require(l_Common_0.RoactRodux);
local _ = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local _ = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local _ = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v9 = v4.PureComponent:extend("OnScreenKeyboardWindow");
v9.init = function(v10)
    v10.state = {
        onScreenKeyboardHeight = 0
    };
end;
v9.didMount = function(v11)
    v11.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function()
        v11:setState({
            onScreenKeyboardHeight = not not l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0
        });
    end);
end;
v9.willUnmount = function(v12)
    if v12.keyboardVisibleChanged then
        v12.keyboardVisibleChanged:disconnect();
        v12.keyboardVisibleChanged = nil;
    end;
end;
v9.render = function(v13)
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, -v13.state.onScreenKeyboardHeight), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 1
    }, v13.props.Contents);
end;
return v9;
