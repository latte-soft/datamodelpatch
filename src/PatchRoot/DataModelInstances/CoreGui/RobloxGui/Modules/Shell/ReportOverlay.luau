local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_BaseOverlay_0 = require(l_Shell_0:FindFirstChild("BaseOverlay"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_Http_0 = require(l_Shell_0:FindFirstChild("Http"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
return {
    ReportType = {
        REPORT_GAME = 0
    }, 
    CreateReportOverlay = function(_, _, v11, v12, v13, v14, v15)
        local v16 = l_BaseOverlay_0();
        local l_GreyButtonColor_0 = l_GlobalSettings_0.GreyButtonColor;
        local l_GreySelectedButtonColor_0 = l_GlobalSettings_0.GreySelectedButtonColor;
        local l_WhiteTextColor_0 = l_GlobalSettings_0.WhiteTextColor;
        local l_TextSelectedColor_0 = l_GlobalSettings_0.TextSelectedColor;
        local v21 = l_Utility_0.Create("Frame")({
            Name = "SubmitButtonContainer", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 320, 0, 66), 
            Position = UDim2.new(0, 776, 1, -166); 
            l_AssetManager_0.CreateShadow(1)
        });
        local v22 = l_Utility_0.Create("ImageButton")({
            Name = "SubmitButton", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ImageColor3 = l_GreyButtonColor_0, 
            Image = l_GlobalSettings_0.RoundCornerButtonImage, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(Vector2.new(4, 4), Vector2.new(28, 28)), 
            ZIndex = 2, 
            Parent = v21; 
            l_SoundManager_0:CreateSound("MoveSelection")
        });
        local v23 = l_Utility_0.Create("TextLabel")({
            Name = "SubmitText", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.ButtonSize, 
            TextColor3 = l_WhiteTextColor_0, 
            Text = l_LocalizedStrings_0:LocalizedString("SubmitWord"), 
            ZIndex = v22.ZIndex
        });
        l_Utility_0.ResizeButtonWithText(v21, v23, l_GlobalSettings_0.TextHorizontalPadding);
        local v24 = v21:Clone();
        local l_SubmitButton_0 = v24:FindFirstChild("SubmitButton");
        local v26 = v23:Clone();
        v24.Position = UDim2.new(l_SubmitButton_0.Position.X.Scale, (v21.Position.X.Offset + v21.Size.X.Offset) + 10, v24.Position.Y.Scale, v24.Position.Y.Offset);
        v26.Text = l_LocalizedStrings_0:LocalizedString("CancelWord");
        l_Utility_0.ResizeButtonWithText(v24, v26, l_GlobalSettings_0.TextHorizontalPadding);
        v23.Parent = v22;
        v21.Parent = v16.Container;
        v26.Parent = l_SubmitButton_0;
        v24.Parent = v16.Container;
        v22.SelectionGained:connect(function()
            v22.ImageColor3 = l_GreySelectedButtonColor_0;
            v23.TextColor3 = l_TextSelectedColor_0;
        end);
        v22.SelectionLost:connect(function()
            v22.ImageColor3 = l_GreyButtonColor_0;
            v23.TextColor3 = l_WhiteTextColor_0;
        end);
        l_SubmitButton_0.SelectionGained:connect(function()
            l_SubmitButton_0.ImageColor3 = l_GreySelectedButtonColor_0;
            v26.TextColor3 = l_TextSelectedColor_0;
        end);
        l_SubmitButton_0.SelectionLost:connect(function()
            l_SubmitButton_0.ImageColor3 = l_GreyButtonColor_0;
            v26.TextColor3 = l_WhiteTextColor_0;
        end);
        local v27 = l_Utility_0.Create("TextLabel")({
            Name = "TitleText", 
            Size = UDim2.new(0, 0, 0, 0), 
            Position = UDim2.new(0, v21.Position.X.Offset, 0, 136), 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.HeaderSize, 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            Text = l_LocalizedStrings_0:LocalizedString("ReportGameWord"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Parent = v16.Container
        });
        local _ = l_Utility_0.Create("TextLabel")({
            Name = "DescriptionText", 
            Size = UDim2.new(0, 762, 0, 304), 
            Position = UDim2.new(0, v27.Position.X.Offset, 0, v27.Position.Y.Offset + 62), 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Font = l_GlobalSettings_0.LightFont, 
            FontSize = l_GlobalSettings_0.TitleSize, 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            TextWrapped = true, 
            Text = l_LocalizedStrings_0:LocalizedString("ReportPhrase"), 
            Parent = v16.Container
        });
        v16:SetImage((l_Utility_0.Create("ImageLabel")({
            Name = "ReportIcon", 
            Position = UDim2.new(0, 226, 0, 204), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Shell/Icons/ErrorIconLargeCopy@1080.png", 
            Size = UDim2.new(0, 321, 0, 264)
        })));
        v22.MouseButton1Click:connect(function()
            if v16:Close() then
                spawn(function()
                    if not ((not v11 or not v12) or not v15) then
                        l_Http_0.ReportAbuseAsyncV2(tostring(v15), tostring(v11), tostring(v12), v13, v14, "xbox-app", "xbox-experience", "7", "Game reported from the Xbox App.");
                    end;
                end);
            end;
        end);
        l_SubmitButton_0.MouseButton1Click:connect(function()
            v16:Close();
        end);
        v16.GetAnalyticsInfo = function(_)
            local v30 = {
                [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("ReportOverlayId")
            };
            if v11 then
                v30.AssetId = v11;
            end;
            return v30;
        end;
        v16.GetPriority = function(_)
            return l_GlobalSettings_0.ElevatedPriority;
        end;
        local l_Focus_0 = v16.Focus;
        v16.Focus = function(_)
            l_Focus_0(v16);
            l_Utility_0.SetSelectedCoreObject(l_SubmitButton_0);
        end;
        return v16;
    end
};
