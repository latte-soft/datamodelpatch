local l_RobloxGui_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui");
local l_Shell_0 = l_RobloxGui_0:FindFirstChild("Modules"):FindFirstChild("Shell");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_LoadingWidget_0 = require(l_Shell_0:FindFirstChild("LoadingWidget"));
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_GuiService_0 = game:GetService("GuiService");
return {
    CreateScreenDivide = function()
        return l_Utility_0.Create("Frame")({
            Name = "ScreenDivide", 
            Size = UDim2.fromOffset(2, 610), 
            Position = UDim2.new(0, 822, 0.5, -305), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_GlobalSettings_0.PageDivideColor
        });
    end, 
    CreateModalOverlay = function()
        return l_Utility_0.Create("Frame")({
            Name = "ModalOverlay", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = l_GlobalSettings_0.ModalBackgroundTransparency, 
            BackgroundColor3 = l_GlobalSettings_0.ModalBackgroundColor, 
            BorderSizePixel = 0, 
            ZIndex = 4
        });
    end, 
    DoLoadingSpinner = function(v9, v10, v11)
        local v12 = l_LoadingWidget_0({
            Parent = v9
        }, v11);
        v10.Parent = l_RobloxGui_0;
        l_ContextActionService_0:BindCoreAction("BlockB", function()
        end, false, Enum.KeyCode.ButtonB);
        local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
        l_Utility_0.SetSelectedCoreObject(nil);
        v12:AwaitFinished();
        v12:Cleanup();
        v12 = nil;
        l_Utility_0.SetSelectedCoreObject(l_SelectedCoreObject_0);
        l_ContextActionService_0:UnbindCoreAction("BlockB");
        v10.Parent = nil;
    end, 
    CreateSlicedTextButton = function(v14, v15, v16)
        v14 = v14 or "";
        local v17 = l_Utility_0.Create("Frame")({
            Name = v14 .. "Container", 
            Position = v16 or UDim2.new(), 
            Size = UDim2.new(0, 376, 0, 64), 
            BackgroundTransparency = 1; 
            l_AssetManager_0.CreateShadow(1)
        });
        local v18 = l_Utility_0.Create("ImageButton")({
            Name = v14 .. "Button", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ImageColor3 = l_GlobalSettings_0.GreyButtonColor, 
            Image = l_GlobalSettings_0.RoundCornerButtonImage, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(Vector2.new(4, 4), Vector2.new(28, 28)), 
            ZIndex = 2, 
            Parent = v17; 
            l_SoundManager_0:CreateSound("MoveSelection")
        });
        local v19 = l_Utility_0.Create("TextLabel")({
            Name = v14 .. "Text", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.ButtonSize, 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            Text = v15, 
            ZIndex = 2, 
            Parent = v18
        });
        v18.SelectionGained:connect(function()
            v18.ImageColor3 = l_GlobalSettings_0.GreySelectedButtonColor;
            v19.TextColor3 = l_GlobalSettings_0.TextSelectedColor;
        end);
        v18.SelectionLost:connect(function()
            v18.ImageColor3 = l_GlobalSettings_0.GreyButtonColor;
            v19.TextColor3 = l_GlobalSettings_0.WhiteTextColor;
        end);
        return v17, v18, v19;
    end, 
    CreateSlicedTextOutlineButton = function(v20, v21, v22)
        v20 = v20 or "";
        local v23 = l_Utility_0.Create("Frame")({
            Name = v20 .. "Container", 
            Position = v22 or UDim2.new(), 
            Size = UDim2.new(0, 376, 0, 64), 
            BackgroundTransparency = 1
        });
        local v24 = l_Utility_0.Create("ImageButton")({
            Name = v20 .. "Button", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ImageColor3 = l_GlobalSettings_0.Colors.LightGreyText, 
            Image = l_GlobalSettings_0.RoundCornerButtonOutlineImage, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(Vector2.new(4, 4), Vector2.new(28, 28)), 
            ZIndex = 2, 
            Parent = v23; 
            l_SoundManager_0:CreateSound("MoveSelection")
        });
        local v25 = l_Utility_0.Create("TextLabel")({
            Name = v20 .. "Text", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.ButtonSize, 
            TextColor3 = l_GlobalSettings_0.Colors.LightGreyText, 
            Text = v21, 
            ZIndex = 2, 
            Parent = v24
        });
        v24.SelectionGained:connect(function()
            v25.TextColor3 = l_GlobalSettings_0.Colors.WhiteText;
        end);
        v24.SelectionLost:connect(function()
            v25.TextColor3 = l_GlobalSettings_0.Colors.LightGreyText;
        end);
        return v23, v24, v25;
    end
};
