local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_BaseOverlay_0 = require(l_Shell_0:FindFirstChild("BaseOverlay"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
return function(v7)
    local v8 = l_BaseOverlay_0();
    local l_Title_0 = v7.Title;
    local l_Msg_0 = v7.Msg;
    local l_Callback_0 = v7.Callback;
    v8:SetImage(l_Utility_0.Create("ImageLabel")({
        Name = "ReportIcon", 
        Position = UDim2.new(0, 226, 0, 204), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/ErrorIconLargeCopy@1080.png", 
        Size = UDim2.new(0, 321, 0, 264)
    }));
    local _ = l_Utility_0.Create("TextLabel")({
        Name = "DescriptionText", 
        Size = UDim2.new(0, 762, 0, 304), 
        Position = UDim2.new(0, v8.RightAlign, 0, l_Utility_0.Create("TextLabel")({
            Name = "TitleText", 
            Size = UDim2.new(0, 0, 0, 0), 
            Position = UDim2.new(0, v8.RightAlign, 0, 136), 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.HeaderSize, 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            Text = l_Title_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Parent = v8.Container
        }).Position.Y.Offset + 62), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextWrapped = true, 
        Text = l_Msg_0, 
        Parent = v8.Container
    });
    local v13 = l_Utility_0.Create("TextButton")({
        Name = "KeepEnabledButton", 
        Position = UDim2.new(0, v8.RightAlign, 1, -166), 
        Size = UDim2.new(0, 320, 0, 66), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.BlueButtonColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_GlobalSettings_0.BlackTextColor, 
        Text = l_LocalizedStrings_0:LocalizedString("KeepEnabledPhrase"), 
        Parent = v8.Container; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    l_Utility_0.ResizeButtonWithText(v13, v13, l_GlobalSettings_0.TextHorizontalPadding);
    local v14 = l_Utility_0.Create("TextButton")({
        Name = "OkButton", 
        Position = UDim2.new(0, (v13.Position.X.Offset + v13.Size.X.Offset) + 10, 1, -166), 
        Size = UDim2.new(0, 320, 0, 66), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.GreyButtonColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = l_LocalizedStrings_0:LocalizedString("DisableWord"), 
        Parent = v8.Container; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    l_Utility_0.ResizeButtonWithText(v14, v14, l_GlobalSettings_0.TextHorizontalPadding);
    v13.SelectionGained:connect(function()
        v13.BackgroundColor3 = l_GlobalSettings_0.GreySelectedButtonColor;
        v13.TextColor3 = l_GlobalSettings_0.TextSelectedColor;
    end);
    v13.SelectionLost:connect(function()
        v13.BackgroundColor3 = l_GlobalSettings_0.GreyButtonColor;
        v13.TextColor3 = l_GlobalSettings_0.WhiteTextColor;
    end);
    v14.SelectionGained:connect(function()
        v14.BackgroundColor3 = l_GlobalSettings_0.GreySelectedButtonColor;
        v14.TextColor3 = l_GlobalSettings_0.TextSelectedColor;
    end);
    v14.SelectionLost:connect(function()
        v14.BackgroundColor3 = l_GlobalSettings_0.GreyButtonColor;
        v14.TextColor3 = l_GlobalSettings_0.WhiteTextColor;
    end);
    v8.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("DisableCrossplayOverlayId"), 
            Title = v7.Title
        };
    end;
    v14.MouseButton1Click:connect(function()
        if v8:Close() then
            l_Callback_0();
        end;
    end);
    v13.MouseButton1Click:connect(function()
        v8:Close();
    end);
    local l_Focus_0 = v8.Focus;
    v8.Focus = function(v17)
        l_Focus_0(v17);
        l_Utility_0.SetSelectedCoreObject(v13);
    end;
    v8.GetOverlaySound = function(_)
        return "Error";
    end;
    return v8;
end;
