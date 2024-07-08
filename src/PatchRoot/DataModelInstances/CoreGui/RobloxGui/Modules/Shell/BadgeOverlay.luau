local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_ScrollingTextBox_0 = require(l_Shell_0:FindFirstChild("ScrollingTextBox"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_BaseOverlay_0 = require(l_Shell_0:FindFirstChild("BaseOverlay"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
return function(v8)
    local v9 = l_BaseOverlay_0();
    local l_IsOwned_0 = v8.IsOwned;
    v9:SetImageBackgroundTransparency(0);
    v9:SetImageBackgroundColor(not not l_IsOwned_0 and l_GlobalSettings_0.BadgeOwnedColor or l_GlobalSettings_0.BadgeOverlayColor);
    local v11 = l_Utility_0.Create("ImageLabel")({
        Name = "BadgeImage", 
        Size = UDim2.new(0, 394, 0, 394), 
        BackgroundTransparency = 1, 
        Image = "http://www.roblox.com/Thumbs/Asset.ashx?width=" .. tostring(250) .. "&height=" .. tostring(250) .. "&assetId=" .. tostring(v8.AssetId)
    });
    v11.Position = UDim2.new(0.5, -197, 0.5, -197);
    v9:SetImage(v11);
    local v12 = l_Utility_0.Create("TextLabel")({
        Name = "TitleText", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0, v9.RightAlign, 0, 88), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.HeaderSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = v8.Name, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Parent = v9.Container
    });
    local v13 = nil;
    if l_IsOwned_0 then
        v13 = l_Utility_0.Create("Frame")({
            Name = "HasBadgeContainer", 
            Position = UDim2.new(0, v12.Position.X.Offset, 0, v12.Position.Y.Offset + 34), 
            BackgroundTransparency = 1, 
            Parent = v9.Container
        });
        local v14 = l_Utility_0.Create("ImageLabel")({
            Name = "HasBadgeImage", 
            BackgroundTransparency = 1, 
            Parent = v13, 
            Image = "rbxasset://textures/ui/Shell/Icons/Checkmark@1080.png", 
            Size = UDim2.new(0, 35, 0, 35)
        });
        v13.Size = UDim2.new(0, 200, 0, v14.Size.Y.Offset);
        local _ = l_Utility_0.Create("TextLabel")({
            Name = "HasBadgeText", 
            Size = UDim2.new(0, 0, 0, 0), 
            Position = UDim2.new(0, v14.Size.X.Offset + 12, 0.5, 0), 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.ItalicFont, 
            FontSize = l_GlobalSettings_0.DescriptionSize, 
            TextColor3 = l_GlobalSettings_0.GreenTextColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Text = l_LocalizedStrings_0:LocalizedString("HaveBadgeWord"), 
            Parent = v13
        });
    end;
    local v16 = l_ScrollingTextBox_0(UDim2.new(0, 762, 0, 304), UDim2.new(0, v12.Position.X.Offset, 0, not not v13 and (v13.Position.Y.Offset + v13.Size.Y.Offset) + 10 or v12.Position.Y.Offset + 40), v9.Container);
    v16:SetText(v8.Description);
    v16:SetFontSize(l_GlobalSettings_0.TitleSize);
    local _ = v16:GetContainer();
    local v18 = l_Utility_0.Create("TextButton")({
        Name = "OkButton", 
        Size = UDim2.new(0, 320, 0, 66), 
        Position = UDim2.new(0, v12.Position.X.Offset, 1, -121), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.BlueButtonColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_GlobalSettings_0.TextSelectedColor, 
        Text = l_LocalizedStrings_0:LocalizedString("OkWord"), 
        Parent = v9.Container; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    l_Utility_0.ResizeButtonWithText(v18, v18, l_GlobalSettings_0.TextHorizontalPadding);
    v18.MouseButton1Click:connect(function()
        v9:Close();
    end);
    local l_Focus_0 = v9.Focus;
    v9.Focus = function(_)
        l_Focus_0(v9);
        l_Utility_0.SetSelectedCoreObject(v18);
    end;
    v9.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("BadgeOverlayId"), 
            AssetId = v8.AssetId
        };
    end;
    return v9;
end;
