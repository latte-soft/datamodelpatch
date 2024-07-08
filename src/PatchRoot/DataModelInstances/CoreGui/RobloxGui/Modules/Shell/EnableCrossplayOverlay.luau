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
        Name = "AlertIcon", 
        Size = UDim2.new(0, 416, 0, 416), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/AlertIcon.png", 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
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
        Name = "OkButton", 
        Position = UDim2.new(0, v8.RightAlign, 1, -166), 
        Size = UDim2.new(0, 320, 0, 66), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.BlueButtonColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_GlobalSettings_0.BlackTextColor, 
        Text = l_LocalizedStrings_0:LocalizedString("OkWord"), 
        Parent = v8.Container; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    l_Utility_0.ResizeButtonWithText(v13, v13, l_GlobalSettings_0.TextHorizontalPadding);
    v8.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("EnableCrossplayOverlayId"), 
            Title = v7.Title
        };
    end;
    v13.MouseButton1Click:connect(function()
        if v8:Close() then
            l_Callback_0();
        end;
    end);
    local l_Focus_0 = v8.Focus;
    v8.Focus = function(v16)
        l_Focus_0(v16);
        l_Utility_0.SetSelectedCoreObject(v13);
    end;
    v8.GetOverlaySound = function(_)
        return "OverlayOpen";
    end;
    return v8;
end;
