local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_TextService_0 = game:GetService("TextService");
return function(v4, v5)
    local v6 = {};
    local v7 = 0.3;
    local l_Quad_0 = Enum.EasingStyle.Quad;
    local l_Out_0 = Enum.EasingDirection.Out;
    local v10 = 2;
    local v11 = l_Utility_0.Create("Frame")({
        Name = "ClipFrame", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ZIndex = v10, 
        ClipsDescendants = true, 
        Parent = v4
    });
    local v12 = l_Utility_0.Create("Frame")({
        Name = "PopupBG", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 1, 5), 
        BackgroundTransparency = l_GlobalSettings_0.ModalBackgroundTransparency, 
        BackgroundColor3 = l_GlobalSettings_0.ModalBackgroundColor, 
        BorderSizePixel = 0, 
        ZIndex = v10, 
        Parent = v11
    });
    local v13 = l_Utility_0.Create("TextLabel")({
        Name = "NameLabel", 
        Size = UDim2.new(1, -18, 1, -12), 
        Position = UDim2.new(0, 16, 0, 6), 
        BackgroundTransparency = 1, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        ZIndex = v10, 
        Text = v5, 
        Parent = v12
    });
    local function v15()
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v13.Text, l_Utility_0.ConvertFontSizeEnumToInt(v13.FontSize), v13.Font, Vector2.new((v11.AbsoluteSize.x - 7) - 18, (v11.AbsoluteSize.y - 7) - 12));
        v12.Size = UDim2.new(0, (l_l_TextService_0_TextSize_0.x + 18) + 7, 0, math.min(l_l_TextService_0_TextSize_0.y + 12, v4.AbsoluteSize.y * 0.75) + 7);
    end;
    spawn(function()
        v15();
    end);
    v4.SelectionGained:connect(function()
        if #v13.Text > 0 then
            v15();
            l_Utility_0.TweenPositionOrSet(v12, UDim2.new(0, 0, 1, -v12.Size.Y.Offset), l_Out_0, l_Quad_0, v7, true);
        end;
    end);
    v4.SelectionLost:connect(function()
        l_Utility_0.TweenPositionOrSet(v12, UDim2.new(0, 0, 1, 5), l_Out_0, l_Quad_0, v7, true);
    end);
    v6.SetTweenTime = function(_, v17)
        v7 = v17;
    end;
    v6.SetEasingStyle = function(_, v19)
        l_Quad_0 = v19;
    end;
    v6.SetEasingDirection = function(_, v21)
        l_Out_0 = v21;
    end;
    v6.SetText = function(_, v23)
        v13.Text = v23;
        v15();
        if #v23 == 0 then
            v12.Position = UDim2.new(0, 0, 1, 5);
        end;
    end;
    v6.SetZIndex = function(_, v25)
        if v25 ~= v10 then
            v10 = v25;
            v11.ZIndex = v10;
            v12.ZIndex = v10;
            v13.ZIndex = v10;
        end;
    end;
    return v6;
end;
