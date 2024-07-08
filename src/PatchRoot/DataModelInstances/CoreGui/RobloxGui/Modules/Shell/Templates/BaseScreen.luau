local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
return function(v3)
    local v4 = {};
    local v5 = l_Utility_0.Create("Frame")({
        Name = "Container", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    });
    local v6 = l_Utility_0.Create("ImageButton")({
        Name = "BackButton", 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Lobby/Buttons/nine_slice_button.png", 
        ImageColor3 = l_GlobalSettings_0.GreyButtonColor, 
        Size = UDim2.new(0, 175, 0, 48), 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(9, 9, 39, 39)
    });
    local v7 = l_Utility_0.Create("ImageLabel")({
        Name = "BackImage", 
        Size = UDim2.new(0, 48, 0, 48), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/BackIcon@1080.png", 
        Parent = v5
    });
    local v8 = l_Utility_0.Create("TextLabel")({
        Name = "BackText", 
        Size = UDim2.new(0, 0, 0, v7.Size.Y.Offset), 
        Position = UDim2.new(0, v7.Size.X.Offset + 8, 0, 0), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = "", 
        Parent = v5
    });
    local v9 = l_Utility_0.Create("TextLabel")({
        Name = "TitleText", 
        Size = UDim2.new(0, 0, 0, 35), 
        Position = UDim2.new(0, 16, 0, v7.Size.Y.Offset + 74), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.HeaderSize, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = "", 
        Parent = v5
    });
    v4.Container = v5;
    v4.BackImage = v7;
    v4.BackText = v8;
    v4.TitleText = v9;
    v4.SetBackText = function(_, v11)
        local l_TextSize_0 = game:GetService("TextService"):GetTextSize(v11, l_Utility_0.ConvertFontSizeEnumToInt(v8.FontSize), v8.Font, Vector2.new());
        local v13 = (v6.Size.Y.Offset - v7.Size.Y.Offset) / 2;
        v8.Text = v11;
        v6.Size = UDim2.new(0, ((v13 * 2 + l_TextSize_0.X) + v7.Size.X.Offset) + 8, v6.Size.Y.Scale, v6.Size.Y.Offset);
    end;
    v4:SetBackText(v3:GetBackText());
    v6.MouseButton1Click:connect(function()
        v3:OnBackButtonClick();
    end);
    return v4;
end;
