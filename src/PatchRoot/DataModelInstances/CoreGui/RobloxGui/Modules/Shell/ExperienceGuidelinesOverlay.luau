local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = nil;
pcall(function()
    v2 = game:GetService("PlatformService");
end);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_BaseOverlay_0 = require(l_Shell_0:FindFirstChild("BaseOverlay"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local v10 = require(l_Shell_0.Flags.GetFStringExperienceGuidelinesUrl);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableLinkingProtocolOpenUrlForXbox");
return function(v12, v13, v14)
    local v15 = l_BaseOverlay_0();
    local v16 = v10();
    local l_ImageContainer_0 = v15.Container:FindFirstChild("ImageContainer");
    if l_ImageContainer_0 then
        l_ImageContainer_0:Destroy();
    end;
    local v18 = nil;
    local v19 = nil;
    if v14 then
        if v14 == 0 then
            v18 = v12;
            v19 = if not not v13 and #v13 > 0 then table.concat(v13, "\n") else l_LocalizedStrings_0:LocalizedString("SuitableForAllPhrase");
        elseif v14 > 0 then
            v18 = v12;
            v19 = "";
            v19 = table.concat(v13, "\n");
        end;
    else
        v18 = l_LocalizedStrings_0:LocalizedString("AgeGuidelinesPhrase");
        v19 = l_LocalizedStrings_0:LocalizedString("NotAvailableWord");
    end;
    local v20 = l_Utility_0.Create("Frame")({
        Name = "TitleAndDescriptionContainer", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 136), 
        BackgroundTransparency = 1, 
        Parent = v15.Container
    });
    local _ = l_Utility_0.Create("UIListLayout")({
        Name = "GuidelinesModalListLayout", 
        FillDirection = Enum.FillDirection.Vertical, 
        Padding = UDim.new(0, 36), 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Parent = v20
    });
    local _ = l_Utility_0.Create("TextLabel")({
        Name = "TitleText", 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.HeaderSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = l_LocalizedStrings_0:LocalizedString("AgeGuidelinesPhrase"), 
        TextXAlignment = Enum.TextXAlignment.Center, 
        LayoutOrder = 0, 
        Parent = v20
    });
    local _ = l_Utility_0.Create("TextLabel")({
        Name = "TitleText", 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.BoldFont, 
        FontSize = l_GlobalSettings_0.MediumFontSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = v18, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        LayoutOrder = 1, 
        Parent = v20
    });
    local _ = l_Utility_0.Create("TextLabel")({
        Name = "DescriptorText", 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.DescriptionSize, 
        TextColor3 = l_GlobalSettings_0.LightGreyTextColor, 
        Text = v19, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        LayoutOrder = 2, 
        Parent = v20
    });
    local v25 = l_Utility_0.Create("TextButton")({
        Name = "LearnMoreButton", 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.new(0.5, 0, 1, -166), 
        AnchorPoint = Vector2.new(0.5, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.BlueButtonColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_GlobalSettings_0.TextSelectedColor, 
        Text = l_LocalizedStrings_0:LocalizedString("LearnMorePhrase"), 
        Parent = v15.Container; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local _ = l_Utility_0.Create("UIPadding")({
        Name = "LearnMorePadding", 
        PaddingTop = UDim.new(0, 16), 
        PaddingBottom = UDim.new(0, 16), 
        PaddingLeft = UDim.new(0, 16), 
        PaddingRight = UDim.new(0, 16), 
        Parent = v25
    });
    v25.MouseButton1Click:connect(function()
        if not l_game_EngineFeature_0 then
            local l_status_0, l_result_0 = pcall(function()
                if v2 then
                    v2:LaunchPlatformUri(v16);
                end;
            end);
            if not l_status_0 then
                l_Utility_0.DebugLog(string.format("PlatformService:LaunchPlatformUri failed to launch uri: %s, for reason: %s", v16, l_result_0));
            end;
        else
            l_LinkingProtocol_0.default:openURL(v16):andThen(function(v29)
                if v29 == false then
                    l_Utility_0.DebugLog("LinkingProtocol:openURL failed.");
                end;
            end);
        end;
        v15:Close();
    end);
    local l_Focus_0 = v15.Focus;
    v15.Focus = function(_)
        l_Focus_0(v15);
        l_GuiService_0.SelectedCoreObject = v25;
    end;
    return v15;
end;
