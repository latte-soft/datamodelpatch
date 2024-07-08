local v0 = Color3.new(0.8941176470588236, 0.9254901960784314, 0.9647058823529412);
local v1 = Color3.new(1, 0.10980392156862745, 0);
local v2 = Color3.new(0.9803921568627451, 0.9215686274509803, 0);
local v3 = Color3.new(0.10588235294117647, 0.9882352941176471, 0.4196078431372549);
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Frame_0 = Instance.new("Frame");
l_Frame_0.Name = "HealthbarContainer";
l_Frame_0.BackgroundTransparency = 1;
l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
local l_ImageLabel_0 = Instance.new("ImageLabel");
l_ImageLabel_0.ImageColor3 = v0;
l_ImageLabel_0.BackgroundTransparency = 1;
l_ImageLabel_0.ScaleType = Enum.ScaleType.Slice;
l_ImageLabel_0.SliceCenter = Rect.new(10, 10, 10, 10);
l_ImageLabel_0.Name = "HealthbarBack";
l_ImageLabel_0.Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png";
l_ImageLabel_0.Size = UDim2.new(1, 0, 0.3, 0);
l_ImageLabel_0.Position = UDim2.new(0, 0, 0.7, 0);
l_ImageLabel_0.Parent = l_Frame_0;
local l_ImageLabel_1 = Instance.new("ImageLabel");
l_ImageLabel_1.ImageColor3 = v3;
l_ImageLabel_1.BackgroundTransparency = 1;
l_ImageLabel_1.ScaleType = Enum.ScaleType.Slice;
l_ImageLabel_1.SliceCenter = Rect.new(10, 10, 10, 10);
l_ImageLabel_1.Size = UDim2.new(1, 0, 1, 0);
l_ImageLabel_1.Position = UDim2.new(0, 0, 0, 0);
l_ImageLabel_1.Name = "HealthbarFill";
l_ImageLabel_1.Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png";
l_ImageLabel_1.Parent = l_ImageLabel_0;
local l_TextLabel_0 = Instance.new("TextLabel");
l_TextLabel_0.Name = "PlayerName";
l_TextLabel_0.BackgroundTransparency = 1;
l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
l_TextLabel_0.Text = "";
l_TextLabel_0.Font = Enum.Font.SourceSansBold;
l_TextLabel_0.FontSize = Enum.FontSize.Size24;
l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
l_TextLabel_0.Size = UDim2.new(1, 0, 0, 14);
l_TextLabel_0.Parent = l_Frame_0;
local function _(v13)
    return (Vector3.new(v13.r, v13.g, v13.b));
end;
local function v19(v15, v16)
    for _, v18 in pairs(v15:GetChildren()) do
        if v18:IsA(v16) then
            return v18;
        end;
    end;
end;
local v20 = {
    [Vector3.new(v1.r, v1.g, v1.b)] = 0.1, 
    [Vector3.new(v2.r, v2.g, v2.b)] = 0.5, 
    [Vector3.new(v3.r, v3.g, v3.b)] = 0.8
};
local function v29(v21)
    if v21 <= 0.1 then
        return v1;
    elseif v21 >= 0.8 then
        return v3;
    else
        local v22 = Vector3.new(0, 0, 0);
        local v23 = 0;
        for v24, v25 in pairs(v20) do
            local v26 = v21 - v25;
            if v26 == 0 then
                return Color3.new(v24.x, v24.y, v24.z);
            else
                local v27 = 1 / (v26 * v26);
                v22 = v22 + v27 * v24;
                v23 = v23 + v27;
            end;
        end;
        local v28 = v22 / v23;
        return Color3.new(v28.x, v28.y, v28.z);
    end;
end;
local function _(v30)
    local v31 = v30.Health / v30.MaxHealth;
    if v31 ~= v31 then
        v31 = 1;
    end;
    l_ImageLabel_1.ImageColor3 = v29(v31);
    l_ImageLabel_1.Size = UDim2.new(v31, 0, 1, 0);
end;
local v33 = nil;
local v34 = nil;
local function v35(v36)
    if v34 then
        v34:disconnect();
        v34 = nil;
    end;
    if v33 then
        v33:disconnect();
        v33 = nil;
    end;
    if v36 then
        v34 = v36.AncestryChanged:connect(function(v37, v38)
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if v37 == v36 and (not l_LocalPlayer_0 or v38 ~= l_LocalPlayer_0.Character) then
                v35(nil);
            end;
        end);
        v33 = v36.HealthChanged:connect(function()
            local l_v36_0 = v36;
            local v41 = l_v36_0.Health / l_v36_0.MaxHealth;
            if v41 ~= v41 then
                v41 = 1;
            end;
            l_ImageLabel_1.ImageColor3 = v29(v41);
            l_ImageLabel_1.Size = UDim2.new(v41, 0, 1, 0);
        end);
        local v42 = v36.Health / v36.MaxHealth;
        if v42 ~= v42 then
            v42 = 1;
        end;
        l_ImageLabel_1.ImageColor3 = v29(v42);
        l_ImageLabel_1.Size = UDim2.new(v42, 0, 1, 0);
    end;
end;
local function v45(v43)
    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    if not (not (l_LocalPlayer_1 and v43.Parent == l_LocalPlayer_1.Character) or not v43:IsA("Humanoid")) then
        v35(v43);
    end;
end;
local v46 = nil;
local function v49(v47)
    local v48 = v19(v47, "Humanoid");
    if v48 then
        v35(v48);
    end;
    if v46 then
        v46:disconnect();
        v46 = nil;
    end;
    v46 = v47.ChildAdded:connect(v45);
