local v0 = Color3.new(0.10588235294117647, 0.9882352941176471, 0.4196078431372549);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local v5 = false;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v7 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.XBoxOne then
    v7 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.WiiU then
        v7 = true;
        if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.PS4 then
            v7 = true;
            if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.AndroidTV then
                v7 = true;
                if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.XBox360 then
                    v7 = true;
                    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.PS3 then
                        v7 = true;
                        if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Ouya then
                            v7 = l_l_UserInputService_0_Platform_0 == Enum.Platform.SteamOS;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v5 = v7;
l_l_UserInputService_0_Platform_0 = {
    Create = function(v8)
        return function(v9)
            local v10 = Instance.new(v8);
            for v11, v12 in pairs(v9) do
                if type(v11) == "number" then
                    v12.Parent = v10;
                else
                    v10[v11] = v12;
                end;
            end;
            return v10;
        end;
    end
};
v7 = function()
    local v13 = {
        Container = nil
    };
    local v14 = {};
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local l_BindableEvent_1 = Instance.new("BindableEvent");
    local function v17()
        if not v13.Container then
            v13.Container = l_l_UserInputService_0_Platform_0.Create("ImageButton")({
                Name = "TopRightContainer", 
                Size = UDim2.new(0, 350, 0, 100), 
                Position = UDim2.new(1, -415, 0, 10), 
                AutoButtonColor = false, 
                Image = "", 
                Active = false, 
                BackgroundTransparency = 1, 
                Parent = l_RobloxGui_0
            });
        end;
    end;
    removeFromDisplayStack = function(v18)
        local v19 = nil;
        for v20 = 1, #v14 do
            if v14[v20] == v18 then
                v19 = v20 + 1;
                break;
            end;
        end;
        local l_v18_0 = v18;
        for v22 = v19, #v14 do
            local v23 = v14[v22];
            v23.Position = UDim2.new(v23.Position.X.Scale, v23.Position.X.Offset, v23.Position.Y.Scale, l_v18_0.AbsolutePosition.Y);
            l_v18_0 = v23;
        end;
        l_BindableEvent_0:Fire();
    end;
    addBackToDisplayStack = function(v24)
        local v25 = 0;
        for v26 = 1, #v14 do
            if v14[v26] == v24 then
                v25 = v26 + 1;
                break;
            end;
        end;
        local l_v24_0 = v24;
        for v28 = v25, #v14 do
            local v29 = v14[v28];
            v29.Position = UDim2.new(v29.Position.X.Scale, v29.Position.X.Offset, v29.Position.Y.Scale, (l_v24_0.AbsolutePosition.Y + l_v24_0.AbsoluteSize.Y) + 4);
            l_v24_0 = v29;
        end;
        l_BindableEvent_0:Fire();
    end;
    addToDisplayStack = function(v30)
        local v31 = nil;
        if #v14 > 0 then
            v31 = v14[#v14];
        end;
        v14[#v14 + 1] = v30;
        local v32 = 0;
        if v31 then
            v32 = (v31.AbsolutePosition.Y + v31.AbsoluteSize.Y) + 4;
        end;
        v30.Position = UDim2.new(v30.Position.X.Scale, v30.Position.X.Offset, v30.Position.Y.Scale, v32);
        v17();
        v30.Parent = v13.Container;
        v30.Changed:connect(function(v33)
            if v33 == "Visible" then
                if v30.Visible then
                    addBackToDisplayStack(v30);
                else
                    removeFromDisplayStack(v30);
                    return ;
                end;
            end;
        end);
        l_BindableEvent_0:Fire();
    end;
    v13.CreateHealthBar = function(_)
        v13.HealthContainer = l_l_UserInputService_0_Platform_0.Create("Frame")({
            Name = "HealthContainer", 
            Size = UDim2.new(1, -86, 0, 50), 
            Position = UDim2.new(0, 92, 0, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BackgroundTransparency = 0.5
        });
        local v35 = l_l_UserInputService_0_Platform_0.Create("Frame")({
            Name = "HealthFill", 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = v0, 
            Parent = l_l_UserInputService_0_Platform_0.Create("Frame")({
                Name = "HealthFillHolder", 
                Size = UDim2.new(1, -10, 1, -10), 
                Position = UDim2.new(0, 5, 0, 5), 
                BorderSizePixel = 0, 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                BackgroundTransparency = 1, 
                Parent = v13.HealthContainer
            })
        });
        local _ = l_l_UserInputService_0_Platform_0.Create("TextLabel")({
            Name = "HealthText", 
            Size = UDim2.new(0, 98, 0, 50), 
            Position = UDim2.new(0, -100, 0, 0), 
            BackgroundTransparency = 0.5, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Font = Enum.Font.SourceSans, 
            FontSize = Enum.FontSize.Size36, 
            Text = "Health", 
            TextColor3 = Color3.new(1, 1, 1), 
            BorderSizePixel = 0, 
            Parent = v13.HealthContainer
        });
        local v37 = l_l_UserInputService_0_Platform_0.Create("TextLabel")({
            Visible = false
        });
        local v38 = l_l_UserInputService_0_Platform_0.Create("TextLabel")({
            Visible = false
        });
        addToDisplayStack(v13.HealthContainer);
        v17();
        v13.HealthContainer.Changed:connect(function()
            l_BindableEvent_1:Fire();
        end);
        return v13.Container, v37, v13.HealthContainer, v35, v38;
    end;
    v13.CreateAccountType = function(_, v40)
        v13.AccountTypeContainer = l_l_UserInputService_0_Platform_0.Create("Frame")({
            Name = "AccountTypeContainer", 
            Size = UDim2.new(0, 50, 0, 50), 
            Position = UDim2.new(1, -55, 0, 10), 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BackgroundTransparency = 0.5, 
            Parent = l_RobloxGui_0
        });
        local _ = l_l_UserInputService_0_Platform_0.Create("TextLabel")({
            Name = "AccountTypeText", 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Font = Enum.Font.SourceSans, 
            FontSize = Enum.FontSize.Size36, 
            Text = v40, 
            TextColor3 = Color3.new(1, 1, 1), 
            BorderSizePixel = 0, 
            Parent = v13.AccountTypeContainer, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        });
    end;
    v13.SetupTopStat = function(_)
        local v43 = true;
        local v44 = nil;
        local v45 = nil;
        local v46 = nil;
        local v47 = nil;
        local v48 = nil;
        local function v50()
            if not v48 then
                v48 = l_l_UserInputService_0_Platform_0.Create("Frame")({
                    Name = "OneStatFrame", 
                    Size = UDim2.new(1, 0, 0, 36), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                });
                local v49 = l_l_UserInputService_0_Platform_0.Create("TextLabel")({
                    Name = "StatName", 
                    Size = UDim2.new(0.5, 0, 0, 36), 
                    BackgroundTransparency = 1, 
                    Font = Enum.Font.SourceSans, 
                    FontSize = Enum.FontSize.Size36, 
                    TextStrokeColor3 = Color3.new(0.40784313725490196, 0.40784313725490196, 0.40784313725490196), 
                    TextStrokeTransparency = 0, 
                    Text = " StatName:", 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BorderSizePixel = 0, 
                    ClipsDescendants = true, 
                    Parent = v48
                }):clone();
                v49.Position = UDim2.new(0.5, 0, 0, 0);
                v49.Name = "StatValue";
                v49.Text = "123,643,231";
                v49.TextXAlignment = Enum.TextXAlignment.Right;
                v49.Parent = v48;
                addToDisplayStack(v48);
                return ;
            else
                return ;
            end;
        end;
        local v51 = nil;
        local function v54(v52)
            if v45 then
                v45:disconnect();
                v45 = nil;
            end;
            if v46 then
                v46:disconnect();
                v46 = nil;
            end;
            v44 = v52;
            if v44 then
                v50();
                v51(v44);
                v46 = v44.AncestryChanged:connect(function()
                    v51(v44, "Parent");
                end);
                v45 = v44.Changed:connect(function(v53)
                    v51(v44, v53);
                end);
            end;
        end;
        v51 = function(v55, v56)
            if v56 and v56 == "Parent" then
                v48.StatName.Text = "";
                v48.StatValue.Text = "";
                v54(nil);
                tenFootInterfaceChanged();
                return ;
            elseif not v43 then
                v48.StatName.Text = "";
                v48.StatValue.Text = "";
                return ;
            else
                v48.StatName.Text = " " .. tostring(v55.Name) .. ":";
                v48.StatValue.Text = tostring(v55.Value);
                return ;
            end;
        end;
        local function v58(v57)
            return ((((v57:IsA("StringValue") or v57:IsA("IntValue")) or v57:IsA("BoolValue")) or v57:IsA("NumberValue")) or v57:IsA("DoubleConstrainedValue")) or v57:IsA("IntConstrainedValue");
        end;
        local function _(v59)
            if not (v44 or not v58(v59)) then
                v54(v59);
            end;
        end;
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        while not l_LocalPlayer_0 do
            l_Players_0.PlayerAdded:wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        tenFootInterfaceChanged = function()
            local l_leaderstats_0 = l_LocalPlayer_0:FindFirstChild("leaderstats");
            if l_leaderstats_0 then
                local l_l_leaderstats_0_Children_0 = l_leaderstats_0:GetChildren();
                for v64 = 1, #l_l_leaderstats_0_Children_0 do
                    local v65 = l_l_leaderstats_0_Children_0[v64];
                    if not (v44 or not v58(v65)) then
                        v54(v65);
                    end;
                end;
                if v47 then
                    v47:disconnect();
                end;
                v47 = l_leaderstats_0.ChildAdded:connect(function(v66)
                    if not (v44 or not v58(v66)) then
                        v54(v66);
                    end;
                end);
            end;
        end;
        if not l_LocalPlayer_0:FindFirstChild("leaderstats") then
            l_LocalPlayer_0.ChildAdded:connect(tenFootInterfaceChanged);
        else
            tenFootInterfaceChanged();
        end;
        return {
            SetTopStatEnabled = function(_, v68)
                v43 = v68;
                if v44 then
                    v51(v44, "");
                end;
            end
        };
    end;
    return v13;
end;
local v69 = {};
local v70 = v7();
v69.IsEnabled = function(_)
    return v5;
end;
v69.CreateHealthBar = function(_)
    return v70:CreateHealthBar();
end;
v69.CreateAccountType = function(_, v74)
    return v70:CreateAccountType(v74);
end;
v69.SetupTopStat = function(_)
    return v70:SetupTopStat();
end;
return v69;
