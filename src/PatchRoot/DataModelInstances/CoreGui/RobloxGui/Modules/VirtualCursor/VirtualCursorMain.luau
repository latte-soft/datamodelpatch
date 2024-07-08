local l_Parent_0 = script.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Input_0 = require(l_Parent_0:WaitForChild("Input"));
local l_Interface_0 = require(l_Parent_0:WaitForChild("Interface"));
local l_OnRenderStep_0 = require(l_Parent_0:WaitForChild("OnRenderStep"));
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = false;
local function v14(v13)
    if v9 then
        v13 = v13 or v9.CursorPosition;
        v9.Enabled = true;
        v9.CursorPosition = v13;
        l_Interface_0:EnableUI(v13);
        l_GamepadService_0:SetGamepadCursorPosition(v13);
        l_Input_0:EnableInput();
        l_RunService_0:BindToRenderStep("VirtualCursorStepped", Enum.RenderPriority.Input.Value + 1, v9.OnRenderStep);
        v11 = l_GuiService_0.MenuOpened:Connect(function()
            l_GamepadService_0.GamepadCursorEnabled = false;
        end);
        return ;
    else
        return ;
    end;
end;
local function v15()
    if v9.Enabled then
        v11:Disconnect();
        v11 = nil;
        v9.PreviouslySelectedObject = nil;
        l_Interface_0:DisableUI();
        l_Input_0:DisableInput();
        l_RunService_0:UnbindFromRenderStep("VirtualCursorStepped");
        if v9.SelectedObject then
            l_GuiService_0.SelectedObject = nil;
            l_GuiService_0.SelectedCoreObject = nil;
            v9.SelectedObject = nil;
        end;
        v9.Enabled = false;
        return ;
    else
        return ;
    end;
end;
local v16 = {};
v16.__index = v16;
v16.GetEnabled = function(v17)
    return v17.Enabled;
end;
v16.new = function()
    local v18 = {
        Enabled = false, 
        CursorPosition = Vector2.new(), 
        SelectedObject = nil, 
        PreviouslySelectedObject = nil
    };
    v18.OnRenderStep = function(v19)
        l_OnRenderStep_0(v18, v19);
    end;
    v10 = l_UserInputService_0.LastInputTypeChanged:Connect(function(v20)
        if not (v20 ~= Enum.UserInputType.Gamepad1 and v20 ~= Enum.UserInputType.Focus) or not l_GamepadService_0.GamepadCursorEnabled then
            if not (not (v20 == Enum.UserInputType.Gamepad1) or not v12) then
                l_GamepadService_0.GamepadCursorEnabled = true;
                v12 = false;
            end;
            return ;
        else
            l_GamepadService_0.GamepadCursorEnabled = false;
            v12 = true;
            return ;
        end;
    end);
    setmetatable(v18, v16);
    v9 = v18;
    return v18;
end;
l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function()
    local l_GamepadCursorEnabled_0 = l_GamepadService_0.GamepadCursorEnabled;
    if v9 then
        if not l_GamepadCursorEnabled_0 then
            v15();
        else
            v14((l_UserInputService_0:GetMouseLocation()));
            return ;
        end;
    end;
end);
return v16.new();