end;
local function _(v50)
    l_TextLabel_0.Text = v50.Name;
    v50.CharacterAdded:connect(v49);
    if v50.Character then
        local l_Character_0 = v50.Character;
        local v52 = v19(l_Character_0, "Humanoid");
        if v52 then
            v35(v52);
        end;
        if v46 then
            v46:disconnect();
            v46 = nil;
        end;
        v46 = l_Character_0.ChildAdded:connect(v45);
    end;
end;
if not l_Players_0.LocalPlayer then
    spawn(function()
        while not l_Players_0.LocalPlayer do
            l_Players_0.ChildAdded:wait();
        end;
        local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
        l_TextLabel_0.Text = l_LocalPlayer_2.Name;
        l_LocalPlayer_2.CharacterAdded:connect(v49);
        if l_LocalPlayer_2.Character then
            local l_Character_1 = l_LocalPlayer_2.Character;
            local v56 = v19(l_Character_1, "Humanoid");
            if v56 then
                v35(v56);
            end;
            if v46 then
                v46:disconnect();
                v46 = nil;
            end;
            v46 = l_Character_1.ChildAdded:connect(v45);
        end;
    end);
else
    local l_LocalPlayer_3 = l_Players_0.LocalPlayer;
    l_TextLabel_0.Text = l_LocalPlayer_3.Name;
    l_LocalPlayer_3.CharacterAdded:connect(v49);
    if l_LocalPlayer_3.Character then
        local l_Character_2 = l_LocalPlayer_3.Character;
        local v59 = v19(l_Character_2, "Humanoid");
        if v59 then
            v35(v59);
        end;
        if v46 then
            v46:disconnect();
            v46 = nil;
        end;
        v46 = l_Character_2.ChildAdded:connect(v45);
    end;
end;
local v60 = {
    ModuleName = "Healthbar", 
    KeepVRTopbarOpen = false, 
    VRIsExclusive = false, 
    VRClosesNonExclusive = false
};
local v61 = nil;
local v62 = nil;
local v63 = nil;
local function v92(v64)
    if v64 == "VREnabled" then
        if not l_UserInputService_0.VREnabled then
            if v61 then
                v61:disconnect();
                v61 = nil;
            end;
            if v62 then
                v62:disconnect();
                v62 = nil;
            end;
            if v63 then
                v63:disconnect();
                v63 = nil;
            end;
            l_Frame_0.Parent = nil;
        else
            local v65 = require(l_RobloxGui_0.Modules.VR.VRHub);
            local v66 = require(l_RobloxGui_0.Modules.VR.Panel3D);
            local v67 = v66.Get("Healthbar");
            v67:ResizeStuds(1.5, 0.25, 128);
            v67:SetType(v66.Type.Fixed, {
                CFrame = CFrame.new(0, 0, -5)
            });
            v67:SetVisible(true);
            v67.PreUpdate = function(v68, _, _, _, _)
                local v73 = v66.Get("Backpack") or v66.Get("Topbar3D");
                local v74 = v66.Get("Topbar3D");
                if not (not v73 or not v74) then
                    v68.localCF = (v73.localCF or CFrame.new()) * CFrame.new((math.max(v74.width, v73.width) / 2 - v67.width / 2) - 0.11, 0.25, 0.1);
                end;
            end;
            v67.CalculateTransparency = function(_)
                local v76 = v66.Get("Backpack");
                local v77 = v66.Get("Topbar3D");
                local v78 = math.min((not not v76 and v76:IsVisible()) and v76:CalculateTransparency() or 1, (not not v77 and v77:IsVisible()) and v77:CalculateTransparency() or 1);
                l_ImageLabel_0.ImageTransparency = v78;
                l_ImageLabel_1.ImageTransparency = v78;
                l_TextLabel_0.TextTransparency = v78;
                return v78;
            end;
            local v79 = false;
            local _ = function()
                for _, v81 in pairs(v65:GetOpenedModules()) do
                    if v81.VRIsExclusive then
                        v79 = true;
                        return ;
                    end;
                end;
                v79 = false;
            end;
            local function _()
                return l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not v79;
            end;
            v61 = l_StarterGui_0.CoreGuiChangedSignal:connect(function()
                v67:SetVisible(l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not v79);
            end);
            v62 = v65.ModuleOpened.Event:connect(function(_)
                for _, v86 in pairs(v65:GetOpenedModules()) do
                    if v86.VRIsExclusive then
                        v79 = true;
                        goto label1 --[[  true, false  ]];
                    end;
                end;
                v79 = false;
                ::label1::;
                v67:SetVisible(l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not v79);
            end);
            v63 = v65.ModuleClosed.Event:connect(function(_)
                for _, v89 in pairs(v65:GetOpenedModules()) do
                    if v89.VRIsExclusive then
                        v79 = true;
                        goto label2 --[[  true, false  ]];
                    end;
                end;
                v79 = false;
                ::label2::;
                v67:SetVisible(l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not v79);
            end);
            for _, v91 in pairs(v65:GetOpenedModules()) do
                if v91.VRIsExclusive then
                    v79 = true;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            v79 = false;
            ::label0::;
            v67:SetVisible(l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not v79);
            l_Frame_0.Parent = v67:GetGUI();
            v65:RegisterModule(v60);
            return ;
        end;
    end;
end;
l_UserInputService_0.Changed:connect(v92);
if l_UserInputService_0.VREnabled then
    v92("VREnabled");
end;
return v60;
