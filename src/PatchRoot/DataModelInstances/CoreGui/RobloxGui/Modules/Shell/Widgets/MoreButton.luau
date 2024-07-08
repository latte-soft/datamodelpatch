local l_GuiService_0 = game:GetService("GuiService");
local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
return function()
    local v4 = l_Utility_0.Create("ImageLabel")({
        Name = "OverrideSelection", 
        Image = "rbxasset://textures/ui/SelectionBox.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(19, 19, 43, 43), 
        BackgroundTransparency = 1
    });
    local v5 = l_Utility_0.Create("ImageButton")({
        Name = "MoreButton", 
        BackgroundTransparency = 1, 
        Visible = false, 
        SelectionImageObject = v4, 
        Image = "rbxasset://textures/ui/Shell/Buttons/MoreButton@1080.png", 
        Size = UDim2.new(0, 108, 0, 50); 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local function _(v6)
        v5.Image = not v6 and "rbxasset://textures/ui/Shell/Buttons/MoreButton@1080.png" or "rbxasset://textures/ui/Shell/Buttons/MoreButtonSelected@1080.png";
        v5.Size = UDim2.new(0, 108, 0, 50);
    end;
    v5.SelectionGained:connect(function()
        v5.Image = "rbxasset://textures/ui/Shell/Buttons/MoreButtonSelected@1080.png";
        v5.Size = UDim2.new(0, 108, 0, 50);
    end);
    v5.SelectionLost:connect(function()
        v5.Image = "rbxasset://textures/ui/Shell/Buttons/MoreButton@1080.png";
        v5.Size = UDim2.new(0, 108, 0, 50);
    end);
    v5.Image = not (l_GuiService_0.SelectedCoreObject == v5) and "rbxasset://textures/ui/Shell/Buttons/MoreButton@1080.png" or "rbxasset://textures/ui/Shell/Buttons/MoreButtonSelected@1080.png";
    v5.Size = UDim2.new(0, 108, 0, 50);
    return v5, v4;
end;
