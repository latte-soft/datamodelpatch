local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_BadgeOverlay_0 = require(l_Shell_0:FindFirstChild("BadgeOverlay"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_PopupText_0 = require(l_Shell_0:FindFirstChild("PopupText"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_ThumbnailLoader_0 = require(l_Shell_0:FindFirstChild("ThumbnailLoader"));
return function(v10, v11, v12, v13)
    local v14 = {};
    local v15 = nil;
    local v16 = (v11.Y.Offset - 14) / 2;
    local v17 = {};
    local v18 = l_Utility_0.Create("Frame")({
        Name = "ImageContainer", 
        Size = v11, 
        Position = v12, 
        BackgroundTransparency = 1, 
        Parent = v13
    });
    local v19 = 1;
    for v20 = 1, 2 do
        for v21 = 1, 2 do
            local v22 = l_Utility_0.Create("Frame")({
                Name = tostring(v19), 
                Size = UDim2.new(0, v16, 0, v16), 
                Position = UDim2.new(0, (v20 - 1) * v16 + (v20 - 1) * 14, 0, (v21 - 1) * v16 + (v21 - 1) * 14), 
                BackgroundTransparency = 1, 
                Parent = v18; 
                l_AssetManager_0.CreateShadow(1)
            });
            l_Utility_0.Create("ImageLabel")({
                Name = "Thumb", 
                Size = UDim2.new(0, 228, 0, 228), 
                Position = UDim2.new(0.5, -114, 0.5, -114), 
                BackgroundTransparency = 1, 
                Image = "", 
                ZIndex = 1, 
                Parent = l_Utility_0.Create("TextButton")({
                    Name = "Button", 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = l_GlobalSettings_0.FriendStatusTextTransparency, 
                    BackgroundColor3 = l_GlobalSettings_0.BadgeFrameColor, 
                    BorderSizePixel = 0, 
                    ZIndex = 2, 
                    Text = "", 
                    ClipsDescendants = true, 
                    Parent = v22; 
                    l_SoundManager_0:CreateSound("MoveSelection")
                })
            });
            v17[v19] = v22;
            v19 = v19 + 1;
        end;
    end;
    local v23 = l_Utility_0.Create("ImageButton")({
        Name = "MoreBadgesButton", 
        BackgroundTransparency = 1, 
        Visible = false, 
        Parent = v18, 
        Image = "rbxasset://textures/ui/Shell/Buttons/MoreButton@1080.png", 
        Size = UDim2.new(0, 108, 0, 50), 
        ZIndex = 2; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    v23.Position = UDim2.new(1, -v23.AbsoluteSize.x, 1, 12);
    local function _(v24)
        v23.Image = not v24 and "rbxasset://textures/ui/Shell/Buttons/MoreButton@1080.png" or "rbxasset://textures/ui/Shell/Buttons/MoreButtonSelected@1080.png";
    end;
    v23.SelectionGained:connect(function()
        v23.Image = "rbxasset://textures/ui/Shell/Buttons/MoreButtonSelected@1080.png";
    end);
    v23.SelectionLost:connect(function()
        v23.Image = "rbxasset://textures/ui/Shell/Buttons/MoreButton@1080.png";
    end);
    local v26 = l_Utility_0.Create("ImageLabel")({
        Name = "CheckMarkImage", 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/Checkmark@1080.png", 
        Size = UDim2.new(0, 35, 0, 35), 
        ZIndex = 2
    });
    local function v32()
        if v15 then
            for v27 = 1, #v17 do
                if v15[v27] then
                    local v28 = v15[v27];
                    local l_Thumb_0 = v17[v27].Button:FindFirstChild("Thumb");
                    if l_Thumb_0 then
                        local v30 = l_ThumbnailLoader_0:Create(l_Thumb_0, v28.AssetId, l_ThumbnailLoader_0.Sizes.Medium, l_ThumbnailLoader_0.AssetType.Icon);
                        spawn(function()
                            v30:LoadAsync();
                        end);
                    end;
                    if v28.IsOwned then
                        v17[v27].Button.BackgroundColor3 = l_GlobalSettings_0.BadgeOwnedColor;
                        v17[v27].Button.BackgroundTransparency = 0;
                        local v31 = v26:Clone();
                        v31.Position = UDim2.new(1, -v31.Size.X.Offset - 8, 0, 8);
                        v31.Parent = v17[v27];
                    end;
                    v17[v27].Button.MouseButton1Click:connect(function()
                        l_ScreenManager_0:OpenScreen(l_BadgeOverlay_0(v28), false);
                    end);
                    l_PopupText_0(v17[v27].Button, v28.Name);
                end;
            end;
            return ;
        else
            l_Utility_0.DebugLog("BadgeSort: failed to set badge data because data is nil.");
            return ;
        end;
    end;
    v23.MouseButton1Click:connect(function()
        l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenBadgeScreen, v15, v10);
    end);
    v14.GetContainer = function(_)
        return v18;
    end;
    v14.GetDefaultSelection = function(_)
        return not not v17 and v17[1].Button or nil;
    end;
    v14.Initialize = function(_, v36)
        if not v15 then
            v15 = v36;
            v32();
            if #v36 > 4 then
                v23.Visible = true;
            end;
        end;
    end;
    v14.Destroy = function(_)
        v18:Destroy();
        v17 = nil;
    end;
    return v14;
end;
