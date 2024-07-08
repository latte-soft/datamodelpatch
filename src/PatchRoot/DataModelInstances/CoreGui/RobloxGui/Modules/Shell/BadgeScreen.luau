local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_BadgeOverlay_0 = require(l_Shell_0:FindFirstChild("BadgeOverlay"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_ScrollingGrid_0 = require(l_Shell_0:FindFirstChild("ScrollingGrid"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_PopupText_0 = require(l_Shell_0:FindFirstChild("PopupText"));
local l_ThumbnailLoader_0 = require(l_Shell_0:FindFirstChild("ThumbnailLoader"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_BaseScreen_0 = require(l_Shell_0:FindFirstChild("BaseScreen"));
return function(v12)
    local v13 = l_BaseScreen_0();
    local l_Container_0 = v13.Container;
    v13:SetTitle(l_LocalizedStrings_0:LocalizedString("GameBadgesTitle"));
    local v15 = nil;
    local v16 = l_ScrollingGrid_0();
    v16:SetPosition(UDim2.new(0, 0, 0.21500000000000002, 0));
    v16:SetSize(UDim2.new(1, 0, 0, 570));
    v16:SetScrollDirection(v16.Enum.ScrollDirection.Horizontal);
    v16:SetParent(l_Container_0);
    v16:SetClipping(false);
    v16:SetCellSize(Vector2.new(276, 276));
    v16:SetSpacing(Vector2.new(18, 18));
    local v17 = l_Utility_0.Create("ImageLabel")({
        Name = "CheckMarkImage", 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/Checkmark@1080.png", 
        Size = UDim2.new(0, 35, 0, 35), 
        ZIndex = 2
    });
    local function _(v18, v19)
        v18.MouseButton1Click:connect(function()
            l_ScreenManager_0:OpenScreen(l_BadgeOverlay_0(v19), false);
        end);
    end;
    local v21 = l_Utility_0.Create("Frame")({
        Name = "BadgeContainer", 
        BackgroundTransparency = 1; 
        l_AssetManager_0.CreateShadow(0)
    });
    l_Utility_0.Create("TextButton")({
        Name = "BadgeImage", 
        BorderSizePixel = 0, 
        BackgroundTransparency = 0.2, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = Color3.new(0.25098039215686274, 0.3176470588235294, 0.36470588235294116), 
        Text = "", 
        ZIndex = 1, 
        Parent = v21; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local _ = l_Utility_0.Create("ImageLabel")({
        Name = "Thumb", 
        Size = UDim2.new(0, 228, 0, 228), 
        Position = UDim2.new(0.5, -114, 0.5, -114), 
        BackgroundTransparency = 1, 
        Image = "", 
        ZIndex = 2, 
        Parent = v21.BadgeImage
    });
    for v23 = 1, #v12 do
        local v24 = v12[v23];
        local v25 = v21:Clone();
        local l_Thumb_0 = v25.BadgeImage:FindFirstChild("Thumb");
        if l_Thumb_0 then
            local v27 = l_ThumbnailLoader_0:Create(l_Thumb_0, v24.AssetId, l_ThumbnailLoader_0.Sizes.Medium, l_ThumbnailLoader_0.AssetType.Icon);
            spawn(function()
                v27:LoadAsync();
            end);
        end;
        if v24.IsOwned then
            v25.BadgeImage.BackgroundColor3 = l_GlobalSettings_0.BadgeOwnedColor;
            v25.BadgeImage.BackgroundTransparency = 0;
            local v28 = v17:Clone();
            v28.Position = UDim2.new(1, -v28.Size.X.Offset - 8, 0, 8);
            v28.Parent = v25;
        end;
        v25.Name = tostring(v23);
        v16:AddItem(v25);
        v25.BadgeImage.MouseButton1Click:connect(function()
            l_ScreenManager_0:OpenScreen(l_BadgeOverlay_0(v24), false);
        end);
        l_PopupText_0(v25.BadgeImage, v24.Name);
        if not v15 then
            v15 = v25;
        end;
    end;
    v13.GetDefaultSelectionObject = function(_)
        return v15;
    end;
    return v13;
end;
