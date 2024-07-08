local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_GameplaySettingsData_0 = require(l_Shell_0:FindFirstChild("GameplaySettingsData"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local l_GuiService_0 = game:GetService("GuiService");
local v9 = nil;
pcall(function()
    v9 = game:GetService("PlatformService");
end);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableLinkingProtocolOpenUrlForXbox");
return function(v11)
    local v12 = {};
    local v13 = l_Utility_0.Create("Frame")({
        Name = "GameplaySettingsContainer", 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Selectable = true, 
        SelectionImageObject = l_Utility_0.Create("Frame")({
            BackgroundTransparency = 1
        })
    });
    local function v16(v14)
        if not l_game_EngineFeature_0 then
            if v9 then
                v9:LaunchPlatformUri(v14);
            end;
            return ;
        else
            l_LinkingProtocol_0.default:openURL(v14):andThen(function(v15)
                if v15 == false then
                    l_Utility_0.DebugLog("LinkingProtocol:openURL failed.");
                end;
            end);
            return ;
        end;
    end;
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    local function v24()
        l_Utility_0.Create("TextLabel")({
            Name = "CPPSettingsTitle", 
            TextXAlignment = "Left", 
            TextYAlignment = "Bottom", 
            Size = UDim2.new(0, 0, 0, 0), 
            Position = UDim2.new(0, 26, 0, 26), 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.SubHeaderSize, 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            Text = l_LocalizedStrings_0:LocalizedString("CrossPlatformGameplayPhrase"), 
            Parent = v13
        });
        v17 = l_Utility_0.Create("ImageButton")({
            Name = "EnabledStatusButton", 
            Position = UDim2.new(0, 26, 0, 46), 
            Size = UDim2.new(0, 520, 0, 75), 
            BackgroundTransparency = 1, 
            ImageTransparency = 0.25, 
            ImageColor3 = l_GlobalSettings_0.GreyButtonColor, 
            Image = l_GlobalSettings_0.RoundCornerButtonImage, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(16, 16, 16, 16), 
            ZIndex = 1, 
            Parent = v13; 
            l_SoundManager_0:CreateSound("MoveSelection")
        });
        local v20 = l_Utility_0.Create("TextLabel")({
            Name = "EnabledStatusText", 
            TextXAlignment = "Left", 
            TextYAlignment = "Center", 
            Size = UDim2.new(0, 0, 1, 0), 
            Position = UDim2.new(0, 72, 0, 0), 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.ButtonSize, 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            ZIndex = 2, 
            Text = l_LocalizedStrings_0:LocalizedString("LoadingWord"), 
            Parent = v17
        });
        local v21 = l_Utility_0.Create("ImageLabel")({
            Name = "EnabledStatusIcon", 
            Position = UDim2.new(0, 20, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(0, 32, 0, 32), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Shell/Icons/EnabledStatusIcon.png", 
            ImageColor3 = Color3.new(1, 1, 1), 
            ZIndex = 2, 
            Parent = v17
        });
        l_Utility_0.Create("ImageLabel")({
            Name = "EnabledStatusLinkIcon", 
            Position = UDim2.new(1, -20, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0, 32, 0, 32), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Shell/Icons/ExternalLink.png", 
            ImageColor3 = Color3.new(1, 1, 1), 
            ZIndex = 2, 
            Parent = v17
        });
        local v22 = l_Utility_0.Create("TextLabel")({
            Name = "DescriptionText", 
            Position = UDim2.new(0, 26, 0, 135), 
            Size = UDim2.new(0, 520, 0, 110), 
            Text = "", 
            TextXAlignment = "Center", 
            TextYAlignment = "Top", 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.BoldFont, 
            TextColor3 = l_GlobalSettings_0.GreyTextColor, 
            FontSize = l_GlobalSettings_0.SmallTitleSize, 
            TextWrapped = true, 
            Parent = v13
        });
        l_Utility_0.ResizeButtonWithDynamicText(v17, v20, {
            l_LocalizedStrings_0:LocalizedString("EnabledWord"), 
            l_LocalizedStrings_0:LocalizedString("DisabledWord"), 
            l_LocalizedStrings_0:LocalizedString("LoadingWord")
        }, l_GlobalSettings_0.TextHorizontalPadding + v20.Position.X.Offset / 2);
        v17.MouseButton1Click:connect(function()
            v16("ms-settings://CustomizePrivacyMultiplayer");
        end);
        v13.SelectionGained:connect(function()
            l_Utility_0.SetSelectedCoreObject(v17);
        end);
        return function(v23)
            if not v23 then
                v21.ImageColor3 = Color3.new(1, 1, 1);
                v20.Text = l_LocalizedStrings_0:LocalizedString("LoadingWord");
                v22.Text = "";
                return ;
            elseif not v23.CrossPlatform.CanJoinGame then
                v21.ImageColor3 = Color3.new(0.9, 0, 0);
                v20.Text = l_LocalizedStrings_0:LocalizedString("DisabledWord");
                v22.Text = l_LocalizedStrings_0:LocalizedString("CrossplayDisabledDescription");
                l_GameplaySettingsData_0.UpdateCrossplayEnabled(false);
                return ;
            else
                v21.ImageColor3 = Color3.new(0, 0.9, 0);
                v20.Text = l_LocalizedStrings_0:LocalizedString("EnabledWord");
                v22.Text = l_LocalizedStrings_0:LocalizedString("CrossplayEnabledDescription");
                l_GameplaySettingsData_0.UpdateCrossplayEnabled(true);
                return ;
            end;
        end;
    end;
    local function v41()
        local v25 = l_Utility_0.Create("TextLabel")({
            Name = "XboxAccountSettingsTitle", 
            TextXAlignment = "Left", 
            TextYAlignment = "Bottom", 
            Size = UDim2.new(0, 0, 0, 0), 
            Position = UDim2.new(0, 26, 0, 278), 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.SubHeaderSize, 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            Text = l_LocalizedStrings_0:LocalizedString("XboxAccountSettingsPhrase"), 
            Parent = v13
        });
        v18 = l_Utility_0.Create("ImageButton")({
            Name = "MultiplayerButton", 
            Size = UDim2.new(0, 520, 0, 75), 
            BackgroundTransparency = 1, 
            ImageTransparency = 0.25, 
            ImageColor3 = l_GlobalSettings_0.GreyButtonColor, 
            Image = l_GlobalSettings_0.RoundCornerButtonImage, 
            ScaleType = Enum.ScaleType.Slice, 
            Selectable = true, 
            SliceCenter = Rect.new(16, 16, 16, 16), 
            ZIndex = 1, 
            Parent = v13; 
            l_SoundManager_0:CreateSound("MoveSelection")
        });
        v18.Position = v25.Position + UDim2.new(0, 0, 0, v25.Size.Y.Offset + 20);
        v19 = v18:Clone();
        v19.Name = "SharedContentButton";
        v19.Parent = v13;
        v19.Position = v19.Position + UDim2.new(0, 0, 0, v18.Size.Y.Offset + 10);
        local v26 = false;
        local l_Selectable_0 = v18.Selectable;
        local v28 = false;
        local l_Selectable_1 = v19.Selectable;
        v18.MouseButton1Click:connect(function()
            if v26 then
                v16("ms-settings://CustomizePrivacyMultiplayer");
            end;
        end);
        v19.MouseButton1Click:connect(function()
            if v28 then
                v16("ms-settings://CustomizePrivacyGameContent");
            end;
        end);
        local v30 = l_Utility_0.Create("TextLabel")({
            Name = "MultiplayerText", 
            TextXAlignment = "Left", 
            TextYAlignment = "Center", 
            Size = UDim2.new(0, 0, 1, 0), 
            Position = UDim2.new(0, 72, 0, 0), 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.ButtonSize, 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            ZIndex = 2, 
            Parent = v18, 
            Text = l_LocalizedStrings_0:LocalizedString("MultiplayerWord") .. ": " .. l_LocalizedStrings_0:LocalizedString("LoadingWord")
        });
        local v31 = v30:Clone();
        v31.Name = "SharedContentText";
        v31.Parent = v19;
        v31.Text = l_LocalizedStrings_0:LocalizedString("SharedContentWord") .. ": " .. l_LocalizedStrings_0:LocalizedString("LoadingWord");
        local v32 = l_Utility_0.Create("ImageLabel")({
            Name = "MultiplayerIcon", 
            Position = UDim2.new(0, 20, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(0, 32, 0, 32), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Shell/Icons/EnabledStatusIcon.png", 
            ImageColor3 = Color3.new(1, 1, 1), 
            ZIndex = 2, 
            Parent = v18
        });
        local v33 = v32:Clone();
        v33.Name = "SharedContentIcon";
        v33.Parent = v19;
        local v34 = l_Utility_0.Create("ImageLabel")({
            Name = "MultiplayerLinkIcon", 
            Position = UDim2.new(1, -20, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0, 32, 0, 32), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Shell/Icons/ExternalLink.png", 
            ImageColor3 = Color3.new(1, 1, 1), 
            ZIndex = 2, 
            Parent = v18
        });
        local v35 = v34:Clone();
        v35.Name = "SharedContentLinkIcon";
        v35.Parent = v19;
        local v36 = l_Utility_0.Create("TextLabel")({
            Name = "DescriptionText", 
            Size = UDim2.new(0, 520, 0, 200), 
            Text = "", 
            TextXAlignment = "Center", 
            TextYAlignment = "Top", 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.BoldFont, 
            TextColor3 = l_GlobalSettings_0.GreyTextColor, 
            FontSize = l_GlobalSettings_0.SmallTitleSize, 
            TextWrapped = true, 
            Parent = v13
        });
        v36.Position = UDim2.new(0, 26, 0, (v19.Position.Y.Offset + v19.Size.Y.Offset) + 24);
        return function(v37)
            if not v37 then
                v33.ImageColor3 = Color3.new(1, 1, 1);
                v32.ImageColor3 = Color3.new(1, 1, 1);
                v31.Text = l_LocalizedStrings_0:LocalizedString("SharedContentWord") .. ": " .. l_LocalizedStrings_0:LocalizedString("LoadingWord");
                v30.Text = l_LocalizedStrings_0:LocalizedString("MultiplayerWord") .. ": " .. l_LocalizedStrings_0:LocalizedString("LoadingWord");
                v36.Text = "";
                v28 = false;
                v26 = false;
                l_Selectable_1 = true;
                l_Selectable_0 = true;
            else
                local l_Multiplayer_0 = v37.Multiplayer;
                local l_SharedContent_0 = v37.SharedContent;
                if not l_Multiplayer_0.Success or not l_SharedContent_0.Success then
                    v36.Text = l_LocalizedStrings_0:LocalizedString("PrivilegeErrorPhrase");
                elseif l_Multiplayer_0.PrivilegeCheckResult == "NoIssue" and l_SharedContent_0.PrivilegeCheckResult == "NoIssue" then
                    v36.Text = l_LocalizedStrings_0:LocalizedString("PrivilegeAllowedPhrase");
                elseif not (l_Multiplayer_0.PrivilegeCheckResult ~= "Banned") or l_SharedContent_0.PrivilegeCheckResult == "Banned" then
                    v36.Text = l_LocalizedStrings_0:LocalizedString("PrivilegeBannedPhrase");
                elseif not (l_Multiplayer_0.PrivilegeCheckResult ~= "PurchaseRequired") or l_SharedContent_0.PrivilegeCheckResult == "PurchaseRequired" then
                    v36.Text = l_LocalizedStrings_0:LocalizedString("PrivilegePurchaseRequiredPhrase");
                else
                    v36.Text = l_LocalizedStrings_0:LocalizedString("PrivilegeDeniedPhrase");
                end;
                v32.ImageColor3 = not not l_Multiplayer_0.CanJoinGame and Color3.new(0, 0.9, 0) or Color3.new(0.9, 0, 0);
                v33.ImageColor3 = not not l_SharedContent_0.CanJoinGame and Color3.new(0, 0.9, 0) or Color3.new(0.9, 0, 0);
                v30.Text = l_LocalizedStrings_0:LocalizedString("MultiplayerWord") .. ": " .. l_LocalizedStrings_0:LocalizedString(l_Multiplayer_0.LocalizedStringKey);
                v31.Text = l_LocalizedStrings_0:LocalizedString("SharedContentWord") .. ": " .. l_LocalizedStrings_0:LocalizedString(l_SharedContent_0.LocalizedStringKey);
                local v40 = true;
                if l_SharedContent_0.PrivilegeCheckResult ~= "NoIssue" then
                    v40 = true;
                    if l_SharedContent_0.PrivilegeCheckResult ~= "Banned" then
                        v40 = l_SharedContent_0.PrivilegeCheckResult == "PurchaseRequired";
                    end;
                end;
                v28 = not v40;
                v40 = true;
                if l_Multiplayer_0.PrivilegeCheckResult ~= "NoIssue" then
                    v40 = true;
                    if l_Multiplayer_0.PrivilegeCheckResult ~= "Banned" then
                        v40 = l_Multiplayer_0.PrivilegeCheckResult == "PurchaseRequired";
                    end;
                end;
                v26 = not v40;
                l_Selectable_1 = v28;
                l_Selectable_0 = v26;
            end;
            v35.Visible = v28;
            v34.Visible = v26;
            v19.Selectable = l_Selectable_1;
            v18.Selectable = l_Selectable_0;
            v19.ImageTransparency = not l_Selectable_1 and 1 or 0.25;
            v18.ImageTransparency = not l_Selectable_0 and 1 or 0.25;
            if not (not (not (l_GuiService_0.SelectedCoreObject ~= v19) or l_GuiService_0.SelectedCoreObject == v18) or l_GuiService_0.SelectedCoreObject.Selectable) then
                l_Utility_0.SetSelectedCoreObject(v13.EnabledStatusButton);
            end;
        end;
    end;
    local v42 = v24();
    local v43 = v41();
    local function v45(v44)
        v42(v44);
        v43(v44);
    end;
    local v46 = l_GameplaySettingsData_0.GetPrivilegeSettings();
    v42(v46);
    v43(v46);
    l_GameplaySettingsData_0.OnGetPrivilegeSettingsBegin:connect(v45);
    l_GameplaySettingsData_0.OnGetPrivilegeSettingsEnd:connect(v45);
    v12.SetParent = function(_, v48)
        v13.Parent = v48;
    end;
    v12.Focus = function(_)
        if v11 then
            if v11 == 113 then
                if not v18 or not v18.Selectable then
                    l_Utility_0.SetSelectedCoreObject(v17);
                    return ;
                else
                    l_Utility_0.SetSelectedCoreObject(v18);
                    return ;
                end;
            elseif v11 == 116 then
                if not v19 or not v19.Selectable then
                    l_Utility_0.SetSelectedCoreObject(v17);
                else
                    l_Utility_0.SetSelectedCoreObject(v19);
                    return ;
                end;
            end;
        end;
    end;
    v12.GetContainer = function(_)
        return v13;
    end;
    return v12;
end;
