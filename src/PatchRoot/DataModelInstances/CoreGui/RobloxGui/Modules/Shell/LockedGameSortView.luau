local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
return function()
    local v5 = {};
    local v6 = {};
    local v7 = l_Utility_0.Create("Frame")({
        Name = "LockedViewContainer", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BackgroundColor3 = l_GlobalSettings_0.ModalBackgroundColor, 
        BorderSizePixel = 0, 
        Selectable = true; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v8 = l_Utility_0.Create("TextLabel")({
        Name = "LockedTextLabel", 
        Size = UDim2.new(0.6, 0, 0.5, 0), 
        Position = UDim2.new(0.2, 0, 0.5, 8), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = l_LocalizedStrings_0:LocalizedString("UnlockGamesPhrase"), 
        TextWrapped = true, 
        Visible = false, 
        Parent = v7
    });
    local v9 = l_Utility_0.Create("ImageLabel")({
        Name = "LockLabel", 
        Size = UDim2.new(0, 116, 0, 140), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/LockIcon.png", 
        Visible = false, 
        Parent = v7, 
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.new(0.5, 0, 0.5, -20)
    });
    v7.SelectionGained:connect(function()
        l_Utility_0.PropertyTweener(v7, "BackgroundTransparency", 1, l_GlobalSettings_0.ModalBackgroundTransparency, 0, l_Utility_0.Linear, true, nil);
        v8.Visible = true;
        v9.Visible = true;
    end);
    v7.SelectionLost:connect(function()
        l_Utility_0.PropertyTweener(v7, "BackgroundTransparency", l_GlobalSettings_0.ModalBackgroundTransparency, 1, 0, l_Utility_0.Linear, true, nil);
        v8.Visible = false;
        v9.Visible = false;
    end);
    v5.SetParent = function(_, v11)
        v7.Parent = v11;
    end;
    v5.GetSelection = function(_)
        return v7;
    end;
    v5.CreateLockedIconOverlay = function(_, v14)
        table.insert(v6, (l_Utility_0.Create("Frame")({
            Name = "LockedOverlay", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = l_GlobalSettings_0.ModalBackgroundTransparency, 
            BackgroundColor3 = l_GlobalSettings_0.ModalBackgroundColor, 
            BorderSizePixel = 0, 
            Parent = v14
        })));
    end;
    v5.RemoveLockedIconOverlays = function(_)
        for v16 = 1, #v6 do
            v6[v16].Parent = nil;
        end;
    end;
    return v5;
end;
