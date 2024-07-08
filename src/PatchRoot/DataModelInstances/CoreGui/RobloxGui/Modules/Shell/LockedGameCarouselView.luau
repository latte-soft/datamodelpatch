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
        BackgroundTransparency = 0.2, 
        BackgroundColor3 = Color3.new(0.1, 0.1, 0.1), 
        BorderSizePixel = 0, 
        Selectable = false; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local _ = l_Utility_0.Create("TextLabel")({
        Name = "LockedTextLabel", 
        Size = UDim2.new(0.7, 0, 0.5, 0), 
        Position = UDim2.new(0.125, 0, 0.25, 0), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = l_LocalizedStrings_0:LocalizedString("UnlockGamesPhrase"), 
        TextWrapped = true, 
        Parent = v7
    });
    local _ = l_Utility_0.Create("ImageLabel")({
        Name = "LockLabel", 
        Position = UDim2.new(0, 50, 0.5, -70), 
        Size = UDim2.new(0, 116, 0, 140), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/LockIcon.png", 
        Parent = v7
    });
    v5.SetParent = function(_, v11)
        v7.Parent = v11;
    end;
    v5.SetSize = function(_, v13)
        v7.Size = v13;
    end;
    v5.SetPosition = function(_, v15)
        v7.Position = v15;
    end;
    v5.GetContainer = function(_)
        return v7;
    end;
    v5.SetSelectionImageObject = function(_, v18)
        v7.SelectionImageObject = v18;
    end;
    local function _(v19, v20, v21)
        pcall(function(v22, v23, v24)
            v22[v23] = v24;
        end, v19, v20, v21);
    end;
    local function v26(v27, v28)
        if v27:IsA("GuiObject") then
            pcall(function(v29, v30, v31)
                v29[v30] = v31;
            end, v27, "ZIndex", v28);
            local l_v27_Children_0 = v27:GetChildren();
            for v33 = 1, #l_v27_Children_0 do
                local v34 = l_v27_Children_0[v33];
                if v34:IsA("GuiObject") then
                    v26(v34, v28);
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    v5.SetZIndex = function(_, v36)
        v26(v7, v36);
    end;
    v5.GetSelection = function(_)
        return v7;
    end;
    v5.CreateLockedIconOverlay = function(_, v39)
        table.insert(v6, (l_Utility_0.Create("Frame")({
            Name = "LockedOverlay", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = l_GlobalSettings_0.ModalBackgroundTransparency, 
            BackgroundColor3 = l_GlobalSettings_0.ModalBackgroundColor, 
            BorderSizePixel = 0, 
            Parent = v39
        })));
    end;
    v5.RemoveLockedIconOverlays = function(_)
        for v41 = 1, #v6 do
            v6[v41].Parent = nil;
        end;
    end;
    return v5;
end;
