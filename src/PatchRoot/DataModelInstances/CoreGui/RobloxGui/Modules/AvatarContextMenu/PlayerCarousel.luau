local v0 = {};
v0.__index = v0;
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = Color3.fromRGB(0, 162, 255);
local v6 = Color3.fromRGB(0, 0, 0);
local l_AvatarContextMenu_0 = l_CoreGui_0:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("AvatarContextMenu");
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = {};
local v12 = {};
local function v19()
    local v13 = {};
    local v14 = {};
    for v15, v16 in ipairs(v8:GetChildren()) do
        if v16:IsA("GuiObject") and v16.Name ~= "_CarouselDivider" then
            table.insert(v14, v16);
            v13[v16] = v15;
        end;
    end;
    table.sort(v14, function(v17, v18)
        if v17.LayoutOrder == v18.LayoutOrder then
            return v13[v17] < v13[v18];
        else
            return v17.LayoutOrder < v18.LayoutOrder;
        end;
    end);
    return v14;
end;
local function v33(v20)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "PlayerCarousel";
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_Frame_0.Size = UDim2.new(1, 0, 0.28, 0);
    l_Frame_0.ClipsDescendants = true;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "InnerFrame";
    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_Frame_1.Size = UDim2.new(0.8, 0, 1, 0);
    l_Frame_1.ClipsDescendants = true;
    l_Frame_1.Active = true;
    l_Frame_1.Parent = l_Frame_0;
    v8 = Instance.new("Frame");
    v8.Name = "SelectedPlayer";
    v8.AnchorPoint = Vector2.new(0.5, 0.5);
    v8.BackgroundTransparency = 1;
    v8.Position = UDim2.new(0.5, 0, 0.5, 0);
    v8.Size = UDim2.new(0, 100, 1, -10);
    v8.Parent = l_Frame_1;
    v9 = Instance.new("UIPageLayout");
    v9.EasingDirection = Enum.EasingDirection.Out;
    v9.EasingStyle = Enum.EasingStyle.Quad;
    v9.Padding = UDim.new(0, 5);
    v9.TweenTime = 0.25;
    v9.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    v9.VerticalAlignment = Enum.VerticalAlignment.Center;
    v9.TouchInputEnabled = false;
    v9.Circular = true;
    v9.SortOrder = Enum.SortOrder.LayoutOrder;
    local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_0.DominantAxis = Enum.DominantAxis.Height;
    l_UIAspectRatioConstraint_0.Parent = v8;
    v10 = Instance.new("BindableEvent");
    v10.Name = "PlayerChanged";
    local v24 = nil;
    v9:GetPropertyChangedSignal("CurrentPage"):Connect(function()
        if v9.CurrentPage then
            if v9.CurrentPage.Name == "_CarouselDivider" then
                if v24 == v19()[1] then
                    v9:Previous();
                else
                    v9:Next();
                end;
            else
                v9.CurrentPage.BackgroundColor3 = v6;
                v24 = v9.CurrentPage;
            end;
        end;
        if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject.Parent == v9.Parent then
            l_GuiService_0.SelectedCoreObject.BackgroundColor3 = v5;
        end;
        l_GuiService_0.SelectedCoreObject = v9.CurrentPage;
        if v9.CurrentPage then
            v10:Fire(v11[v9.CurrentPage]);
        end;
    end);
    v9.Parent = v8;
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "NextButton";
    l_ImageButton_0.Image = v20.ScrollRightImage;
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.AnchorPoint = Vector2.new(1, 0.5);
    l_ImageButton_0.Position = UDim2.new(1, -5, 0.5, 0);
    l_ImageButton_0.Size = UDim2.new(0.3, 0, 0.3, 0);
    l_ImageButton_0.Selectable = false;
    l_ImageButton_0.Parent = l_Frame_0;
    local l_UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_1.DominantAxis = Enum.DominantAxis.Width;
    l_UIAspectRatioConstraint_1.Parent = l_ImageButton_0;
    local v27 = l_ImageButton_0:Clone();
    v27.Name = "PrevButton";
    if v20.ScrollLeftImage ~= "" then
        v27.Image = v20.ScrollLeftImage;
    else
        v27.Rotation = 180;
    end;
    v27.AnchorPoint = Vector2.new(0, 0.5);
    v27.Position = UDim2.new(0, 5, 0.5, 0);
    v27.Selectable = false;
    v27.Parent = l_Frame_0;
    local function _(v28)
        if not v28 then
            v9:Previous();
            return ;
        else
            v9:Next();
            return ;
        end;
    end;
    l_ImageButton_0.MouseButton1Click:Connect(function()
        v9:Next();
    end);
    v27.MouseButton1Click:Connect(function()
        v9:Previous();
    end);
    local function v31()
        local v30 = l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch;
        v27.Visible = not v30 and #v8:GetChildren() > 3;
        l_ImageButton_0.Visible = not v30 and #v8:GetChildren() > 3;
    end;
    local v32 = l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch;
    v27.Visible = not v32 and #v8:GetChildren() > 3;
    l_ImageButton_0.Visible = not v32 and #v8:GetChildren() > 3;
    l_UserInputService_0.LastInputTypeChanged:Connect(v31);
    return l_Frame_0;
end;
v0.UpdateGuiTheme = function(v34, v35)
    v34.rbxGui.NextButton.Image = v35.ScrollRightImage;
    if v35.ScrollLeftImage ~= "" then
        v34.rbxGui.PrevButton.Image = v35.ScrollLeftImage;
        return ;
    else
        v34.rbxGui.PrevButton.Image = v35.ScrollRightImage;
        v34.rbxGui.PrevButton.Rotation = 180;
        return ;
    end;
