local l_Signal_0 = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Signal;
local v1 = {};
v1.__index = v1;
v1.new = function()
    return (setmetatable({
        DeviceAccelerationChanged = l_Signal_0.new(), 
        DeviceGravityChanged = l_Signal_0.new(), 
        DeviceRotationChanged = l_Signal_0.new(), 
        GamepadConnected = l_Signal_0.new(), 
        GamepadDisconnected = l_Signal_0.new(), 
        InputBegan = l_Signal_0.new(), 
        InputChanged = l_Signal_0.new(), 
        InputEnded = l_Signal_0.new(), 
        JumpRequest = l_Signal_0.new(), 
        LastInputTypeChanged = l_Signal_0.new(), 
        PointerAction = l_Signal_0.new(), 
        StatusBarTapped = l_Signal_0.new(), 
        TextBoxFocusReleased = l_Signal_0.new(), 
        TextBoxFocused = l_Signal_0.new(), 
        TouchEnded = l_Signal_0.new(), 
        TouchLongPress = l_Signal_0.new(), 
        TouchMoved = l_Signal_0.new(), 
        TouchPan = l_Signal_0.new(), 
        TouchPinch = l_Signal_0.new(), 
        TouchRotate = l_Signal_0.new(), 
        TouchStarted = l_Signal_0.new(), 
        TouchSwipe = l_Signal_0.new(), 
        TouchTap = l_Signal_0.new(), 
        TouchTapInWorld = l_Signal_0.new(), 
        UserCFrameChanged = l_Signal_0.new(), 
        WindowFocusReleased = l_Signal_0.new(), 
        WindowFocused = l_Signal_0.new()
    }, v1));
end;
return v1;
