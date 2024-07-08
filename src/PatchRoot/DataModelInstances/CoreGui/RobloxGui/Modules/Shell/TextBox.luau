local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local v1 = nil;
pcall(function()
    v1 = game:GetService("PlatformService");
end);
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
return function(v5)
    local v6 = {
        GetDefaultText = nil
    };
    local v7 = Vector2.new();
    local v8 = "";
    local v9 = "";
    local v10 = "";
    local v11 = not UserSettings().GameSettings:InStudioMode() and Enum.XboxKeyBoardType.Default;
    local v12 = "";
    local v13 = nil;
    local v14 = true;
    v6.OnTextChanged = l_Utility_0.Signal();
    local v15 = l_Utility_0.Create("ImageLabel")({
        Name = "SelectionBox", 
        Image = "rbxasset://textures/ui/SelectionBox.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(21, 21, 41, 41), 
        BackgroundTransparency = 1
    });
    local v16 = l_Utility_0.Create("ImageButton")({
        Name = "TextBoxFrame", 
        Size = v5, 
        BackgroundTransparency = 1, 
        ImageColor3 = l_GlobalSettings_0.TextBoxColor, 
        ImageTransparency = l_GlobalSettings_0.TextBoxDefaultTransparency, 
        Image = l_GlobalSettings_0.RoundCornerButtonImage, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(Vector2.new(4, 4), Vector2.new(28, 28)); 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v17 = l_Utility_0.Create("TextLabel")({
        Name = "DefaultTextLabel", 
        Size = UDim2.new(1, -v7.x * 2, 1, -v7.y * 2), 
        Position = UDim2.new(0, v7.x, 0, v7.y), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_GlobalSettings_0.TextSelectedColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        ZIndex = 2, 
        Parent = v16
    });
    local function v18()
        v17.Size = UDim2.new(1, -v7.x * 2, 1, -v7.y * 2);
        v17.Position = UDim2.new(0, v7.x, 0, v7.y);
        v15.Size = UDim2.new(1, v7.x * 2 + 24, 1, v7.y * 2 + 24);
        v15.Position = UDim2.new(0, -v7.x - 12, 0, -v7.y - 12);
    end;
    v18();
    local function v20(v19)
        if not UserSettings().GameSettings:InStudioMode() then
            v12 = v19;
            if #v12 == 0 then
                v17.Text = v6:GetDefaultText();
            elseif v11 == Enum.XboxKeyBoardType.Password then
                v17.Text = string.rep("*", #v12);
            else
                v17.Text = v12;
            end;
            v17.Visible = true;
            l_Utility_0.DisconnectEvent(v13);
            v6.OnTextChanged:fire(v12);
            return ;
        else
            return ;
        end;
    end;
    v16.MouseButton1Click:connect(function()
        if v14 then
            if UserSettings().GameSettings:InStudioMode() or game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows then
                l_Utility_0.DebugLog("Warning: virtual keyboard not accessable in studio");
            elseif v1 then
                v17.Visible = false;
                v1:ShowKeyboard(v9, v10, v12 or "", v11);
            end;
            l_Utility_0.DisconnectEvent(v13);
            if v1 then
                v13 = v1.KeyboardClosed:connect(v20);
            end;
        end;
    end);
    v16.SelectionGained:connect(function()
        l_Utility_0.PropertyTweener(v16, "ImageTransparency", l_GlobalSettings_0.TextBoxSelectedTransparency, l_GlobalSettings_0.TextBoxSelectedTransparency, 0, l_Utility_0.EaseInOutQuad, true);
    end);
    v16.SelectionLost:connect(function()
        l_Utility_0.PropertyTweener(v16, "ImageTransparency", l_GlobalSettings_0.TextBoxDefaultTransparency, l_GlobalSettings_0.TextBoxDefaultTransparency, 0, l_Utility_0.EaseInOutQuad, true);
    end);
    v6.SetKeyboardTitle = function(_, v22)
        v9 = v22;
    end;
    v6.SetKeyboardDescription = function(_, v24)
        v10 = v24;
    end;
    v6.SetKeyboardType = function(_, v26)
        v11 = v26;
    end;
    v6.SetEnabled = function(_, v28)
        v14 = v28;
    end;
    v6.SetParent = function(_, v30)
        v16.Parent = v30;
    end;
    v6.SetPosition = function(_, v32)
        v16.Position = v32;
    end;
    v6.SetSpacing = function(_, v34)
        v7 = v34;
        v18();
    end;
    v6.SetDefaultText = function(_, v36)
        v8 = v36;
        v17.Text = v8;
    end;
    v6.SetFont = function(_, v38)
        v17.Font = v38;
    end;
    v6.SetFontSize = function(_, v40)
        v17.FontSize = v40;
    end;
    v6.SetClipsDescendants = function(_, v42)
        v17.ClipsDescendants = v42;
    end;
    v6.SetVisible = function(_, _)
        v16.Visible = false;
    end;
    v6.GetContainer = function(_)
        return v16;
    end;
    v6.GetTextBox = function(_)
        return v17;
    end;
    v6.GetDefaultText = function(_)
        return v8;
    end;
    return v6;
end;
