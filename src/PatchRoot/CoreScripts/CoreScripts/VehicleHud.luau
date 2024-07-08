local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
while not l_Players_0.LocalPlayer do
    wait();
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v7 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v8 = not v7 and 70 or 100;
local function _(v9, v10, v11, v12, v13)
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = v9;
    l_ImageLabel_0.Size = v10;
    l_ImageLabel_0.Position = v11;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Image = v12;
    l_ImageLabel_0.Parent = v13;
    return l_ImageLabel_0;
end;
local function v21(v16, v17, v18, v19)
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = v16;
    l_TextLabel_0.Size = UDim2.new(1, -4, 0, not v7 and 20 or 50);
    l_TextLabel_0.Position = UDim2.new(0, 2, 0, not v7 and -20 or -50);
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextXAlignment = v17;
    l_TextLabel_0.Font = Enum.Font.SourceSans;
    l_TextLabel_0.FontSize = not not v7 and Enum.FontSize.Size48 or Enum.FontSize.Size18;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextStrokeTransparency = 0.5;
    l_TextLabel_0.TextStrokeColor3 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805);
    l_TextLabel_0.Text = v18;
    l_TextLabel_0.Parent = v19;
    return l_TextLabel_0;
end;
local l_Frame_0 = Instance.new("Frame");
l_Frame_0.Name = "VehicleHudFrame";
l_Frame_0.Size = UDim2.new(0, not v7 and 158 or 316, 0, not v7 and 14 or 50);
l_Frame_0.Position = UDim2.new(0.5, -(l_Frame_0.Size.X.Offset / 2), 1, -v8 - l_Frame_0.Size.Y.Offset);
l_Frame_0.BackgroundTransparency = 1;
l_Frame_0.Visible = false;
l_Frame_0.Parent = l_RobloxGui_0;
local l_Frame_1 = Instance.new("Frame");
l_Frame_1.Name = "SpeedBarClippingFrame";
l_Frame_1.Size = UDim2.new(0, 0, 0, not v7 and 4 or 24);
l_Frame_1.Position = UDim2.new(0.5, not v7 and -71 or -142, 0.5, not v7 and -2 or -13);
l_Frame_1.BackgroundTransparency = 1;
l_Frame_1.ClipsDescendants = true;
l_Frame_1.ZIndex = 2;
l_Frame_1.Parent = l_Frame_0;
local v24 = UDim2.new(1, 0, 1, 0);
local v25 = UDim2.new(0, 0, 0, 1);
local l_ImageLabel_1 = Instance.new("ImageLabel");
l_ImageLabel_1.Name = "HudBG";
l_ImageLabel_1.Size = v24;
l_ImageLabel_1.Position = v25;
l_ImageLabel_1.BackgroundTransparency = 1;
l_ImageLabel_1.Image = "rbxasset://textures/ui/Vehicle/SpeedBarBKG.png";
l_ImageLabel_1.Parent = l_Frame_0;
v25 = UDim2.new(0, not v7 and 142 or 284, 0, not v7 and 4 or 24);
l_ImageLabel_1 = UDim2.new(0.5, not v7 and -71 or -142, 0.5, not v7 and -2 or -13);
local l_ImageLabel_2 = Instance.new("ImageLabel");
l_ImageLabel_2.Name = "SpeedBG";
l_ImageLabel_2.Size = v25;
l_ImageLabel_2.Position = l_ImageLabel_1;
l_ImageLabel_2.BackgroundTransparency = 1;
l_ImageLabel_2.Image = "rbxasset://textures/ui/Vehicle/SpeedBarEmpty.png";
l_ImageLabel_2.Parent = l_Frame_0;
v24 = l_ImageLabel_2;
v25 = UDim2.new(0, not v7 and 142 or 284, 1, 0);
l_ImageLabel_1 = UDim2.new(0, 0, 0, 0);
l_ImageLabel_2 = Instance.new("ImageLabel");
l_ImageLabel_2.Name = "SpeedBarImage";
l_ImageLabel_2.Size = v25;
l_ImageLabel_2.Position = l_ImageLabel_1;
l_ImageLabel_2.BackgroundTransparency = 1;
l_ImageLabel_2.Image = "rbxasset://textures/ui/Vehicle/SpeedBar.png";
l_ImageLabel_2.Parent = l_Frame_1;
v21("SpeedLabel", Enum.TextXAlignment.Left, "Speed", l_Frame_0);
v25 = v21("SpeedText", Enum.TextXAlignment.Right, "0", l_Frame_0);
l_ImageLabel_1 = function()
    local v28 = l_LocalPlayer_0 and l_LocalPlayer_0.Character;
    if v28 then
        for _, v30 in pairs(v28:GetChildren()) do
            if v30:IsA("Humanoid") then
                return v30;
            end;
        end;
    end;
end;
l_ImageLabel_2 = function()
    if v3 then
        local l_magnitude_0 = v3.Velocity.magnitude;
        v25.Text = tostring((math.min(math.floor(l_magnitude_0), 9999)));
        l_Frame_1.Size = UDim2.new(0, math.min(math.floor((l_magnitude_0 / v3.MaxSpeed) * v24.Size.X.Offset), v24.Size.X.Offset), 0, not v7 and 4 or 24);
    end;
end;
local function v33(v32)
    if v32 == "HeadsUpDisplay" then
        l_Frame_0.Visible = not l_Frame_0.Visible;
    end;
end;
local function v36(v34, v35)
    if not v34 then
        if v3 then
            l_Frame_0.Visible = false;
            v3 = nil;
            if v4 then
                v4:disconnect();
                v4 = nil;
            end;
            if v5 then
                v5:disconnect();
                v5 = nil;
            end;
        end;
    elseif not (not v35 or not v35:IsA("VehicleSeat")) then
        v3 = v35;
        l_Frame_0.Visible = v3.HeadsUpDisplay;
        v4 = l_RunService_0.Heartbeat:connect(l_ImageLabel_2);
        v5 = v3.Changed:connect(v33);
        return ;
    end;
end;
local v37 = nil;
local v38 = nil;
local function _()
    if v37 then
        v37:Disconnect();
        v37 = nil;
    end;
end;
local function _()
    if v38 then
        v38:Disconnect();
        v38 = nil;
    end;
end;
local function v44(v41)
    if v37 then
        v37:Disconnect();
        v37 = nil;
    end;
    if v38 then
        v38:Disconnect();
        v38 = nil;
    end;
    local l_Humanoid_0 = v41:FindFirstChildWhichIsA("Humanoid");
    if not l_Humanoid_0 then
        v38 = v41.ChildAdded:Connect(function(v43)
            if v43:IsA("Humanoid") then
                if v37 then
                    v37:Disconnect();
                    v37 = nil;
                end;
                if v38 then
                    v38:Disconnect();
                    v38 = nil;
                end;
                v37 = v43.Seated:connect(v36);
            end;
        end);
        return ;
    else
        v37 = l_Humanoid_0.Seated:connect(v36);
        return ;
    end;
end;
if l_LocalPlayer_0.Character then
    v44(l_LocalPlayer_0.Character);
end;
l_LocalPlayer_0.CharacterAdded:connect(function(v45)
    v36(false);
    v44(v45);
end);
