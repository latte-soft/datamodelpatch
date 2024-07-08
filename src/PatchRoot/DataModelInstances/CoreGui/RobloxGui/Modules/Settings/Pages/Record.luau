local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_TextService_0 = game:GetService("TextService");
local l_VRService_0 = game:GetService("VRService");
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums;
local l_EventNames_0 = require(l_CorePackages_0.Workspace.Packages.Screenshots).Analytics.EventNames;
local v9 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v10 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v11 = nil;
local l_status_0, l_result_0 = pcall(function()
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v14 = l_status_0 and l_result_0;
local v15 = game:DefineFastFlag("LogRecordActivations", false);
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
v11 = (function()
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    local v19 = false;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Name = "RecordingEvent";
    l_NewPage_0.RecordingChanged = l_BindableEvent_0.Event;
    l_NewPage_0.IsRecording = function(_)
        return v19;
    end;
    l_NewPage_0.TabHeader.Name = "RecordTab";
    if not v10.UIBloxThemeEnabled then
        l_NewPage_0.TabHeader.Icon.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/RecordTab.png";
        l_NewPage_0.TabHeader.Icon.AspectRatioConstraint.AspectRatio = 1.025;
        if not v14 then
            l_NewPage_0.TabHeader.Icon.Title.Text = "Record";
        else
            l_NewPage_0.TabHeader.Title.Text = "Record";
        end;
    else
        l_NewPage_0.TabHeader.TabLabel.Icon.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/RecordTab.png";
        l_NewPage_0.TabHeader.TabLabel.Title.Text = "Record";
    end;
    local function v22()
        l_NewPage_0.TabHeader.Visible = not l_VRService_0.VREnabled;
    end;
    l_NewPage_0.TabHeader.Visible = not l_VRService_0.VREnabled;
    l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v22);
    l_NewPage_0.Page.Name = "Record";
    local function v37(v23, v24, v25, v26, v27)
        local v28 = 10;
        local v29 = 0;
        local v30 = 10;
        local v31 = v10.textSize(24);
        local v32 = v10.font(Enum.Font.SourceSans);
        if v25 then
            v28 = 10;
            v29 = 0;
            v30 = 0;
            v31 = v10.textSize(36);
            v32 = v10.font(Enum.Font.SourceSansBold, "Bold");
        end;
        local v33 = v9:Create("Frame")({
            Name = v23 .. "Container", 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            LayoutOrder = v27, 
            Parent = v26
        });
        local v34 = v9:Create("TextLabel")({
            Name = v23, 
            BackgroundTransparency = 1, 
            Text = v24, 
            TextWrapped = true, 
            Font = v32, 
            TextSize = v31, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Position = UDim2.new(0, v28, 0, 0), 
            Size = UDim2.new(1, -(v28 + v29), 1, 0), 
            ZIndex = 2, 
            Parent = v33
        });
        local function v36(v35)
            if v35 == "AbsoluteSize" then
                v33.Size = UDim2.new(1, 0, 0, l_TextService_0:GetTextSize(v24, v34.TextSize, v34.Font, Vector2.new((v26.AbsoluteSize.X - v28) - v29, 10000)).Y + v30);
            end;
        end;
        v36("AbsoluteSize");
        v26.Changed:connect(v36);
        return v34, v33;
    end;
    l_NewPage_0.SetHub = function(_, v39)
        l_NewPage_0.HubRef = v39;
        local function v40()
            l_NewPage_0.HubRef:SetVisibility(false, true);
        end;
        local _ = v37("ScreenshotTitle", "Screenshot", true, l_NewPage_0.Page, 1);
        local _ = v37("ScreenshotBody", "By clicking the 'Take Screenshot' button, the menu will close and take a screenshot and save it to your computer.", false, l_NewPage_0.Page, 2);
        local l_l_NewPage_0_0 = l_NewPage_0;
        local l_l_NewPage_0_1 = l_NewPage_0;
        local v45, v46 = v9:AddButtonRow(l_NewPage_0, "ScreenshotButton", "Take Screenshot", UDim2.new(0, 300, 0, 44), v40);
        l_l_NewPage_0_0.ScreenshotButtonRow = v45;
        l_l_NewPage_0_1.ScreenshotButton = v46;
        l_NewPage_0.ScreenshotButtonRow.LayoutOrder = 3;
        l_l_NewPage_0_0 = v37("VideoTitle", "Video", true, l_NewPage_0.Page, 4);
        l_l_NewPage_0_1 = v37("VideoBody", "By clicking the 'Record Video' button, the menu will close and start recording your screen.", false, l_NewPage_0.Page, 5);
        v45, v46 = v9:AddButtonRow(l_NewPage_0, "RecordButton", "Record Video", UDim2.new(0, 300, 0, 44), v40);
        v45.LayoutOrder = 6;
        v46.MouseButton1Click:connect(function()
            if v15 then
                l_RbxAnalyticsService_0:SendEventDeferred("mobile", l_Contexts_0.Screenshots, l_EventTypes_0.ButtonClick, {
                    btn = if v19 then l_EventNames_0.CapturesLegacyVideoRecordDeactivated else l_EventNames_0.CapturesLegacyVideoRecordActivated
                });
            end;
            l_BindableEvent_0:Fire(not v19);
        end);
        local l_FirstChild_0 = settings():FindFirstChild("Game Options");
        if l_FirstChild_0 then
            l_FirstChild_0.VideoRecordingChangeRequest:connect(function(v48)
                v19 = v48;
                if not v48 then
                    v46.RecordButtonTextLabel.Text = "Record Video";
                    return ;
                else
                    v46.RecordButtonTextLabel.Text = "Stop Recording";
                    return ;
                end;
            end);
        end;
        v46.Activated:Connect(function()
            l_CoreGui_0:ToggleRecording();
        end);
        l_NewPage_0.ScreenshotButton.Activated:Connect(function()
            l_CoreGui_0:TakeScreenshot();
        end);
        l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 400);
    end;
    return l_NewPage_0;
end)();
v11.Displayed.Event:connect(function(v49)
    if v49 then
        l_GuiService_0.SelectedCoreObject = v11.ScreenshotButton;
    end;
end);
return v11;
