local l_UserInputService_0 = game:GetService("UserInputService");
local l_ProximityPromptService_0 = game:GetService("ProximityPromptService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v8 = require(l_RobloxGui_0.Modules.CoreUtility);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v10 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableAutomaticSizeVerticalOffsetWidthFix);
local v11 = require(l_RobloxGui_0.Modules.Flags.FFlagProximityPromptGamepadIcons);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v13 = v8.waitForChildOfClass(l_LocalPlayer_0, "PlayerGui");
local v14 = {
    [Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/xboxX.png", 
    [Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/xboxY.png", 
    [Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/xboxA.png", 
    [Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/xboxB.png", 
    [Enum.KeyCode.DPadLeft] = "rbxasset://textures/ui/Controls/dpadLeft.png", 
    [Enum.KeyCode.DPadRight] = "rbxasset://textures/ui/Controls/dpadRight.png", 
    [Enum.KeyCode.DPadUp] = "rbxasset://textures/ui/Controls/dpadUp.png", 
    [Enum.KeyCode.DPadDown] = "rbxasset://textures/ui/Controls/dpadDown.png", 
    [Enum.KeyCode.ButtonSelect] = "rbxasset://textures/ui/Controls/xboxView.png", 
    [Enum.KeyCode.ButtonStart] = "rbxasset://textures/ui/Controls/xboxmenu.png", 
    [Enum.KeyCode.ButtonL1] = "rbxasset://textures/ui/Controls/xboxLB.png", 
    [Enum.KeyCode.ButtonR1] = "rbxasset://textures/ui/Controls/xboxRB.png", 
    [Enum.KeyCode.ButtonL2] = "rbxasset://textures/ui/Controls/xboxLT.png", 
    [Enum.KeyCode.ButtonR2] = "rbxasset://textures/ui/Controls/xboxRT.png", 
    [Enum.KeyCode.ButtonL3] = "rbxasset://textures/ui/Controls/xboxLS.png", 
    [Enum.KeyCode.ButtonR3] = "rbxasset://textures/ui/Controls/xboxRS.png", 
    [Enum.KeyCode.Thumbstick1] = "rbxasset://textures/ui/Controls/xboxLSDirectional.png", 
    [Enum.KeyCode.Thumbstick2] = "rbxasset://textures/ui/Controls/xboxRSDirectional.png"
};
local v15 = {
    [Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png", 
    [Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png", 
    [Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
};
if l_UserInputService_0:GetPlatform() == Enum.Platform.OSX then
    v15[Enum.KeyCode.LeftMeta] = "rbxasset://textures/ui/Controls/command.png";
    v15[Enum.KeyCode.RightMeta] = "rbxasset://textures/ui/Controls/command.png";
    v15[Enum.KeyCode.LeftAlt] = "rbxasset://textures/ui/Controls/option.png";
    v15[Enum.KeyCode.RightAlt] = "rbxasset://textures/ui/Controls/option.png";
end;
local v16 = {
    ["'"] = "rbxasset://textures/ui/Controls/apostrophe.png", 
    [","] = "rbxasset://textures/ui/Controls/comma.png", 
    ["`"] = "rbxasset://textures/ui/Controls/graveaccent.png", 
    ["."] = "rbxasset://textures/ui/Controls/period.png", 
    [" "] = "rbxasset://textures/ui/Controls/spacebar.png"
};
local v17 = {
    [Enum.KeyCode.LeftControl] = "Ctrl", 
    [Enum.KeyCode.RightControl] = "Ctrl", 
    [Enum.KeyCode.LeftAlt] = "Alt", 
    [Enum.KeyCode.RightAlt] = "Alt", 
    [Enum.KeyCode.F1] = "F1", 
    [Enum.KeyCode.F2] = "F2", 
    [Enum.KeyCode.F3] = "F3", 
    [Enum.KeyCode.F4] = "F4", 
    [Enum.KeyCode.F5] = "F5", 
    [Enum.KeyCode.F6] = "F6", 
    [Enum.KeyCode.F7] = "F7", 
    [Enum.KeyCode.F8] = "F8", 
    [Enum.KeyCode.F9] = "F9", 
    [Enum.KeyCode.F10] = "F10", 
    [Enum.KeyCode.F11] = "F11", 
    [Enum.KeyCode.F12] = "F12", 
    [Enum.KeyCode.PageUp] = "PgUp", 
    [Enum.KeyCode.PageDown] = "PgDn", 
    [Enum.KeyCode.Home] = "Home", 
    [Enum.KeyCode.End] = "End", 
    [Enum.KeyCode.Insert] = "Ins", 
    [Enum.KeyCode.Delete] = "Del"
};
local v18 = {
    [Enum.KeyCode.LeftControl] = 12, 
    [Enum.KeyCode.RightControl] = 12, 
    [Enum.KeyCode.LeftAlt] = 12, 
    [Enum.KeyCode.RightAlt] = 12, 
    [Enum.KeyCode.F10] = 12, 
    [Enum.KeyCode.F11] = 12, 
    [Enum.KeyCode.F12] = 12, 
    [Enum.KeyCode.PageUp] = 8, 
    [Enum.KeyCode.PageDown] = 8, 
    [Enum.KeyCode.Home] = 8, 
    [Enum.KeyCode.End] = 10, 
    [Enum.KeyCode.Insert] = 10, 
    [Enum.KeyCode.Delete] = 10
};
local function _()
    local l_ProximityPrompts_0 = v13:FindFirstChild("ProximityPrompts");
    if l_ProximityPrompts_0 == nil then
        l_ProximityPrompts_0 = Instance.new("ScreenGui");
        l_ProximityPrompts_0.Name = "ProximityPrompts";
        l_ProximityPrompts_0.ResetOnSpawn = false;
        l_ProximityPrompts_0.Parent = v13;
        l_ProximityPrompts_0.IgnoreGuiInset = true;
    end;
    return l_ProximityPrompts_0;
end;
local function v29(v21, v22, v23, v24)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Size = UDim2.fromScale(0.5, 1);
    l_Frame_0.Position = UDim2.fromScale(not v22 and 0.5 or 0, 0);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.ClipsDescendants = true;
    l_Frame_0.Parent = v21;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Size = UDim2.fromScale(2, 1);
    l_ImageLabel_0.Position = UDim2.fromScale(not v22 and -1 or 0, 0);
    l_ImageLabel_0.Image = "rbxasset://textures/ui/Controls/RadialFill.png";
    l_ImageLabel_0.Parent = l_Frame_0;
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(0.4999, 0), 
        NumberSequenceKeypoint.new(0.5, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    l_UIGradient_0.Rotation = not v22 and 0 or 180;
    l_UIGradient_0.Parent = l_ImageLabel_0;
    local v28 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    table.insert(v23, l_TweenService_0:Create(l_ImageLabel_0, v28, {
        ImageTransparency = 1
    }));
    table.insert(v24, l_TweenService_0:Create(l_ImageLabel_0, v28, {
        ImageTransparency = 0
    }));
    return l_UIGradient_0;
end;
local function v38(v30, v31)
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "CircularProgressBar";
    l_Frame_1.Size = UDim2.fromOffset(58, 58);
    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_1.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_1.BackgroundTransparency = 1;
    local v33 = v29(l_Frame_1, true, v30, v31);
    local v34 = v29(l_Frame_1, false, v30, v31);
    local l_NumberValue_0 = Instance.new("NumberValue");
    l_NumberValue_0.Name = "Progress";
    l_NumberValue_0.Parent = l_Frame_1;
    l_NumberValue_0.Changed:Connect(function(v36)
        local v37 = math.clamp(v36 * 360, 0, 360);
        v33.Rotation = math.clamp(v37, 180, 360);
        v34.Rotation = math.clamp(v37, 0, 180);
    end);
    return l_Frame_1;
end;
local function v99(v39, v40, v41)
    local v42 = {};
    local v43 = {};
    local v44 = {};
    local v45 = {};
    local v46 = TweenInfo.new(v39.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local v47 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v48 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v49 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Name = "Prompt";
    l_BillboardGui_0.AlwaysOnTop = true;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Size = UDim2.fromScale(0.5, 1);
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.BackgroundColor3 = Color3.new(0.07, 0.07, 0.07);
    l_Frame_2.AnchorPoint = Vector2.new(0.5, 0);
    l_Frame_2.Position = UDim2.fromScale(0.5, 0);
    l_Frame_2.Size = UDim2.fromScale(0, 1);
    l_Frame_2.AutomaticSize = Enum.AutomaticSize.X;
    l_Frame_2.Parent = l_BillboardGui_0;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.Parent = l_Frame_2;
    Instance.new("UICorner").Parent = l_Frame_2;
    local l_Frame_3 = Instance.new("Frame");
    l_Frame_3.Name = "InputFrame";
    l_Frame_3.Size = UDim2.fromScale(1, 1);
    l_Frame_3.BackgroundTransparency = 1;
    l_Frame_3.SizeConstraint = Enum.SizeConstraint.RelativeYY;
    l_Frame_3.Parent = l_Frame_2;
    local l_Frame_4 = Instance.new("Frame");
    l_Frame_4.Size = UDim2.fromScale(1, 1);
    l_Frame_4.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_4.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_4.BackgroundTransparency = 1;
    l_Frame_4.Parent = l_Frame_3;
    local l_UIScale_0 = Instance.new("UIScale");
    l_UIScale_0.Parent = l_Frame_4;
    table.insert(v42, l_TweenService_0:Create(l_UIScale_0, v48, {
        Scale = v40 == Enum.ProximityPromptInputType.Touch and 1.6 or 1.33
    }));
    table.insert(v43, l_TweenService_0:Create(l_UIScale_0, v48, {
        Scale = 1
    }));
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "ActionText";
    l_TextLabel_0.Font = l_AppFonts_0.default:getMedium();
    l_TextLabel_0.TextSize = 19;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextTransparency = 1;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
    table.insert(v42, l_TweenService_0:Create(l_TextLabel_0, v48, {
        TextTransparency = 1
    }));
    table.insert(v43, l_TweenService_0:Create(l_TextLabel_0, v48, {
        TextTransparency = 0
    }));
    table.insert(v44, l_TweenService_0:Create(l_TextLabel_0, v48, {
        TextTransparency = 1
    }));
    table.insert(v45, l_TweenService_0:Create(l_TextLabel_0, v48, {
        TextTransparency = 0
    }));
    local l_TextLabel_1 = Instance.new("TextLabel");
    l_TextLabel_1.Name = "ObjectText";
    l_TextLabel_1.Font = l_AppFonts_0.default:getMedium();
    l_TextLabel_1.TextSize = 14;
    l_TextLabel_1.BackgroundTransparency = 1;
    l_TextLabel_1.TextTransparency = 1;
    l_TextLabel_1.TextColor3 = Color3.new(0.7, 0.7, 0.7);
    l_TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
    l_UIListLayout_0.Padding = UDim.new(-0.25, 0);
    l_UIListLayout_0.Parent = l_Frame_2;
    table.insert(v42, l_TweenService_0:Create(l_UIListLayout_0, v48, {
        Padding = UDim.new(-0.25, 0)
    }));
    table.insert(v43, l_TweenService_0:Create(l_UIListLayout_0, v48, {
        Padding = UDim.new(0, 0)
    }));
    table.insert(v44, l_TweenService_0:Create(l_UIListLayout_0, v48, {
        Padding = UDim.new(-0.25, 0)
    }));
    table.insert(v45, l_TweenService_0:Create(l_UIListLayout_0, v48, {
        Padding = UDim.new(0, 0)
    }));
    local l_Frame_5 = Instance.new("Frame");
    l_Frame_5.Name = "TextFrame";
    l_Frame_5.Size = UDim2.fromScale(0, 1);
    l_Frame_5.AutomaticSize = Enum.AutomaticSize.X;
    l_Frame_5.BackgroundTransparency = 1;
    l_Frame_5.Parent = l_Frame_2;
    l_TextLabel_0.Size = UDim2.fromScale(0, 1);
    l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.X;
    l_TextLabel_0.Parent = l_Frame_5;
    l_TextLabel_1.Size = UDim2.fromScale(0, 1);
    l_TextLabel_1.AutomaticSize = Enum.AutomaticSize.X;
    l_TextLabel_1.Parent = l_Frame_5;
    table.insert(v42, l_TweenService_0:Create(l_TextLabel_1, v48, {
        TextTransparency = 1
    }));
    table.insert(v43, l_TweenService_0:Create(l_TextLabel_1, v48, {
        TextTransparency = 0
    }));
    table.insert(v44, l_TweenService_0:Create(l_TextLabel_1, v48, {
        TextTransparency = 1
    }));
    table.insert(v45, l_TweenService_0:Create(l_TextLabel_1, v48, {
        TextTransparency = 0
    }));
    table.insert(v42, l_TweenService_0:Create(l_Frame_2, v48, {
        BackgroundTransparency = 1
    }));
    table.insert(v43, l_TweenService_0:Create(l_Frame_2, v48, {
        BackgroundTransparency = 0.2
    }));
    table.insert(v44, l_TweenService_0:Create(l_Frame_2, v48, {
        BackgroundTransparency = 1
    }));
    table.insert(v45, l_TweenService_0:Create(l_Frame_2, v48, {
        BackgroundTransparency = 0.2
    }));
    local l_Frame_6 = Instance.new("Frame");
    l_Frame_6.Name = "RoundFrame";
    l_Frame_6.Size = UDim2.fromOffset(48, 48);
    l_Frame_6.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_6.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_6.BackgroundTransparency = 1;
    l_Frame_6.Parent = l_Frame_4;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(0.5, 0);
    l_UICorner_0.Parent = l_Frame_6;
    table.insert(v44, l_TweenService_0:Create(l_Frame_6, v49, {
        BackgroundTransparency = 1
    }));
    table.insert(v45, l_TweenService_0:Create(l_Frame_6, v49, {
        BackgroundTransparency = 0.5
    }));
    if v40 == Enum.ProximityPromptInputType.Gamepad then
        local v62 = if not not v11 and game:GetEngineFeature("GetImageForKeyCode") then l_UserInputService_0:GetImageForKeyCode(v39.GamepadKeyCode) else v14[v39.GamepadKeyCode];
        if v62 then
            local l_ImageLabel_1 = Instance.new("ImageLabel");
            l_ImageLabel_1.Name = "ButtonImage";
            l_ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5);
            l_ImageLabel_1.Size = UDim2.fromOffset(24, 24);
            l_ImageLabel_1.Position = UDim2.fromScale(0.5, 0.5);
            l_ImageLabel_1.BackgroundTransparency = 1;
            l_ImageLabel_1.ImageTransparency = 1;
            l_ImageLabel_1.Image = v62;
            l_ImageLabel_1.Parent = l_Frame_4;
            table.insert(v44, l_TweenService_0:Create(l_ImageLabel_1, v49, {
                ImageTransparency = 1
            }));
            table.insert(v45, l_TweenService_0:Create(l_ImageLabel_1, v49, {
                ImageTransparency = 0
            }));
        end;
    elseif v40 == Enum.ProximityPromptInputType.Touch then
        local l_ImageLabel_2 = Instance.new("ImageLabel");
        l_ImageLabel_2.Name = "ButtonImage";
        l_ImageLabel_2.BackgroundTransparency = 1;
        l_ImageLabel_2.ImageTransparency = 1;
        l_ImageLabel_2.Size = UDim2.fromOffset(25, 31);
        l_ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_2.Position = UDim2.fromScale(0.5, 0.5);
        l_ImageLabel_2.Image = "rbxasset://textures/ui/Controls/TouchTapIcon.png";
        l_ImageLabel_2.Parent = l_Frame_4;
        table.insert(v44, l_TweenService_0:Create(l_ImageLabel_2, v49, {
            ImageTransparency = 1
        }));
        table.insert(v45, l_TweenService_0:Create(l_ImageLabel_2, v49, {
            ImageTransparency = 0
        }));
    else
        local l_ImageLabel_3 = Instance.new("ImageLabel");
        l_ImageLabel_3.Name = "ButtonImage";
        l_ImageLabel_3.BackgroundTransparency = 1;
        l_ImageLabel_3.ImageTransparency = 1;
        l_ImageLabel_3.Size = UDim2.fromOffset(28, 30);
        l_ImageLabel_3.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_3.Position = UDim2.fromScale(0.5, 0.5);
        l_ImageLabel_3.Image = "rbxasset://textures/ui/Controls/key_single.png";
        l_ImageLabel_3.Parent = l_Frame_4;
        table.insert(v44, l_TweenService_0:Create(l_ImageLabel_3, v49, {
            ImageTransparency = 1
        }));
        table.insert(v45, l_TweenService_0:Create(l_ImageLabel_3, v49, {
            ImageTransparency = 0
        }));
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v39.KeyboardKeyCode);
        local v67 = v15[v39.KeyboardKeyCode];
        if v67 == nil then
            v67 = v16[l_l_UserInputService_0_StringForKeyCode_0];
        end;
        if v67 == nil then
            local v68 = v17[v39.KeyboardKeyCode];
            if v68 then
                l_l_UserInputService_0_StringForKeyCode_0 = v68;
            end;
        end;
        if not v67 then
            if l_l_UserInputService_0_StringForKeyCode_0 ~= nil and l_l_UserInputService_0_StringForKeyCode_0 ~= "" then
                local l_TextLabel_2 = Instance.new("TextLabel");
                l_TextLabel_2.Name = "ButtonText";
                l_TextLabel_2.Position = UDim2.fromOffset(0, -1);
                l_TextLabel_2.Size = UDim2.fromScale(1, 1);
                l_TextLabel_2.Font = l_AppFonts_0.default:getMedium();
                local v70 = v18[v39.KeyboardKeyCode];
                if v70 == nil then
                    v70 = 14;
                end;
                l_TextLabel_2.TextSize = v70;
                l_TextLabel_2.BackgroundTransparency = 1;
                l_TextLabel_2.TextTransparency = 1;
                l_TextLabel_2.TextColor3 = Color3.new(1, 1, 1);
                l_TextLabel_2.TextXAlignment = Enum.TextXAlignment.Center;
                l_TextLabel_2.Text = l_l_UserInputService_0_StringForKeyCode_0;
                l_TextLabel_2.Parent = l_Frame_4;
                table.insert(v44, l_TweenService_0:Create(l_TextLabel_2, v49, {
                    TextTransparency = 1
                }));
                table.insert(v45, l_TweenService_0:Create(l_TextLabel_2, v49, {
                    TextTransparency = 0
                }));
            else
                error("ProximityPrompt '" .. v39.Name .. "' has an unsupported keycode for rendering UI: " .. tostring(v39.KeyboardKeyCode));
            end;
        else
            local l_ImageLabel_4 = Instance.new("ImageLabel");
            l_ImageLabel_4.Name = "ButtonImage";
            l_ImageLabel_4.AnchorPoint = Vector2.new(0.5, 0.5);
            l_ImageLabel_4.Size = UDim2.fromOffset(36, 36);
            l_ImageLabel_4.Position = UDim2.fromScale(0.5, 0.5);
            l_ImageLabel_4.BackgroundTransparency = 1;
            l_ImageLabel_4.ImageTransparency = 1;
            l_ImageLabel_4.Image = v67;
            l_ImageLabel_4.Parent = l_Frame_4;
            table.insert(v44, l_TweenService_0:Create(l_ImageLabel_4, v49, {
                ImageTransparency = 1
            }));
            table.insert(v45, l_TweenService_0:Create(l_ImageLabel_4, v49, {
                ImageTransparency = 0
            }));
        end;
    end;
    if not (v40 ~= Enum.ProximityPromptInputType.Touch and not v39.ClickablePrompt) then
        local l_TextButton_0 = Instance.new("TextButton");
        l_TextButton_0.BackgroundTransparency = 1;
        l_TextButton_0.TextTransparency = 1;
        l_TextButton_0.Size = UDim2.fromScale(1, 1);
        l_TextButton_0.Parent = l_BillboardGui_0;
        l_TextButton_0.Selectable = false;
        local v73 = false;
        do
            local l_v73_0 = v73;
            l_TextButton_0.InputBegan:Connect(function(v75)
                if (not (v75.UserInputType ~= Enum.UserInputType.Touch) or v75.UserInputType == Enum.UserInputType.MouseButton1) and v75.UserInputState ~= Enum.UserInputState.Change then
                    v39:InputHoldBegin();
                    l_v73_0 = true;
                end;
            end);
            l_TextButton_0.InputEnded:Connect(function(v76)
                if not (not (not (v76.UserInputType ~= Enum.UserInputType.Touch) or v76.UserInputType == Enum.UserInputType.MouseButton1) or not l_v73_0) then
                    l_v73_0 = false;
                    v39:InputHoldEnd();
                end;
            end);
            l_BillboardGui_0.Active = true;
        end;
    end;
    if v39.HoldDuration > 0 then
        local v77 = v38(v44, v45);
        v77.Parent = l_Frame_4;
        table.insert(v42, l_TweenService_0:Create(v77.Progress, v46, {
            Value = 1
        }));
        table.insert(v43, l_TweenService_0:Create(v77.Progress, v47, {
            Value = 0
        }));
    end;
    local v78 = nil;
    local v79 = nil;
    local v80 = nil;
    local v81 = nil;
    if v39.HoldDuration > 0 then
        v78 = v39.PromptButtonHoldBegan:Connect(function()
            for _, v83 in ipairs(v42) do
                v83:Play();
            end;
        end);
        v79 = v39.PromptButtonHoldEnded:Connect(function()
            for _, v85 in ipairs(v43) do
                v85:Play();
            end;
        end);
    end;
    v80 = v39.Triggered:Connect(function()
        for _, v87 in ipairs(v44) do
            v87:Play();
        end;
    end);
    v81 = v39.TriggerEnded:Connect(function()
        for _, v89 in ipairs(v45) do
            v89:Play();
        end;
    end);
    local function v93()
        local v90 = 72;
        local v91 = 24;
        local v92 = 0;
        if v39.ObjectText ~= nil and v39.ObjectText ~= "" then
            v92 = 9;
        end;
        l_TextLabel_0.Text = v39.ActionText;
        l_TextLabel_1.Text = v39.ObjectText;
        l_TextLabel_0.AutoLocalize = v39.AutoLocalize;
        l_TextLabel_0.RootLocalizationTable = v39.RootLocalizationTable;
        l_TextLabel_1.AutoLocalize = v39.AutoLocalize;
        l_TextLabel_1.RootLocalizationTable = v39.RootLocalizationTable;
        if not v10 then
            v91 = v91 - v92;
        end;
        if not (not (v39.ActionText ~= nil) or v39.ActionText == "") or v39.ObjectText ~= nil and v39.ObjectText ~= "" then
            l_UIPadding_0.PaddingRight = UDim.new(0, v91);
        else
            l_UIPadding_0.PaddingRight = UDim.new(0, 0);
        end;
        l_TextLabel_0.Position = UDim2.new(0, 0, 0, v92);
        l_TextLabel_1.Position = UDim2.new(0, 0, 0, -10);
        l_BillboardGui_0.Size = UDim2.fromOffset(v90, 72);
        task.defer(function()
            l_RunService_0.RenderStepped:Wait();
            l_RunService_0.RenderStepped:Wait();
            v90 = l_Frame_2.AbsoluteSize.X;
            l_BillboardGui_0.Size = UDim2.fromOffset(v90, 72);
            l_BillboardGui_0.SizeOffset = Vector2.new(v39.UIOffset.X / l_BillboardGui_0.Size.Width.Offset, v39.UIOffset.Y / l_BillboardGui_0.Size.Height.Offset);
        end);
    end;
    local v94 = v39.Changed:Connect(v93);
    v93();
    l_BillboardGui_0.Adornee = v39.Parent;
    l_BillboardGui_0.Parent = v41;
    for _, v96 in ipairs(v45) do
        v96:Play();
    end;
    return function()
        if v78 then
            v78:Disconnect();
        end;
        if v79 then
            v79:Disconnect();
        end;
        v80:Disconnect();
        v81:Disconnect();
        v94:Disconnect();
        for _, v98 in ipairs(v44) do
            v98:Play();
        end;
        wait(0.2);
        l_BillboardGui_0.Parent = nil;
    end;
end;
local function _()
    l_ProximityPromptService_0.PromptShown:Connect(function(v100, v101)
        if v100.Style == Enum.ProximityPromptStyle.Custom then
            return ;
        else
            local l_ProximityPrompts_1 = v13:FindFirstChild("ProximityPrompts");
            if l_ProximityPrompts_1 == nil then
                l_ProximityPrompts_1 = Instance.new("ScreenGui");
                l_ProximityPrompts_1.Name = "ProximityPrompts";
                l_ProximityPrompts_1.ResetOnSpawn = false;
                l_ProximityPrompts_1.Parent = v13;
                l_ProximityPrompts_1.IgnoreGuiInset = true;
            end;
            l_ProximityPrompts_1 = v99(v100, v101, l_ProximityPrompts_1);
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            local v104 = v100.PromptHidden:Connect(function()
                l_BindableEvent_0:Fire();
            end);
            local v105 = v100.Destroying:Connect(function()
                l_BindableEvent_0:Fire();
            end);
            l_BindableEvent_0.Event:Wait();
            v104:Disconnect();
            v105:Disconnect();
            l_ProximityPrompts_1();
            return ;
        end;
    end);
end;
l_ProximityPromptService_0.PromptShown:Connect(function(v107, v108)
    if v107.Style == Enum.ProximityPromptStyle.Custom then
        return ;
    else
        local l_ProximityPrompts_2 = v13:FindFirstChild("ProximityPrompts");
        if l_ProximityPrompts_2 == nil then
            l_ProximityPrompts_2 = Instance.new("ScreenGui");
            l_ProximityPrompts_2.Name = "ProximityPrompts";
            l_ProximityPrompts_2.ResetOnSpawn = false;
            l_ProximityPrompts_2.Parent = v13;
            l_ProximityPrompts_2.IgnoreGuiInset = true;
        end;
        l_ProximityPrompts_2 = v99(v107, v108, l_ProximityPrompts_2);
        local l_BindableEvent_1 = Instance.new("BindableEvent");
        local v111 = v107.PromptHidden:Connect(function()
            l_BindableEvent_1:Fire();
        end);
        local v112 = v107.Destroying:Connect(function()
            l_BindableEvent_1:Fire();
        end);
        l_BindableEvent_1.Event:Wait();
        v111:Disconnect();
        v112:Disconnect();
        l_ProximityPrompts_2();
        return ;
    end;
end);
