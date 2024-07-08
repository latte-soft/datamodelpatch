local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_ThumbnailLoader_0 = require(l_Shell_0:FindFirstChild("ThumbnailLoader"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
return function(v7, v8)
    local v9 = {};
    local v10 = l_Utility_0.Create("ImageButton")({
        Name = v8, 
        Size = v7, 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundColor3 = l_GlobalSettings_0.WhiteTextColor, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        AutoButtonColor = false; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v11 = nil;
    v10.SelectionGained:connect(function()
        v11 = l_Utility_0.PropertyTweener(v10, "BackgroundTransparency", 1, l_GlobalSettings_0.AvatarBoxBackgroundSelectedTransparency, 0, l_Utility_0.EaseInOutQuad, true, nil);
    end);
    v10.SelectionLost:connect(function()
        if v11 then
            v11:Cancel();
            v11 = nil;
        end;
        v10.BackgroundTransparency = 1;
    end);
    local v12 = l_Utility_0.Create("Frame")({
        Name = "AvatarImageContainer", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 104, 0, 104), 
        Parent = v10; 
        l_AssetManager_0.CreateShadow(1)
    });
    local v13 = l_Utility_0.Create("ImageLabel")({
        Name = "AvatarImage", 
        Image = "", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.CharacterBackgroundColor, 
        ZIndex = 2, 
        Parent = v12
    });
    local v14 = l_Utility_0.Create("Frame")({
        Name = "ContentContainer", 
        Size = UDim2.new(1, -v12.Size.X.Offset - 12, 0, v12.Size.Y.Offset), 
        Position = UDim2.new(0, v12.Size.X.Offset + 12, 0, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    });
    local v15 = l_Utility_0.Create("Frame")({
        Name = "FriendDisplayContainer", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0, 0.5), 
        BackgroundTransparency = 1, 
        Parent = v14
    });
    local v16 = l_Utility_0.Create("TextLabel")({
        Name = "GamertagLabel", 
        Text = "", 
        Size = UDim2.new(1, 0, 0, 24), 
        Position = UDim2.new(0, 0, 0, 0), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        BackgroundTransparency = 1, 
        Parent = v15
    });
    local v17 = l_Utility_0.Create("Frame")({
        Name = "RobloxNameContainer", 
        Size = UDim2.new(1, 0, 0, 24), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Parent = v15
    });
    local v18 = l_Utility_0.Create("ImageLabel")({
        Name = "RobloxIcon", 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/RobloxIcon24.png", 
        Size = UDim2.new(0, 24, 0, 24), 
        Parent = v17
    });
    local v19 = l_Utility_0.Create("TextLabel")({
        Name = "RobloxNameLabel", 
        Text = "", 
        Size = UDim2.new(1, -v18.Size.X.Offset - 10, 1, 0), 
        Position = UDim2.new(0, v18.Size.X.Offset + 10, 0, -1), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        BackgroundTransparency = 1, 
        Parent = v17
    });
    local v20 = l_Utility_0.Create("Frame")({
        Name = "StatusContainer", 
        Size = UDim2.new(1, 0, 0, 20), 
        Position = UDim2.new(0, 0, 0, (v16.Position.Y.Offset + v16.Size.Y.Offset) - 11), 
        BackgroundTransparency = 1, 
        Parent = v15
    });
    local v21 = l_Utility_0.Create("ImageLabel")({
        Name = "PresenceStatusImage", 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/OnlineStatusIcon@1080.png", 
        Size = UDim2.new(0, 19, 0, 20), 
        Position = UDim2.new(0, v18.Size.X.Offset / 2 - 10, 0, 0), 
        Parent = v20
    });
    local v22 = l_Utility_0.Create("TextLabel")({
        Name = "PresenceLabel", 
        Text = "", 
        Size = UDim2.new(1, -v21.Position.X.Offset - v21.Size.X.Offset, 1, 0), 
        Position = UDim2.new(0, (v21.Position.X.Offset + v21.Size.X.Offset) + 12, 0, 0), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextColor3 = l_GlobalSettings_0.LightGreyTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.DescriptionSize, 
        BackgroundTransparency = 1, 
        Parent = v20
    });
    v14.Parent = v10;
    l_Utility_0.Create("Frame")({
        Name = "Break", 
        Size = UDim2.new(1, -v12.Size.X.Offset - 12, 0, 2), 
        Position = UDim2.new(0, v12.Size.X.Offset + 12, 1, -2), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.LineBreakColor, 
        Parent = v10
    });
    local v23 = l_Utility_0.Create("ImageLabel")({
        Name = "FailImage", 
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0.25, 0, 0.25, 0), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/DefaultProfileIcon.png", 
        ZIndex = 2
    });
    v9.GetContainer = function(_)
        return v10;
    end;
    local function _(v25)
        if not (v25 ~= nil) or v25 < 1 then
            v23.Parent = v13;
            return ;
        else
            spawn(function()
                if l_ThumbnailLoader_0:LoadAvatarThumbnailAsync(v13, v25, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100):LoadAsync(false, false) then
                    v23.Parent = nil;
                    return ;
                else
                    v23.Parent = v13;
                    return ;
                end;
            end);
            return ;
        end;
    end;
    local function _(v27, v28)
        v22.Text = v27 or "";
        v21.ImageColor3 = v28;
        v21.Visible = v27 ~= "";
    end;
    v9.SetDisplay = function(_, v31)
        local l_robloxuid_0 = v31.robloxuid;
        if not (l_robloxuid_0 ~= nil) or l_robloxuid_0 < 1 then
            v23.Parent = v13;
        else
            local l_l_robloxuid_0_0 = l_robloxuid_0 --[[ copy: 2 -> 7 ]];
            spawn(function()
                if l_ThumbnailLoader_0:LoadAvatarThumbnailAsync(v13, l_l_robloxuid_0_0, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100):LoadAsync(false, false) then
                    v23.Parent = nil;
                    return ;
                else
                    v23.Parent = v13;
                    return ;
                end;
            end);
        end;
        l_robloxuid_0 = v31.gamertag or "";
        local v34 = v31.robloxName or "";
        local v35 = 0;
        if l_robloxuid_0 ~= "" then
            v16.Text = l_robloxuid_0;
            v16.Position = UDim2.new(0, 0, 0, 0);
            v16.Visible = true;
            v35 = (v35 + v16.Size.Y.Offset) + 12;
        else
            v16.Text = "";
            v16.Visible = false;
        end;
        if v34 ~= "" then
            v19.Text = v34;
            v17.Position = UDim2.new(0, 0, 0, v35);
            v17.Visible = true;
            v35 = (v35 + v17.Size.Y.Offset) + 7;
        else
            v19.Text = "";
            v17.Visible = false;
        end;
        if v31.robloxStatus == "InGame" then
            local l_lastLocation_0 = v31.lastLocation;
            local l_GreenText_0 = l_GlobalSettings_0.Colors.GreenText;
            v22.Text = l_lastLocation_0 or "";
            v21.ImageColor3 = l_GreenText_0;
            v21.Visible = l_lastLocation_0 ~= "";
        elseif v31.robloxStatus == "InStudio" then
            local l_lastLocation_1 = v31.lastLocation;
            local l_OrangeText_0 = l_GlobalSettings_0.Colors.OrangeText;
            v22.Text = l_lastLocation_1 or "";
            v21.ImageColor3 = l_OrangeText_0;
            v21.Visible = l_lastLocation_1 ~= "";
        elseif v31.robloxStatus == "Online" then
            local l_BlueText_0 = l_GlobalSettings_0.Colors.BlueText;
            v22.Text = "Roblox";
            v21.ImageColor3 = l_BlueText_0;
            v21.Visible = true;
        elseif v31.xboxStatus and v31.xboxStatus == "Online" then
            local v41 = l_LocalizedStrings_0:LocalizedString("OnlineWord");
            local l_BlueText_1 = l_GlobalSettings_0.Colors.BlueText;
            v22.Text = v41 or "";
            v21.ImageColor3 = l_BlueText_1;
            v21.Visible = v41 ~= "";
        else
            local v43 = l_LocalizedStrings_0:LocalizedString("OfflineWord");
            local l_GreyText_0 = l_GlobalSettings_0.Colors.GreyText;
            v22.Text = v43 or "";
            v21.ImageColor3 = l_GreyText_0;
            v21.Visible = v43 ~= "";
        end;
        v20.Position = UDim2.new(0, 0, 0, v35);
        v15.Size = UDim2.new(1, 0, 0, v35 + v20.Size.Y.Offset);
    end;
    v9.Destroy = function(_)
        v10:Destroy();
        v9 = nil;
    end;
    return v9;
end;
