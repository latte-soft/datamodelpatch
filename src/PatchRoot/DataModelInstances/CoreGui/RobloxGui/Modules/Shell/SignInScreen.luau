local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = nil;
pcall(function()
    v4 = game:GetService("ThirdPartyUserService");
end);
local l_TextService_0 = game:GetService("TextService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_LinkAccountScreen_0 = require(l_Shell_0:FindFirstChild("LinkAccountScreen"));
local l_SetAccountCredentialsScreen_0 = require(l_Shell_0:FindFirstChild("SetAccountCredentialsScreen"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_AppState_0 = require(l_Shell_0:FindFirstChild("AppState"));
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v18 = require(l_Shell_0.Flags.GetFFlagXboxAnalyticsTrackTTI);
return function()
    local v19 = {
        TransitionTweens = nil
    };
    local v20 = false;
    local v21 = nil;
    local l_GreyButtonColor_0 = l_GlobalSettings_0.GreyButtonColor;
    local l_GreySelectedButtonColor_0 = l_GlobalSettings_0.GreySelectedButtonColor;
    local l_WhiteTextColor_0 = l_GlobalSettings_0.WhiteTextColor;
    local l_TextSelectedColor_0 = l_GlobalSettings_0.TextSelectedColor;
    local v26 = string.format(l_LocalizedStrings_0:LocalizedString("PlayAsPhrase"), l_AppState_0.store:getState().XboxUser.gamertag);
    l_Utility_0.Create("Frame")({
        Name = "ModalOverlay", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = l_GlobalSettings_0.ModalBackgroundTransparency, 
        BackgroundColor3 = l_GlobalSettings_0.ModalBackgroundColor, 
        BorderSizePixel = 0, 
        ZIndex = 4
    });
    local v27 = l_Utility_0.Create("Frame")({
        Name = "SignInScreen", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Visible = false
    });
    local v28 = l_Utility_0.Create("ImageLabel")({
        Name = "RobloxLogo", 
        Size = UDim2.new(0, 594, 0, 199), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/ROBLOXSplashLogo.png", 
        Parent = v27, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    });
    v28.Image = "rbxasset://textures/ui/Shell/Icons/SplashLogo.png";
    v28.Size = UDim2.new(0, 594, 0, 209);
    local v29 = l_Utility_0.Create("ImageLabel")({
        Name = "BackImage", 
        Size = UDim2.new(0, 48, 0, 48), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/BackIcon@1080.png", 
        Parent = v27
    });
    l_Utility_0.Create("TextLabel")({
        Name = "BackText", 
        Size = UDim2.new(0, 0, 0, v29.Size.Y.Offset), 
        Position = UDim2.new(0, v29.Size.X.Offset + 8, 0, 0), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = l_LocalizedStrings_0:LocalizedString("BackWord"), 
        Parent = v27
    });
    local v30 = l_Utility_0.Create("Frame")({
        Name = "FadeInFrame", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Visible = false, 
        Parent = v27
    });
    local v31 = l_Utility_0.Create("Frame")({
        Name = "LinkAccountButtonContainer", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 200, 0, 64), 
        Position = UDim2.new(0.5, -100, 1, -204), 
        Parent = v30; 
        l_AssetManager_0.CreateShadow(1)
    });
    local v32 = l_Utility_0.Create("ImageButton")({
        Name = "LinkAccountButton", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ImageColor3 = l_GreyButtonColor_0, 
        Image = l_GlobalSettings_0.RoundCornerButtonImage, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(Vector2.new(4, 4), Vector2.new(28, 28)), 
        ZIndex = 2, 
        Parent = v31; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v33 = v31:Clone();
    v33.Name = "CreateAccountButtonContainer";
    local l_LinkAccountButton_0 = v33.LinkAccountButton;
    l_LinkAccountButton_0.Name = "CreateAccountButton";
    v33.Size = UDim2.new(0, 360, 0, 64);
    v33.Position = UDim2.new(0.5, -180, 1, (v31.Position.Y.Offset - 64) - 44);
    v33.Parent = v30;
    local v35 = l_Utility_0.Create("TextLabel")({
        Name = "LinkAccountText", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_WhiteTextColor_0, 
        Text = l_LocalizedStrings_0:LocalizedString("SignInPhrase"), 
        ZIndex = 2, 
        Parent = v32
    });
    l_Utility_0.ResizeButtonWithText(v31, v35, l_GlobalSettings_0.TextHorizontalPadding);
    v31.Position = UDim2.new(0.5, -v31.Size.X.Offset / 2, 1, v31.Position.Y.Offset);
    local v36 = v35:Clone();
    v36.Text = v26;
    v36.Parent = l_LinkAccountButton_0;
    v33.Size = UDim2.new(0, l_TextService_0:GetTextSize(v26, l_Utility_0.ConvertFontSizeEnumToInt(v36.FontSize), v36.Font, Vector2.new(0, 0)).X + 64, 0, v33.Size.Y.Offset);
    l_Utility_0.ResizeButtonWithText(v33, v36, l_GlobalSettings_0.TextHorizontalPadding);
    v33.Position = UDim2.new(0.5, -v33.Size.X.Offset / 2, 1, v33.Position.Y.Offset);
    l_LinkAccountButton_0.SelectionGained:connect(function()
        l_LinkAccountButton_0.ImageColor3 = l_GreySelectedButtonColor_0;
        v36.TextColor3 = l_TextSelectedColor_0;
    end);
    l_LinkAccountButton_0.SelectionLost:connect(function()
        l_LinkAccountButton_0.ImageColor3 = l_GreyButtonColor_0;
        v36.TextColor3 = l_WhiteTextColor_0;
    end);
    v32.SelectionGained:connect(function()
        v32.ImageColor3 = l_GreySelectedButtonColor_0;
        v35.TextColor3 = l_TextSelectedColor_0;
    end);
    v32.SelectionLost:connect(function()
        v32.ImageColor3 = l_GreyButtonColor_0;
        v35.TextColor3 = l_WhiteTextColor_0;
    end);
    local function _()
        l_ScreenManager_0:DefaultCancelFade(v19.TransitionTweens);
        v30.Visible = true;
        v19.TransitionTweens = l_ScreenManager_0:FadeInSitu(v30);
        if v20 then
            l_Utility_0.SetSelectedCoreObject(l_LinkAccountButton_0);
        end;
    end;
    l_LinkAccountButton_0.MouseButton1Click:connect(function()
        l_SoundManager_0:Play("ButtonPress");
        local v38 = l_SetAccountCredentialsScreen_0(l_LocalizedStrings_0:LocalizedString("SignUpTitle"), l_LocalizedStrings_0:LocalizedString("SignUpDescription"), l_LocalizedStrings_0:LocalizedString("SignUpWord"));
        v38:SetParent(v27.Parent);
        l_ScreenManager_0:OpenScreen(v38, true);
    end);
    v32.MouseButton1Click:connect(function()
        l_SoundManager_0:Play("ButtonPress");
        local v39 = l_LinkAccountScreen_0();
        v39:SetParent(v27.Parent);
        l_ScreenManager_0:OpenScreen(v39, true);
    end);
    v19.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("SignInScreenId")
        };
    end;
    v19.SetParent = function(_, v42)
        v21 = v42;
    end;
    v19.Show = function(_)
        v28.AnchorPoint = Vector2.new(0.5, 0.5);
        v28.Position = UDim2.new(0.5, 0, 0.5, 0);
        v27.Visible = true;
        v27.Parent = v21;
        l_ScreenManager_0:DefaultCancelFade(v19.TransitionTweens);
        v30.Visible = true;
        v19.TransitionTweens = l_ScreenManager_0:FadeInSitu(v30);
        if v20 then
            l_Utility_0.SetSelectedCoreObject(l_LinkAccountButton_0);
        end;
        if v18() then
            l_default_0:logEventOnce("landing_page_did_mount");
        end;
    end;
    v19.Hide = function(_)
        v27.Visible = false;
        v30.Visible = false;
    end;
    v19.Focus = function(_)
        v20 = true;
        l_GuiService_0:AddSelectionParent("SignInScreen", v30);
        l_Utility_0.SetSelectedCoreObject(l_LinkAccountButton_0);
        if v4 then
            l_ContextActionService_0:BindCoreAction("ReturnToEngagement", function(_, v47, _)
                if v47 == Enum.UserInputState.End then
                    v4:ReturnToEngagement();
                end;
            end, false, Enum.KeyCode.ButtonB);
        end;
    end;
    v19.RemoveFocus = function(_)
        v20 = false;
        l_GuiService_0:RemoveSelectionGroup("SignInScreen");
        l_Utility_0.SetSelectedCoreObject(nil);
        l_ContextActionService_0:UnbindCoreAction("ReturnToEngagement");
    end;
    return v19;
end;
