local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_TextService_0 = game:GetService("TextService");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
return function()
    local v4 = {};
    local v5 = l_Utility_0.Create("Frame")({
        Name = "SiteInfoContainer", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 1, 0), 
        AnchorPoint = Vector2.new(0, 1), 
        BackgroundTransparency = 1
    });
    local v6 = l_Utility_0.Create("TextLabel")({
        Name = "SiteInfoText", 
        Size = UDim2.new(1, -12, 0, 12), 
        Position = UDim2.new(0, 0, 1, 0), 
        AnchorPoint = Vector2.new(0, 1), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Bottom, 
        Text = "", 
        Parent = v5
    });
    local function v7()
        v5.Size = UDim2.new(0, l_TextService_0:GetTextSize(v6.Text, l_Utility_0.ConvertFontSizeEnumToInt(v6.FontSize), v6.Font, Vector2.new(0, 0)).X, 0, 50);
    end;
    v4.SetParent = function(_, v9)
        v5.Parent = v9;
    end;
    v4.SetText = function(_, v11)
        if v11 ~= v6.Text then
            v6.Text = v11;
            v7();
        end;
    end;
    return v4;
end;
