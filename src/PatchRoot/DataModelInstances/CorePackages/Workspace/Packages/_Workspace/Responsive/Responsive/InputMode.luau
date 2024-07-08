local l_VRService_0 = game:GetService("VRService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Signal_0 = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Signal;
local v3 = {
    Pointer = "Pointer", 
    Touch = "Touch", 
    Directional = "Directional"
};
local v4 = {
    [Enum.UserInputType.MouseButton1] = v3.Pointer, 
    [Enum.UserInputType.MouseButton2] = v3.Pointer, 
    [Enum.UserInputType.MouseButton3] = v3.Pointer, 
    [Enum.UserInputType.MouseWheel] = v3.Pointer, 
    [Enum.UserInputType.MouseMovement] = v3.Pointer, 
    [Enum.UserInputType.Keyboard] = v3.Pointer, 
    [Enum.UserInputType.TextInput] = v3.Pointer, 
    [Enum.UserInputType.Gamepad1] = v3.Directional, 
    [Enum.UserInputType.Gamepad2] = v3.Directional, 
    [Enum.UserInputType.Gamepad3] = v3.Directional, 
    [Enum.UserInputType.Gamepad4] = v3.Directional, 
    [Enum.UserInputType.Gamepad5] = v3.Directional, 
    [Enum.UserInputType.Gamepad6] = v3.Directional, 
    [Enum.UserInputType.Gamepad7] = v3.Directional, 
    [Enum.UserInputType.Gamepad8] = v3.Directional, 
    [Enum.UserInputType.Touch] = v3.Touch, 
    [Enum.UserInputType.None] = v3.Pointer
};
local v5 = l_Signal_0.new();
local v6 = {
    preferred = nil, 
    last = nil
};
local v7 = {
    [Enum.Platform.XBoxOne] = true, 
    [Enum.Platform.XBox360] = true, 
    [Enum.Platform.WiiU] = true, 
    [Enum.Platform.PS3] = true, 
    [Enum.Platform.PS4] = true, 
    [Enum.Platform.PS5] = true, 
    [Enum.Platform.Ouya] = true, 
    [Enum.Platform.AndroidTV] = true
};
local v8 = {
    [Enum.Platform.IOS] = true, 
    [Enum.Platform.Android] = true
};
getPreferredInput = function()
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local l_VREnabled_0 = l_VRService_0.VREnabled;
    local v11 = v7[l_l_UserInputService_0_Platform_0] or false;
    local v12 = v8[l_l_UserInputService_0_Platform_0] or false;
    if not l_VREnabled_0 then
        if not v11 then
            if not v12 then
                return v3.Pointer;
            else
                return v3.Touch;
            end;
        else
            return v3.Directional;
        end;
    else
        return v3.Pointer;
    end;
end;
updatePreferredInput = function()
    local v13 = getPreferredInput();
    if v13 ~= v6.preferred then
        v6.preferred = v13;
        if v6.last == nil then
            v6.last = v6.preferred;
        end;
        v5:fire();
    end;
end;
updateLastInput = function()
    local v14 = v4[l_UserInputService_0:GetLastInputType()];
    if v14 and v14 ~= v6.last then
        v6.last = v14;
        v5:fire();
    end;
end;
init = function()
    l_UserInputService_0.GamepadConnected:Connect(updatePreferredInput);
    l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(updatePreferredInput);
    l_UserInputService_0:GetPropertyChangedSignal("MouseEnabled"):Connect(updatePreferredInput);
    l_UserInputService_0:GetPropertyChangedSignal("TouchEnabled"):Connect(updatePreferredInput);
    l_UserInputService_0:GetPropertyChangedSignal("GamepadEnabled"):Connect(updatePreferredInput);
    l_UserInputService_0.LastInputTypeChanged:Connect(updateLastInput);
    updateLastInput();
    updatePreferredInput();
end;
init();
return {
    Enum = v3, 
    preferredInputRules = {
        {
            Key = v3.Directional, 
            preferredInput = v3.Directional
        }, 
        {
            Key = v3.Pointer, 
            preferredInput = v3.Pointer
        }, 
        {
            Key = v3.Touch, 
            preferredInput = v3.Touch
        }
    }, 
    lastInputRules = {
        {
            Key = v3.Directional, 
            lastInput = v3.Directional
        }, 
        {
            Key = v3.Pointer, 
            lastInput = v3.Pointer
        }, 
        {
            Key = v3.Touch, 
            lastInput = v3.Touch
        }
    }, 
    connect = function(v15)
        return v5:connect(v15);
    end, 
    preferred = function()
        return v6.preferred;
    end, 
    last = function()
        return v6.last;
    end
};
