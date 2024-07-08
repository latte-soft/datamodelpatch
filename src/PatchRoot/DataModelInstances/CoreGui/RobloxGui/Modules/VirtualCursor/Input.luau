local l_Parent_0 = script.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v6 = require(l_Parent_0.Properties);
local v7 = require(l_Parent_0.Interface);
local v8 = {};
local v9 = Vector2.new();
local v10 = Vector2.new();
local v11 = false;
local v12 = nil;
local function v19(v13)
    local v14 = 0;
    local v15 = 0;
    if v6.ThumbstickDeadzone <= v13.Magnitude then
        local v16 = math.atan2(v13.y, v13.x);
        local v17 = math.abs(math.cos(v16) * v6.ThumbstickDeadzone);
        local v18 = math.abs(math.sin(v16) * v6.ThumbstickDeadzone);
        v14 = (math.max(math.abs(v13.x) - v17, 0) / (1 - v17)) * math.sign(v13.x);
        v15 = (math.max(math.abs(v13.y) - v18, 0) / (1 - v18)) * math.sign(v13.y);
    end;
    return Vector2.new(v14, -v15);
end;
local function v23(_, v21, v22)
    if v21 == Enum.UserInputState.Change then
        v10 = Vector2.new(v22.Position.x, v22.Position.y * -1);
        return Enum.ContextActionResult.Sink;
    else
        v10 = Vector2.new();
        return Enum.ContextActionResult.Pass;
    end;
end;
l_UserInputService_0.InputBegan:Connect(function(v24)
    if v11 then
        if not (not (v24.UserInputType == Enum.UserInputType.Gamepad1 and v24.KeyCode == Enum.KeyCode.ButtonA) or not l_GuiService_0.SelectedObject and not l_GuiService_0.SelectedCoreObject) then
            v7:PlayCursorTweenActivate();
        end;
        return ;
    else
        return ;
    end;
end);
l_UserInputService_0.InputEnded:Connect(function(v25)
    if v11 then
        if v25.UserInputType == Enum.UserInputType.Gamepad1 and v25.KeyCode == Enum.KeyCode.ButtonA then
            v7:PlayCursorTweenDefault();
        end;
        return ;
    else
        return ;
    end;
end);
v8.GetThumbstickVector = function(_)
    return v9;
end;
v8.GetThumbstick2Vector = function(_)
    return v10;
end;
v8.EnableInput = function(_)
    v12 = l_GamepadService_0.GamepadThumbstick1Changed:Connect(function(v29)
        v9 = v19(v29);
    end);
    l_ContextActionService_0:BindCoreActionAtPriority("VirtualCursorThumbstick2Movement", v23, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick2);
    v11 = true;
end;
v8.DisableInput = function(_)
    v12:Disconnect();
    v12 = nil;
    l_ContextActionService_0:UnbindCoreAction("VirtualCursorThumbstick2Movement");
    if Enum.UserInputState.Cancel == Enum.UserInputState.Change then
        v10 = Vector2.new((nil).Position.x, (nil).Position.y * -1);
        local _ = Enum.ContextActionResult.Sink;
    else
        v10 = Vector2.new();
        local _ = Enum.ContextActionResult.Pass;
    end;
    v11 = false;
end;
return v8;
