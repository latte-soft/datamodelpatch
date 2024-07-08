local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_SettingsScreenBase_0 = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("SettingsScreenBase"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
return function(v6)
    local v7 = l_SettingsScreenBase_0(v6);
    local l_TextBoxDefaultTransparency_0 = l_GlobalSettings_0.TextBoxDefaultTransparency;
    local l_TextBoxSelectedTransparency_0 = l_GlobalSettings_0.TextBoxSelectedTransparency;
    local l_Spacing_0 = v7.Spacing;
    local v11 = l_Utility_0.Create("TextButton")({
        Name = "SwitchProfileButton", 
        Size = UDim2.new(0, 394, 0, 612), 
        Position = UDim2.new(0, (v7.AccountButton.Position.X.Offset + v7.AccountButton.Size.X.Offset) + l_Spacing_0, 0, 238), 
        BackgroundTransparency = l_TextBoxDefaultTransparency_0, 
        BackgroundColor3 = l_GlobalSettings_0.TextBoxColor, 
        BorderSizePixel = 0, 
        Text = "", 
        Parent = v7.Container; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v12 = v11:Clone();
    v12.Name = "OverscanButton";
    v12.Position = UDim2.new(0, (v11.Position.X.Offset + v11.Size.X.Offset) + l_Spacing_0, 0, 238);
    v12.Parent = v7.Container;
    local _ = l_Utility_0.Create("ImageLabel")({
        Name = "SwitchProfileIcon", 
        Size = UDim2.new(0, 224, 0, 255), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/ProfileIcon.png", 
        Parent = v11, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    });
    local v14 = l_Utility_0.Create("TextLabel")({
        Name = "SwitchProfileText", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0.5, 0, 1, -96), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = l_LocalizedStrings_0:LocalizedString("SwitchProfileWord"), 
        Parent = v11
    });
    local _ = l_Utility_0.Create("ImageLabel")({
        Name = "OverscanIcon", 
        Size = UDim2.new(0, 256, 0, 181), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/TVIcon.png", 
        Parent = v12, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    });
    local v16 = v14:Clone();
    v16.Name = "OverscanText";
    v16.Text = l_LocalizedStrings_0:LocalizedString("OverscanWord");
    v16.Parent = v12;
    v11.SelectionGained:connect(function()
        l_Utility_0.PropertyTweener(v11, "BackgroundTransparency", l_TextBoxSelectedTransparency_0, l_TextBoxSelectedTransparency_0, 0, l_Utility_0.EaseInOutQuad, true);
    end);
    v11.SelectionLost:connect(function()
        v11.BackgroundTransparency = l_TextBoxDefaultTransparency_0;
    end);
    v12.SelectionGained:connect(function()
        l_Utility_0.PropertyTweener(v12, "BackgroundTransparency", l_TextBoxSelectedTransparency_0, l_TextBoxSelectedTransparency_0, 0, l_Utility_0.EaseInOutQuad, true);
    end);
    v12.SelectionLost:connect(function()
        v12.BackgroundTransparency = l_TextBoxDefaultTransparency_0;
    end);
    local v17 = false;
    v11.MouseButton1Click:connect(function()
        l_SoundManager_0:Play("ButtonPress");
        if not v17 then
            v17 = true;
            v6:OpenSwitchProfileScreen();
            v17 = false;
            return ;
        else
            return ;
        end;
    end);
    local v18 = false;
    v12.MouseButton1Click:connect(function()
        l_SoundManager_0:Play("ButtonPress");
        if not v18 then
            v18 = true;
            v6:OpenOverscanScreen();
            v18 = false;
            return ;
        else
            return ;
        end;
    end);
    return v7;
end;
