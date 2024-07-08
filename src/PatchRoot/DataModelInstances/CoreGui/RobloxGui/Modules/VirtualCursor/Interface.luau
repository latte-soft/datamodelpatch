local l_Parent_0 = script.Parent;
local _ = game:GetService("CoreGui");
local l_TweenService_0 = game:GetService("TweenService");
local l_VRService_0 = game:GetService("VRService");
local l_CoreGui_1 = game:GetService("CoreGui");
local _ = l_CoreGui_1.RobloxGui;
local v6 = require(l_Parent_0.Properties);
local v7 = {};
local v8 = {
    Default = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png", 
    Hover = "rbxasset://textures/ui/VirtualCursor/cursorHover.png", 
    Pressed = "rbxasset://textures/ui/VirtualCursor/cursorPressed.png", 
    Arrow = "rbxasset://textures/ui/VirtualCursor/cursorArrow.png"
};
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = {
    Default = 2, 
    Activated = 1.7
};
local function v16(v14)
    local v15 = v13[v14] * v6.CursorRadius;
    return UDim2.fromOffset(v15, v15);
end;
local function _(v17)
    if not v17 then
        v10.Image = v8.Default;
        return ;
    else
        v10.Image = v8.Hover;
        return ;
    end;
end;
local function _(v19)
    v10.Position = UDim2.fromOffset(v19.x, v19.y);
end;
local function v28()
    if v9 == nil then
        v9 = Instance.new("ScreenGui");
        v9.Enabled = false;
        v9.IgnoreGuiInset = true;
        v9.DisplayOrder = 100;
        v9.Name = "VirtualCursorGui";
        v10 = Instance.new("ImageLabel");
        v10.Active = false;
        v10.AnchorPoint = Vector2.new(0.5, 0.5);
        local l_v10_0 = v10;
        local v22 = v13.Default * v6.CursorRadius;
        l_v10_0.Size = UDim2.fromOffset(v22, v22);
        v10.Image = v8.Default;
        v10.Visible = false;
        v10.BackgroundTransparency = 1;
        v10.Parent = v9;
        v9.Parent = l_CoreGui_1;
        l_v10_0 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
        local l_l_TweenService_0_0 = l_TweenService_0;
        local l_v10_1 = v10;
        local l_l_v10_0_0 = l_v10_0;
        local v26 = {};
        local v27 = v13.Activated * v6.CursorRadius;
        v26.Size = UDim2.fromOffset(v27, v27);
        v11 = l_l_TweenService_0_0:Create(l_v10_1, l_l_v10_0_0, v26);
        l_l_TweenService_0_0 = l_TweenService_0;
        l_v10_1 = v10;
        l_l_v10_0_0 = l_v10_0;
        v26 = {};
        v27 = v13.Default * v6.CursorRadius;
        v26.Size = UDim2.fromOffset(v27, v27);
        v12 = l_l_TweenService_0_0:Create(l_v10_1, l_l_v10_0_0, v26);
    end;
    return v9;
end;
v7.GetCursorSize = function(_, v30)
    return v16(v30);
end;
v7.PlayCursorTweenActivate = function(_)
    v11:Play();
end;
v7.PlayCursorTweenDefault = function(_)
    v12:Play();
end;
v7.SetCursorHighlight = function(_, v34)
    if not v34 then
        v10.Image = v8.Default;
        return ;
    else
        v10.Image = v8.Hover;
        return ;
    end;
end;
v7.SetCursorPosition = function(_, v36)
    v10.Position = UDim2.fromOffset(v36.x, v36.y);
end;
v7.SetArrow = function(_, v38, v39)
    if v38 == -1 and v39 == 0 then
        v10.Rotation = 90;
    elseif v39 == 0 then
        v10.Rotation = 270;
    end;
    if v38 == 0 and v39 == 1 then
        v10.Rotation = 0;
    elseif v38 == 0 then
        v10.Rotation = 180;
    end;
    v10.Image = v8.Arrow;
end;
v7.EnableUI = function(_, v41)
    local v42 = not l_VRService_0.VREnabled;
    v28().Enabled = v42;
    local l_v10_2 = v10;
    local v44 = v13.Default * v6.CursorRadius;
    l_v10_2.Size = UDim2.fromOffset(v44, v44);
    v10.Position = UDim2.fromOffset(v41.x, v41.y);
    v10.Visible = v42;
end;
v7.DisableUI = function(_)
    v10.Image = v8.Default;
    v28().Enabled = false;
    v10.Visible = false;
end;
return v7;
