local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_TextService_0 = game:GetService("TextService");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
return function(v4)
    local v5 = {};
    local v6 = v4.AbsoluteSize.x * 0.5;
    local v7 = l_Utility_0.Create("Frame")({
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Visible = false, 
        Parent = v4
    });
    local v8 = l_Utility_0.Create("ImageLabel")({
        Size = UDim2.new(0, 40, 0, 40), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/AlertIcon.png", 
        Parent = v7
    });
    local v9 = l_Utility_0.Create("TextLabel")({
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0, 56, 0, 21.5), 
        BackgroundTransparency = 1, 
        Text = "", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        FontSize = l_GlobalSettings_0.DescriptionSize, 
        Font = l_GlobalSettings_0.RegularFont, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        Parent = v7
    });
    local function v10()
        v7.Position = UDim2.new(1, -((math.min(l_TextService_0:GetTextSize(v9.Text, l_Utility_0.ConvertFontSizeEnumToInt(v9.FontSize), v9.Font, Vector2.new(0, 0)).x, v6) + v8.Size.X.Offset) + 4), 0, v8.Size.Y.Offset / 2);
    end;
    v5.SetVisible = function(_, v12)
        v7.Visible = v12;
    end;
    v5.SetText = function(_, v14)
        if v14 == v9.Text then
            return ;
        else
            v9.Text = v14;
            v10();
            return ;
        end;
    end;
    return v5;
end;
