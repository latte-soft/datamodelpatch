local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_GuiService_0 = game:GetService("GuiService");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_BaseOverlay_0 = require(l_Shell_0:FindFirstChild("BaseOverlay"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
return function(v9)
    if v9 then
        local v10 = l_BaseOverlay_0();
        local l_Title_0 = v9.Title;
        local l_Msg_0 = v9.Msg;
        local l_Code_0 = v9.Code;
        local l_Id_0 = v9.Id;
        local v15 = l_Utility_0.Create("ImageLabel")({
            Name = "IconImage", 
            BackgroundTransparency = 1
        });
        v15.Image = not l_Id_0 and "rbxasset://textures/ui/Shell/Icons/ErrorIconLargeCopy@1080.png" or "rbxasset://textures/ui/Shell/Icons/AlertIcon.png";
        v15.Size = not not l_Id_0 and UDim2.new(0, 416, 0, 416) or UDim2.new(0, 321, 0, 264);
        v15.AnchorPoint = Vector2.new(0.5, 0.5);
        v15.Position = UDim2.new(0.5, 0, 0.5, 0);
        v10:SetImage(v15);
        local v16 = l_Utility_0.Create("TextLabel")({
            Name = "DescriptionText", 
            Size = UDim2.new(0, 762, 0, 304), 
            Position = UDim2.new(0, v10.RightAlign, 0, l_Utility_0.Create("TextLabel")({
                Name = "TitleText", 
                Size = UDim2.new(0, 0, 0, 0), 
                Position = UDim2.new(0, v10.RightAlign, 0, 136), 
                BackgroundTransparency = 1, 
                Font = l_GlobalSettings_0.RegularFont, 
                FontSize = l_GlobalSettings_0.HeaderSize, 
                TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
                Text = l_Title_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Parent = v10.Container
            }).Position.Y.Offset + 62), 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Font = l_GlobalSettings_0.LightFont, 
            FontSize = l_GlobalSettings_0.TitleSize, 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            TextWrapped = true, 
            Text = l_Msg_0, 
            Parent = v10.Container
        });
        if l_Code_0 then
            v16.Text = string.format(l_LocalizedStrings_0:LocalizedString("ErrorMessageAndCodePrase"), l_Msg_0, l_Code_0);
        end;
        local v17 = l_Utility_0.Create("TextButton")({
            Name = "OkButton", 
            Size = UDim2.new(0, 320, 0, 66), 
            Position = UDim2.new(0, v10.RightAlign, 1, -166), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_GlobalSettings_0.BlueButtonColor, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.ButtonSize, 
            TextColor3 = l_GlobalSettings_0.TextSelectedColor, 
            Text = l_LocalizedStrings_0:LocalizedString("OkWord"), 
            Parent = v10.Container; 
            l_SoundManager_0:CreateSound("MoveSelection")
        });
        local l_l_Code_0_0 = l_Code_0;
        if l_l_Code_0_0 then
            l_l_Code_0_0 = true;
            if l_Code_0 ~= 113 then
                l_l_Code_0_0 = l_Code_0 == 116;
            end;
        end;
        if l_l_Code_0_0 then
            v17.Text = l_LocalizedStrings_0:LocalizedString("GoToSettingsPhrase");
        end;
        l_Utility_0.ResizeButtonWithText(v17, v17, l_GlobalSettings_0.TextHorizontalPadding);
        v10.GetAnalyticsInfo = function(_)
            local v20 = {
                [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("ErrorOverlayId"), 
                Title = v9.Title
            };
            if l_Code_0 then
                v20.ErrorCode = l_Code_0;
            end;
            if l_Id_0 then
                v20.AlertId = l_Id_0;
            end;
            return v20;
        end;
        v10.GetPriority = function(_)
            return l_GlobalSettings_0.ElevatedPriority;
        end;
        v17.MouseButton1Click:connect(function()
            v10:Close();
            if l_l_Code_0_0 then
                l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenAccountSettingsScreen, l_Code_0);
            end;
        end);
        local l_Focus_0 = v10.Focus;
        v10.Focus = function(_)
            l_Focus_0(v10);
            l_GuiService_0.SelectedCoreObject = v17;
        end;
        v10.GetOverlaySound = function(_)
            return "Error";
        end;
        if l_Code_0 then
            l_Analytics_0.ReportCounter("Error-" .. tostring(l_Code_0), 1);
            l_Analytics_0.SetRBXEventStream("Error", {
                ErrorCode = l_Code_0
            });
        end;
        if l_Id_0 then
            l_Analytics_0.ReportCounter("Alert-" .. tostring(l_Id_0), 1);
            l_Analytics_0.SetRBXEventStream("Alert", {
                AlertId = l_Id_0
            });
        end;
        return v10;
    else
        return ;
    end;
end;
