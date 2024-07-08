local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = nil;
pcall(function()
    v3 = game:GetService("PlatformService");
end);
local v4 = nil;
pcall(function()
    v4 = game:GetService("ThirdPartyUserService");
end);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_TextService_0 = game:GetService("TextService");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local v8 = require(l_Shell_0.AppState);
local l_AccountManager_0 = require(l_Shell_0:FindFirstChild("AccountManager"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_SignInScreen_0 = require(l_Shell_0:FindFirstChild("SignInScreen"));
local l_LoadingWidget_0 = require(l_Shell_0:FindFirstChild("LoadingWidget"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v22 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_getFFlagDebugLuaAppAlwaysUseGamepad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagDebugLuaAppAlwaysUseGamepad;
local v24 = require(l_Shell_0.Flags.GetFFlagXboxAnalyticsTrackTTI);
local v25 = {
    [Enum.KeyCode.ButtonA] = true, 
    [Enum.KeyCode.ButtonX] = true
};
local v26 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true
};
if l_getFFlagDebugLuaAppAlwaysUseGamepad_0() then
    local v27 = v22.Config.DebugKeyboardBindings or {};
    local v28 = v27[Enum.KeyCode.ButtonA] or {};
    for _, v30 in v28, nil, nil do
        v25[v30] = true;
    end;
    v28 = v27[Enum.KeyCode.ButtonX] or {};
    for _, v32 in v28, nil, nil do
        v25[v32] = true;
    end;
    v26[Enum.UserInputType.Keyboard] = true;
end;
local v33 = {
    Unknown = -1, 
    Success = 0, 
    NoUser = 1
};
local v34 = {
    Unknown = -1, 
    Success = 0, 
    NoUser = 1
};
local function v37(v35, v36)
    if (not l_getFFlagDebugLuaAppAlwaysUseGamepad_0() or not v22.Config.DebugKeyboardBindings) or not table.find(v22.Config.DebugKeyboardBindings[v36] or {}, v35) then
        return v35 == v36;
    else
        return true;
    end;
end;
return function(v38)
    local v39 = {};
    local v40 = nil;
    local v41 = nil;
    local v42 = l_LocalizedStrings_0:LocalizedString("EngagementHint");
    local v43 = l_Utility_0.Create("Frame")({
        Name = "EngagementScreen", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Parent = v38
    });
    local v44 = l_Utility_0.Create("ImageLabel")({
        Name = "RobloxLogo", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 594, 0, 209), 
        Image = "rbxasset://textures/ui/Shell/Icons/SplashLogo.png", 
        Parent = v43, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    });
    local v45 = l_Utility_0.Create("Frame")({
        Name = "EngagementHintContainer", 
        Size = UDim2.new(0, 0, 0, 58), 
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 331), 
        BackgroundTransparency = 1, 
        Parent = v44
    });
    l_Utility_0.Create("UIListLayout")({
        Name = "EngagementHintListLayout", 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Parent = v45
    });
    local v46 = l_Utility_0.Create("TextLabel")({
        Name = "EngagementLeftText", 
        Size = UDim2.new(0, 0, 0, 58), 
        AnchorPoint = Vector2.new(0, 0.5), 
        BackgroundTransparency = 1, 
        Text = "", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        LayoutOrder = 0, 
        Parent = v45
    });
    local v47 = l_Utility_0.Create("TextLabel")({
        Name = "EngagementRightText", 
        Size = UDim2.new(0, 0, 0, 58), 
        AnchorPoint = Vector2.new(0, 0.5), 
        BackgroundTransparency = 1, 
        Text = "", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        LayoutOrder = 2, 
        Parent = v45
    });
    local v48 = l_Utility_0.Create("ImageLabel")({
        Name = "EngagementIndicator", 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0, 105, 0.5, 0), 
        Size = UDim2.new(0, 58, 0, 58), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/ButtonIcons/AButtonEngagementScreen.png", 
        LayoutOrder = 1, 
        Parent = v45
    });
    local v49 = l_Utility_0.Create("TextLabel")({
        Name = "SwitchAccountHint", 
        AnchorPoint = Vector2.new(1, 1), 
        Size = UDim2.new(0, 260, 0, 38), 
        Position = UDim2.new(1, 0, 1, -13), 
        BackgroundTransparency = 1, 
        Text = l_LocalizedStrings_0:LocalizedString("SwitchAccountHint"), 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = "Right", 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        Parent = v43
    });
    local v50 = l_Utility_0.Create("ImageLabel")({
        Name = "SwitchAccountIndicator", 
        AnchorPoint = Vector2.new(1, 0.5), 
        Position = UDim2.new(0, 0, 0.5, 0), 
        Size = UDim2.new(0, 58, 0, 58), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/ButtonIcons/XButtonEngagementScreen.png", 
        Parent = v49
    });
    (function()
        local v51 = string.find(v42, "{");
        local v52 = "";
        if v51 and v51 > 0 then
            v52 = string.sub(v42, 1, v51 - 1);
        end;
        local v53 = string.find(v42, "}");
        local v54 = "";
        if v53 and v53 > 0 then
            v54 = string.sub(v42, v53 + 1, #v42);
        end;
        v46.Size = UDim2.new(0, l_TextService_0:GetTextSize(v52, l_Utility_0.ConvertFontSizeEnumToInt(v46.FontSize), v46.Font, Vector2.new()).x, 0, 58);
        v46.Text = v52;
        v47.Size = UDim2.new(0, l_TextService_0:GetTextSize(v54, l_Utility_0.ConvertFontSizeEnumToInt(v47.FontSize), v47.Font, Vector2.new()).x, 0, 58);
        v47.Text = v54;
        l_Utility_0.ResizeButtonWithText(v49, v49, 0, 0);
    end)();
    local function _(v55)
        if v55 == nil then
            v55 = l_Errors_0.Default;
        end;
        l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(v55), false);
    end;
    local function v58()
        local v57 = {};
        if not v4 then
            v57.gamertag = "InStudioNoGamertag";
            v57.xuid = -1;
        else
            v57.gamertag = v4:GetUserPlatformName();
            v57.xuid = v4:GetUserPlatformId();
        end;
        v8.store:dispatch(require(l_Shell_0.Actions.SetXboxUser)(v57));
    end;
    local function v70(v59)
        if not UserSettings().GameSettings:InStudioMode() then
            local v69 = l_LoadingWidget_0({
                Parent = v44, 
                Position = UDim2.new(0.5, 0, 0, 415)
            }, {
                function()
                    local l_status_0, l_result_0 = pcall(function()
                        return v4:RegisterActiveUser(v59);
                    end);
                    if l_status_0 then
                        if l_result_0 ~= v33.Success then
                            local v62 = l_Errors_0.RegisterActiveUser[l_result_0];
                            if v62 == nil then
                                v62 = l_Errors_0.Default;
                            end;
                            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(v62), false);
                            return ;
                        else
                            v58();
                            local v63 = l_AccountManager_0:HasLinkedAccountAsync();
                            if v63 == l_AccountManager_0.AuthResults.AccountUnlinked then
                                l_RbxAnalyticsService_0:ReportCounter("Xbox_SignUp_Start");
                                local v64 = l_SignInScreen_0();
                                v64:SetParent(v43.Parent);
                                l_ScreenManager_0:OpenScreen(v64, true);
                                return ;
                            elseif v63 ~= l_AccountManager_0.AuthResults.Success then
                                local v65 = l_Errors_0.Authentication[v63];
                                if v65 == nil then
                                    v65 = l_Errors_0.Default;
                                end;
                                l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(v65), false);
                                return ;
                            else
                                local v66 = l_AccountManager_0:LoginAsync();
                                if v24() then
                                    l_default_0:logEventOnce("lua_auth_request_end");
                                end;
                                if v66 == l_AccountManager_0.AuthResults.Success then
                                    l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.AuthenticationSuccess);
                                    return ;
                                else
                                    local v67 = l_Errors_0.Authentication[v66];
                                    if v67 == nil then
                                        v67 = l_Errors_0.Default;
                                    end;
                                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(v67), false);
                                    return ;
                                end;
                            end;
                        end;
                    else
                        local v68 = l_Errors_0.RegisterActiveUser[v33.Unknown];
                        if v68 == nil then
                            v68 = l_Errors_0.Default;
                        end;
                        l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(v68), false);
                        return ;
                    end;
                end
            });
            v69:AwaitFinished();
            v69:Cleanup();
            return ;
        else
            v58();
            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.AuthenticationSuccess);
            return ;
        end;
    end;
    local function v72(v71)
        v40 = l_Utility_0.DisconnectEvent(v40);
        v41 = l_Utility_0.DisconnectEvent(v41);
        v46.TextColor3 = l_GlobalSettings_0.WhiteTextColor;
        l_Utility_0.PropertyTweener(v46, "TextTransparency", 0, 1, 0.25, l_Utility_0.EaseOutQuad, true, function()
            v70(v71);
        end);
        v47.TextColor3 = l_GlobalSettings_0.WhiteTextColor;
        l_Utility_0.PropertyTweener(v47, "TextTransparency", 0, 1, 0.25, l_Utility_0.EaseOutQuad, true);
        l_Utility_0.PropertyTweener(v48, "ImageTransparency", 0, 1, 0.25, l_Utility_0.EaseOutQuad, true);
        l_Utility_0.PropertyTweener(v49, "TextTransparency", 0, 1, 0.25, l_Utility_0.EaseOutQuad, true);
        l_Utility_0.PropertyTweener(v50, "ImageTransparency", 0, 1, 0.25, l_Utility_0.EaseOutQuad, true);
    end;
    local function _(v73)
        local l_status_1, l_result_1 = pcall(function()
            return v3:ShowAccountPicker(v73);
        end);
        if not l_status_1 or l_result_1 == v34.Unknown then
            local v76 = l_Errors_0.RegisterActiveUser[v34.Unknown];
            if v76 == nil then
                v76 = l_Errors_0.Default;
            end;
            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(v76), false);
            return v34.Unknown;
        else
            return l_result_1;
        end;
    end;
    v39.GetName = function(_)
        return l_Analytics_0.WidgetNames("EngagementScreenId");
    end;
    v39.GetId = function(_)
        return l_Analytics_0.WidgetNames("EngagementScreenId");
    end;
    v39.Show = function(_)
        v43.Visible = true;
    end;
    v39.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("EngagementScreenId")
        };
    end;
    v39.Hide = function(_)
        v43.Visible = false;
    end;
    v39.Focus = function(_)
        v46.TextColor3 = l_GlobalSettings_0.WhiteTextColor;
        v46.TextTransparency = 0;
        v47.TextColor3 = l_GlobalSettings_0.WhiteTextColor;
        v47.TextTransparency = 0;
        v49.TextTransparency = 0;
        v48.ImageTransparency = 0;
        v50.ImageTransparency = 0;
        l_Utility_0.DisconnectEvent(v40);
        local v84 = {};
        v40 = l_UserInputService_0.InputBegan:connect(function(v85)
            if v26[v85.UserInputType] then
                if not v37(v85.KeyCode, Enum.KeyCode.ButtonA) then
                    if v37(v85.KeyCode, Enum.KeyCode.ButtonX) then
                        v84[v85.KeyCode] = true;
                    end;
                else
                    v46.TextColor3 = l_GlobalSettings_0.GreyTextColor;
                    v47.TextColor3 = l_GlobalSettings_0.GreyTextColor;
                    v84[v85.KeyCode] = true;
                    return ;
                end;
            end;
        end);
        l_Utility_0.DisconnectEvent(v41);
        local v86 = false;
        v41 = l_UserInputService_0.InputEnded:connect(function(v87)
            if not v86 then
                v86 = true;
                if not (not v26[v87.UserInputType] or not v25[v87.KeyCode]) and v84[v87.KeyCode] == true then
                    l_SoundManager_0:Play("ButtonPress");
                    if not v37(v87.KeyCode, Enum.KeyCode.ButtonA) then
                        if not (not v37(v87.KeyCode, Enum.KeyCode.ButtonX) or not v3) then
                            local l_UserInputType_0 = v87.UserInputType;
                            local l_status_2, l_result_2 = pcall(function()
                                return v3:ShowAccountPicker(l_UserInputType_0);
                            end);
                            local v91;
                            if not l_status_2 or l_result_2 == v34.Unknown then
                                local v92 = l_Errors_0.RegisterActiveUser[v34.Unknown];
                                if v92 == nil then
                                    v92 = l_Errors_0.Default;
                                end;
                                l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(v92), false);
                                v91 = v34.Unknown;
                            else
                                v91 = l_result_2;
                            end;
                            if v91 == v34.Success then
                                v46.TextColor3 = l_GlobalSettings_0.GreyTextColor;
                                v47.TextColor3 = l_GlobalSettings_0.GreyTextColor;
                                v84[v87.KeyCode] = true;
                                v72(v87.UserInputType);
                            end;
                        end;
                    else
                        v46.TextColor3 = l_GlobalSettings_0.GreyTextColor;
                        v47.TextColor3 = l_GlobalSettings_0.GreyTextColor;
                        v84[v87.KeyCode] = true;
                        v72(v87.UserInputType);
                    end;
                end;
                v86 = false;
                v84[v87.KeyCode] = false;
                return ;
            else
                return ;
            end;
        end);
    end;
    v39.RemoveFocus = function(_)
        v40 = l_Utility_0.DisconnectEvent(v40);
        v41 = l_Utility_0.DisconnectEvent(v41);
    end;
    v39.SetParent = function(_, v95)
        v43.Parent = v95;
    end;
    if v24() then
        l_default_0:logEventOnce("engagement_screen_did_mount");
    end;
    return v39;
end;
