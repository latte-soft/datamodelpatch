local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local l_Settings_0 = l_Modules_0:WaitForChild("Settings");
local l_AvatarContextMenu_0 = l_Modules_0:WaitForChild("AvatarContextMenu");
local v6 = nil;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local _ = require(l_AvatarContextMenu_0:WaitForChild("ContextMenuUtil"));
local _ = require(l_Settings_0:WaitForChild("Utility"));
local v10 = {};
v10.__index = v10;
v10.CreateContextMenuHolder = function(_, _)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "AvatarContextMenu";
    l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Parent = l_RobloxGui_0;
    l_Frame_0.AutoLocalize = false;
    return l_Frame_0;
end;
v10.CreateLeaveMenuButton = function(v14, v15, v16)
    local function v17()
        v14.CloseMenuFunc();
    end;
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "CloseMenuButton";
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.AnchorPoint = Vector2.new(1, 0);
    l_ImageButton_0.Position = UDim2.new(1, -10, 0, 10);
    l_ImageButton_0.Size = UDim2.new(0.05, 0, 0.1, 0);
    l_ImageButton_0.Image = v16.LeaveMenuImage;
    l_ImageButton_0.Selectable = false;
    l_ImageButton_0.Activated:Connect(v17);
    local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_0.AspectType = Enum.AspectType.FitWithinMaxSize;
    l_UIAspectRatioConstraint_0.DominantAxis = Enum.DominantAxis.Height;
    l_UIAspectRatioConstraint_0.AspectRatio = 1;
    l_UIAspectRatioConstraint_0.Parent = l_ImageButton_0;
    l_ImageButton_0.Parent = v15;
    return l_ImageButton_0;
end;
local function _(v20)
    if v20 == nil then
        return ;
    else
        local v21 = nil;
        workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            if v21 then
                v21:Disconnect();
            end;
            v21 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(v20);
            v20();
        end);
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        if v21 then
            v21:Disconnect();
        end;
        v21 = l_CurrentCamera_1:GetPropertyChangedSignal("ViewportSize"):Connect(v20);
        v20();
        return ;
    end;