end;
v0.FadeTowardsEdges = function(_)
    if v9.CurrentPage then
        local v37 = v19();
        local v38 = 0;
        for v39, v40 in ipairs(v37) do
            if v40 == v9.CurrentPage then
                v38 = v39;
                break;
            end;
        end;
        for v41, v42 in ipairs(v37) do
            local v43 = math.min((v38 - v41) % #v37, (v41 - v38) % #v37);
            if v43 >= 2 then
                v42.ImageTransparency = 0.7;
            elseif v43 == 1 then
                v42.ImageTransparency = 0.4;
            else
                v42.ImageTransparency = 0;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v0.AddCarouselDivider = function(_)
    local l__CarouselDivider_0 = v8:FindFirstChild("_CarouselDivider");
    if l__CarouselDivider_0 then
        l__CarouselDivider_0:Destroy();
    end;
    if #v8:GetChildren() - 1 < 5 then
        return ;
    else
        l__CarouselDivider_0 = Instance.new("Frame");
        l__CarouselDivider_0.Name = "_CarouselDivider";
        l__CarouselDivider_0.Size = UDim2.new(1, 0, 1, 0);
        l__CarouselDivider_0.BackgroundTransparency = 1;
        l__CarouselDivider_0.Parent = v8;
        l__CarouselDivider_0.LayoutOrder = 1000000;
        local l_Frame_2 = Instance.new("Frame");
        l_Frame_2.Name = "line";
        l_Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
        l_Frame_2.BorderSizePixel = 0;
        l_Frame_2.Position = UDim2.new(0.25, 0, 0, -3);
        l_Frame_2.Size = UDim2.new(0, 2, 1, 6);
        l_Frame_2.Parent = l__CarouselDivider_0;
        local v47 = l_Frame_2:Clone();
        v47.Position = UDim2.new(0.5, 0, 0, -3);
        v47.Parent = l__CarouselDivider_0;
        local v48 = l_Frame_2:Clone();
        v48.Position = UDim2.new(0.75, 0, 0, -3);
        v48.Parent = l__CarouselDivider_0;
        return ;
    end;
end;
v0.RemovePlayerEntry = function(v49, v50)
    local v51 = v12[v50];
    if v51 then
        v12[v50] = nil;
        v11[v51] = nil;
        v51:Destroy();
        if v9 then
            v9:ApplyLayout();
        end;
        v49:FadeTowardsEdges();
    end;
end;
v0.ClearPlayerEntries = function(_)
    for v53 in pairs(v11) do
        v53:Destroy();
    end;
    v11 = {};
    v12 = {};
end;
v0.CreatePlayerEntry = function(_, v55, v56)
    local v57 = v12[v55];
    if not v57 then
        local l_ImageButton_1 = Instance.new("ImageButton");
        l_ImageButton_1.Name = v55.Name;
        l_ImageButton_1.BorderSizePixel = 0;
        l_ImageButton_1.LayoutOrder = v56;
        l_ImageButton_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
        l_ImageButton_1.BackgroundTransparency = 0;
        l_ImageButton_1.Size = UDim2.new(1, 0, 1, 0);
        l_ImageButton_1.SelectionLost:connect(function()
            l_ImageButton_1.BackgroundColor3 = v6;
        end);
        l_ImageButton_1.SelectionGained:connect(function()
            l_ImageButton_1.BackgroundColor3 = v5;
        end);
        local v59 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
        local v60 = nil;
        v60 = l_TweenService_0:Create(l_ImageButton_1, v59, {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        });
        v60:Play();
        v11[l_ImageButton_1] = v55;
        v12[v55] = l_ImageButton_1;
        l_ImageButton_1.MouseButton1Click:Connect(function()
            v9:JumpTo(l_ImageButton_1);
        end);
        l_ImageButton_1.Parent = v8;
        spawn(function()
            l_ImageButton_1.Image = require(l_AvatarContextMenu_0:WaitForChild("ContextMenuUtil")):GetHeadshotForPlayer(v55);
            v60:Cancel();
            v60 = nil;
            if l_ImageButton_1 == l_GuiService_0.SelectedCoreObject then
                l_ImageButton_1.BackgroundColor3 = v5;
                return ;
            else
                l_ImageButton_1.BackgroundColor3 = v6;
                return ;
            end;
        end);
        return ;
    else
        v57.LayoutOrder = v56;
        return ;
    end;
end;
v0.SwitchToPlayerEntry = function(v61, v62, v63)
    if v62 then
        local v64 = v12[v62];
        if not v64 then
            v61:CreatePlayerEntry(v62, 0);
            v64 = v12[v62];
        end;
        if v63 then
            v9.TweenTime = 0;
        end;
        v9:JumpTo(v64);
        spawn(function()
            v9.TweenTime = 0.25;
        end);
        return ;
    else
        return ;
    end;
end;
v0.OffsetPlayerEntry = function(_, v66)
    if v66 == 0 then
        return ;
    elseif v66 > 0 then
        v9:Next();
        return ;
    else
        v9:Previous();
        return ;
    end;
end;
v0.GetSelectedPlayer = function(_)
    return v11[v9.CurrentPage];
end;
v0.new = function(v68)
    local v69 = setmetatable({}, v0);
    v69.rbxGui = v33(v68);
    v69.PlayerChanged = v10.Event;
    v10.Event:Connect(function()
        v69:FadeTowardsEdges();
    end);
    return v69;
end;
return v0;
