local l_UserInputService_0 = game:GetService("UserInputService");
local v1 = require(script.Parent.Parent.React);
local v2 = {
    [Enum.UserInputType.MouseButton1] = "Mouse", 
    [Enum.UserInputType.MouseButton2] = "Mouse", 
    [Enum.UserInputType.MouseButton3] = "Mouse", 
    [Enum.UserInputType.MouseWheel] = "Mouse", 
    [Enum.UserInputType.MouseMovement] = "Mouse", 
    [Enum.UserInputType.Touch] = "Touch", 
    [Enum.UserInputType.Keyboard] = "Keyboard", 
    [Enum.UserInputType.Focus] = nil, 
    [Enum.UserInputType.Accelerometer] = nil, 
    [Enum.UserInputType.Gyro] = nil, 
    [Enum.UserInputType.Gamepad1] = "Gamepad", 
    [Enum.UserInputType.Gamepad2] = "Gamepad", 
    [Enum.UserInputType.Gamepad3] = "Gamepad", 
    [Enum.UserInputType.Gamepad4] = "Gamepad", 
    [Enum.UserInputType.Gamepad5] = "Gamepad", 
    [Enum.UserInputType.Gamepad6] = "Gamepad", 
    [Enum.UserInputType.Gamepad7] = "Gamepad", 
    [Enum.UserInputType.Gamepad8] = "Gamepad", 
    [Enum.UserInputType.TextInput] = nil, 
    [Enum.UserInputType.InputMethod] = nil, 
    [Enum.UserInputType.None] = nil
};
return function()
    local v3, v4 = v1.useState(v2[l_UserInputService_0:GetLastInputType()] or "None");
    v1.useEffect(function()
        local v7 = l_UserInputService_0.LastInputTypeChanged:Connect(function(v5)
            local v6 = v2[v5];
            if v6 then
                v4(v6);
            end;
        end);
        return function()
            v7:Disconnect();
        end;
    end, {});
    return v3;
end;