end;
v10.CreateMenuFrame = function(v25, v26)
    local l_v25_ContextMenuHolder_0 = v25:CreateContextMenuHolder();
    local l_ImageButton_1 = Instance.new("ImageButton");
    l_ImageButton_1.Name = "Menu";
    l_ImageButton_1.AnchorPoint = v26.AnchorPoint;
    l_ImageButton_1.Size = v26.Size;
    l_ImageButton_1.Position = v26.OnScreenPosition;
    l_ImageButton_1.BackgroundTransparency = v26.BackgroundTransparency;
    l_ImageButton_1.BackgroundColor3 = v26.BackgroundColor;
    l_ImageButton_1.Image = v26.BackgroundImage;
    l_ImageButton_1.ScaleType = v26.BackgroundImageScaleType;
    l_ImageButton_1.SliceCenter = v26.BackgroundImageSliceCenter;
    l_ImageButton_1.AutoButtonColor = false;
    l_ImageButton_1.BorderSizePixel = 0;
    l_ImageButton_1.Selectable = false;
    l_ImageButton_1.Visible = false;
    l_ImageButton_1.Active = true;
    l_ImageButton_1.ClipsDescendants = true;
    l_ImageButton_1.Modal = true;
    l_GuiService_0:AddSelectionParent("AvatarContextMenuGroup", l_ImageButton_1);
    local l_UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_1.AspectType = Enum.AspectType.ScaleWithParentSize;
    l_UIAspectRatioConstraint_1.DominantAxis = Enum.DominantAxis.Height;
    l_UIAspectRatioConstraint_1.Name = "MenuAspectRatio";
    l_UIAspectRatioConstraint_1.AspectRatio = v26.AspectRatio;
    l_UIAspectRatioConstraint_1.Parent = l_ImageButton_1;
    local function v31()
        local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
        if l_ViewportSize_0.x < l_ViewportSize_0.y then
            l_UIAspectRatioConstraint_1.DominantAxis = Enum.DominantAxis.Width;
            return ;
        else
            l_UIAspectRatioConstraint_1.DominantAxis = Enum.DominantAxis.Height;
            return ;
        end;
    end;
    if not (v31 == nil) then
        local v32 = nil;
        do
            local l_v32_0 = v32;
            workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
                local l_CurrentCamera_2 = workspace.CurrentCamera;
                if l_v32_0 then
                    l_v32_0:Disconnect();
                end;
                l_v32_0 = l_CurrentCamera_2:GetPropertyChangedSignal("ViewportSize"):Connect(v31);
                v31();
            end);
            local l_CurrentCamera_3 = workspace.CurrentCamera;
            if l_v32_0 then
                l_v32_0:Disconnect();
            end;
            l_v32_0 = l_CurrentCamera_3:GetPropertyChangedSignal("ViewportSize"):Connect(v31);
            v31();
        end;
    end;
    local l_UISizeConstraint_0 = Instance.new("UISizeConstraint");
    l_UISizeConstraint_0.Name = "MenuSizeConstraint";
    l_UISizeConstraint_0.MaxSize = v26.MaxSize;
    l_UISizeConstraint_0.MinSize = v26.MinSize;
    l_UISizeConstraint_0.Parent = l_ImageButton_1;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "Content";
    l_Frame_1.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.Parent = l_ImageButton_1;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Top;
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.Parent = l_Frame_1;
    local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
    l_ScrollingFrame_0.Name = "ContextActionList";
    l_ScrollingFrame_0.AnchorPoint = Vector2.new(0.5, 1);
    l_ScrollingFrame_0.BackgroundColor3 = v26.ButtonFrameColor;
    l_ScrollingFrame_0.BackgroundTransparency = v26.ButtonFrameTransparency;
    l_ScrollingFrame_0.BorderSizePixel = 0;
    l_ScrollingFrame_0.LayoutOrder = 2;
    l_ScrollingFrame_0.Size = UDim2.new(1, -12, 0.54, 0);
    l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 208);
    l_ScrollingFrame_0.ScrollBarThickness = 4;
    l_ScrollingFrame_0.Selectable = false;
    l_ScrollingFrame_0.Parent = l_Frame_1;
    local l_UIListLayout_1 = Instance.new("UIListLayout");
    l_UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    l_UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Top;
    l_UIListLayout_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, l_UIListLayout_1.AbsoluteContentSize.Y);
    end);
    l_UIListLayout_1.Parent = l_ScrollingFrame_0;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.Name = "NameTag";
    l_TextButton_0.AnchorPoint = Vector2.new(0.5, 1);
    l_TextButton_0.BackgroundColor3 = v26.NameTagColor;
    l_TextButton_0.AutoButtonColor = false;
    l_TextButton_0.BorderSizePixel = 0;
    l_TextButton_0.LayoutOrder = 1;
    l_TextButton_0.Size = UDim2.new(1, -12, 0.16, 0);
    l_TextButton_0.Font = v26.Font;
    l_TextButton_0.TextColor3 = v26.TextColor;
    l_TextButton_0.TextSize = 24 * v26.TextScale;
    l_TextButton_0.Text = "";
    l_TextButton_0.TextXAlignment = Enum.TextXAlignment.Center;
    l_TextButton_0.TextYAlignment = Enum.TextYAlignment.Center;
    l_TextButton_0.Selectable = false;
    l_TextButton_0.Parent = l_Frame_1;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Name = "Underline";
    l_Frame_2.BackgroundColor3 = v26.NameUnderlineColor;
    l_Frame_2.AnchorPoint = Vector2.new(0, 1);
    l_Frame_2.BorderSizePixel = 0;
    l_Frame_2.Position = UDim2.new(0, 0, 1, 0);
    l_Frame_2.Size = UDim2.new(1, 0, 0, 2);
    l_Frame_2.Parent = l_TextButton_0;
    v25:CreateLeaveMenuButton(l_ImageButton_1, v26);
    l_ImageButton_1.Parent = l_v25_ContextMenuHolder_0;
    v25.ContextMenuFrame = l_ImageButton_1;
    return l_ImageButton_1;
