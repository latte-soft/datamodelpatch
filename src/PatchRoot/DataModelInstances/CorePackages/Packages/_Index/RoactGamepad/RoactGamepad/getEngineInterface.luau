local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v13 = {
    getGamepadConnected = function(v4)
        return l_UserInputService_0:GetGamepadConnected(v4);
    end, 
    getGamepadState = function(v5)
        return l_UserInputService_0:GetGamepadState(v5);
    end, 
    getNavigationGamepads = function()
        return l_UserInputService_0:GetNavigationGamepads();
    end, 
    getSelection = function()
        return l_GuiService_0.SelectedCoreObject;
    end, 
    setSelection = function(v6)
        l_GuiService_0.SelectedCoreObject = v6;
    end, 
    subscribeToSelectionChanged = function(v7)
        return l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(v7);
    end, 
    subscribeToRenderStepped = function(v8)
        return l_RunService_0.RenderStepped:Connect(v8);
    end, 
    subscribeToGamepadConnected = function(v9)
        return l_UserInputService_0.GamepadConnected:Connect(v9);
    end, 
    subscribeToGamepadDisconnected = function(v10)
        return l_UserInputService_0.GamepadDisconnected:Connect(v10);
    end, 
    subscribeToInputBegan = function(v11)
        return l_UserInputService_0.InputBegan:Connect(v11);
    end, 
    subscribeToInputEnded = function(v12)
        return l_UserInputService_0.InputEnded:Connect(v12);
    end
};
local v16 = {
    getSelection = function()
        return l_GuiService_0.SelectedObject;
    end, 
    setSelection = function(v14)
        l_GuiService_0.SelectedObject = v14;
    end, 
    subscribeToSelectionChanged = function(v15)
        return l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(v15);
    end, 
    getGamepadConnected = v13.getGamepadConnected, 
    getGamepadState = v13.getGamepadState, 
    getNavigationGamepads = v13.getNavigationGamepads, 
    subscribeToRenderStepped = v13.subscribeToRenderStepped, 
    subscribeToGamepadConnected = v13.subscribeToGamepadConnected, 
    subscribeToGamepadDisconnected = v13.subscribeToGamepadDisconnected, 
    subscribeToInputBegan = v13.subscribeToInputBegan, 
    subscribeToInputEnded = v13.subscribeToInputEnded
};
return function(v17)
    if not v17:IsDescendantOf(l_CoreGui_0) then
        if v17:FindFirstAncestorWhichIsA("PlayerGui") == nil then
            error("Gamepad navigation not supported. Must be a child of CoreGui or a PlayerGui");
        end;
        return v16;
    else
        return v13;
    end;
end;
