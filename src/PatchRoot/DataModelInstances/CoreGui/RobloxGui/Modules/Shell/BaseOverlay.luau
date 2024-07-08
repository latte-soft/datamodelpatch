local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local v9 = Vector2.new(0, 225);
return function()
    local v10 = {};
    local l_ModalBackgroundTransparency_0 = l_GlobalSettings_0.ModalBackgroundTransparency;
    v10.RightAlign = 776;
    local v12 = l_Utility_0.Create("Frame")({
        Name = "ModalOverlay", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BackgroundColor3 = Color3.new(), 
        BorderSizePixel = 0
    });
    local v13 = l_Utility_0.Create("Frame")({
        Name = "Container", 
        Size = UDim2.new(1, 0, 0.6388888888888888, 0), 
        Position = UDim2.new(v9.x / 1920, 0, v9.y / 1080, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.OverlayColor, 
        Parent = v12
    });
    local v14 = l_Utility_0.Create("Frame")({
        Name = "ImageContainer", 
        Size = UDim2.new(0, 576, 0, 642), 
        Position = UDim2.new(0, 100, 0.5, -321), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        BackgroundColor3 = Color3.new(), 
        ZIndex = 2, 
        Parent = v13
    });
    local v15 = l_AssetManager_0.CreateShadow(1);
    v15.ImageTransparency = 1;
    v15.Parent = v14;
    local v16 = l_Utility_0.Create("Frame")({
        Name = "ImageBackground", 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        BackgroundColor3 = Color3.new(), 
        Parent = v14
    });
    v10.Container = v13;
    v10.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("BaseOverlayId")
        };
    end;
    v10.SetImageBackgroundTransparency = function(_, v19)
        v16.BackgroundTransparency = v19;
        if v19 > 0 then
            v15.ImageTransparency = 1;
            return ;
        else
            v15.ImageTransparency = 0;
            return ;
        end;
    end;
    v10.SetImageBackgroundColor = function(_, v21)
        v16.BackgroundColor3 = v21;
    end;
    v10.SetImage = function(_, v23)
        v23.AnchorPoint = Vector2.new(0.5, 0.5);
        v23.Position = UDim2.new(0.5, 0, 0.5, 0);
        v23.ZIndex = v14.ZIndex;
        v23.Parent = v14;
    end;
    v10.GetOverlaySound = function(_)
        return "OverlayOpen";
    end;
    v10.GetPriority = function(_)
        return l_GlobalSettings_0.OverlayPriority;
    end;
    v10.Show = function(v26)
        v12.Parent = l_ScreenManager_0:GetScreenGuiByPriority(v26:GetPriority());
        local _ = l_Utility_0.PropertyTweener(v12, "BackgroundTransparency", 1, l_ModalBackgroundTransparency_0, 0.25, l_Utility_0.EaseInOutQuad, nil);
        l_SoundManager_0:Play(v26:GetOverlaySound());
        v12.Visible = true;
    end;
    v10.Hide = function(_)
        local _ = l_Utility_0.PropertyTweener(v12, "BackgroundTransparency", l_ModalBackgroundTransparency_0, 1, 0.25, l_Utility_0.EaseInOutQuad, true, function()
            v12:Destroy();
        end);
        v13.Parent = nil;
        v13:Destroy();
    end;
    v10.Focus = function(_)
        l_ContextActionService_0:BindCoreAction("CloseOverlay", function(_, v32, _)
            if v32 == Enum.UserInputState.End then
                l_ScreenManager_0:CloseCurrent(v10);
            end;
        end, false, Enum.KeyCode.ButtonB);
        l_GuiService_0:AddSelectionParent("Overlay", v13);
        v12.Visible = true;
    end;
    v10.RemoveFocus = function(_)
        l_ContextActionService_0:UnbindCoreAction("CloseOverlay");
        l_GuiService_0:RemoveSelectionGroup("Overlay");
        v12.Visible = false;
    end;
    v10.Close = function(v35)
        if l_ScreenManager_0:GetTopScreen() == v35 then
            l_SoundManager_0:Play("ButtonPress");
            l_ScreenManager_0:CloseCurrent(v10);
            return true;
        else
            return false;
        end;
    end;
    return v10;
end;
