local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_Players_0 = game:GetService("Players");
local l_ProximityPromptService_0 = game:GetService("ProximityPromptService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v11 = require(l_RobloxGui_0.Modules.CaptureMaster);
local v12 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v13 = require(l_RobloxGui_0.Modules.Common.httpRequest)(l_HttpRbxApiService_0);
local l_PermissionsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol;
local v15 = require(l_CorePackages_0.Promise);
local v16 = game:DefineFastFlag("ScreenshotHudGuiVisibilityApiForScreenshotHud", false);
local v17 = game:DefineFastFlag("ScreenshotHudRemoveWatermark", false);
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
if require(l_RobloxGui_0.Modules.Flags.GetFFlagScreenshotHudApi)() then
    local l_ScreenshotHud_0 = l_GuiService_0:WaitForChild("ScreenshotHud");
    local v21 = {
        Default = {
            BackgroundColor3 = Color3.fromRGB(0, 180, 109), 
            BackgroundTransparency = 0
        }, 
        Hovered = {
            BackgroundColor3 = Color3.fromRGB(0, 232, 126), 
            BackgroundTransparency = 0
        }, 
        Pressed = {
            BackgroundColor3 = Color3.fromRGB(0, 232, 126), 
            BackgroundTransparency = 0.5
        }
    };
    local v22 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAllowUsernameOverlayInScreenshotHud);
    local v23 = nil;
    local v24 = nil;
    local v25 = {};
    local v26 = {};
    local v27 = nil;
    local v28 = false;
    local function v34(v29, v30)
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.BackgroundColor3 = Color3.new(1, 1, 1);
        l_Frame_0.BackgroundTransparency = 1;
        l_Frame_0.BorderSizePixel = 0;
        l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
        l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
        for v32, v33 in pairs(v29) do
            l_Frame_0[v32] = v33;
        end;
        l_Frame_0.Parent = v30;
        return l_Frame_0;
    end;
    local function v41(v35, v36, v37)
        local l_ImageLabel_0 = Instance.new("ImageLabel");
        l_ImageLabel_0.Image = v35;
        l_ImageLabel_0.BackgroundTransparency = 1;
        l_ImageLabel_0.BorderSizePixel = 0;
        l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
        l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
        for v39, v40 in pairs(v36) do
            l_ImageLabel_0[v39] = v40;
        end;
        l_ImageLabel_0.Parent = v37;
        return l_ImageLabel_0;
    end;
    local function v48(v42, v43, v44)
        local l_ImageButton_0 = Instance.new("ImageButton");
        l_ImageButton_0.Image = v42;
        l_ImageButton_0.BackgroundTransparency = 1;
        l_ImageButton_0.BorderSizePixel = 0;
        l_ImageButton_0.Position = UDim2.new(0, 0, 0, 0);
        l_ImageButton_0.Size = UDim2.new(1, 0, 1, 0);
        for v46, v47 in pairs(v43) do
            l_ImageButton_0[v46] = v47;
        end;
        l_ImageButton_0.Parent = v44;
        return l_ImageButton_0;
    end;
    local function v55(v49, v50, v51)
        local l_TextLabel_0 = Instance.new("TextLabel");
        l_TextLabel_0.Text = v49;
        l_TextLabel_0.BackgroundTransparency = 1;
        l_TextLabel_0.BorderSizePixel = 0;
        l_TextLabel_0.Font = l_AppFonts_0.default:getMedium();
        l_TextLabel_0.Position = UDim2.new(0, 0, 0, 0);
        l_TextLabel_0.Size = UDim2.new(1, 0, 1, 0);
        l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
        l_TextLabel_0.TextSize = 20;
        for v53, v54 in pairs(v50) do
            l_TextLabel_0[v53] = v54;
        end;
        l_TextLabel_0.Parent = v51;
        return l_TextLabel_0;
    end;
    local l_l_GuiService_0_GuiInset_0, v57 = l_GuiService_0:GetGuiInset();
    local v58 = v34({
        Name = "ScreenshotHudFrame", 
        Position = UDim2.new(0, -l_l_GuiService_0_GuiInset_0.X, 0, -l_l_GuiService_0_GuiInset_0.Y), 
        Size = UDim2.new(1, l_l_GuiService_0_GuiInset_0.X + v57.X, 1, l_l_GuiService_0_GuiInset_0.Y + v57.Y), 
        Visible = false
    }, l_RobloxGui_0);
    local v59 = v34({
        Name = "ScreenshotHudContent", 
        Position = UDim2.new(0, l_l_GuiService_0_GuiInset_0.X, 0, l_l_GuiService_0_GuiInset_0.Y), 
        Size = UDim2.new(1, -l_l_GuiService_0_GuiInset_0.X - v57.X, 1, -l_l_GuiService_0_GuiInset_0.Y - v57.Y), 
        Visible = false
    }, v58);
    local v60 = v48("", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        AutoButtonColor = false, 
        BackgroundColor3 = Color3.fromRGB(0, 180, 109), 
        BackgroundTransparency = 0.5, 
        Name = "CameraButton", 
        Position = UDim2.new(0.5, 0, 1, -50), 
        Size = UDim2.fromOffset(64, 64)
    }, nil);
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(0, 32);
    l_UICorner_0.Parent = v60;
    local v62 = v41("", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = v21.Default.BackgroundColor3, 
        BackgroundTransparency = v21.Default.BackgroundTransparency, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(52, 52)
    }, v60);
    local l_UICorner_1 = Instance.new("UICorner");
    l_UICorner_1.CornerRadius = UDim.new(0, 26);
    l_UICorner_1.Parent = v62;
    local v64 = v41("rbxasset://textures/ui/ScreenshotHud/Camera.png", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(32, 32)
    }, v62);
    local v65 = v48("", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = Color3.fromRGB(7, 7, 8), 
        BackgroundTransparency = 0, 
        Name = "CloseButton", 
        Position = UDim2.new(0.5, -66, 1, -50), 
        Size = UDim2.fromOffset(48, 48)
    }, nil);
    local l_UICorner_2 = Instance.new("UICorner");
    l_UICorner_2.CornerRadius = UDim.new(0, 24);
    l_UICorner_2.Parent = v65;
    local _ = v41("rbxasset://textures/ui/ScreenshotHud/Close.png", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(32, 32)
    }, v65);
    local v68 = v48("", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = Color3.fromRGB(0, 180, 109), 
        BackgroundTransparency = 0, 
        Name = "CameraButton", 
        Position = UDim2.new(1, -94, 1, -78), 
        Size = UDim2.fromOffset(140, 36)
    }, nil);
    local l_UICorner_3 = Instance.new("UICorner");
    l_UICorner_3.CornerRadius = UDim.new(0, 18);
    l_UICorner_3.Parent = v68;
    local _ = v41("rbxasset://textures/ui/Controls/xboxY.png", {
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0, 6, 0.5, 0), 
        Size = UDim2.fromOffset(24, 24)
    }, v68);
    local _ = v55(v12:FormatByKey("CoreScripts.ScreenshotHud.Action.TakePhoto"), {
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0, 30, 0.5, 0), 
        Size = UDim2.new(1, -36, 0, 20), 
        TextScaled = true, 
        TextWrapped = true
    }, v68);
    local v72 = v48("", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = Color3.fromRGB(7, 7, 8), 
        BackgroundTransparency = 0, 
        Name = "CloseButton", 
        Position = UDim2.new(1, -228, 1, -78), 
        Size = UDim2.fromOffset(104, 36)
    }, nil);
    local l_UICorner_4 = Instance.new("UICorner");
    l_UICorner_4.CornerRadius = UDim.new(0, 18);
    l_UICorner_4.Parent = v72;
    local _ = v41("rbxasset://textures/ui/Controls/xboxB.png", {
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0, 6, 0.5, 0), 
        Size = UDim2.fromOffset(24, 24)
    }, v72);
    local _ = v55(v12:FormatByKey("CoreScripts.ScreenshotHud.Action.Cancel"), {
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0, 30, 0.5, 0), 
        Size = UDim2.new(1, -36, 0, 20), 
        TextScaled = true, 
        TextWrapped = true
    }, v72);
    local v76 = v34({
        Name = "ScreenshotOverlay", 
        Position = UDim2.new(0, l_l_GuiService_0_GuiInset_0.X, 0, l_l_GuiService_0_GuiInset_0.Y), 
        Size = UDim2.new(1, -l_l_GuiService_0_GuiInset_0.X - v57.X, 1, -l_l_GuiService_0_GuiInset_0.Y - v57.Y), 
        ZIndex = 2
    }, v58);
    local v77 = if v17 then nil else v55(game.Name, {
        Font = l_ScreenshotHud_0.OverlayFont, 
        Name = "ExperienceName", 
        Position = UDim2.new(0, 24, 0, 24), 
        Size = UDim2.new(1, 0, 0, 48), 
        TextSize = 22, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextWrapped = true, 
        Visible = l_ScreenshotHud_0.ExperienceNameOverlayEnabled
    }, v76);
    local v78 = if v17 then nil else v55("@" .. l_Players_0.LocalPlayer.DisplayName, {
        AnchorPoint = Vector2.new(1, 1), 
        Font = l_ScreenshotHud_0.OverlayFont, 
        Name = "UserName", 
        Position = UDim2.new(1, -24, 1, -4), 
        Size = UDim2.new(1, -24, 0, 18), 
        TextSize = 18, 
        TextTransparency = 0.3, 
        TextXAlignment = Enum.TextXAlignment.Right, 
        Visible = l_ScreenshotHud_0.UsernameOverlayEnabled
    }, v76);
    local _ = if v17 then nil else v41("rbxasset://textures/ui/ScreenshotHud/RobloxLogo.png", {
        AnchorPoint = Vector2.new(1, 1), 
        Position = UDim2.new(1, -24, 1, -24), 
        Size = UDim2.fromOffset(103, 18)
    }, v76);
    local v80 = v34({
        Active = true, 
        BackgroundTransparency = 0.5, 
        Name = "FlashOverlay", 
        Visible = false, 
        ZIndex = 3
    }, v58);
    local function _()
        if not v17 then
            if game.GameId ~= 0 then
                l_GetGameNameAndDescription_0(v13, game.GameId):andThen(function(v81)
                    if v81.Name then
                        v77.Text = v81.Name;
                    end;
                end);
            end;
            return ;
        else
            return ;
        end;
    end;
    local function v84()
        return l_PermissionsProtocol_0.default:checkOrRequestPermissions({
            l_PermissionsProtocol_0.Permissions.WRITE_MEDIA_STORAGE
        }):andThen(function(v83)
            return not not (v83 == l_PermissionsProtocol_0.Status.AUTHORIZED) and v15.resolve() or v15.reject();
        end);
    end;
    local function v89()
        local l_Descendants_0 = l_Players_0.LocalPlayer.PlayerGui:GetDescendants();
        local v86 = {};
        for _, v88 in ipairs(l_Descendants_0) do
            if not (not v88:IsA("ScreenGui") or not v88.Enabled) then
                table.insert(v86, v88);
            end;
        end;
        return v86;
    end;
    local function v93()
        local v90 = {};
        for _, v92 in ipairs(Enum.CoreGuiType:GetEnumItems()) do
            if l_StarterGui_0:GetCoreGuiEnabled(v92) then
                table.insert(v90, v92);
            end;
        end;
        return v90;
    end;
    local function v94()
    end;
    local function v95()
        if l_UserInputService_0:GetPlatform() == Enum.Platform.Android then
            v84():andThen(v94, function()
                v11:ShowPermissionToast();
            end);
            return ;
        else
            v94();
            return ;
        end;
    end;
    v94 = function()
        v11:DismissNotification();
        if v27 then
            v27:Disconnect();
            v27 = nil;
        end;
        local v96 = false;
        local v97 = false;
        local v98 = nil;
        if not v16 or not game:GetEngineFeature("ScreenshotHudHideGuisApi") then
            v98 = v89();
            for _, v100 in ipairs(v98) do
                v100.Enabled = false;
            end;
        elseif l_ScreenshotHud_0.HidePlayerGuiForCaptures then
            v98 = v89();
            for _, v102 in ipairs(v98) do
                v102.Enabled = false;
            end;
            v97 = true;
        end;
        local v103 = nil;
        if not v16 or not game:GetEngineFeature("ScreenshotHudHideGuisApi") then
            v103 = v93();
            for _, v105 in ipairs(v103) do
                l_StarterGui_0:SetCoreGuiEnabled(v105, false);
            end;
        elseif l_ScreenshotHud_0.HideCoreGuiForCaptures then
            v103 = v93();
            for _, v107 in ipairs(v103) do
                l_StarterGui_0:SetCoreGuiEnabled(v107, false);
            end;
            v96 = true;
        end;
        local l_Enabled_0 = l_ProximityPromptService_0.Enabled;
        l_ProximityPromptService_0.Enabled = false;
        v59.Visible = false;
        wait(0.2);
        local v109 = {};
        for _, v111 in pairs(l_Players_0:GetPlayers()) do
            local v112 = v111.Character and v111.Character:WaitForChild("Humanoid");
            if v112 then
                v109[v112] = v112.DisplayDistanceType;
                v112.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
            end;
        end;
        l_CoreGui_0:TakeScreenshot();
        wait(0.2);
        v59.Visible = true;
        v80.Visible = true;
        wait(0.2);
        v80.Visible = false;
        if not v27 then
            v27 = v60.Activated:connect(v95);
        end;
        l_ProximityPromptService_0.Enabled = l_Enabled_0;
        for _, v114 in pairs(l_Players_0:GetPlayers()) do
            local v115 = v114.Character and v114.Character:WaitForChild("Humanoid");
            if not (not v115 or not v109[v115]) then
                v115.DisplayDistanceType = v109[v115];
            end;
        end;
        if not v16 or not game:GetEngineFeature("ScreenshotHudHideGuisApi") then
            for _, v117 in ipairs(v98) do
                v117.Enabled = true;
            end;
        elseif v97 then
            for _, v119 in ipairs(v98) do
                v119.Enabled = true;
            end;
        end;
        if not v16 or not game:GetEngineFeature("ScreenshotHudHideGuisApi") then
            for _, v121 in ipairs(v103) do
                l_StarterGui_0:SetCoreGuiEnabled(v121, true);
            end;
        elseif v96 then
            for _, v123 in ipairs(v103) do
                l_StarterGui_0:SetCoreGuiEnabled(v123, true);
            end;
        end;
        if l_ScreenshotHud_0.CloseWhenScreenshotTaken then
            l_ScreenshotHud_0.Visible = false;
        end;
        l_RbxAnalyticsService_0:SendEventDeferred("client", "screenshotHud", "TakeScreenshot", {
            pid = tostring(game.PlaceId)
        });
    end;
    local function _(v124)
        return v124.Name:match("^Gamepad*") ~= nil;
    end;
    local function v126()
        if v23 then
            v23.Parent = nil;
        end;
        if v24 then
            v24.Parent = nil;
        end;
        v23 = if not v28 then v60 else v68;
        v24 = if not v28 then v65 else v72;
        v23.Parent = v59;
        v24.Parent = v59;
        if l_ScreenshotHud_0.CameraButtonPosition ~= UDim2.fromOffset(0, 0) then
            v23.Position = l_ScreenshotHud_0.CameraButtonPosition;
        end;
        if l_ScreenshotHud_0.CloseButtonPosition ~= UDim2.fromOffset(0, 0) then
            v24.Position = l_ScreenshotHud_0.CloseButtonPosition;
        end;
    end;
    local function v130(v127)
        local _ = nil;
        local v129 = (v127 or l_UserInputService_0:GetLastInputType()).Name:match("^Gamepad*") ~= nil;
        if v28 ~= v129 then
            v28 = v129;
            v126();
        end;
    end;
    local function v140()
        table.insert(v25, (v60.InputBegan:Connect(function(v131)
            if v131.UserInputType == Enum.UserInputType.MouseMovement then
                v62.BackgroundColor3 = v21.Hovered.BackgroundColor3;
                v62.BackgroundTransparency = v21.Hovered.BackgroundTransparency;
                return ;
            else
                if not (v131.UserInputType ~= Enum.UserInputType.MouseButton1) or v131.UserInputType == Enum.UserInputType.Touch then
                    v62.BackgroundColor3 = v21.Pressed.BackgroundColor3;
                    v62.BackgroundTransparency = v21.Pressed.BackgroundTransparency;
                end;
                return ;
            end;
        end)));
        table.insert(v25, (v60.InputEnded:Connect(function()
            v62.BackgroundColor3 = v21.Default.BackgroundColor3;
            v62.BackgroundTransparency = v21.Default.BackgroundTransparency;
        end)));
        if v27 then
            v27:Disconnect();
            v27 = nil;
        end;
        v27 = v60.Activated:connect(v95);
        table.insert(v25, v27);
        table.insert(v25, (v65.Activated:connect(function()
            l_ScreenshotHud_0.Visible = false;
        end)));
        l_ContextActionService_0:BindAction("ScreenshotHudGamepadClose", function(_, v133, v134)
            if not (not (v133 == Enum.UserInputState.End) or not (v134.UserInputType.Name:match("^Gamepad*") ~= nil)) then
                l_ScreenshotHud_0.Visible = false;
            end;
        end, false, Enum.KeyCode.ButtonB);
        table.insert(v26, "ScreenshotHudGamepadClose");
        l_ContextActionService_0:BindAction("ScreenshotHudGamepadCamera", function(_, v136, v137)
            if not (not (v136 == Enum.UserInputState.End) or not (v137.UserInputType.Name:match("^Gamepad*") ~= nil)) then
                v95();
            end;
        end, false, Enum.KeyCode.ButtonY);
        table.insert(v26, "ScreenshotHudGamepadCamera");
        local _ = nil;
        local v139 = l_UserInputService_0:GetLastInputType().Name:match("^Gamepad*") ~= nil;
        if v28 ~= v139 then
            v28 = v139;
            v126();
        end;
        table.insert(v25, (l_UserInputService_0.LastInputTypeChanged:Connect(v130)));
    end;
    local function v145()
        for _, v142 in ipairs(v25) do
            v142:Disconnect();
            v142 = nil;
        end;
        v25 = {};
        for _, v144 in ipairs(v26) do
            l_ContextActionService_0:UnbindAction(v144);
        end;
        v26 = {};
    end;
    local function v147(v146)
        v58.Visible = l_ScreenshotHud_0.Visible;
        v145();
        if l_ScreenshotHud_0.Visible then
            v59.Visible = true;
            v80.Visible = false;
            v140();
            v11:Start();
        end;
        l_RbxAnalyticsService_0:SendEventDeferred("client", "screenshotHud", "ScreenshotHudEnabled", {
            pid = tostring(game.PlaceId), 
            enabled = v146
        });
    end;
    l_ScreenshotHud_0:GetPropertyChangedSignal("Visible"):Connect(function()
        v147(l_ScreenshotHud_0.Visible);
    end);
    if not v17 then
        l_ScreenshotHud_0:GetPropertyChangedSignal("OverlayFont"):Connect(function()
            v77.Font = l_ScreenshotHud_0.OverlayFont;
            v78.Font = l_ScreenshotHud_0.OverlayFont;
            l_RbxAnalyticsService_0:SendEventDeferred("client", "screenshotHud", "OverlayFont", {
                pid = tostring(game.PlaceId), 
                font = l_ScreenshotHud_0.OverlayFont.Name
            });
        end);
        l_ScreenshotHud_0:GetPropertyChangedSignal("ExperienceNameOverlayEnabled"):Connect(function()
            v77.Visible = l_ScreenshotHud_0.ExperienceNameOverlayEnabled;
            l_RbxAnalyticsService_0:SendEventDeferred("client", "screenshotHud", "ExperienceNameOverlayEnabled", {
                pid = tostring(game.PlaceId), 
                enabled = l_ScreenshotHud_0.ExperienceNameOverlayEnabled
            });
        end);
        l_ScreenshotHud_0:GetPropertyChangedSignal("UsernameOverlayEnabled"):Connect(function()
            local v148 = false;
            if not (not l_ScreenshotHud_0.UsernameOverlayEnabled or not v22()) then
                v148 = true;
            end;
            v78.Visible = v148;
            l_RbxAnalyticsService_0:SendEventDeferred("client", "screenshotHud", "UsernameOverlayEnabled", {
                pid = tostring(game.PlaceId), 
                enabled = v148
            });
        end);
    end;
    l_ScreenshotHud_0:GetPropertyChangedSignal("CameraButtonIcon"):Connect(function()
        v64.Image = l_ScreenshotHud_0.CameraButtonIcon or "rbxasset://textures/ui/ScreenshotHud/Camera.png";
        l_RbxAnalyticsService_0:SendEventDeferred("client", "screenshotHud", "CameraButtonIcon", {
            pid = tostring(game.PlaceId), 
            icon = l_ScreenshotHud_0.CameraButtonIcon
        });
    end);
    l_ScreenshotHud_0:GetPropertyChangedSignal("CameraButtonPosition"):Connect(function()
        v23.Position = l_ScreenshotHud_0.CameraButtonPosition;
        l_RbxAnalyticsService_0:SendEventDeferred("client", "screenshotHud", "CameraButtonPosition", {
            pid = tostring(game.PlaceId), 
            position = tostring(l_ScreenshotHud_0.CameraButtonPosition)
        });
    end);
    l_ScreenshotHud_0:GetPropertyChangedSignal("CloseButtonPosition"):Connect(function()
        v24.Position = l_ScreenshotHud_0.CloseButtonPosition;
        l_RbxAnalyticsService_0:SendEventDeferred("client", "screenshotHud", "CloseButtonPosition", {
            pid = tostring(game.PlaceId), 
            position = tostring(l_ScreenshotHud_0.CloseButtonPosition)
        });
    end);
    if (not v17 and not v17) and game.GameId ~= 0 then
        l_GetGameNameAndDescription_0(v13, game.GameId):andThen(function(v149)
            if v149.Name then
                v77.Text = v149.Name;
            end;
        end);
    end;
    v126();
    v147(l_ScreenshotHud_0.Visible);
    return ;
else
    return ;
end;
