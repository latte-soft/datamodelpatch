local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_BaseScreen_0 = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
return function(v6)
    local v7 = l_BaseScreen_0(v6);
    local v8 = l_Utility_0.Create("TextLabel")({
        Name = "VersionBuildIdText", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Right, 
        TextYAlignment = Enum.TextYAlignment.Bottom, 
        Text = "", 
        Parent = v7.Container
    });
    local l_v6_VersionInfo_0 = v6:GetVersionInfo();
    v8.Text = string.format(l_LocalizedStrings_0:LocalizedString("VersionIdString"), tostring(l_v6_VersionInfo_0.Major), tostring(l_v6_VersionInfo_0.Minor), tostring(l_v6_VersionInfo_0.Build), (tostring(l_v6_VersionInfo_0.Revision)));
    l_v6_VersionInfo_0 = l_GlobalSettings_0.TextBoxDefaultTransparency;
    local l_TextBoxSelectedTransparency_0 = l_GlobalSettings_0.TextBoxSelectedTransparency;
    local v11 = l_Utility_0.Create("TextButton")({
        Name = "AccountButton", 
        Size = UDim2.new(0, 394, 0, 612), 
        Position = UDim2.new(0, 217, 0, 238), 
        BackgroundTransparency = l_v6_VersionInfo_0, 
        BackgroundColor3 = l_GlobalSettings_0.TextBoxColor, 
        BorderSizePixel = 0, 
        Text = "", 
        Parent = v7.Container; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    v7.AccountButton = v11;
    v7.Spacing = 40;
    local _ = l_Utility_0.Create("ImageLabel")({
        Name = "AccountIcon", 
        Size = UDim2.new(0, 256, 0, 256), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/AccountIcon.png", 
        Parent = v11, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    });
    local _ = l_Utility_0.Create("TextLabel")({
        Name = "AccountText", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0.5, 0, 1, -96), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = l_LocalizedStrings_0:LocalizedString("AccountWord"), 
        Parent = v11
    });
    v11.SelectionGained:connect(function()
        l_Utility_0.PropertyTweener(v11, "BackgroundTransparency", l_TextBoxSelectedTransparency_0, l_TextBoxSelectedTransparency_0, 0, l_Utility_0.EaseInOutQuad, true);
    end);
    v11.SelectionLost:connect(function()
        v11.BackgroundTransparency = l_v6_VersionInfo_0;
    end);
    v11.MouseButton1Click:connect(function()
        l_SoundManager_0:Play("ButtonPress");
        v6:OpenAccountScreen();
    end);
    v7.GetDefaultSelectionObject = function(_)
        return v11;
    end;
    return v7;
end;
