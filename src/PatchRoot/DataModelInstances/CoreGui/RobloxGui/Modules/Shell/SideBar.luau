local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
return function()
    local v8 = {};
    local v9 = {};
    local v10 = nil;
    local v11 = false;
    local v12 = l_Utility_0.Create("Frame")({
        Name = "ModalOverlay", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BackgroundColor3 = l_GlobalSettings_0.ModalBackgroundColor, 
        BorderSizePixel = 0, 
        ZIndex = 4
    });
    local v13 = l_Utility_0.Create("Frame")({
        Name = "SideBarContainer", 
        Size = UDim2.new(0.3, 0, 1, 0), 
        Position = UDim2.new(1, 0, 0, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.OverlayColor, 
        ZIndex = 5, 
        Parent = v12
    });
    local v14 = l_Utility_0.Create("TextButton")({
        Name = "DummySelectionImage", 
        Size = UDim2.new(0, 0, 0, 0), 
        Visible = false; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v15 = l_Utility_0.Create("TextLabel")({
        Name = "Text", 
        Size = UDim2.new(1, -165, 1, -156), 
        Position = UDim2.new(0, 65, 0, 156), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ZIndex = 6, 
        Text = "", 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.DescriptionSize, 
        TextWrapped = true
    });
    local function v17()
        for v16 = 1, #v9 do
            v9[v16].Position = UDim2.new(0, 0, 0, 156 + 75 * (v16 - 1));
        end;
    end;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Name = "ClosedEvent";
    v8.Closed = l_BindableEvent_0.Event;
    v8.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("SideBarId")
        };
    end;
    v8.AddItem = function(_, v21, v22)
        local v23 = l_Utility_0.Create("TextButton")({
            Name = "SortButton", 
            Size = UDim2.new(1, 0, 0, 75), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_GlobalSettings_0.BlueButtonColor, 
            BackgroundTransparency = 1, 
            ZIndex = 6, 
            Text = "", 
            SelectionImageObject = v14, 
            Parent = v13; 
            l_SoundManager_0:CreateSound("MoveSelection")
        });
        local v24 = l_Utility_0.Create("TextLabel")({
            Name = "SortName", 
            Size = UDim2.new(1, -65, 1, 0), 
            Position = UDim2.new(0, 65, 0, 0), 
            BackgroundTransparency = 1, 
            Text = v21, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.MediumFontSize, 
            ZIndex = 7, 
            Parent = v23
        });
        v23.MouseButton1Click:connect(function()
            l_SoundManager_0:Play("ButtonPress");
            l_ScreenManager_0:CloseCurrent(v8);
            l_BindableEvent_0:Fire();
            v22();
        end);
        v23.SelectionGained:connect(function()
            v23.BackgroundTransparency = 0;
            v24.TextColor3 = l_GlobalSettings_0.TextSelectedColor;
        end);
        v23.SelectionLost:connect(function()
            v23.BackgroundTransparency = 1;
            v24.TextColor3 = l_GlobalSettings_0.WhiteTextColor;
        end);
        v9[#v9 + 1] = v23;
        v17();
    end;
    v8.SetText = function(_, v26)
        v15.Text = v26;
        v15.Parent = v13;
    end;
    v8.ResetText = function(_)
        v15.Text = "";
        v15.Parent = nil;
    end;
    v8.RemoveAllItems = function(_)
        v8:ResetText();
        for v29, v30 in pairs(v9) do
            v30:Destroy();
            v9[v29] = nil;
        end;
    end;
    v8.SetSelectedObject = function(_, v32, v33)
        if #v9 > 0 then
            v10 = not not v32 and v9[v32] or v9[1];
            if not ((not (v33 == true) or not v10) or not v11) then
                l_GuiService_0.SelectedCoreObject = v10;
                return ;
            end;
        else
            v10 = nil;
        end;
    end;
    v8.GetPriority = function(_)
        return l_GlobalSettings_0.OverlayPriority;
    end;
    v8.Show = function(v35)
        v12.Parent = l_ScreenManager_0:GetScreenGuiByPriority(v35:GetPriority());
        local _ = l_Utility_0.PropertyTweener(v12, "BackgroundTransparency", 1, l_GlobalSettings_0.ModalBackgroundTransparency, 0.25, l_Utility_0.EaseInOutQuad, true, nil);
        v13:TweenPosition(UDim2.new(1 - v13.Size.X.Scale, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.25, true);
        l_SoundManager_0:Play("SideMenuSlideIn");
    end;
    v8.Hide = function(_)
        local _ = l_Utility_0.PropertyTweener(v12, "BackgroundTransparency", 0.3, 1, 0.25, l_Utility_0.EaseInOutQuad, true, function()
            v12.Parent = nil;
        end);
        v13:TweenPosition(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.25, true);
    end;
    v8.IsFocused = function(_)
        return v11;
    end;
    v8.Focus = function(v40)
        v11 = true;
        l_GuiService_0:AddSelectionParent("SideBar", v13);
        if not v10 then
            v40:SetSelectedObject(1);
            l_Utility_0.SetSelectedCoreObject(v10);
        else
            l_Utility_0.SetSelectedCoreObject(v10);
        end;
        l_ContextActionService_0:BindCoreAction("CloseSideBar", function(_, v42, _)
            if v42 == Enum.UserInputState.End then
                l_ScreenManager_0:CloseCurrent(v8);
                l_BindableEvent_0:Fire();
            end;
        end, false, Enum.KeyCode.ButtonB);
    end;
    v8.RemoveFocus = function(_)
        v11 = false;
        l_GuiService_0:RemoveSelectionGroup("SideBar");
        l_ContextActionService_0:UnbindCoreAction("CloseSideBar");
        v10 = nil;
    end;
    return v8;
end;
