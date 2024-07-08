local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_BaseScreen_0 = require(l_Shell_0:FindFirstChild("BaseScreen"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_TextBox_0 = require(l_Shell_0:FindFirstChild("TextBox"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_ScrollingTextBox_0 = require(l_Shell_0:FindFirstChild("ScrollingTextBox"));
local l_GuiUtilities_0 = require(l_Shell_0:FindFirstChild("GuiUtilities"));
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local v12 = nil;
pcall(function()
    v12 = game:GetService("PlatformService");
end);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableLinkingProtocolOpenUrlForXbox");
return function()
    local v14 = l_BaseScreen_0();
    local l_GreyButtonColor_0 = l_GlobalSettings_0.GreyButtonColor;
    local l_GreySelectedButtonColor_0 = l_GlobalSettings_0.GreySelectedButtonColor;
    local l_WhiteTextColor_0 = l_GlobalSettings_0.WhiteTextColor;
    local l_TextSelectedColor_0 = l_GlobalSettings_0.TextSelectedColor;
    local v19 = l_Utility_0.Create("Frame")({
        Name = "ScreenDivide", 
        Size = UDim2.new(0, 2, 0, 610), 
        Position = UDim2.new(0, 822, 0.5, -305), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.PageDivideColor, 
        Parent = v14.Container
    });
    local _ = l_Utility_0.Create("TextLabel")({
        Name = "TermsOfServiceText", 
        Size = UDim2.new(0, 740, 0, 128), 
        Position = UDim2.new(0, 16, 0, 835), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextWrapped = true, 
        Text = l_LocalizedStrings_0:LocalizedString("ToSInfoLinkPhrase"), 
        Parent = v14.Container
    });
    local v21 = l_TextBox_0(UDim2.new(0, 656, 0, 84));
    v21:SetPosition(UDim2.new(0, (v19.Position.X.Offset + v19.Size.X.Offset) + 86, 0, 334));
    v21:SetSpacing(Vector2.new(20, 0));
    v21:SetParent(v14.Container);
    v21:SetClipsDescendants(true);
    local l_v21_TextBox_0 = v21:GetTextBox();
    local l_v21_Container_0 = v21:GetContainer();
    v14.UsernameObject = v21;
    v14.UsernameTextBox = l_v21_TextBox_0;
    v14.UsernameSelection = l_v21_Container_0;
    local v24 = l_TextBox_0(UDim2.new(0, 656, 0, 84));
    v24:SetPosition(UDim2.new(0, (v19.Position.X.Offset + v19.Size.X.Offset) + 86, 0, 484));
    v24:SetSpacing(Vector2.new(20, 0));
    v24:SetParent(v14.Container);
    v24:SetClipsDescendants(true);
    local l_v24_TextBox_0 = v24:GetTextBox();
    local l_v24_Container_0 = v24:GetContainer();
    v14.PasswordObject = v24;
    v14.PasswordTextBox = l_v24_TextBox_0;
    v14.PasswordSelection = l_v24_Container_0;
    local function _(v27, v28, v29)
        v27 = v27 or "";
        local v30 = l_Utility_0.Create("Frame")({
            Name = v27 .. "Container", 
            Position = v29 or UDim2.new(), 
            Size = UDim2.new(0, 376, 0, 64), 
            BackgroundTransparency = 1, 
            Parent = v14.Container; 
            l_AssetManager_0.CreateShadow(1)
        });
        local v31 = l_Utility_0.Create("ImageButton")({
            Name = v27 .. "Button", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ImageColor3 = l_GreyButtonColor_0, 
            Image = l_GlobalSettings_0.RoundCornerButtonImage, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(Vector2.new(4, 4), Vector2.new(28, 28)), 
            ZIndex = 2, 
            Parent = v30; 
            l_SoundManager_0:CreateSound("MoveSelection")
        });
        local v32 = l_Utility_0.Create("TextLabel")({
            Name = v27 .. "Text", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.ButtonSize, 
            TextColor3 = l_WhiteTextColor_0, 
            Text = v28, 
            ZIndex = 2, 
            Parent = v31
        });
        v31.SelectionGained:connect(function()
            v31.ImageColor3 = l_GreySelectedButtonColor_0;
            v32.TextColor3 = l_TextSelectedColor_0;
        end);
        v31.SelectionLost:connect(function()
            v31.ImageColor3 = l_GreyButtonColor_0;
            v32.TextColor3 = l_WhiteTextColor_0;
        end);
        return v30, v31, v32;
    end;
    local function v38(v34)
        if not l_game_EngineFeature_0 then
            local l_status_0, l_result_0 = pcall(function()
                assert(not UserSettings().GameSettings:InStudioMode() or game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows, "Can't use in studio");
                v12:LaunchPlatformUri(v34);
            end);
            if not l_status_0 then
                l_Utility_0.DebugLog(string.format("PlatformService:LaunchPlatformUri failed to launch uri: %s, for reason: %s", v34, l_result_0));
            end;
            return ;
        else
            l_LinkingProtocol_0.default:openURL(v34):andThen(function(v37)
                if v37 == false then
                    l_Utility_0.DebugLog("LinkingProtocol:openURL failed.");
                end;
            end);
            return ;
        end;
    end;
    local v39, v40, v41 = l_GuiUtilities_0.CreateSlicedTextButton("SignIn", l_LocalizedStrings_0:LocalizedString("SignInPhrase"), UDim2.new(0, l_v24_Container_0.Position.X.Offset, 0, (l_v24_Container_0.Position.Y.Offset + l_v24_Container_0.Size.Y.Offset) + 66));
    v39.Size = UDim2.new(0, 656, 0, 64);
    v39.Parent = v14.Container;
    v14.SignInButton = v40;
    local v42 = l_Utility_0.Create("TextButton")({
        Name = "ToSButton", 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, v39.Position.X.Offset, 0, (v39.Position.Y.Offset + v39.Size.Y.Offset) + 251), 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = l_LocalizedStrings_0:LocalizedString("ViewTermsPhrase"), 
        Parent = v14.Container
    });
    l_Utility_0.Create("UIPadding")({
        Name = "ToSButtonPadding", 
        PaddingTop = UDim.new(0, 16), 
        PaddingBottom = UDim.new(0, 16), 
        PaddingLeft = UDim.new(0, 16), 
        PaddingRight = UDim.new(0, 16), 
        Parent = v42
    });
    local v43 = tick() - 1;
    v42.MouseButton1Click:connect(function()
        if tick() - v43 < 1 then
            return ;
        else
            v43 = tick();
            v38("https://en.help.roblox.com/hc/en-us/articles/205358110");
            return ;
        end;
    end);
    local v44 = l_ScrollingTextBox_0(UDim2.new(0, 740, 0, 460), UDim2.new(0, 16, 0, 334), v14.Container);
    v44:SetFont(l_GlobalSettings_0.RegularFont);
    v44:SetFontSize(l_GlobalSettings_0.TitleSize);
    v44.OnSelectableChanged:connect(function(v45)
        local l_v44_SelectableObject_0 = v44:GetSelectableObject();
        if v45 == true then
            l_v44_SelectableObject_0.NextSelectionRight = v40;
            l_v44_SelectableObject_0.NextSelectionLeft = l_v44_SelectableObject_0;
            l_v44_SelectableObject_0.NextSelectionUp = l_v44_SelectableObject_0;
            l_v44_SelectableObject_0.NextSelectionDown = l_v44_SelectableObject_0;
            return ;
        else
            l_v44_SelectableObject_0.NextSelectionRight = nil;
            l_v44_SelectableObject_0.NextSelectionLeft = nil;
            l_v44_SelectableObject_0.NextSelectionUp = nil;
            l_v44_SelectableObject_0.NextSelectionDown = nil;
            return ;
        end;
    end);
    v14.GetDefaultSelectionObject = function(_)
        return l_v21_Container_0;
    end;
    v14.SetDescriptionText = function(_, v49)
        v44:SetText(v49);
    end;
    v14.SetButtonText = function(_, v51)
        v41.Text = v51;
    end;
    return v14;
end;
