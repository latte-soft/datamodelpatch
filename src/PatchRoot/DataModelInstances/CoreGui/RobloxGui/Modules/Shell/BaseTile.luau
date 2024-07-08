local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_PopupText_0 = require(l_Shell_0:FindFirstChild("PopupText"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local v6 = Color3.new(0.17647058823529413, 0.3764705882352941, 0.5019607843137255);
local v7 = Color3.new(0.15294117647058825, 0.27058823529411763, 0.3215686274509804);
return function()
    local v8 = {
        focused = false, 
        active = false
    };
    local v9 = l_Utility_0.Create("ImageButton")({
        Name = "AvatarItemContainer", 
        Size = UDim2.new(0, 220, 0, 220), 
        BackgroundTransparency = 1, 
        ZIndex = 2; 
        l_AssetManager_0.CreateShadow(1), 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v10 = l_Utility_0.Create("Frame")({
        Name = "AvatarItemContents", 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = not not v8.active and v6 or v7, 
        ClipsDescendants = true, 
        ZIndex = 2, 
        Parent = v9; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v11 = l_PopupText_0(v9, "");
    v11:SetZIndex(3);
    local v12 = l_Utility_0.Create("ImageLabel")({
        Name = "AvatarImage", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        Parent = v10
    });
    local v13 = l_Utility_0.Create("ImageLabel")({
        Name = "EquippedCheckmark", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        ZIndex = 3, 
        Visible = false, 
        Image = "rbxasset://textures/ui/Shell/Icons/EquippedOverlay.png", 
        Parent = v10
    });
    v8.AvatarItemContainer = v9;
    v8.AvatarImage = v12;
    v8.EquippedCheckmark = v13;
    local function _(v14, v15)
        l_Utility_0.PropertyTweener(v12, "ImageColor3", v12.ImageColor3.r, v14, v15 or 0.2, function(...)
            local v16 = l_Utility_0.EaseOutQuad(...);
            return Color3.new(v16, v16, v16);
        end, true);
    end;
    v8.UpdateEquipButton = function(_)
    end;
    v8.ColorizeImage = function(_, ...)
        local v20, v21 = ...;
        l_Utility_0.PropertyTweener(v12, "ImageColor3", v12.ImageColor3.r, v20, v21 or 0.2, function(...)
            local v22 = l_Utility_0.EaseOutQuad(...);
            return Color3.new(v22, v22, v22);
        end, true);
    end;
    v8.SetPopupText = function(_, v24)
        v11:SetText(v24);
    end;
    v8.SetImage = function(_, v26)
        v12.Image = v26;
    end;
    v8.GetGuiObject = function(_)
        return v9;
    end;
    v8.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("BaseTileId")
        };
    end;
    v8.GetPackageInfo = function(_)
    end;
    v8.OnClick = function(_)
    end;
    v8.SetActive = function(v31, v32)
        v31.active = v32;
        v10.BackgroundColor3 = not not v31.active and v6 or v7;
    end;
    v8.Select = function(_)
    end;
    v8.Show = function(_)
    end;
    v8.Hide = function(_)
    end;
    v8.Focus = function(v36)
        v36.focused = true;
    end;
    v8.RemoveFocus = function(v37)
        v37.focused = false;
    end;
    return v8;
end;
