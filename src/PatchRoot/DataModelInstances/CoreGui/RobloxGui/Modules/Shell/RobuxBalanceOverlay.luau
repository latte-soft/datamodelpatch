local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_TextService_0 = game:GetService("TextService");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_BaseOverlay_0 = require(l_Shell_0:FindFirstChild("BaseOverlay"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_CurrencyWidget_0 = require(l_Shell_0:FindFirstChild("CurrencyWidget"));
local l_UserData_0 = require(l_Shell_0:FindFirstChild("UserData"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
return function(v10, v11)
    local v12 = l_BaseOverlay_0();
    local v13 = nil;
    local v14 = nil;
    v12:SetImage((l_Utility_0.Create("ImageLabel")({
        Name = "OverlayImage", 
        Size = UDim2.new(0, 416, 0, 416), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/AlertIcon.png", 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })));
    local v15 = l_Utility_0.Create("TextLabel")({
        Name = "TitleText", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0, v12.RightAlign, 0, 88), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.HeaderSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = l_LocalizedStrings_0:LocalizedString("RobuxBalanceOverlayTitle"), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Parent = v12.Container
    });
    local v16 = l_Utility_0.Create("TextLabel")({
        Name = "DescriptionText", 
        Size = UDim2.new(0, 762, 0, 126), 
        Position = UDim2.new(0, v12.RightAlign, 0, v15.Position.Y.Offset + 62), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextWrapped = true, 
        Text = l_LocalizedStrings_0:LocalizedString("RobuxBalanceOverlayPhrase"), 
        Parent = v12.Container
    });
    local v17 = l_Utility_0.Create("TextLabel")({
        Name = "platformBalanceTitle", 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = l_LocalizedStrings_0:LocalizedString("PlatformBalanceTitle"), 
        Parent = v12.Container
    });
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v17.Text, 42, l_GlobalSettings_0.RegularFont, Vector2.new());
    v17.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.x, 0, l_l_TextService_0_TextSize_0.y);
    v17.AnchorPoint = Vector2.new(0, 0.5);
    v17.Position = UDim2.new(0, v12.RightAlign, 0, (v16.Position.Y.Offset + v16.Size.Y.Offset) + 60);
    local v19 = v17:Clone();
    v19.Name = "TotalBalanceTitle";
    v19.Text = l_LocalizedStrings_0:LocalizedString("TotalBalanceTitle");
    v19.Parent = v12.Container;
    l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v19.Text, 42, l_GlobalSettings_0.RegularFont, Vector2.new());
    v19.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.x, 0, l_l_TextService_0_TextSize_0.y);
    v19.AnchorPoint = Vector2.new(0, 0.5);
    v19.Position = UDim2.new(0, v12.RightAlign, 0, (v17.Position.Y.Offset + v17.Size.Y.Offset) + 16);
    local v20 = l_Utility_0.Create("TextLabel")({
        Name = "XboxBalanceText", 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextColor3 = l_GlobalSettings_0.GreenTextColor, 
        Parent = v12.Container
    });
    local function v22(v21)
        v20.Text = l_Utility_0.FormatNumberString(v21);
        l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v20.Text, 42, l_GlobalSettings_0.RegularFont, Vector2.new());
        v20.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.x, 0, l_l_TextService_0_TextSize_0.y);
        v20.AnchorPoint = Vector2.new(0, 0.5);
        v20.Position = UDim2.new(0, (v12.RightAlign + v17.Size.X.Offset) + 8, 0, v17.Position.Y.Offset);
    end;
    v22(v10);
    local v23 = v20:Clone();
    v23.Name = "TotalBalanceText";
    v23.Parent = v12.Container;
    local function v25(v24)
        v23.Text = l_Utility_0.FormatNumberString(v24);
        l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v23.Text, 42, l_GlobalSettings_0.RegularFont, Vector2.new());
        v23.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.x, 0, l_l_TextService_0_TextSize_0.y);
        v23.Position = UDim2.new(0, (v12.RightAlign + v19.Size.X.Offset) + 8, 0, v19.Position.Y.Offset);
    end;
    v25(v11);
    local v26 = l_Utility_0.Create("TextButton")({
        Name = "OkButton", 
        Size = UDim2.new(0, 320, 0, 66), 
        Position = UDim2.new(0, v15.Position.X.Offset, 1, -121), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.BlueButtonColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_GlobalSettings_0.TextSelectedColor, 
        Text = l_LocalizedStrings_0:LocalizedString("OkWord"), 
        Parent = v12.Container; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    l_Utility_0.ResizeButtonWithText(v26, v26, l_GlobalSettings_0.TextHorizontalPadding);
    v26.MouseButton1Click:connect(function()
        v12:Close();
    end);
    v12.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("RobuxBalanceOverlayId")
        };
    end;
    local l_Focus_0 = v12.Focus;
    v12.Focus = function(_)
        l_Focus_0(v12);
        l_Utility_0.SetSelectedCoreObject(v26);
        if not v13 then
            v13 = l_CurrencyWidget_0();
        end;
        v14 = l_Utility_0.DisconnectEvent(v14);
        v14 = v13.RobuxChanged:connect(function(v30)
            v22(v30);
            v25(l_UserData_0.GetTotalUserBalanceAsync());
        end);
    end;
    v12.ScreenRemoved = function(_)
        v14 = l_Utility_0.DisconnectEvent(v14);
        v13:Destroy();
        v13 = nil;
    end;
    return v12;
end;