end;
v10.UpdateGuiTheme = function(v43, v44)
    v43.ContextMenuFrame.Size = v44.Size;
    v43.ContextMenuFrame.AnchorPoint = v44.AnchorPoint;
    v43.ContextMenuFrame.BackgroundTransparency = v44.BackgroundTransparency;
    v43.ContextMenuFrame.BackgroundColor3 = v44.BackgroundColor;
    v43.ContextMenuFrame.Image = v44.BackgroundImage;
    v43.ContextMenuFrame.ScaleType = v44.BackgroundImageScaleType;
    v43.ContextMenuFrame.SliceCenter = v44.BackgroundImageSliceCenter;
    v43.ContextMenuFrame.CloseMenuButton.Image = v44.LeaveMenuImage;
    v43.ContextMenuFrame.MenuSizeConstraint.MaxSize = v44.MaxSize;
    v43.ContextMenuFrame.MenuSizeConstraint.MinSize = v44.MinSize;
    v43.ContextMenuFrame.MenuAspectRatio.AspectRatio = v44.AspectRatio;
    local l_Content_0 = v43.ContextMenuFrame.Content;
    l_Content_0.ContextActionList.BackgroundColor3 = v44.ButtonFrameColor;
    l_Content_0.ContextActionList.BackgroundTransparency = v44.ButtonFrameTransparency;
    l_Content_0.NameTag.BackgroundColor3 = v44.NameTagColor;
    l_Content_0.NameTag.Font = v44.Font;
    l_Content_0.NameTag.TextColor3 = v44.TextColor;
    l_Content_0.NameTag.TextSize = 24 * v44.TextScale;
    l_Content_0.NameTag.Underline.BackgroundColor3 = v44.NameUnderlineColor;
    if v6 then
        v6:UpdateGuiTheme(v44);
    end;
end;
v10.BuildPlayerCarousel = function(v46, v47, v48)
    if not v6 then
        v6 = require(l_AvatarContextMenu_0.PlayerCarousel).new(v48);
        v6.rbxGui.Parent = v46.ContextMenuFrame.Content;
    end;
    v6:ClearPlayerEntries();
    if v46.PlayerChangedConnection then
        v46.PlayerChangedConnection:Disconnect();
    end;
    v46.PlayerChangedConnection = v6.PlayerChanged:Connect(function(v49)
        if not v49 then
            v46.ContextMenuFrame.Content.NameTag.Text = "";
        else
            v46.ContextMenuFrame.Content.NameTag.Text = v49.Name;
        end;
        l_BindableEvent_0:Fire(v49);
    end);
    for v50 = 1, #v47 do
        v6:CreatePlayerEntry(v47[v50][1], v47[v50][2]);
    end;
    v6:FadeTowardsEdges();
    v6:AddCarouselDivider();
end;
v10.RemovePlayerEntry = function(_, v52)
    if v6 then
        v6:RemovePlayerEntry(v52);
        return ;
    else
        return ;
    end;
end;
v10.GetBottomScreenPaddingConstant = function(_)
    return 0.02;
end;
v10.SetCloseMenuFunc = function(v54, v55)
    v54.CloseMenuFunc = v55;
end;
v10.SwitchToPlayerEntry = function(_, v57, v58)
    if v6 then
        v6:SwitchToPlayerEntry(v57, v58);
        return ;
    else
        return ;
    end;
end;
v10.OffsetPlayerEntry = function(_, v60)
    if v6 then
        v6:OffsetPlayerEntry(v60);
        return ;
    else
        return ;
    end;
end;
v10.GetSelectedPlayer = function(_)
    if v6 then
        return v6:GetSelectedPlayer();
    else
        return nil;
    end;
end;
v10.new = function()
    local v62 = setmetatable({}, v10);
    v62.CloseMenuFunc = nil;
    v62.ContextMenuFrame = nil;
    v62.LastSetPlayerIcon = nil;
    v62.PlayerChangedConnection = nil;
    v62.SelectedPlayerChanged = l_BindableEvent_0.Event;
    return v62;
end;
return v10.new();
