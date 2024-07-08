local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_TextService_0 = game:GetService("TextService");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
return function(v5, v6, v7)
    local v8 = {
        OnSelectableChanged = l_Utility_0.Signal()
    };
    local v9 = l_Utility_0.Create("ImageLabel")({
        Name = "EdgeSelectionImage", 
        Size = UDim2.new(1, 32, 1, 32), 
        Position = UDim2.new(0, -16, 0, -16), 
        Image = "rbxasset://textures/ui/SelectionBox.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(21, 21, 41, 41), 
        BackgroundTransparency = 1
    });
    local v10 = l_Utility_0.Create("Frame")({
        Name = "ScrollingTextBox", 
        Size = v5 or UDim2.new(), 
        Position = v6 or UDim2.new(), 
        BackgroundTransparency = 1, 
        Parent = v7
    });
    local v11 = l_Utility_0.Create("ScrollingFrame")({
        Name = "ScrollingBox", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        ScrollBarThickness = 0, 
        SelectionImageObject = v9, 
        Selectable = false, 
        Parent = v10; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v12 = l_Utility_0.Create("TextLabel")({
        Name = "TextLabel", 
        Size = UDim2.new(1, 0, 4, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.DescriptionSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextWrapped = true, 
        Text = "", 
        Parent = v11
    });
    local v13 = l_Utility_0.Create("Frame")({
        Name = "ArrowContainer", 
        Size = UDim2.new(1, 0, 0, 51), 
        BackgroundTransparency = 1
    });
    local v14 = l_Utility_0.Create("ImageLabel")({
        Name = "UpArrow", 
        BackgroundTransparency = 1, 
        ImageColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Visible = false, 
        Parent = v10, 
        Image = "rbxasset://textures/ui/Shell/Icons/UpIndicatorIcon@1080.png", 
        Size = UDim2.new(0, 20, 0, 18), 
        Position = UDim2.new(1, -20, 1, 21)
    });
    local v15 = l_Utility_0.Create("ImageLabel")({
        Name = "DownArrow", 
        BackgroundTransparency = 1, 
        ImageColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Visible = false, 
        Parent = v10, 
        Image = "rbxasset://textures/ui/Shell/Icons/DownIndicatorIcon@1080.png", 
        Size = UDim2.new(0, 20, 0, 18), 
        Position = UDim2.new(1, -20, 1, 43)
    });
    v14.Parent = v13;
    v14.Position = UDim2.new(1, -20, 0, 0);
    v15.Parent = v13;
    v15.Position = UDim2.new(1, -20, 0, 33);
    local v16 = l_Utility_0.Create("ImageLabel")({
        Name = "RightStickHint", 
        BackgroundTransparency = 1, 
        ImageColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Visible = false, 
        Parent = v10, 
        Image = "rbxasset://textures/ui/Shell/Icons/RightStickHint@1080.png", 
        Size = UDim2.new(0, 32, 0, 32), 
        Position = UDim2.new(1, -64, 1, 25)
    });
    local function _()
        local l_CanvasPosition_0 = v11.CanvasPosition;
        if (v12.AbsoluteSize.y - v11.AbsoluteWindowSize.y) - 2 <= l_CanvasPosition_0.y then
            v15.ImageColor3 = l_GlobalSettings_0.GreyTextColor;
        else
            v15.ImageColor3 = l_GlobalSettings_0.WhiteTextColor;
        end;
        if l_CanvasPosition_0.y <= 2 then
            v14.ImageColor3 = l_GlobalSettings_0.GreyTextColor;
            return ;
        else
            v14.ImageColor3 = l_GlobalSettings_0.WhiteTextColor;
            return ;
        end;
    end;
    local function v22()
        local l_Y_0 = v8:GetTextSize().Y;
        v12.Size = UDim2.new(1, 0, 0, l_Y_0);
        v11.CanvasSize = UDim2.new(0, 0, 0, l_Y_0);
        local v20 = v11.AbsoluteSize.y < l_Y_0;
        if v20 then
            v13.Parent = v10.Parent;
            v10.Size = UDim2.new(v10.Size.X.Scale, v10.Size.X.Offset, v10.Size.Y.Scale, (v10.Size.Y.Offset - v13.Size.Y.Offset) + 20);
        end;
        v8:SetArrowsVisible(v20);
        v8:SetSelectable(v20);
        local l_CanvasPosition_1 = v11.CanvasPosition;
        if (v12.AbsoluteSize.y - v11.AbsoluteWindowSize.y) - 2 <= l_CanvasPosition_1.y then
            v15.ImageColor3 = l_GlobalSettings_0.GreyTextColor;
        else
            v15.ImageColor3 = l_GlobalSettings_0.WhiteTextColor;
        end;
        if l_CanvasPosition_1.y <= 2 then
            v14.ImageColor3 = l_GlobalSettings_0.GreyTextColor;
            return ;
        else
            v14.ImageColor3 = l_GlobalSettings_0.WhiteTextColor;
            return ;
        end;
    end;
    v11:GetPropertyChangedSignal("CanvasPosition"):connect(function()
        local l_CanvasPosition_2 = v11.CanvasPosition;
        if (v12.AbsoluteSize.y - v11.AbsoluteWindowSize.y) - 2 <= l_CanvasPosition_2.y then
            v15.ImageColor3 = l_GlobalSettings_0.GreyTextColor;
        else
            v15.ImageColor3 = l_GlobalSettings_0.WhiteTextColor;
        end;
        if l_CanvasPosition_2.y <= 2 then
            v14.ImageColor3 = l_GlobalSettings_0.GreyTextColor;
            return ;
        else
            v14.ImageColor3 = l_GlobalSettings_0.WhiteTextColor;
            return ;
        end;
    end);
    v11:GetPropertyChangedSignal("AbsoluteWindowSize"):connect(function()
        local l_CanvasPosition_3 = v11.CanvasPosition;
        if (v12.AbsoluteSize.y - v11.AbsoluteWindowSize.y) - 2 <= l_CanvasPosition_3.y then
            v15.ImageColor3 = l_GlobalSettings_0.GreyTextColor;
        else
            v15.ImageColor3 = l_GlobalSettings_0.WhiteTextColor;
        end;
        if l_CanvasPosition_3.y <= 2 then
            v14.ImageColor3 = l_GlobalSettings_0.GreyTextColor;
            return ;
        else
            v14.ImageColor3 = l_GlobalSettings_0.WhiteTextColor;
            return ;
        end;
    end);
    v11.SelectionGained:Connect(function()
        v16.Visible = true;
    end);
    v11.SelectionLost:Connect(function()
        v16.Visible = false;
    end);
    v8.SetParent = function(_, v26)
        if v10.Parent ~= v26 then
            v10.Parent = v26;
            spawn(function()
                v22();
            end);
        end;
    end;
    v8.SetPosition = function(_, v28)
        v10.Position = v28;
    end;
    v8.SetSize = function(_, v30)
        if v10.Size ~= v30 then
            v10.Size = v30;
            spawn(function()
                v22();
            end);
        end;
    end;
    v8.SetFontSize = function(_, v32)
        if v12.FontSize ~= v32 then
            v12.FontSize = v32;
            spawn(function()
                v22();
            end);
        end;
    end;
    v8.SetFont = function(_, v34)
        if v12.Font ~= v34 then
            v12.Font = v34;
            spawn(function()
                v22();
            end);
        end;
    end;
    v8.SetText = function(_, v36)
        if v12.Text ~= tostring(v36) then
            v12.Text = tostring(v36);
            spawn(function()
                v22();
            end);
        end;
    end;
    v8.GetTextSize = function(_)
        return l_TextService_0:GetTextSize(v12.Text, l_Utility_0.ConvertFontSizeEnumToInt(v12.FontSize), v12.Font, Vector2.new(v12.AbsoluteSize.X, 6000));
    end;
    v8.SetLayoutOrder = function(_, v39)
        v10.LayoutOrder = v39;
        v13.LayoutOrder = v39 + 1;
    end;
    v8.SetSelectable = function(_, v41)
        v11.Selectable = v41;
        v8.OnSelectableChanged:fire(v41);
    end;
    v8.SetZIndex = function(_, v43)
        v10.ZIndex = v43;
        v12.ZIndex = v43;
        v14.ZIndex = v43;
        v15.ZIndex = v43;
        v16.ZIndex = v43;
    end;
    v8.SetArrowsVisible = function(_, v45)
        v14.Visible = v45;
        v15.Visible = v45;
    end;
    v8.GetContainer = function(_)
        return v10;
    end;
    v8.GetSelectableObject = function(_)
        return v11;
    end;
    v8.GetArrowsVisible = function(_)
        return v14.Visible;
    end;
    v8.IsSelectable = function(_)
        return v11.Selectable;
    end;
    return v8;
end;
