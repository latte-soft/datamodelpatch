local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Symbol);
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_IXPService_0 = game:GetService("IXPService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v9 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v10 = require(l_CorePackages_0.Roact);
local v11 = require(l_CorePackages_0.Cryo);
local v12 = require(l_CorePackages_0.Otter);
local v13 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v14 = require(l_RobloxGui_0.Modules.VR.VRHub);
local v15 = require(l_RobloxGui_0.Modules.Common.PolicyService);
local v16 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local v17 = require(l_CorePackages_0.InGameServices.MouseIconOverrideService);
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local v19 = require(l_RobloxGui_0.Modules.Settings.Components.MenuBackButton);
local v20 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v21 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_ScreenshotsPolicy_0 = require(l_CorePackages_0.Workspace.Packages.Screenshots).ScreenshotsPolicy;
local v24 = require(l_RobloxGui_0.Modules.Common.InExperienceCapabilities);
local v25 = require(script.Parent.Theme);
local v26 = v25.color("SETTINGS_SHIELD", Color3.new(0.1607843137254902, 0.1607843137254902, 0.1607843137254902));
local v27 = v25.transparency("SETTINGS_SHIELD_TRANSPARENCY", 0.2);
local l_SHIELD_INACTIVE_POSITION_0 = v25.SHIELD_INACTIVE_POSITION;
local v29 = v3.named("SettingsHubCursorOverride");
local v30 = if not v9 then v13:IsSmallTouchScreen() and 24 or 26 else 32;
local l_FFlag_0 = settings():GetFFlag("UseNotificationsLocalization");
local l_FFlag_1 = settings():GetFFlag("LocalizeVersionLabels");
local v33 = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)();
local v34 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v35 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAbuseReportEnableReportSentPage);
local v36 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v37 = require(l_RobloxGui_0.Modules.Flags.GetFFlagOldMenuUseSpeakerIcons);
local v38 = require(l_RobloxGui_0.Modules.Flags.GetFFlagMuteButtonRaceConditionFix);
local v39 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveAssetVersionEndpoint);
local v40 = require(l_RobloxGui_0.Modules.Flags.GetFFlagNewEventIngestPlayerScriptsDimensions);
local v41 = game:DefineFastFlag("FixMouseIconSettingsMenuWithDeferredEvents", false);
local v42 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagShareInviteLinkContextMenuV1Enabled);
local v43 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagReportAbuseMenuEntrypointAnalytics);
local v44 = require(l_RobloxGui_0.Modules.Flags.FFlagAvatarChatCoreScriptSupport);
local v45 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceRecordingIndicatorsEnabled);
local v46 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableTeleportBackButton);
local v47 = require(l_RobloxGui_0.Modules.Chrome.Enabled)();
local v48 = require(l_RobloxGui_0.Modules.Chrome.Flags.GetFFlagOpenControlsOnMenuOpen);
local v49 = game:DefineFastFlag("LuaEnableGameInviteModalSettingsHub", false);
local v50 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagFix10ftBottomButtons);
local v51 = require(l_RobloxGui_0.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification);
local l_GetFStringGameInviteMenuLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringGameInviteMenuLayer;
local v53 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagFix10ftMenuGap);
local v54 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagFixSettingsHubVRBackgroundError);
local v55 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagRightAlignMicText);
local v56 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagFixResumeSourceAnalytics);
local v57 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagShouldInitWithFirstPageWithTabHeader);
local v58 = game:DefineFastFlag("PreventHiddenSwitchPage", false);
local l_GetFFlagEnableScreenshotUtility_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableScreenshotUtility;
local v60 = game:DefineFastFlag("IGMThemeResizeFix", false);
local v61 = game:DefineFastFlag("FixReducedMotionStuckIGM", false);
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_GameSettings_0 = UserSettings().GameSettings;
local v74 = nil;
pcall(function()
    v74 = game:GetService("PlatformService");
end);
local v75 = nil;
pcall(function()
    v75 = game:GetService("PlatformFriendsService");
end);
local v76 = nil;
spawn(function()
    v76 = l_RobloxReplicatedStorage_0:WaitForChild("GetServerVersion", math.huge);
end);
local v77 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
local l_TouchEnabled_0 = l_UserInputService_0.TouchEnabled;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
local v81 = not string.find(l_BaseUrl_0, "www.roblox.com");
local v82 = require(l_RobloxGui_0.Modules.DevConsoleMaster);
local v83 = nil;
local v84 = false;
local v85 = nil;
local v86 = require(l_RobloxGui_0.Modules.Settings.Components.SettingsFullScreenTitleBar);
local v87 = require(l_RobloxGui_0.Modules.Settings.Components.PermissionsButtons);
local v88 = require(l_RobloxGui_0.Modules.SelfView.toggleSelfViewSignal);
local v89 = require(l_RobloxGui_0.Modules.SelfView.publicApi);
local v90 = require(l_RobloxGui_0.Modules.SelfView.selfViewVisibilityUpdatedSignal);
local l_GameInviteAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteAnalytics;
local v92 = require(script:FindFirstAncestor("Settings").Analytics.VoiceAnalytics);
local v93 = nil;
local v94 = nil;
local v95 = nil;
local v96 = nil;
if v51() then
    v93 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
    v94 = v93.GameInviteModalManager;
    v95 = v93.GameInviteInviteExperimentVariant;
    v96 = v93.GameInviteConstants;
end;
local v97 = require(l_RobloxGui_0.Modules.Screenshots.ScreenshotsApp);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v99 = v15:IsSubjectToChinaPolicies();
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v101 = require(l_RobloxGui_0.Modules.Flags.GetFFlagOldMenuNewIcons);
local v102 = require(l_RobloxGui_0.Modules.Flags.GetFFlagPlayerListAnimateMic);
local v103 = require(l_RobloxGui_0.Modules.Settings.Experiments.NotchSupportExperiment);
local v104 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagInGameMenuV1FadeBackgroundAnimation);
local v105 = require(l_RobloxGui_0.Modules.Flags.GetFFlagSwitchInExpTranslationsPackage);
local v106 = game:DefineFastFlag("SettingsHubRaceConditionFix", false);
local v107 = {
    MicOn = "rbxasset://textures/ui/Settings/Players/Unmute@2x.png", 
    MicOff = "rbxasset://textures/ui/Settings/Players/Muted@2x.png", 
    MicDisabled = "rbxasset://textures/ui/Settings/Players/Blocked@2x.png", 
    Loading = "rbxasset://textures/ui/Settings/Players/Unmuted-White@2x.png"
};
local l_v107_0 = v107;
if v101() then
    v107 = l_default_0.MuteStatusIcons;
    l_v107_0 = l_default_0.PlayerMuteStatusIcons;
end;
local v109 = {};
if v45() then
    v109 = {
        frequency = 4, 
        dampingRatio = 1
    };
end;
local v110 = l_FFlag_1 or v99;
local v111 = nil;
if not (not v110 and not v45()) then
    v111 = require(l_RobloxGui_0.Modules:WaitForChild("RobloxTranslator"));
end;
local function _(v112, v113)
    if v111 then
        local l_status_0, l_result_0 = pcall(v111.FormatByKey, v111, v112);
        if not l_status_0 then
            return v113;
        else
            return l_result_0;
        end;
    else
        return v113;
    end;
end;
local v117 = require(l_RobloxGui_0.Modules.ChatSelector);
local v118 = nil;
local v119 = nil;
if v53() and v25.UIBloxThemeEnabled or not v9 then
    local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
    v118 = UDim2.new(0, 0, 0, -l_l_GuiService_0_GuiInset_0.Y);
    v119 = UDim2.new(1, 0, 1, l_l_GuiService_0_GuiInset_0.Y);
else
    v118 = UDim2.new(0, 0, 0, 0);
    v119 = UDim2.new(1, 0, 1, 0);
end;
local function v126(v122)
    local l_CorePackages_1 = game:GetService("CorePackages");
    for _, v125 in pairs(v122) do
        if not l_CorePackages_1:FindFirstChild(v125) then
            return false;
        end;
    end;
    return true;
end;
local function _()
    if not v85 then
        if not v76 then
            while true do
                wait();
                if v76 then
                    break;
                end;
            end;
        end;
        v85 = v76:InvokeServer();
        return v85;
    else
        return v85;
    end;
end;
local function _()
    if not v39() then
        local l_PlaceVersion_0 = game.PlaceVersion;
        pcall(function()
            l_PlaceVersion_0 = string.format("%s (Latest: %d)", l_PlaceVersion_0, l_HttpService_0:JSONDecode((l_HttpRbxApiService_0:GetAsync(string.format("assets/%d/versions", game.PlaceId))))[1].VersionNumber);
        end);
        return l_PlaceVersion_0;
    else
        return game.PlaceVersion;
    end;
end;
local function v553()
    local v130 = {
        Visible = false, 
        Active = true, 
        Pages = {
            CurrentPage = nil, 
            PageTable = {}
        }, 
        MenuStack = {}, 
        TabHeaders = {}, 
        BottomBarButtons = {}, 
        BottomBarButtonsComponents = {}, 
        ResizedConnection = nil, 
        TakingScreenshot = false
    };
    if v46() then
        v130.BackBarVisibleConnection = nil;
    end;
    v130.PreferredTransparencyChangedConnection = nil;
    v130.TabConnection = nil;
    v130.LeaveGamePage = require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGame);
    v130.ResetCharacterPage = require(l_RobloxGui_0.Modules.Settings.Pages.ResetCharacter);
    v130.SettingsShowSignal = v13:CreateSignal();
    v130.CurrentPageSignal = v13:CreateSignal();
    v130.OpenStateChangedCount = 0;
    v130.BottomButtonFrame = nil;
    local v131 = v92.new(l_RbxAnalyticsService_0, "SettingsHub");
    if v45() then
        v130.isMuted = nil;
        v130.lastVoiceRecordingIndicatorTextUpdated = nil;
    end;
    if v104() then
        v103.initialize();
    end;
    if v44 then
        v130.selfViewOpen = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
        v130.toggleSelfViewSignal = v88:connect(function()
            v130.selfViewOpen = not v130.selfViewOpen;
        end);
        v130.selfViewOpen = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView) and v89.getSelfViewIsOpenAndVisible();
        v130.selfViewVisibilitySignal = v90:connect(function()
            v130.selfViewOpen = v89.getSelfViewIsOpenAndVisible();
        end);
    end;
    local v132 = nil;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Name = "PoppedMenu";
    v130.PoppedMenu = l_BindableEvent_0.Event;
    local function _(v134)
        return (v134 or v130.Pages.CurrentPage).ShouldShowBottomBar == true;
    end;
    local function _(v136)
        v136 = v136 or v130.Pages.CurrentPage;
        if not v13:IsPortrait() and not v13:IsSmallTouchScreen() then
            local v137 = false;
            if v136 ~= nil then
                v137 = v136.ShouldShowBottomBar == true;
            end;
            return v137;
        else
            return v25.AlwaysShowBottomBar();
        end;
    end;
    local function v143()
        if v130.Visible then
            for v139 = 1, #v130.BottomBarButtons do
                local v140 = v130.BottomBarButtons[v139];
                local v141 = v140[1];
                local v142 = v140[2];
                l_ContextActionService_0:BindCoreAction(v141, v142[1], false, unpack(v142[2]));
            end;
            if v130.BottomButtonFrame then
                v130.BottomButtonFrame.Visible = true;
            end;
            return ;
        else
            return ;
        end;
    end;
    local function v149(v144)
        for _, v146 in pairs(v130.BottomBarButtons) do
            l_ContextActionService_0:UnbindCoreAction(v146[1]);
        end;
        local l_OpenStateChangedCount_0 = v130.OpenStateChangedCount;
        local function v148()
            if not (not (v130.OpenStateChangedCount == l_OpenStateChangedCount_0) or not v130.BottomButtonFrame) then
                v130.BottomButtonFrame.Visible = false;
            end;
        end;
        if not v144 then
            if not (not (v130.OpenStateChangedCount == l_OpenStateChangedCount_0) or not v130.BottomButtonFrame) then
                v130.BottomButtonFrame.Visible = false;
            end;
            return ;
        else
            delay(v144, v148);
            return ;
        end;
    end;
    local function _(v150, v151, v152)
        local l_FirstChild_0 = v130.BottomButtonFrame:FindFirstChild(v150 .. "ButtonButton", true);
        if l_FirstChild_0 then
            l_FirstChild_0.Position = v151;
            l_FirstChild_0.Size = v152;
            return ;
        else
            return ;
        end;
    end;
    local function _(v155)
        return type(v155) == "function" and v155() or v155;
    end;
    local function v159()
        local l_localMuted_0 = l_default_0.localMuted;
        local _ = nil;
        if l_localMuted_0 == nil then
            if not v37() then
                return v107.Loading;
            else
                return l_v107_0.Loading;
            end;
        elseif not l_localMuted_0 then
            if not l_default_0.isTalking or not v102() then
                if not v37() then
                    return v107.MicOn;
                else
                    return l_v107_0.MicOn;
                end;
            else
                return (l_default_0:GetIcon("Unmuted" .. tostring(20 * math.floor(0.5 + 5 * math.random())), "MicLight"));
            end;
        elseif not v37() then
            return v107.MicOff;
        else
            return l_v107_0.MicOff;
        end;
    end;
    local v160 = {};
    local v161 = {
        Loading = "", 
        MicOff = "", 
        MicOn = ""
    };
    local function v167()
        local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
        if not v160[l_RobloxLocaleId_0] then
            local _ = nil;
            v160[l_RobloxLocaleId_0] = (if not v105() then require(l_RobloxGui_0.Modules.InGameMenu.Localization.Localization) else require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization).new(l_RobloxLocaleId_0);
            local v164 = v160[l_RobloxLocaleId_0];
            v161.Loading = v164:Format("CoreScripts.InGameMenu.QuickActions.Connecting");
            v161.MicOff = v164:Format("CoreScripts.InGameMenu.QuickActions.UnmuteSelf");
            v161.MicOn = v164:Format("CoreScripts.InGameMenu.QuickActions.MuteSelf");
        end;
        local l_localMuted_1 = l_default_0.localMuted;
        local _ = "";
        if l_localMuted_1 == nil then
            return v161.Loading;
        elseif not l_localMuted_1 then
            if not l_default_0.isTalking then
                return v161.MicOn;
            else
                return v161.MicOn;
            end;
        else
            return v161.MicOff;
        end;
    end;
    local v168 = nil;
    local v169 = nil;
    local function v172()
        if not v47 then
            local v170 = nil;
            local v171 = nil;
            if not v25.UseIconButtons then
                v170 = v130.BottomButtonFrame:FindFirstChild("MuteButtonHint", true);
            else
                if not v168 then
                    v168 = v130.BottomButtonFrame:FindFirstChild("MuteButtonButtonIcon", true);
                    v169 = v130.BottomButtonFrame:FindFirstChild("MuteButtonButtonTextLabel", true);
                end;
                v170 = v168;
                v171 = v169;
            end;
            if v170 then
                v170.Image = v159();
            end;
            if v171 then
                v171.Text = v167();
            end;
            return ;
        else
            return ;
        end;
    end;
    local function v177()
        local l_MuteButtonButton_0 = v130.MuteButtonButton;
        if l_MuteButtonButton_0 then
            l_MuteButtonButton_0.Visible = false;
            l_MuteButtonButton_0:Destroy();
        end;
        local v174 = if not v9 then UDim2.new(0, 260, 0, v25.LargeButtonHeight) else UDim2.new(0, 320, 0, (not not v50() and v25.UIBloxThemeEnabled) and 72 or 120);
        local v175 = UDim2.new(0.5, not v9 and -130 or -160, 0.5, -25);
        local l_FirstChild_1 = v130.BottomButtonFrame:FindFirstChild("LeaveGame" .. "ButtonButton", true);
        if l_FirstChild_1 then
            l_FirstChild_1.Position = v175;
            l_FirstChild_1.Size = v174;
        end;
        v175 = UDim2.new(0.5, not v9 and -400 or -550, 0.5, -25);
        l_FirstChild_1 = v130.BottomButtonFrame:FindFirstChild("ResetCharacter" .. "ButtonButton", true);
        if l_FirstChild_1 then
            l_FirstChild_1.Position = v175;
            l_FirstChild_1.Size = v174;
        end;
        v175 = UDim2.new(0.5, not v9 and 140 or 200, 0.5, -25);
        l_FirstChild_1 = v130.BottomButtonFrame:FindFirstChild("Resume" .. "ButtonButton", true);
        if l_FirstChild_1 then
            l_FirstChild_1.Position = v175;
            l_FirstChild_1.Size = v174;
            return ;
        else
            return ;
        end;
    end;
    local v178 = 0;
    local function v192(v179, v180, v181, _, _, v184, v185, v186)
        local v187 = v179 .. "Button";
        local v188 = v13:MakeIconButton(v187, not not v180 and v25.Images[v180] or nil, v181, nil, v185, nil, v130);
        v188.Parent = v130.BottomButtonFrame;
        v188.Position = v184;
        v188.LayoutOrder = v178;
        v178 = v178 + 1;
        v130.BottomBarButtons[#v130.BottomBarButtons + 1] = {
            v187, 
            {
                function(_, v190, _)
                    if v190 == Enum.UserInputState.Begin then
                        v185();
                    end;
                end, 
                v186
            }
        };
        v130.BottomBarButtonsComponents[#v130.BottomBarButtonsComponents + 1] = v188;
    end;
    local function v212(v193, v194, v195, v196, v197, v198, v199, v200)
        local v201 = v193 .. "Button";
        local v202 = v193 .. "Text";
        local v203 = UDim2.new(0, 260, 0, v25.LargeButtonHeight);
        if v9 then
            v203 = if not not v25.UIBloxThemeEnabled and v50() then UDim2.new(0, 320, 0, 72) else UDim2.new(0, 320, 0, 120);
        end;
        local l_v130_0 = v130;
        local l_v130_1 = v130;
        local v206, v207 = v13:MakeStyledButton(v193 .. "Button", v194, v203, v198, nil, v130);
        l_v130_0[v201] = v206;
        l_v130_1[v202] = v207;
        v130[v201].Position = v197;
        v130[v201].Parent = v130.BottomButtonFrame;
        if v9 then
            v130[v201].ImageTransparency = 1;
        end;
        v130[v202].FontSize = Enum.FontSize.Size24;
        l_v130_0 = nil;
        if not l_TouchEnabled_0 then
            if not v25.UIBloxThemeEnabled then
                if not l_FFlag_0 then
                    v130[v202].Size = UDim2.new(0.75, 0, 0.9, 0);
                    v130[v202].Position = UDim2.new(0.25, 0, 0, 0);
                else
                    v130[v202].Size = UDim2.new(0.675, 0, 0.67, 0);
                    v130[v202].Position = UDim2.new(0.275, 0, 0.125, 0);
                end;
            else
                v130[v202].Size = UDim2.new(1, -51, 1, 0);
                v130[v202].Position = UDim2.new(1, -9, 0, 0);
                v130[v202].AnchorPoint = Vector2.new(1, 0);
            end;
            l_v130_1 = v193 .. "Hint";
            v206 = "";
            v206 = if l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then v195 else v196;
            l_v130_0 = v13:Create("ImageLabel")({
                Name = l_v130_1, 
                ZIndex = v130.Shield.ZIndex + 2, 
                BackgroundTransparency = 1, 
                Image = v206, 
                Parent = v130[v201]
            });
            if not v25.UIBloxThemeEnabled then
                l_v130_0.AnchorPoint = Vector2.new(0.5, 0.5);
                l_v130_0.Size = UDim2.new(0, 50, 0, 50);
                l_v130_0.Position = UDim2.new(0.15, 0, 0.475, 0);
            else
                if v206 == v196 then
                    l_v130_0.ImageColor3 = v25.color("WhiteButtonText", Color3.new(1, 1, 1));
                    l_v130_0.ImageTransparency = v25.transparency("WhiteButtonText", 1);
                end;
                l_v130_0.Position = UDim2.new(0, 9, 0.5, 0);
                l_v130_0.Size = UDim2.new(0, 33, 0, 33);
                l_v130_0.AnchorPoint = Vector2.new(0, 0.5);
            end;
        end;
        if v9 then
            v130[v202].FontSize = Enum.FontSize.Size36;
        end;
        l_UserInputService_0.InputBegan:connect(function(v208)
            if not ((v208.UserInputType ~= Enum.UserInputType.Gamepad1 and v208.UserInputType ~= Enum.UserInputType.Gamepad2) and v208.UserInputType ~= Enum.UserInputType.Gamepad3) or v208.UserInputType == Enum.UserInputType.Gamepad4 then
                if l_v130_0 then
                    l_v130_0.Image = v195;
                    return ;
                end;
            elseif not (not (v208.UserInputType == Enum.UserInputType.Keyboard) or not l_v130_0) then
                l_v130_0.Image = v196;
            end;
        end);
        v130.BottomBarButtons[#v130.BottomBarButtons + 1] = {
            v201, 
            {
                function(_, v210, _)
                    if v210 == Enum.UserInputState.Begin then
                        if not v56() then
                            v198();
                        else
                            v200();
                            return ;
                        end;
                    end;
                end, 
                v199
            }
        };
    end;
    local function v237(v213, v214, v215, v216, v217, v218, v219, v220, v221)
        local v222 = v213 .. "Button";
        local v223 = v213 .. "Text";
        local v224 = v220 or UDim2.new(0, 260, 0, 70);
        if v9 then
            v224 = if not not v25.UIBloxThemeEnabled and v50() then UDim2.new(0, 320, 0, 72) else UDim2.new(0, 320, 0, 120);
        end;
        local l_v130_2 = v130;
        local l_v130_3 = v130;
        local v227, v228 = v13:MakeStyledButton(v213 .. "Button", v214, v224, v218, nil, v130);
        l_v130_2[v222] = v227;
        l_v130_3[v223] = v228;
        v130[v222].Position = v217;
        v130[v222].Parent = v130.BottomButtonFrame;
        if v9 then
            v130[v222].ImageTransparency = 1;
        end;
        v130[v223].FontSize = Enum.FontSize.Size24;
        l_v130_2 = nil;
        if not (l_TouchEnabled_0 and not v221) then
            if not l_FFlag_0 then
                v130[v223].Size = UDim2.new(0.75, 0, 0.9, 0);
                v130[v223].Position = UDim2.new(0.25, 0, 0, 0);
            else
                v130[v223].Size = UDim2.new(0.675, 0, 0.67, 0);
                v130[v223].Position = UDim2.new(0.275, 0, 0.125, 0);
            end;
            l_v130_3 = v213 .. "Hint";
            v227 = "";
            l_v130_2 = v13:Create("ImageLabel")({
                Name = l_v130_3, 
                ZIndex = v130.Shield.ZIndex + 2, 
                BackgroundTransparency = 1, 
                Image = if l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then type(v215) == "function" and v215() or v215 else type(v216) == "function" and v216() or v216, 
                Parent = v130[v222]
            });
            l_v130_2.AnchorPoint = Vector2.new(0.5, 0.5);
            l_v130_2.Size = v214 == "" and (not not v101() and UDim2.fromOffset(50, 50) or UDim2.fromOffset(30, 40)) or UDim2.new(0, 50, 0, 50);
            l_v130_2.Position = v214 == "" and UDim2.new(0.5, 0, 0.475, 0) or UDim2.new(0.15, 0, 0.475, 0);
        end;
        if v9 then
            v130[v223].FontSize = Enum.FontSize.Size36;
        end;
        l_UserInputService_0.InputBegan:connect(function(v229)
            if not ((v229.UserInputType ~= Enum.UserInputType.Gamepad1 and v229.UserInputType ~= Enum.UserInputType.Gamepad2) and v229.UserInputType ~= Enum.UserInputType.Gamepad3) or v229.UserInputType == Enum.UserInputType.Gamepad4 then
                if l_v130_2 then
                    local l_l_v130_2_0 = l_v130_2;
                    local l_v215_0 = v215;
                    l_l_v130_2_0.Image = type(l_v215_0) == "function" and l_v215_0() or l_v215_0;
                    return ;
                end;
            elseif not (not (v229.UserInputType == Enum.UserInputType.Keyboard) or not l_v130_2) then
                local l_l_v130_2_1 = l_v130_2;
                local l_v216_0 = v216;
                l_l_v130_2_1.Image = type(l_v216_0) == "function" and l_v216_0() or l_v216_0;
            end;
        end);
        v130.BottomBarButtons[#v130.BottomBarButtons + 1] = {
            v222, 
            {
                function(_, v235, _)
                    if v235 == Enum.UserInputState.Begin then
                        v218();
                    end;
                end, 
                v219
            }
        };
    end;
    local v238 = "";
    if v9 then
        v238 = "@2x";
    end;
    local v239 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB" .. v238 .. ".png";
    local v240 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX" .. v238 .. ".png";
    local v241 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY" .. v238 .. ".png";
    local function v246()
        if not v25.UseIconButtons then
            if not (not v38() or not v130.BottomButtonFrame:FindFirstChild("MuteButtonHint", true)) then
                return ;
            end;
        elseif not (not v38() or not v130.BottomButtonFrame:FindFirstChild("MuteButtonButtonIcon", true)) then
            return ;
        end;
        if not v25.UseIconButtons then
            v237("MuteButton", "", v239, v159, UDim2.new(0.5, not v9 and 330 or 300, 0.5, -25), function()
                l_default_0:ToggleMic("InGameMenu");
            end, {}, UDim2.new(0, v25.LargeButtonHeight, 0, v25.LargeButtonHeight), true);
        else
            v192("MuteButton", nil, "", v239, v159, UDim2.new(0.5, not v9 and 330 or 300, 0.5, -25), function()
                l_default_0:ToggleMic("InGameMenu");
                if v131 then
                    v131:onToggleMuteSelf(v130.isMuted);
                end;
            end, {});
            v172();
        end;
        if not v38() then
            l_default_0.muteChanged.Event:Connect(function(_)
                v172();
            end);
            if v102() then
                v130.SettingsShowSignal:connect(function(v243)
                    local v244 = 0;
                    local v245 = false;
                    if not v243 or v245 then
                        if v245 then
                            v245 = false;
                            l_RunService_0:UnbindFromRenderStep("settings-hub-renderstep");
                        end;
                    else
                        v245 = true;
                        l_RunService_0:BindToRenderStep("settings-hub-renderstep", Enum.RenderPriority.Last.Value, function()
                            v244 = v244 + 1;
                            if v244 % 3 == 0 then
                                v172();
                            end;
                        end);
                    end;
                    if not (not v45() or not v243) then
                        v130.lastVoiceRecordingIndicatorTextUpdated = tick();
                        v130.voiceRecordingIndicatorTextMotor:setGoal(v12.instant(0));
                    end;
                end);
            end;
        end;
    end;
    local function v250()
        if not v47 then
            local v247 = UDim2.new(0, 235, 0, v25.LargeButtonHeight);
            v246();
            local v248 = UDim2.new(0.5, (not v9 and -130 or -160) + -27.5, 0.5, -25);
            local l_FirstChild_2 = v130.BottomButtonFrame:FindFirstChild("LeaveGame" .. "ButtonButton", true);
            if l_FirstChild_2 then
                l_FirstChild_2.Position = v248;
                l_FirstChild_2.Size = v247;
            end;
            v248 = UDim2.new(0.5, not v9 and -400 or -550, 0.5, -25);
            l_FirstChild_2 = v130.BottomButtonFrame:FindFirstChild("ResetCharacter" .. "ButtonButton", true);
            if l_FirstChild_2 then
                l_FirstChild_2.Position = v248;
                l_FirstChild_2.Size = v247;
            end;
            v248 = UDim2.new(0.5, (not v9 and 140 or 200) + -55, 0.5, -25);
            l_FirstChild_2 = v130.BottomButtonFrame:FindFirstChild("Resume" .. "ButtonButton", true);
            if l_FirstChild_2 then
                l_FirstChild_2.Position = v248;
                l_FirstChild_2.Size = v247;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    local v251 = false;
    local v252 = false;
    local function v268()
        if not (not game:GetEngineFeature("VoiceChatSupported") or v251) then
            v251 = true;
            l_default_0:asyncInit():andThen(function()
                v252 = true;
                if v45() then
                    v130.VoiceRecordingText.Visible = true;
                    l_default_0:getService().StateChanged:Connect(function(_, v254)
                        if v254 == Enum.VoiceChatState.Ended then
                            v130.VoiceRecordingText.Visible = false;
                            v252 = false;
                            v177();
                            return ;
                        else
                            if v254 == Enum.VoiceChatState.Joined then
                                if v252 == false then
                                    v250();
                                end;
                                v130.VoiceRecordingText.Visible = true;
                            end;
                            return ;
                        end;
                    end);
                end;
                l_default_0:SetupParticipantListeners();
                v250();
                if v38() then
                    l_default_0.muteChanged.Event:Connect(function(v255)
                        v172();
                        if v45() then
                            v130.isMuted = v255;
                            v130.lastVoiceRecordingIndicatorTextUpdated = tick();
                            v130.voiceRecordingIndicatorTextMotor:setGoal(v12.instant(0));
                            if not v130.isMuted then
                                local l_VoiceRecordingText_0 = v130.VoiceRecordingText;
                                local v257;
                                if v111 then
                                    local l_status_1, l_result_1 = pcall(v111.FormatByKey, v111, "InGame.CommonUI.Label.MicOnRecording");
                                    v257 = not l_status_1 and "Mic On (recording audio)" or l_result_1;
                                else
                                    v257 = "Mic On (recording audio)";
                                end;
                                l_VoiceRecordingText_0.Text = v257;
                            else
                                local l_VoiceRecordingText_1 = v130.VoiceRecordingText;
                                local v261;
                                if v111 then
                                    local l_status_2, l_result_2 = pcall(v111.FormatByKey, v111, "InGame.CommonUI.Label.MicOff");
                                    v261 = not l_status_2 and "Mic Off" or l_result_2;
                                else
                                    v261 = "Mic Off";
                                end;
                                l_VoiceRecordingText_1.Text = v261;
                                return ;
                            end;
                        end;
                    end);
                    if v102() then
                        v130.SettingsShowSignal:connect(function(v264)
                            local v265 = 0;
                            local v266 = false;
                            if not v264 or v266 then
                                if v266 then
                                    v266 = false;
                                    l_RunService_0:UnbindFromRenderStep("settings-hub-renderstep");
                                end;
                            else
                                v266 = true;
                                l_RunService_0:BindToRenderStep("settings-hub-renderstep", Enum.RenderPriority.Last.Value, function()
                                    v265 = v265 + 1;
                                    if v265 % 3 == 0 then
                                        v172();
                                    end;
                                end);
                            end;
                            if not (not v45() or not v264) then
                                v130.lastVoiceRecordingIndicatorTextUpdated = tick();
                                v130.voiceRecordingIndicatorTextMotor:setGoal(v12.instant(0));
                            end;
                        end);
                    end;
                end;
            end):catch(function(v267)
                if v36() then
                    v77:warning("Failed to init VoiceChatServiceManager {}", v267);
                end;
            end);
        end;
    end;
    if not v106 then
        v268();
    end;
    local v269 = true;
    local function v273(v270)
        v269 = v270;
        if v130.ResetCharacterButton then
            v130.ResetCharacterButton.Selectable = v270;
            v130.ResetCharacterButton.Active = v270;
            v130.ResetCharacterButton.Enabled.Value = v270;
            local l_ResetCharacterHint_0 = v130.ResetCharacterButton:FindFirstChild("ResetCharacterHint");
            if l_ResetCharacterHint_0 then
                l_ResetCharacterHint_0.ImageColor3 = not not v270 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
            end;
            local l_ResetCharacterButtonTextLabel_0 = v130.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel");
            if l_ResetCharacterButtonTextLabel_0 then
                l_ResetCharacterButtonTextLabel_0.TextColor3 = not not v270 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
            end;
        end;
    end;
    local v274 = nil;
    v130.GetRespawnBehaviour = function(_)
        return v269, v274;
    end;
    v130.RespawnBehaviourChangedEvent = Instance.new("BindableEvent");
    l_StarterGui_0:RegisterSetCore("ResetButtonCallback", function(v276)
        local v277 = false;
        if typeof(v276) == "Instance" then
            v277 = v276:IsA("BindableEvent");
        end;
        if v277 or type(v276) == "boolean" then
            v130.ResetCharacterPage:SetResetCallback(v276);
        else
            warn("ResetButtonCallback must be set to a BindableEvent or a boolean");
        end;
        if v276 == false then
            v273(false);
        elseif not v269 and (v277 or v276 == true) then
            v273(true);
        end;
        if v277 then
            v274 = v276;
        end;
        v130.RespawnBehaviourChangedEvent:Fire(v269, v274);
    end);
    local v278 = nil;
    local function v280(v279)
        return v10.createElement(v87, {
            isTenFootInterface = v9, 
            isPortrait = v13:IsPortrait(), 
            isSmallTouchScreen = v13:IsSmallTouchScreen(), 
            ZIndex = v130.Shield.ZIndex, 
            LayoutOrder = -1, 
            shouldFillScreen = v279, 
            selfViewOpen = v130.selfViewOpen, 
            useNewMenuTheme = v25.UIBloxThemeEnabled
        });
    end;
    v130.createBackgroundFadeGui = function()
        if not v130.FullscreenGui then
            v130.FullscreenGui = v13:Create("ScreenGui")({
                Name = "FSSettingsMenuBackground", 
                ScreenInsets = Enum.ScreenInsets.None, 
                ClipToDeviceSafeArea = false, 
                DisplayOrder = l_RobloxGui_0.DisplayOrder - 1, 
                Enabled = false, 
                Parent = l_CoreGui_0
            });
        end;
        if not v130.FullscreenBackgroundCover then
            v130.FullscreenBackgroundCover = v13:Create("Frame")({
                Name = "BackgroundCover", 
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromScale(0, 0), 
                BackgroundColor3 = v26, 
                BackgroundTransparency = 1, 
                Visible = true, 
                Active = true, 
                Parent = v130.FullscreenGui
            });
        end;
    end;
    local function v354()
        local v281 = 0;
        if v13:IsSmallTouchScreen() then
            v281 = 5;
        end;
        v130.ClippingShield = v13:Create("Frame")({
            Name = "SettingsClippingShield", 
            Size = v119, 
            Position = v118, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            BackgroundTransparency = 1, 
            Visible = true, 
            ZIndex = 2, 
            Parent = l_RobloxGui_0
        });
        local v282 = "Frame";
        if v25.UIBloxThemeEnabled then
            v282 = "ImageButton";
        end;
        v130.CanvasGroup = v13:Create("CanvasGroup")({
            Name = "CanvasGroup", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = 0, 
            Parent = v130.ClippingShield
        });
        v130.Shield = v13:Create(v282)({
            Name = "SettingsShield", 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = l_SHIELD_INACTIVE_POSITION_0, 
            BackgroundTransparency = v27, 
            BackgroundColor3 = v26, 
            BorderSizePixel = 0, 
            Visible = false, 
            Active = true, 
            ZIndex = 2, 
            Parent = v130.ClippingShield
        });
        v130.VRShield = v13:Create("Frame")({
            Name = "VRBackground", 
            Parent = v130.Shield, 
            BackgroundColor3 = v26, 
            BackgroundTransparency = v27, 
            Position = UDim2.new(0, -4, 0, 24), 
            Size = UDim2.new(1, 8, 1, -40), 
            BorderSizePixel = 0, 
            Visible = false
        });
        local l_game_EngineFeature_0 = game:GetEngineFeature("CoreScriptVersionEnabled");
        if not l_game_EngineFeature_0 then
            v130.VersionContainer = v13:Create("Frame")({
                Name = "VersionContainer", 
                Parent = v130.Shield, 
                BackgroundColor3 = v26, 
                BackgroundTransparency = v27, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, v30), 
                AnchorPoint = Vector2.new(0, 1), 
                BorderSizePixel = 0, 
                AutoLocalize = false, 
                ZIndex = 5, 
                Visible = false
            });
        else
            v130.VersionContainer = v13:Create("ScrollingFrame")({
                Name = "VersionContainer", 
                Parent = v130.Shield, 
                CanvasSize = UDim2.new(0, 0, 0, v30), 
                BackgroundColor3 = v26, 
                BackgroundTransparency = v27, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, v30), 
                AnchorPoint = Vector2.new(0, 1), 
                BorderSizePixel = 0, 
                AutoLocalize = false, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                ScrollBarThickness = 0, 
                ZIndex = 5, 
                Visible = false
            });
        end;
        local v284 = v13:Create("UIListLayout")({
            Name = "VersionContainer", 
            Parent = v130.VersionContainer, 
            Padding = UDim.new(0, 6), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        local function _(v285)
            v285.Size = not not l_game_EngineFeature_0 and UDim2.new(0, v285.TextBounds.X + 6, 0, v30) or UDim2.new(0.2, -6, 1, 0);
        end;
        v130.ServerVersionLabel = v13:Create("TextLabel")({
            Name = "ServerVersionLabel", 
            Parent = v130.VersionContainer, 
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v25.textSize(if not v9 then v13:IsSmallTouchScreen() and 14 or 20 else 28), 
            Text = "Server Version: ...", 
            Font = v25.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        spawn(function()
            local v287 = "Server Version: ";
            if v110 then
                if v111 then
                    local l_status_3, l_result_3 = pcall(v111.FormatByKey, v111, "InGame.HelpMenu.Label.ServerVersion");
                    v287 = not l_status_3 and "Server Version: " or l_result_3;
                else
                    v287 = "Server Version: ";
                end;
            end;
            local l_ServerVersionLabel_0 = v130.ServerVersionLabel;
            local l_v287_0 = v287;
            local v292;
            if not v85 then
                if not v76 then
                    while true do
                        wait();
                        if v76 then
                            break;
                        end;
                    end;
                end;
                v85 = v76:InvokeServer();
                v292 = v85;
            else
                v292 = v85;
            end;
            l_ServerVersionLabel_0.Text = l_v287_0 .. v292;
            l_ServerVersionLabel_0 = v130.ServerVersionLabel;
            l_ServerVersionLabel_0.Size = not not l_game_EngineFeature_0 and UDim2.new(0, l_ServerVersionLabel_0.TextBounds.X + 6, 0, v30) or UDim2.new(0.2, -6, 1, 0);
            v130.ServerVersionLabel.TextScaled = not (l_game_EngineFeature_0 or v130.ServerVersionLabel.TextFits);
        end);
        local v293 = "Client Version: ";
        if v110 then
            if v111 then
                local l_status_4, l_result_4 = pcall(v111.FormatByKey, v111, "InGame.HelpMenu.Label.ClientVersion");
                v293 = not l_status_4 and "Client Version: " or l_result_4;
            else
                v293 = "Client Version: ";
            end;
        end;
        local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
        local l_status_5, l_result_5 = pcall(function()
            return l_RunService_0.ClientGitHash;
        end);
        if l_status_5 then
            l_l_RunService_0_RobloxVersion_0 = string.format("%s (%.6s)", l_l_RunService_0_RobloxVersion_0, l_result_5);
        end;
        v130.ClientVersionLabel = v13:Create("TextLabel")({
            Name = "ClientVersionLabel", 
            Parent = v130.VersionContainer, 
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v25.textSize(if not v9 then v13:IsSmallTouchScreen() and 14 or 20 else 28), 
            Text = v293 .. l_l_RunService_0_RobloxVersion_0, 
            Font = v25.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        local l_ClientVersionLabel_0 = v130.ClientVersionLabel;
        l_ClientVersionLabel_0.Size = not not l_game_EngineFeature_0 and UDim2.new(0, l_ClientVersionLabel_0.TextBounds.X + 6, 0, v30) or UDim2.new(0.2, -6, 1, 0);
        v130.ClientVersionLabel.TextScaled = not (l_game_EngineFeature_0 or v130.ClientVersionLabel.TextFits);
        v130.PlaceVersionLabel = v13:Create("TextLabel")({
            Name = "PlaceVersionLabel", 
            Parent = v130.VersionContainer, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v25.textSize(if not v9 then v13:IsSmallTouchScreen() and 14 or 20 else 28), 
            Text = "Place Version: ...", 
            Font = v25.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        l_ClientVersionLabel_0 = function()
            local v300 = "Place Version: ";
            if v110 then
                if v111 then
                    local l_status_6, l_result_6 = pcall(v111.FormatByKey, v111, "InGame.HelpMenu.Label.PlaceVersion");
                    v300 = not l_status_6 and "Place Version: " or l_result_6;
                else
                    v300 = "Place Version: ";
                end;
            end;
            local l_PlaceVersionLabel_0 = v130.PlaceVersionLabel;
            local l_v300_0 = v300;
            local v305;
            if not v39() then
                local l_PlaceVersion_1 = game.PlaceVersion;
                do
                    local l_l_PlaceVersion_1_0 = l_PlaceVersion_1;
                    pcall(function()
                        l_l_PlaceVersion_1_0 = string.format("%s (Latest: %d)", l_l_PlaceVersion_1_0, l_HttpService_0:JSONDecode((l_HttpRbxApiService_0:GetAsync(string.format("assets/%d/versions", game.PlaceId))))[1].VersionNumber);
                    end);
                    v305 = l_l_PlaceVersion_1_0;
                end;
            else
                v305 = game.PlaceVersion;
            end;
            l_PlaceVersionLabel_0.Text = l_v300_0 .. v305;
            l_PlaceVersionLabel_0 = v130.PlaceVersionLabel;
            l_PlaceVersionLabel_0.Size = not not l_game_EngineFeature_0 and UDim2.new(0, l_PlaceVersionLabel_0.TextBounds.X + 6, 0, v30) or UDim2.new(0.2, -6, 1, 0);
            v130.PlaceVersionLabel.TextScaled = not (l_game_EngineFeature_0 or v130.PlaceVersionLabel.TextFits);
        end;
        game:GetPropertyChangedSignal("PlaceVersion"):Connect(l_ClientVersionLabel_0);
        spawn(l_ClientVersionLabel_0);
        if not v15:IsSubjectToChinaPolicies() then
            v130.EnvironmentLabel = v13:Create("TextLabel")({
                Name = "EnvironmentLabel", 
                Parent = v130.VersionContainer, 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                LayoutOrder = 4, 
                TextSize = v25.textSize(if not v9 then v13:IsSmallTouchScreen() and 14 or 20 else 28), 
                Text = l_BaseUrl_0, 
                Font = v25.font(Enum.Font.SourceSans, "SettingsHub"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 5, 
                Visible = v81
            });
            local l_EnvironmentLabel_0 = v130.EnvironmentLabel;
            l_EnvironmentLabel_0.Size = not not l_game_EngineFeature_0 and UDim2.new(0, l_EnvironmentLabel_0.TextBounds.X + 6, 0, v30) or UDim2.new(0.2, -6, 1, 0);
            v130.EnvironmentLabel.TextScaled = not (l_game_EngineFeature_0 or v130.EnvironmentLabel.TextFits);
        end;
        if game:GetEngineFeature("GetPlaySessionIdEnabled") then
            local l_game_PlaySessionId_0 = game:GetPlaySessionId();
            if l_game_PlaySessionId_0 ~= "" then
                local v310 = "PlaySessionId: " .. l_game_PlaySessionId_0;
                if v111 then
                    v310 = v111:FormatByKey("InGame.HelpMenu.Label.PlaySessionId", {
                        RBX_STR = l_game_PlaySessionId_0
                    });
                end;
                v130.PlaySessionIdLabel = v13:Create("TextLabel")({
                    Name = "PlaySessionIdLabel", 
                    Parent = v130.VersionContainer, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 5, 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextSize = v25.textSize(if not v9 then v13:IsSmallTouchScreen() and 14 or 20 else 28), 
                    Text = v310, 
                    Font = v25.font(Enum.Font.SourceSans, "SettingsHub"), 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    ZIndex = 5
                });
                local l_PlaySessionIdLabel_0 = v130.PlaySessionIdLabel;
                l_PlaySessionIdLabel_0.Size = not not l_game_EngineFeature_0 and UDim2.new(0, l_PlaySessionIdLabel_0.TextBounds.X + 6, 0, v30) or UDim2.new(0.2, -6, 1, 0);
                v130.PlaySessionIdLabel.TextScaled = not v130.PlaySessionIdLabel.TextFits;
            end;
        end;
        local function v325()
            local l_StarterPlayerScripts_0 = l_StarterPlayer_0:WaitForChild("StarterPlayerScripts");
            local l_PlayerScriptsLoader_0 = l_StarterPlayerScripts_0:FindFirstChild("PlayerScriptsLoader");
            local l_PlayerModule_0 = l_StarterPlayerScripts_0:FindFirstChild("PlayerModule");
            if (not l_PlayerModule_0 or not l_PlayerScriptsLoader_0) or l_PlayerModule_0.Archivable then
                local l_CameraScript_0 = l_StarterPlayerScripts_0:FindFirstChild("CameraScript");
                local l_ControlScript_0 = l_StarterPlayerScripts_0:FindFirstChild("ControlScript");
                if not l_CameraScript_0 and not l_ControlScript_0 then
                    if not v110 then
                        return "Custom";
                    elseif v111 then
                        local l_status_7, l_result_7 = pcall(v111.FormatByKey, v111, "InGame.CommonUI.Label.Custom");
                        if not l_status_7 then
                            return "Custom";
                        else
                            return l_result_7;
                        end;
                    else
                        return "Custom";
                    end;
                elseif not v110 then
                    return "Custom Old";
                elseif v111 then
                    local l_status_8, l_result_8 = pcall(v111.FormatByKey, v111, "InGame.CommonUI.Label.CustomOld");
                    if not l_status_8 then
                        return "Custom Old";
                    else
                        return l_result_8;
                    end;
                else
                    return "Custom Old";
                end;
            elseif not l_PlayerScriptsLoader_0.Archivable then
                if not v110 then
                    return "Default";
                elseif v111 then
                    local l_status_9, l_result_9 = pcall(v111.FormatByKey, v111, "InGame.CommonUI.Label.Default");
                    if not l_status_9 then
                        return "Default";
                    else
                        return l_result_9;
                    end;
                else
                    return "Default";
                end;
            elseif not v110 then
                return "Possibly Custom";
            elseif v111 then
                local l_status_10, l_result_10 = pcall(v111.FormatByKey, v111, "InGame.CommonUI.Label.PossiblyCustom");
                if not l_status_10 then
                    return "Possibly Custom";
                else
                    return l_result_10;
                end;
            else
                return "Possibly Custom";
            end;
        end;
        v130.OverridesPlayerScriptsLabel = v13:Create("TextLabel")({
            Name = "OverridesPlayerScriptsLabel", 
            Parent = v130.VersionContainer, 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            LayoutOrder = 5, 
            TextSize = v25.textSize(if not v9 then v13:IsSmallTouchScreen() and 14 or 20 else 28), 
            Text = "PlayerScripts: ", 
            Font = v25.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5, 
            Visible = false
        });
        spawn(function()
            local v326 = require(l_RobloxGui_0.Modules.PlayerPermissionsModule);
            if not l_Players_0.LocalPlayer then
                l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            end;
            local v327 = "PlayerScripts: ";
            if v110 then
                if v111 then
                    local l_status_11, l_result_11 = pcall(v111.FormatByKey, v111, "InGame.HelpMenu.Label.PlayerScripts");
                    v327 = not l_status_11 and "PlayerScripts: " or l_result_11;
                else
                    v327 = "PlayerScripts: ";
                end;
            end;
            local v330 = v325();
            l_RbxAnalyticsService_0:setRBXEventStream(l_Constants_0.AnalyticsTargetName, "player_scripts_status", "player_scripts_status_action", {
                defaultPlayerScripts = v330 == "Default", 
                placeID = tostring(game.PlaceId), 
                rawValue = if not v40() then nil else v330, 
                context = if not v40() then nil else "IGMv1"
            });
            v130.OverridesPlayerScriptsLabel.Text = v327 .. v330;
            v130.OverridesPlayerScriptsLabel.Visible = v81 or v326.IsPlayerAdminAsync(l_Players_0.LocalPlayer);
            local l_OverridesPlayerScriptsLabel_0 = v130.OverridesPlayerScriptsLabel;
            l_OverridesPlayerScriptsLabel_0.Size = not not l_game_EngineFeature_0 and UDim2.new(0, l_OverridesPlayerScriptsLabel_0.TextBounds.X + 6, 0, v30) or UDim2.new(0.2, -6, 1, 0);
            v130.OverridesPlayerScriptsLabel.TextScaled = not (l_game_EngineFeature_0 or v130.OverridesPlayerScriptsLabel.TextFits);
        end);
        if l_game_EngineFeature_0 then
            local v332 = "Client CoreScript Version: ";
            if v110 then
                if v111 then
                    local l_status_12, l_result_12 = pcall(v111.FormatByKey, v111, "InGame.HelpMenu.Label.ClientCoreScriptVersion");
                    v332 = not l_status_12 and "Client CoreScript Version: " or l_result_12;
                else
                    v332 = "Client CoreScript Version: ";
                end;
            end;
            v130.CoreScriptVersionLabel = v13:Create("TextLabel")({
                Name = "CoreScriptVersionLabel", 
                Parent = v130.VersionContainer, 
                LayoutOrder = 6, 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                TextSize = v25.textSize(if not v9 then v13:IsSmallTouchScreen() and 14 or 20 else 28), 
                Text = v332 .. l_RunService_0:GetCoreScriptVersion(), 
                Font = v25.font(Enum.Font.SourceSans, "SettingsHub"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 5
            });
            local l_CoreScriptVersionLabel_0 = v130.CoreScriptVersionLabel;
            l_CoreScriptVersionLabel_0.Size = not not l_game_EngineFeature_0 and UDim2.new(0, l_CoreScriptVersionLabel_0.TextBounds.X + 6, 0, v30) or UDim2.new(0.2, -6, 1, 0);
            l_CoreScriptVersionLabel_0 = v130.VersionContainer;
            local l_l_CoreScriptVersionLabel_0_0 = l_CoreScriptVersionLabel_0 --[[ copy: 13 -> 22 ]];
            v284:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                l_l_CoreScriptVersionLabel_0_0.CanvasSize = UDim2.new(0, v284.AbsoluteContentSize.X, 0, v30);
            end);
        end;
        v130.Modal = v13:Create("TextButton")({
            Name = "Modal", 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, -1), 
            Size = UDim2.new(1, 0, 1, 0), 
            Modal = true, 
            Text = "", 
            Parent = v130.Shield, 
            Selectable = false
        });
        if v25.EnableDarkenBackground then
            v130.DarkenBackground = v13:Create("Frame")({
                Name = "DarkenBackground", 
                ZIndex = v130.Shield.ZIndex - 1, 
                BackgroundTransparency = 1, 
                BackgroundColor3 = v25.color("DarkenBackground"), 
                Size = UDim2.new(1, 0, 1, 0), 
                Parent = v130.ClippingShield
            });
        end;
        local v337 = v25.MenuContainerPosition();
        v130.MenuContainer = v13:Create(v282)({
            Name = "MenuContainer", 
            ZIndex = v130.Shield.ZIndex, 
            BackgroundTransparency = v25.transparency("MenuContainer", 1), 
            BackgroundColor3 = v25.color("MenuContainer"), 
            Position = v337.Position, 
            Size = v337.Size, 
            AnchorPoint = v337.AnchorPoint, 
            AutomaticSize = v337.AutomaticSize, 
            Parent = v130.Shield
        });
        v130.MenuContainerPadding = v13:Create("UIPadding")({
            Parent = v130.MenuContainer
        });
        if not v9 then
            local l_Y_0 = l_GuiService_0:GetGuiInset().Y;
            if not (not v44 and (not v45() or v103.enabled())) then
                l_Y_0 = 0;
            end;
            v130.MenuContainerPadding.PaddingTop = UDim.new(0, l_Y_0);
        end;
        local l_MenuContainer_0 = v130.MenuContainer;
        if v25.UIBloxThemeEnabled then
            local v340 = v25.HubPadding();
            v130.MenuContainer.AutoButtonColor = false;
            v130.MenuContainerPadding.PaddingLeft = v340.PaddingLeft;
            v130.MenuContainerPadding.PaddingRight = v340.PaddingRight;
            v130.MenuContainerPadding.PaddingBottom = v340.PaddingBottom;
            v130.MenuContainerPadding.PaddingTop = v340.PaddingTop;
            v13:Create("UICorner")({
                CornerRadius = v25.MenuContainerCornerRadius, 
                Parent = v130.MenuContainer
            });
            if v25.EnableVerticalBottomBar then
                v130.MainColumn = v13:Create("Frame")({
                    Name = "MainColumn", 
                    BackgroundTransparency = 1, 
                    Position = v337.Position, 
                    Size = v337.Size, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Parent = v130.MenuContainer
                });
                l_MenuContainer_0 = v130.MainColumn;
                v130.VerticalMenuDivider = v13:Create("Frame")({
                    Name = "VerticalMenuDivider", 
                    BackgroundTransparency = v25.transparency("Divider"), 
                    BackgroundColor3 = v25.color("Divider"), 
                    Size = UDim2.new(0, 1, 1, -100), 
                    Visible = true, 
                    Parent = v130.MenuContainer
                });
                v130.VerticalMenu = v13:Create("Frame")({
                    Name = "VerticalMenu", 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v25.VerticalMenuWidth, 0, 100), 
                    Visible = false, 
                    Parent = v130.MenuContainer
                });
                v13:Create("UIListLayout")({
                    Name = "MenuListLayout", 
                    Padding = UDim.new(0, 10), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Parent = v130.VerticalMenu
                });
                v130.MenuListLayout = v13:Create("UIListLayout")({
                    Name = "MenuListLayout", 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Parent = v130.MenuContainer
                });
            end;
        end;
        if v44 then
            if not v25.UIBloxThemeEnabled then
                v130.permissionsButtonsRoot = v10.mount(v280(true), v130.MenuContainer, "PermissionsButtons");
            else
                v130.permissionsButtonsRoot = v10.mount(v280(true), v130.Shield, "PermissionsButtons");
            end;
        end;
        v130.MenuListLayout = v13:Create("UIListLayout")({
            Name = "MenuListLayout", 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = if not v25.UIBloxThemeEnabled then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Parent = l_MenuContainer_0
        });
        v130.MenuAspectRatio = v13:Create("UIAspectRatioConstraint")({
            Name = "MenuAspectRatio", 
            AspectRatio = 1.3333333333333333, 
            AspectType = Enum.AspectType.ScaleWithParentSize, 
            Parent = if not v25.UIBloxThemeEnabled then l_MenuContainer_0 else nil
        });
        if not v25.UIBloxThemeEnabled then
            v130.HubBar = v13:Create("ImageLabel")({
                Name = "HubBar", 
                ZIndex = v130.Shield.ZIndex + 1, 
                BorderSizePixel = 0, 
                BackgroundColor3 = Color3.new(0.3058823529411765, 0.32941176470588235, 0.3764705882352941), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuBackground.png", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(4, 4, 6, 6), 
                AnchorPoint = Vector2.new(0.5, 0), 
                LayoutOrder = 0, 
                Parent = l_MenuContainer_0
            });
        else
            v130.HubBar = v13:Create("ImageLabel")({
                Name = "HubBar", 
                BackgroundColor3 = v25.color("HubBarContainer"), 
                BackgroundTransparency = v25.transparency("HubBarContainerTransparency"), 
                ZIndex = v130.Shield.ZIndex + 1, 
                BorderSizePixel = 0, 
                AnchorPoint = Vector2.new(0.5, 0), 
                LayoutOrder = 0, 
                Parent = l_MenuContainer_0
            });
            v13:Create("Frame")({
                BackgroundColor3 = v25.color("Divider"), 
                BackgroundTransparency = v25.transparency("Divider"), 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                Parent = v130.HubBar
            });
        end;
        v130.HubBarListLayout = v13:Create("UIListLayout")({
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Parent = v130.HubBar
        });
        if v46() then
            v130.BackBarRef = v10.createRef();
            v130.BackBar = v10.createElement(v20.Provider, {
                value = l_IXPService_0
            }, {
                v10.createElement(v19, {
                    BackBarRef = v130.BackBarRef, 
                    HubBar = v130.HubBar
                })
            });
            v10.mount(v130.BackBar, l_MenuContainer_0, "BackBar");
        end;
        if not v13:IsSmallTouchScreen() then
            if not v9 then
                v130.HubBar.Size = UDim2.new(0, 800, 0, 60);
                v130.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0);
            else
                v130.HubBar.Size = UDim2.new(0, 1200, 0, 100);
                v130.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0);
            end;
        else
            if not v25.UIBloxThemeEnabled then
                v130.HubBar.Size = UDim2.new(1, -10, 0, 40);
            else
                v130.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 100, 0, 50);
            end;
            v130.HubBar.Position = UDim2.new(0.5, 0, 0, 6);
        end;
        v130.VoiceRecordingIndicatorFrame = if not v45() or v44 then nil else v13:Create("Frame")({
            Size = if not not v55() and v47 then UDim2.new(1, 0, 0, 100) else UDim2.fromOffset(0, 100), 
            Position = UDim2.new(0, 0, 0, 0), 
            Parent = v130.HubBar, 
            BackgroundTransparency = 1
        });
        v130.VoiceRecordingText = if not v45() then nil else v13:Create("TextLabel")({
            Parent = v130.VoiceRecordingIndicatorFrame, 
            Text = "", 
            Visible = false, 
            Position = UDim2.new(0, 60, 0, 0), 
            TextSize = 12, 
            Font = l_AppFonts_0.default:getMedium(), 
            Size = UDim2.fromScale(1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            BackgroundTransparency = 1
        });
        if v45() then
            if not v13:IsSmallTouchScreen() then
                if not v9 then
                    v130.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1);
                    if not v55() or not v47 then
                        v130.VoiceRecordingText.Size = UDim2.new(0, 800, 0, 60);
                        v130.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0);
                    else
                        v130.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                        v130.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 60);
                        v130.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0);
                    end;
                else
                    v130.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1);
                    if not v55() or not v47 then
                        v130.VoiceRecordingText.Size = UDim2.new(0, 1200, 0, 100);
                        v130.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0);
                    else
                        v130.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                        v130.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 100);
                        v130.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0);
                    end;
                end;
            else
                v130.VoiceRecordingText.Size = UDim2.fromScale(1, 1);
                v130.VoiceRecordingText.AnchorPoint = Vector2.new(0, 0);
                if not v55() or not v47 then
                    v130.VoiceRecordingText.Position = UDim2.new(0, 60, 0, -60);
                else
                    v130.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                    v130.VoiceRecordingText.Position = UDim2.new(0, 0, 0, -60);
                end;
            end;
            v130.voiceRecordingIndicatorTextMotor = v12.createSingleMotor(0);
            v130.voiceRecordingIndicatorTextMotor:onStep(function(v341)
                v130.VoiceRecordingText.TextTransparency = v341;
            end);
            spawn(function()
                l_RunService_0:BindToRenderStep("VoiceRecordingIndicator", 1, function()
                    if not (not ((v130.isMuted ~= nil and v130.lastVoiceRecordingIndicatorTextUpdated ~= nil) and tick() - v130.lastVoiceRecordingIndicatorTextUpdated >= 5) or not v130.isMuted) then
                        v130.voiceRecordingIndicatorTextMotor:setGoal(v12.spring(1, v109));
                        v130.voiceRecordingIndicatorTextMotor:start();
                    end;
                end);
            end);
        end;
        v130.PageViewClipper = v13:Create("Frame")({
            Name = "PageViewClipper", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(v130.HubBar.Size.X.Scale, v130.HubBar.Size.X.Offset, 1, (-v130.HubBar.Size.Y.Offset - v130.HubBar.Position.Y.Offset) - v281), 
            Position = UDim2.new(v130.HubBar.Position.X.Scale, v130.HubBar.Position.X.Offset, v130.HubBar.Position.Y.Scale, (v130.HubBar.Position.Y.Offset + v130.HubBar.Size.Y.Offset) + 1), 
            AnchorPoint = Vector2.new(0.5, 0), 
            ClipsDescendants = true, 
            LayoutOrder = 1, 
            Parent = l_MenuContainer_0; 
            v13:Create("ImageButton")({
                Name = "InputCapture", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = ""
            })
        });
        v130.PageView = v13:Create("ScrollingFrame")({
            Name = "PageView", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = if not v25.UIBloxThemeEnabled then UDim2.new(0.5, 0, 0.5, 0) else UDim2.new(0.5, 0, 0.5, 2), 
            Size = UDim2.new(1, 0, 1, -20), 
            CanvasSize = UDim2.new(1, 0, 1, 0), 
            ZIndex = v130.Shield.ZIndex, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Selectable = false, 
            ScrollBarThickness = v25.DefaultScrollBarThickness, 
            Parent = v130.PageViewClipper
        });
        v130.PageView.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar;
        v130.lastPageViewCanvasPosition = v130.PageView.CanvasPosition;
        v130.handelPageViewScroll = function()
            local v342 = math.clamp(v130.lastPageViewCanvasPosition.Y, 0, v130.PageView.MaxCanvasPosition.Y);
            local v343 = math.clamp(v130.PageView.CanvasPosition.Y, 0, v130.PageView.MaxCanvasPosition.Y);
            local v344 = v342 - v343;
            if math.abs(v344) > 5 then
                if v344 < 0 then
                    v130:animateOutBottomBar();
                else
                    v130:animateInBottomBar();
                end;
                v130.lastPageViewCanvasPosition = Vector2.new(v130.PageView.CanvasPosition.x, v343);
            end;
        end;
        v130.pageViewScrollChangeCon = nil;
        if v25.UseStickyBar() then
            v130.PageView.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            if v13:IsPortrait() == false then
                v130.defaultPageViewClipperSize = nil;
                v130.showStickyBottomBar = true;
                v130.pageViewScrollChangeCon = v130.PageView:GetPropertyChangedSignal("CanvasPosition"):connect(v130.handelPageViewScroll);
            end;
        end;
        v130.PageViewInnerFrame = v13:Create("Frame")({
            Name = "PageViewInnerFrame", 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = v130.Shield.ZIndex, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Selectable = false, 
            Parent = v130.PageView, 
            LayoutOrder = 1
        });
        if v25.UIBloxThemeEnabled then
            v13:Create("UIPadding")({
                PaddingTop = UDim.new(0, 5), 
                Parent = v130.PageViewInnerFrame
            });
        end;
        v130.InnerCanvasGroupShow = v13:Create("CanvasGroup")({
            Name = "InnerCanvasGroupShow", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = 0, 
            Parent = v130.PageViewInnerFrame
        });
        v130.InnerCanvasGroupHide = v13:Create("CanvasGroup")({
            Name = "InnerCanvasGroupHide", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = 0, 
            Parent = v130.PageViewInnerFrame
        });
        if v25.UseStickyBar() then
            v130.PageView.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            v13:Create("UIListLayout")({
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Parent = v130.PageView
            });
            v130.PageViewInnerFrame.AutomaticSize = Enum.AutomaticSize.Y;
            v130.PageViewInnerFrame.ClipsDescendants = false;
        end;
        if l_UserInputService_0.MouseEnabled then
            v130.PageViewClipper.Size = UDim2.new(v130.HubBar.Size.X.Scale, v130.HubBar.Size.X.Offset, 0.5, -(v130.HubBar.Position.Y.Offset - v130.HubBar.Size.Y.Offset));
        end;
        v130.BottomButtonFrame = v13:Create("Frame")({
            Name = "BottomButtonFrame", 
            Size = v130.HubBar.Size, 
            Position = UDim2.new(0.5, -v130.HubBar.Size.X.Offset / 2, (1 - v130.HubBar.Position.Y.Scale) - v130.HubBar.Size.Y.Scale, -v130.HubBar.Position.Y.Offset - v130.HubBar.Size.Y.Offset), 
            ZIndex = v130.Shield.ZIndex + 1, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Parent = l_MenuContainer_0
        });
        if v25.UIBloxThemeEnabled then
            v130.BottomButtonFrame.Size = UDim2.new(1, 0, 0, 80);
            v130.MenuListLayout = v13:Create("UIListLayout")({
                Padding = UDim.new(0, 12), 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Parent = v130.BottomButtonFrame
            });
        end;
        local function v345()
            if v58 and v130:GetVisibility() == false then
                return ;
            else
                v130:AddToMenuStack(v130.Pages.CurrentPage);
                v130.HubBar.Visible = false;
                v149();
                v130:SwitchToPage(v130.LeaveGamePage, nil, 1, true);
                return ;
            end;
        end;
        local function v347(v346)
            v278(false);
            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
                source = if not v25.UIBloxThemeEnabled then l_Constants_0.AnalyticsResumeButtonSource else if v56() then v346 else l_Constants_0.AnalyticsResumeShieldSource
            });
        end;
        if v25.UIBloxThemeEnabled then
            v130.Shield.Activated:Connect(if not v56() then v347 else function()
                v347(l_Constants_0.AnalyticsResumeShieldSource);
            end);
        end;
        if v24.canNavigateHome then
            if not v25.UseIconButtons then
                v212("LeaveGame", "Leave", v240, "rbxasset://textures/ui/Settings/Help/LeaveIcon.png", UDim2.new(0.5, not v9 and -130 or -160, 0.5, -25), v345, {
                    Enum.KeyCode.L, 
                    Enum.KeyCode.ButtonX
                }, v345);
            else
                v192("LeaveGame", "icons/actions/leave", "Leave", v240, "rbxasset://textures/ui/Settings/Help/LeaveIcon.png", UDim2.new(0.5, not v9 and -130 or -160, 0.5, -25), v345, {
                    Enum.KeyCode.L, 
                    Enum.KeyCode.ButtonX
                });
            end;
        end;
        local function v348()
            if v269 then
                v130:AddToMenuStack(v130.Pages.CurrentPage);
                v130.HubBar.Visible = false;
                v149();
                v130:SwitchToPage(v130.ResetCharacterPage, nil, 1, true);
            end;
        end;
        if not v25.UseIconButtons then
            v212("ResetCharacter", "Reset Character", v241, "rbxasset://textures/ui/Settings/Help/ResetIcon.png", UDim2.new(0.5, not v9 and -400 or -550, 0.5, -25), v348, {
                Enum.KeyCode.R, 
                Enum.KeyCode.ButtonY
            }, v348);
        else
            v192("ResetCharacter", "icons/actions/respawn", "Reset Character", v241, "rbxasset://textures/ui/Settings/Help/ResetIcon.png", UDim2.new(0.5, not v9 and -400 or -550, 0.5, -25), v348, {
                Enum.KeyCode.R, 
                Enum.KeyCode.ButtonY
            });
        end;
        v212("Resume", "Resume", v239, "rbxasset://textures/ui/Settings/Help/EscapeIcon.png", UDim2.new(0.5, not v9 and 140 or 200, 0.5, -25), if not v56() then v347 else function()
            v347(l_Constants_0.AnalyticsResumeButtonSource);
        end, {
            Enum.KeyCode.ButtonB, 
            Enum.KeyCode.ButtonStart
        }, if not v56() then nil else function()
            v347(l_Constants_0.AnalyticsResumeGamepadSource);
        end);
        if not (not v25.UIBloxThemeEnabled and not l_isSubjectToDesktopPolicies_0()) then
            if not v25.UIBloxThemeEnabled then
                v130.HubBarContainer = v13:Create("ImageLabel")({
                    Name = "HubBarContainer", 
                    ZIndex = v130.Shield.ZIndex + 2, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuBackground.png", 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(4, 4, 6, 6), 
                    Size = UDim2.new(1, -70, 1, 0), 
                    Position = UDim2.new(0, 70, 0, 0), 
                    Parent = v130.HubBar
                });
            else
                v130.HubBarContainer = v13:Create("ImageLabel")({
                    Name = "HubBarContainer", 
                    ZIndex = v130.Shield.ZIndex + 2, 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v25.color("HubBarContainer"), 
                    BackgroundTransparency = v25.transparency("HubBarContainerTransparency"), 
                    Size = if not v25.ShowHomeButton then UDim2.new(1, 0, 1, 0) else UDim2.new(1, -70, 1, 0), 
                    Position = if not v25.ShowHomeButton then UDim2.new(0, 0, 0, 0) else UDim2.new(0, 70, 0, 0), 
                    Parent = v130.HubBar
                });
            end;
            v130.HubBar.ImageTransparency = 1;
            v130.HubBarListLayout.Parent = v130.HubBarContainer;
            if v25.ShowHomeButton then
                if not v25.UIBloxThemeEnabled then
                    v130.HubBarHomeButton = v13:Create("ImageButton")({
                        Name = "HubBarHomeButton", 
                        ZIndex = v130.Shield.ZIndex + 2, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuBackground.png", 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(4, 4, 6, 6), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Parent = v130.HubBar
                    });
                else
                    v130.HubBarHomeButton = v13:Create("ImageButton")({
                        Name = "HubBarHomeButton", 
                        ZIndex = v130.Shield.ZIndex + 2, 
                        BorderSizePixel = 0, 
                        AutoButtonColor = false, 
                        BackgroundColor3 = v25.color("HubBarHomeButton"), 
                        BackgroundTransparency = v25.transparency("HubBarHomeButtonTransparency"), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Parent = v130.HubBar
                    });
                    v13:Create("UICorner")({
                        CornerRadius = v25.DefaultCornerRadius, 
                        Parent = v130.HubBarHomeButton
                    });
                end;
                v130.HubBarHomeButtonAspectRatio = v13:Create("UIAspectRatioConstraint")({
                    AspectRatio = 1, 
                    DominantAxis = Enum.DominantAxis.Height, 
                    Parent = v130.HubBarHomeButton
                });
                v130.HubBarHomeButtonIcon = v13:Create("ImageLabel")({
                    Name = "HubBarHomeButtonIcon", 
                    ZIndex = v130.Shield.ZIndex + 3, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/Settings/MenuBarIcons/HomeTab.png", 
                    Size = UDim2.new(0.7, 0, 0.7, 0), 
                    Position = UDim2.new(0.16, 0, 0.18, 0), 
                    Parent = v130.HubBarHomeButton
                });
                v130.HubBarHomeButton:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                    local v349 = v130.HubBarHomeButton.AbsoluteSize.X + 10;
                    v130.HubBarContainer.Size = UDim2.new(1, -v349, 1, 0);
                    v130.HubBarContainer.Position = UDim2.new(0, v349, 0, 0);
                end);
                v130.HubBarHomeButton.MouseEnter:Connect(function()
                    if not v25.UIBloxThemeEnabled then
                        v130.HubBarHomeButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuSelection@2x.png";
                        return ;
                    else
                        v130.HubBarHomeButton.BackgroundColor3 = v25.color("HubBarHomeButtonHover");
                        v130.HubBarHomeButton.BackgroundTransparency = v25.transparency("HubBarHomeButtonTransparencyHover");
                        return ;
                    end;
                end);
                v130.HubBarHomeButton.MouseLeave:Connect(function()
                    if not v25.UIBloxThemeEnabled then
                        v130.HubBarHomeButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuBackground.png";
                        return ;
                    else
                        v130.HubBarHomeButton.BackgroundColor3 = v25.color("HubBarHomeButton");
                        v130.HubBarHomeButton.BackgroundTransparency = v25.transparency("HubBarHomeButtonTransparency");
                        return ;
                    end;
                end);
                v130.HubBarHomeButton.Activated:Connect(function()
                    v130:AddToMenuStack(v130.Pages.CurrentPage);
                    v130.HubBar.Visible = false;
                    v149();
                    v130:SwitchToPage(v130.LeaveGameToHomePage, nil, 1, true);
                end);
            end;
        end;
        if l_isSubjectToDesktopPolicies_0() then
            v130.FullScreenTitleBar = v86.mount({}, v130.Shield, "FullScreenTitleBar");
        end;
        local function v350()
            if v60 then
                v25.viewportResized();
            end;
            v13:FireOnResized();
        end;
        local v351 = nil;
        local function v353(v352)
            if v352 == "CurrentCamera" then
                if v60 then
                    v25.viewportResized();
                end;
                v13:FireOnResized();
                if v351 then
                    v351:disconnect();
                end;
                v351 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v350);
            end;
        end;
        if v60 then
            v25.viewportResized();
        end;
        v13:FireOnResized();
        if v351 then
            v351:disconnect();
        end;
        v351 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v350);
        if not (not v38() or not v252) then
            v250();
        end;
        workspace.Changed:Connect(v353);
    end;
    local function v361()
        local l_X_0 = v130.BottomButtonFrame.AbsoluteSize.X;
        local v356 = #v130.BottomBarButtons;
        if v356 == 4 then
            l_X_0 = (l_X_0 - 48) - 12;
            v356 = v356 - 1;
        end;
        local v357 = ((l_X_0 - (v356 - 1) * 12) - 12) / v356;
        for v358 = 1, #v130.BottomBarButtons do
            local v359 = v130.BottomBarButtons[v358];
            local v360 = v359[1];
            if v360 ~= "MuteButtonButton" then
                v130[v360].Size = UDim2.fromOffset(v357, v130[v359[1]].Size.Y.Offset);
            end;
        end;
    end;
    local function v378()
        local function _()
            if v130.BackBarRef:getValue() then
                return v130.BackBarRef:getValue().Visible;
            else
                return false;
            end;
        end;
        local v363 = v25.MenuContainerPosition();
        local v364 = 600;
        local l_y_0 = l_RobloxGui_0.AbsoluteSize.y;
        local v366 = 0.050000000000000044 * l_y_0;
        local v367 = v13:IsPortrait();
        if not v9 then
            if v13:IsSmallTouchScreen() then
                v366 = math.min(10, 0.010000000000000009 * l_y_0);
            end;
        else
            v364 = 800;
            v366 = 0.07 * l_y_0;
        end;
        v130.MenuContainer.Size = v363.Size;
        if v25.UIBloxThemeEnabled then
            v130.MenuContainer.Position = v363.Position;
            v130.MenuContainer.AnchorPoint = v363.AnchorPoint;
        end;
        local l_Offset_0 = v130.HubBar.Size.Y.Offset;
        local v369 = v366 * 2 + l_Offset_0 * 2;
        local v370 = ((not not v46() and if v130.BackBarRef:getValue() then v130.BackBarRef:getValue().Visible else false) and v130.BackBarRef:getValue()) and v130.BackBarRef:getValue().Size.Y.Offset or 0;
        local l_MenuContainer_1 = v130.MenuContainer;
        if v25.UIBloxThemeEnabled then
            l_MenuContainer_1 = nil;
            if v25.EnableVerticalBottomBar then
                v130.VerticalMenu.Visible = false;
                v130.VerticalMenuDivider.Visible = false;
                for v372 = 1, #v130.BottomBarButtonsComponents do
                    v130.BottomBarButtonsComponents[v372].Parent = v130.BottomButtonFrame;
                end;
            end;
        end;
        if not v367 then
            if not v9 then
                if not v13:IsSmallTouchScreen() then
                    v130.HubBar.Size = UDim2.new(0, 800, 0, 60);
                    v130.MenuAspectRatio.Parent = l_MenuContainer_1;
                    if v44 then
                        if v130.permissionsButtonsRoot then
                            v10.unmount(v130.permissionsButtonsRoot);
                        end;
                        v130.permissionsButtonsRoot = v10.mount(v280(false), v130.Shield, "PermissionsButtons");
                    end;
                else
                    if not v25.UIBloxThemeEnabled then
                        v130.HubBar.Size = UDim2.new(1, -10, 0, 40);
                    elseif not v25.EnableVerticalBottomBar then
                        v130.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60, 0, 52);
                    else
                        v130.VerticalMenu.Visible = true;
                        v130.VerticalMenuDivider.Visible = true;
                        for v373 = 1, #v130.BottomBarButtonsComponents do
                            v130.BottomBarButtonsComponents[v373].Parent = v130.VerticalMenu;
                        end;
                        v130.HubBar.Size = UDim2.new(0, (l_RobloxGui_0.AbsoluteSize.X - 60) - v25.VerticalMenuWidth, 0, 52);
                    end;
                    v130.MenuAspectRatio.Parent = nil;
                end;
            else
                v130.HubBar.Size = UDim2.new(0, 1200, 0, 100);
                v130.MenuAspectRatio.Parent = l_MenuContainer_1;
            end;
        else
            v130.MenuAspectRatio.Parent = nil;
            v130.HubBar.Position = UDim2.new(0.5, 0, 0, 10);
            if not v25.UIBloxThemeEnabled then
                v130.MenuContainer.Size = UDim2.new(1, 0, 1, 0);
                v130.HubBar.Size = UDim2.new(1, -20, 0, 40);
            else
                v130.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 40, 0, 54);
            end;
        end;
        if v25.UIBloxThemeEnabled then
            l_Offset_0 = if v25.AlwaysShowBottomBar() then v130.HubBar.Size.Y.Offset + v130.BottomButtonFrame.Size.Y.Offset else v130.HubBar.Size.Y.Offset;
            v369 = v366 * 2 + l_Offset_0;
            v370 = ((not not v46() and if v130.BackBarRef:getValue() then v130.BackBarRef:getValue().Visible else false) and v130.BackBarRef:getValue()) and v130.BackBarRef:getValue().Size.Y.Offset or 0;
        end;
        l_RunService_0.Heartbeat:wait();
        local v374 = nil or v130.Pages.CurrentPage;
        local v375;
        if not v13:IsPortrait() and not v13:IsSmallTouchScreen() then
            v375 = false;
            if v374 ~= nil then
                v375 = v374.ShouldShowBottomBar == true;
            end;
        else
            v375 = v25.AlwaysShowBottomBar();
        end;
        if not v375 then
            v149();
        else
            v143();
        end;
        v375 = (l_y_0 - v369) - v370;
        v374 = nil;
        if v367 then
            v374 = v375;
        elseif v364 < v375 then
            v374 = v364;
            v130.HubBar.Position = UDim2.new(v130.HubBar.Position.X.Scale, v130.HubBar.Position.X.Offset, 0.5, -v364 / 2 - v130.HubBar.Size.Y.Offset);
            if v130.BottomButtonFrame then
                v130.BottomButtonFrame.Position = UDim2.new(v130.BottomButtonFrame.Position.X.Scale, v130.BottomButtonFrame.Position.X.Offset, 0.5, v364 / 2);
            end;
        elseif v375 < 150 then
            v374 = 150;
            v130.HubBar.Position = UDim2.new(v130.HubBar.Position.X.Scale, v130.HubBar.Position.X.Offset, 0.5, -75 - v130.HubBar.Size.Y.Offset);
            if v130.BottomButtonFrame then
                v130.BottomButtonFrame.Position = UDim2.new(v130.BottomButtonFrame.Position.X.Scale, v130.BottomButtonFrame.Position.X.Offset, 0.5, 75);
            end;
        else
            v374 = v375;
            v130.HubBar.Position = UDim2.new(v130.HubBar.Position.X.Scale, v130.HubBar.Position.X.Offset, 0, v366);
            if v130.BottomButtonFrame then
                v130.BottomButtonFrame.Position = UDim2.new(v130.BottomButtonFrame.Position.X.Scale, v130.BottomButtonFrame.Position.X.Offset, 1, -(v366 + l_Offset_0));
            end;
        end;
        local v376 = nil;
        if v9 then
            v376 = UDim2.new(0, v130.HubBar.AbsoluteSize.X, 0, v374);
        elseif not v13:IsSmallTouchScreen() then
            v376 = UDim2.new(0, v130.HubBar.AbsoluteSize.X, 0, v374);
        else
            local _ = 0;
            v376 = UDim2.new(0, v130.HubBar.AbsoluteSize.X, 0, v374 + if not v25.UIBloxThemeEnabled then (not not v46() and if v130.BackBarRef:getValue() then v130.BackBarRef:getValue().Visible else false) and 0 or 44 else 0);
        end;
        v130.PageViewClipper.Size = v376;
        v130.defaultPageViewClipperSize = v376;
        if v367 then
            v130.PageViewClipper.Position = UDim2.new(0.5, 0, 0, v130.HubBar.Position.Y.Offset + v130.HubBar.AbsoluteSize.Y);
        else
            v130.PageViewClipper.Position = UDim2.new(v130.PageViewClipper.Position.X.Scale, v130.PageViewClipper.Position.X.Offset, 0.5, -v374 / 2);
        end;
        if v130.VerticalMenu then
            v130.VerticalMenuDivider.Size = UDim2.new(0, 1, 0, v374 + v130.HubBar.Size.Y.Offset);
            v130.VerticalMenu.Size = UDim2.new(0, v25.VerticalMenuWidth, 0, v374 + v130.HubBar.Size.Y.Offset);
        end;
        if v25.UseStickyBar() then
            v130.resetPageViewClipperSize = true;
            v130.showStickyBottomBar = true;
            if v130.pageViewScrollChangeCon then
                v130.pageViewScrollChangeCon:disconnect();
                v130.pageViewScrollChangeCon = nil;
            end;
            if not v367 then
                v130.pageViewScrollChangeCon = v130.PageView:GetPropertyChangedSignal("CanvasPosition"):connect(v130.handelPageViewScroll);
            end;
            v361();
        end;
    end;
    local function _()
        v130.MenuContainer.BackgroundTransparency = v25.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
    end;
    local function v383(v380, v381, _)
        if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl) then
            if not (not (v380 == "Show Quick Profiler") or not v381) and v381 == Enum.UserInputState.Begin then
                l_GameSettings_0.PerformanceStatsVisible = not l_GameSettings_0.PerformanceStatsVisible;
            end;
            return ;
        else
            return ;
        end;
    end;
    local function v387(v384, v385, _)
        if not (not (v384 == "Open Dev Console") or not v385) and v385 == Enum.UserInputState.Begin then
            v82:ToggleVisibility();
        end;
    end;
    local l_v9_0 = v9;
    local v389 = {
        [Enum.UserInputType.Gamepad1] = true, 
        [Enum.UserInputType.Gamepad2] = true, 
        [Enum.UserInputType.Gamepad3] = true, 
        [Enum.UserInputType.Gamepad4] = true, 
        [Enum.KeyCode.Left] = true, 
        [Enum.KeyCode.Right] = true, 
        [Enum.KeyCode.Up] = true, 
        [Enum.KeyCode.Down] = true, 
        [Enum.KeyCode.Tab] = true, 
        [Enum.UserInputType.Touch] = false, 
        [Enum.UserInputType.MouseButton1] = false, 
        [Enum.UserInputType.MouseButton2] = false
    };
    l_UserInputService_0.InputBegan:connect(function(v390)
        if v390.UserInputType and v389[v390.UserInputType] ~= nil then
            l_v9_0 = v389[v390.UserInputType];
            return ;
        else
            if not (not v390.KeyCode or not v389[v390.KeyCode]) then
                l_v9_0 = v389[v390.KeyCode];
            end;
            return ;
        end;
    end);
    l_UserInputService_0.InputChanged:connect(function(v391)
        if not (v391.KeyCode ~= Enum.KeyCode.Thumbstick1) or v391.KeyCode == Enum.KeyCode.Thumbstick2 then
            if v391.Position.magnitude >= 0.25 then
                l_v9_0 = true;
                return ;
            end;
        elseif not (v391.UserInputType ~= Enum.UserInputType.Touch) or v391.UserInputType == Enum.UserInputType.MouseMovement then
            l_v9_0 = false;
        end;
    end);
    local v392 = nil;
    local function v400(v393, v394)
        local v395 = v392(v130.Pages.CurrentPage);
        if v395 < 0 then
            return ;
        else
            local v396 = v395 + v393;
            if v394 then
                if #v130.TabHeaders < v396 then
                    v396 = 1;
                elseif v396 < 1 then
                    v396 = #v130.TabHeaders;
                end;
            end;
            local v397 = v130.TabHeaders[v396];
            if v397 then
                for v398, _ in pairs(v130.Pages.PageTable) do
                    if v398:GetTabHeader() == v397 then
                        v130:SwitchToPage(v398, true, v393);
                        return ;
                    end;
                end;
            end;
            return ;
        end;
    end;
    local function v405(_, v402, v403)
        if v402 ~= Enum.UserInputState.Begin then
            return ;
        else
            local v404 = 0;
            if v403.KeyCode == Enum.KeyCode.ButtonR1 then
                v404 = 1;
            elseif v403.KeyCode == Enum.KeyCode.ButtonL1 then
                v404 = -1;
            end;
            v400(v404, true);
            return ;
        end;
    end;
    local function v408(v406)
        if v406.KeyCode == Enum.KeyCode.Tab then
            local _ = 0;
            v400((l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift)) and -1 or 1, true);
        end;
    end;
    local function v413(_, v410, v411)
        if v410 ~= Enum.UserInputState.Begin then
            return ;
        else
            local v412 = 0;
            if v411.KeyCode == Enum.KeyCode.PageUp then
                v412 = -100;
            elseif v411.KeyCode == Enum.KeyCode.PageDown then
                v412 = 100;
            end;
            v130:ScrollPixels(v412);
            return ;
        end;
    end;
    v354();
    if v106 then
        v268();
    end;
    v392 = function(v414)
        local l_v414_TabHeader_0 = v414:GetTabHeader();
        if l_v414_TabHeader_0 then
            for v416, v417 in pairs(v130.TabHeaders) do
                if v417 == l_v414_TabHeader_0 then
                    return v416;
                end;
            end;
            return -1;
        else
            return -1;
        end;
    end;
    local v418 = nil;
    v418 = function(v419, v420)
        if v420:IsA("GuiObject") then
            v420.ZIndex = v419;
            local l_v420_Children_0 = v420:GetChildren();
            for v422 = 1, #l_v420_Children_0 do
                v418(v419, l_v420_Children_0[v422]);
            end;
        end;
    end;
    local function v427(v423, v424)
        if v423 then
            table.insert(v130.TabHeaders, v423);
            v424.TabPosition = #v130.TabHeaders;
            local v425 = 1 / #v130.TabHeaders;
            for v426 = 1, #v130.TabHeaders do
                v130.TabHeaders[v426].Size = UDim2.new(v425, 0, 1, 0);
            end;
            v418(3, v423);
            if not v25.UIBloxThemeEnabled and not l_isSubjectToDesktopPolicies_0() then
                v423.Parent = v130.HubBar;
                return ;
            else
                v423.Parent = v130.HubBarContainer;
                return ;
            end;
        else
            return ;
        end;
    end;
    local function v433(v428)
        local v429 = nil;
        for v430 = 1, #v130.TabHeaders do
            if v130.TabHeaders[v430] == v428 then
                v429 = v430;
                table.remove(v130.TabHeaders, v430);
                break;
            end;
        end;
        if v429 then
            for v431 = v429, #v130.TabHeaders do
                local v432 = v130.TabHeaders[v431];
                v432.Position = UDim2.new(v432.Position.X.Scale, v432.Position.X.Offset - v428.AbsoluteSize.X, v432.Position.Y.Scale, v432.Position.Y.Offset);
            end;
        end;
        v428.Parent = nil;
    end;
    v130.AddPage = function(_, v435)
        v130.Pages.PageTable[v435] = true;
        v427(v435:GetTabHeader(), v435);
        v435.Page.Position = UDim2.new(v435.TabPosition - 1, 0, 0, 0);
    end;
    v130.RemovePage = function(_, v437)
        v130.Pages.PageTable[v437] = nil;
        v433(v437:GetTabHeader());
    end;
    v130.bottomBarAnimating = false;
    v130.defaultPageViewClipperSize = v130.PageViewClipper.Size;
    v130.showStickyBottomBar = true;
    v130.resetPageViewClipperSize = false;
    animateBottomBarComplete = function()
        if v130.resetPageViewClipperSize then
            v130.PageViewClipper.Size = v130.defaultPageViewClipperSize;
            v130.resetPageViewClipperSize = false;
        end;
        v130.bottomBarAnimating = false;
    end;
    v130.animateInBottomBar = function(_)
        if v130.bottomBarAnimating or v130.showStickyBottomBar == true then
            return ;
        else
            v130.bottomBarAnimating = true;
            v130.showStickyBottomBar = true;
            v130.resetPageViewClipperSize = false;
            v130.PageViewClipper:TweenSize(UDim2.new(v130.defaultPageViewClipperSize.X.Scale, v130.defaultPageViewClipperSize.X.Offset, v130.defaultPageViewClipperSize.Y.Scale, v130.defaultPageViewClipperSize.Y.Offset), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 0.3, true, animateBottomBarComplete);
            return ;
        end;
    end;
    v130.animateOutBottomBar = function(_)
        if v130.bottomBarAnimating or v130.showStickyBottomBar == false then
            return ;
        else
            v130.bottomBarAnimating = true;
            v130.showStickyBottomBar = false;
            v130.resetPageViewClipperSize = false;
            v130.PageViewClipper:TweenSize(UDim2.new(v130.defaultPageViewClipperSize.X.Scale, v130.defaultPageViewClipperSize.X.Offset, v130.defaultPageViewClipperSize.Y.Scale, v130.defaultPageViewClipperSize.Y.Offset + 80), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 0.3, true, animateBottomBarComplete);
            return ;
        end;
    end;
    v130.HideBar = function(_)
        v130.HubBar.Visible = false;
        v130.PageViewClipper.Visible = false;
        if v130.BottomButtonFrame then
            v149();
        end;
    end;
    v130.ShowBar = function(_)
        v130.HubBar.Visible = true;
        v130.PageViewClipper.Visible = true;
        if v130.BottomButtonFrame then
            local v442 = nil or v130.Pages.CurrentPage;
            local v443;
            if not v13:IsPortrait() and not v13:IsSmallTouchScreen() then
                v443 = false;
                if v442 ~= nil then
                    v443 = v442.ShouldShowBottomBar == true;
                end;
            else
                v443 = v25.AlwaysShowBottomBar();
            end;
            if v443 then
                v143();
            end;
        end;
    end;
    v130.ScrollPixels = function(_, v445)
        v130.PageView.CanvasPosition = Vector2.new(0, (math.max(0, (math.min(v130.PageView.CanvasPosition.Y + v445, v130.PageView.CanvasSize.Y.Offset - v130.PageViewClipper.AbsoluteSize.y)))));
    end;
    v130.ScrollToFrame = function(_, v447, v448)
        if not (not l_v9_0 and not v448) then
            local v449 = v447.AbsolutePosition.y - v130.Pages.CurrentPage.Page.AbsolutePosition.y;
            local v450 = v449 + v447.AbsoluteSize.y;
            if v449 < v130.PageView.CanvasPosition.y then
                v130.PageView.CanvasPosition = Vector2.new(0, v449);
                return ;
            elseif v130.PageViewClipper.Size.Y.Offset < v450 - v130.PageView.CanvasPosition.y then
                v130.PageView.CanvasPosition = Vector2.new(0, v450 - v130.PageViewClipper.Size.Y.Offset);
            end;
        end;
    end;
    v130.GetFirstPageWithTabHeader = function(_)
        local v452 = nil;
        for v453, _ in pairs(v130.Pages.PageTable) do
            if v453:GetTabHeader() ~= nil and v453.TabPosition == 1 then
                v452 = v453;
                break;
            end;
        end;
        if v452 == nil then
            error("No page with tab header found");
            return nil;
        else
            return v452;
        end;
    end;
    v130.InitInPage = function(_, v456)
        local l_TabPosition_0 = v456.TabPosition;
        for v458, _ in pairs(v130.Pages.PageTable) do
            if v458 ~= v456 then
                v458:Hide(-1, l_TabPosition_0, true, nil, v130.PageViewInnerFrame);
            end;
        end;
        if v130.BottomButtonFrame then
            local v460 = v456 or v130.Pages.CurrentPage;
            local v461;
            if not v13:IsPortrait() and not v13:IsSmallTouchScreen() then
                v461 = false;
                if v460 ~= nil then
                    v461 = v460.ShouldShowBottomBar == true;
                end;
            else
                v461 = v25.AlwaysShowBottomBar();
            end;
            if not v461 then
                v130.BottomButtonFrame.Visible = false;
            else
                v143();
            end;
            v130.HubBar.Visible = (v456 or v130.Pages.CurrentPage).ShouldShowBottomBar == true;
        end;
        local v462 = v456.IsPageClipped == true;
        v130.PageViewClipper.ClipsDescendants = v462;
        v130.PageView.ClipsDescendants = v462;
        if v25.UseStickyBar() == false then
            v130.PageViewInnerFrame.ClipsDescendants = v462;
        end;
        v130.Pages.CurrentPage = v456;
        v130.Pages.CurrentPage.Active = true;
        if v47 then
            v130.CurrentPageSignal:fire(not not v130.Pages.CurrentPage and v130.Pages.CurrentPage.Page.Name or nil);
        end;
        if v25.UseStickyBar() == false then
            v130.PageView.CanvasSize = UDim2.new(0, 0, 0, v130.Pages.CurrentPage:GetSize().Y);
            v132 = v130.Pages.CurrentPage.Page.Changed:connect(function(v463)
                if v463 == "AbsoluteSize" then
                    v130.PageView.CanvasSize = UDim2.new(0, 0, 0, v130.Pages.CurrentPage:GetSize().Y);
                end;
            end);
        end;
    end;
    v130.SwitchToPage = function(_, v465, v466, v467, v468, _, v470)
        if v130.Pages.PageTable[v465] == nil then
            return ;
        elseif v58 and v130:GetVisibility() == false then
            return ;
        else
            if v25.UIBloxThemeEnabled then
                local v471 = UDim.new(0, 0);
                local v472 = UDim.new(0, 0);
                local v473 = not (v13:IsPortrait() or v13:IsSmallTouchScreen()) or v25.AlwaysShowBottomBar();
                if not (not v130.HubBar or (v465 or v130.Pages.CurrentPage).ShouldShowBottomBar == true) then
                    v471 = UDim.new(0, v130.HubBar.AbsoluteSize.Y);
                end;
                if not (not v130.BottomButtonFrame or not v473) then
                    local v474 = v465 or v130.Pages.CurrentPage;
                    local v475;
                    if not v13:IsPortrait() and not v13:IsSmallTouchScreen() then
                        v475 = false;
                        if v474 ~= nil then
                            v475 = v474.ShouldShowBottomBar == true;
                        end;
                    else
                        v475 = v25.AlwaysShowBottomBar();
                    end;
                    if not v475 then
                        v472 = UDim.new(0, v130.BottomButtonFrame.AbsoluteSize.Y);
                    end;
                end;
                local v476 = v25.HubPadding();
                v130.MenuContainerPadding.PaddingLeft = v476.PaddingLeft;
                v130.MenuContainerPadding.PaddingRight = v476.PaddingRight;
                v130.MenuContainerPadding.PaddingBottom = v476.PaddingBottom + v472;
                v130.MenuContainerPadding.PaddingTop = v476.PaddingTop + v471;
                local v477 = v25.MenuContainerPosition();
                v130.MenuContainer.Position = v477.Position;
                v130.MenuContainer.Size = v477.Size;
                v130.MenuContainer.AnchorPoint = v477.AnchorPoint;
                if not ((not v130.VerticalMenu or v13:IsPortrait()) or not v13:IsSmallTouchScreen()) then
                    local v478 = (v465 or v130.Pages.CurrentPage).ShouldShowBottomBar == true;
                    v130.VerticalMenu.Visible = v478;
                    v130.VerticalMenuDivider.Visible = v478;
                    if not v478 then
                        v130.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60, 0, 52);
                    else
                        v130.HubBar.Size = UDim2.new(0, (l_RobloxGui_0.AbsoluteSize.X - 60) - v25.VerticalMenuWidth, 0, 52);
                    end;
                    local l_Size_0 = v130.PageViewClipper.Size;
                    v130.PageViewClipper.Size = UDim2.new(l_Size_0.X.Scale, v130.HubBar.Size.X.Offset, l_Size_0.Y.Scale, l_Size_0.Y.Offset);
                end;
            end;
            if not ((((not (v467 == nil) or not v130.Pages.CurrentPage) or not v130.Pages.CurrentPage.TabHeader) or not v465) or not v465.TabHeader) then
                v467 = v130.Pages.CurrentPage.TabHeader.AbsolutePosition.x < v465.TabHeader.AbsolutePosition.x and 1 or -1;
            end;
            if v467 == nil then
                v467 = 1;
            end;
            if v130.Pages.CurrentPage and v132 ~= nil then
                v132:disconnect();
                v130.Pages.CurrentPage.Active = false;
            end;
            local l_TabPosition_1 = v465.TabPosition;
            for v481, _ in pairs(v130.Pages.PageTable) do
                if v481 ~= v465 then
                    v481:Hide(-v467, l_TabPosition_1, v468, nil, v130.PageViewInnerFrame, v481 == v130.Pages.CurrentPage);
                end;
            end;
            if v130.BottomButtonFrame then
                local v483 = v465 or v130.Pages.CurrentPage;
                local v484;
                if not v13:IsPortrait() and not v13:IsSmallTouchScreen() then
                    v484 = false;
                    if v483 ~= nil then
                        v484 = v483.ShouldShowBottomBar == true;
                    end;
                else
                    v484 = v25.AlwaysShowBottomBar();
                end;
                if not v484 then
                    v130.BottomButtonFrame.Visible = false;
                else
                    v143();
                end;
                v130.HubBar.Visible = (v465 or v130.Pages.CurrentPage).ShouldShowBottomBar == true;
            end;
            local v485 = v465.IsPageClipped == true;
            v130.PageViewClipper.ClipsDescendants = v485;
            v130.PageView.ClipsDescendants = v485;
            v130.PageViewInnerFrame.ClipsDescendants = v485;
            v130.Pages.CurrentPage = v465;
            v130.Pages.CurrentPage:Display(v130.PageViewInnerFrame, v468);
            v130.Pages.CurrentPage.Active = true;
            if v47 then
                v130.CurrentPageSignal:fire(not not v130.Pages.CurrentPage and v130.Pages.CurrentPage.Page.Name or nil);
            end;
            if v25.UseStickyBar() == false then
                v130.PageView.CanvasSize = UDim2.new(0, 0, 0, v130.Pages.CurrentPage:GetSize().Y);
                v132 = v130.Pages.CurrentPage.Page.Changed:connect(function(v486)
                    if v486 == "AbsoluteSize" then
                        v130.PageView.CanvasSize = UDim2.new(0, 0, 0, v130.Pages.CurrentPage:GetSize().Y);
                    end;
                end);
                if not (not (v130.MenuStack[#v130.MenuStack] ~= v130.Pages.CurrentPage) or v466) then
                    v130.MenuStack[#v130.MenuStack + 1] = v130.Pages.CurrentPage;
                end;
            end;
            local v487 = {
                universeid = tostring(game.GameId)
            };
            if not (not v43() or not v470) then
                v487 = v11.Dictionary.join(v487, v470);
            end;
            if not v465 then
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_unknown_tab", l_Constants_0.AnalyticsMenuActionName, v487);
                return ;
            elseif v130.GameSettingsPage == v465 then
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_GameSettings_tab", l_Constants_0.AnalyticsMenuActionName, v487);
                return ;
            else
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_" .. v465.Page.Name .. "_tab", l_Constants_0.AnalyticsMenuActionName, v487);
                return ;
            end;
        end;
    end;
    v130.SetActive = function(_, v489)
        v130.Active = v489;
        if v130.Pages.CurrentPage then
            v130.Pages.CurrentPage.Active = v489;
        end;
    end;
    clearMenuStack = function()
        while v130.MenuStack and #v130.MenuStack > 0 do
            v130:PopMenu();
        end;
    end;
    setOverrideMouseIconBehavior = function()
        if not v41 or v130.Visible then
            if l_UserInputService_0:GetLastInputType() ~= Enum.UserInputType.Gamepad1 and not l_VRService_0.VREnabled then
                v17.push(v29, Enum.OverrideMouseIconBehavior.ForceShow);
                return ;
            else
                v17.push(v29, Enum.OverrideMouseIconBehavior.ForceHide);
                return ;
            end;
        else
            return ;
        end;
    end;
    v278 = function(v490, v491, v492, _, v494, v495)
        v130.OpenStateChangedCount = v130.OpenStateChangedCount + 1;
        local v496 = v490 ~= v130.Visible;
        v130.Visible = v490;
        if not ((not v33 or not v496) or v490) then
            v16.menuClose();
        end;
        if v130.ResizedConnection then
            v130.ResizedConnection:disconnect();
            v130.ResizedConnection = nil;
        end;
        if not (not v46() or not v130.BackBarVisibleConnection) then
            v130.BackBarVisibleConnection:disconnect();
            v130.BackBarVisibleConnection = nil;
        end;
        if v130.PreferredTransparencyChangedConnection then
            v130.PreferredTransparencyChangedConnection:disconnect();
            v130.PreferredTransparencyChangedConnection = nil;
        end;
        v130.Modal.Visible = v130.Visible;
        if v130.TabConnection then
            v130.TabConnection:disconnect();
            v130.TabConnection = nil;
        end;
        local v497 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
        if v103.enabled() then
            v130.Shield.BackgroundTransparency = 1;
            v130.createBackgroundFadeGui();
        end;
        if not v130.Visible then
            if v48() then
                v130.TakingScreenshot = v495 or false;
            end;
            if v47 then
                v130.CurrentPageSignal:fire("");
            end;
            if not v491 then
                local v498 = 0;
                local v499 = 0;
                if not v103.enabled() then
                    v498 = not l_Constants_0 and 0.4 or l_Constants_0.ShieldCloseAnimationTweenTime;
                else
                    v498 = not l_Constants_0 and 0.2 or l_Constants_0.ShieldCloseFadeTime2;
                    v499 = not l_Constants_0 and 0.25 or v498 + l_Constants_0.ShieldExtraFadeTime;
                end;
                local function v500()
                    v130.SettingsShowSignal:fire(v130.Visible);
                    if not v130.Visible then
                        l_GuiService_0:SetMenuIsOpen(false, "SettingsHub");
                    end;
                    if v33 then
                        v16.menuCloseComplete();
                    end;
                    if v103.enabled() then
                        clearMenuStack();
                        v130.GameSettingsPage:CloseSettingsPage();
                    end;
                end;
                if not l_GameSettings_0.ReducedMotion then
                    v130.Shield:TweenPosition(l_SHIELD_INACTIVE_POSITION_0, Enum.EasingDirection.In, Enum.EasingStyle.Quad, v498, true, function()
                        v130.Shield.Visible = v130.Visible;
                        v500();
                    end);
                else
                    if v61 then
                        if v130.ReducedMotionOpenTween then
                            v130.ReducedMotionOpenTween:Cancel();
                            v130.ReducedMotionOpenTween = nil;
                        end;
                        if v130.ReducedMotionCloseTween then
                            v130.ReducedMotionCloseTween:Cancel();
                            v130.ReducedMotionCloseTween = nil;
                        end;
                    end;
                    v130.Shield.Parent = v130.CanvasGroup;
                    v130.ReducedMotionCloseTween = l_TweenService_0:Create(v130.CanvasGroup, TweenInfo.new(0.25), {
                        GroupTransparency = 1
                    });
                    v130.ReducedMotionCloseTween:Play();
                    v130.ReducedMotionCloseTween.Completed:Connect(function()
                        v130.Shield.Position = l_SHIELD_INACTIVE_POSITION_0;
                        v130.Shield.Visible = v130.Visible;
                        v130.Shield.Parent = v130.ClippingShield;
                    end);
                    v500();
                end;
                if v130.DarkenBackground then
                    local v501 = TweenInfo.new(v498, Enum.EasingStyle.Quart, Enum.EasingDirection.Out);
                    if v130.DarkenBackgroundTween then
                        v130.DarkenBackgroundTween:Cancel();
                    end;
                    v130.DarkenBackgroundTween = l_TweenService_0:Create(v130.DarkenBackground, v501, {
                        BackgroundTransparency = 1
                    });
                    v130.DarkenBackgroundTween:Play();
                end;
                if v103.enabled() then
                    local v502 = l_TweenService_0:Create(v130.FullscreenBackgroundCover, TweenInfo.new(v499, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundTransparency = 1
                    });
                    v502.Completed:Connect(function()
                        v130.FullscreenGui.Enabled = false;
                        v130.FullscreenBackgroundCover.Visible = false;
                    end);
                    v502:Play();
                end;
            else
                v130.Shield.Position = l_SHIELD_INACTIVE_POSITION_0;
                v130.Shield.Visible = v130.Visible;
                v130.SettingsShowSignal:fire(v130.Visible);
                l_GuiService_0:SetMenuIsOpen(false, "SettingsHub");
                if v33 then
                    v16.menuCloseComplete();
                end;
                if v103.enabled() then
                    v130.FullscreenGui.Enabled = false;
                    v130.FullscreenBackgroundCover.Visible = false;
                end;
                if v130.DarkenBackground then
                    if v130.DarkenBackgroundTween then
                        v130.DarkenBackgroundTween:Cancel();
                        v130.DarkenBackgroundTween = nil;
                    end;
                    v130.DarkenBackground.BackgroundTransparency = 1;
                end;
            end;
            if v83 then
                v83:disconnect();
            end;
            if not (not v25.UseStickyBar() or not v130.pageViewScrollChangeCon) then
                v130.pageViewScrollChangeCon:disconnect();
                v130.pageViewScrollChangeCon = nil;
            end;
            v497:HideTemp("SettingsMenu", false);
            if v84 then
                v117:ToggleVisibility();
                v84 = false;
            end;
            if not l_VRService_0.VREnabled then
                v17.pop(v29);
            end;
            if not v103.enabled() then
                clearMenuStack();
            end;
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsHubSwitchTab");
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsHubStopCharacter");
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsScrollHotkey");
            v149(0.4);
            l_GuiService_0.SelectedCoreObject = nil;
            if not v103.enabled() then
                v130.GameSettingsPage:CloseSettingsPage();
            end;
            if not (not v42() or not v130.ShareGamePage) then
                v130.ShareGamePage:ClearShareInviteLink(v130.ShareGameApp);
            end;
        else
            if v48() then
                v130.TakingScreenshot = false;
            end;
            v130.ResizedConnection = l_RobloxGui_0.Changed:connect(function(v503)
                if v503 == "AbsoluteSize" then
                    v378();
                end;
            end);
            if not (not v46() or not v130.BackBarRef:getValue()) then
                v130.BackBarVisibleConnection = v130.BackBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function()
                    v378();
                end);
            end;
            v378();
            v130.PreferredTransparencyChangedConnection = l_GuiService_0:GetPropertyChangedSignal("PreferredTransparency"):connect(function()
                v130.MenuContainer.BackgroundTransparency = v25.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
            end);
            v130.MenuContainer.BackgroundTransparency = v25.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
            v130.SettingsShowSignal:fire(v130.Visible);
            l_GuiService_0:SetMenuIsOpen(true, "SettingsHub");
            v130.Shield.Visible = v130.Visible;
            if v25.UIBloxThemeEnabled then
                l_GuiService_0:CloseInspectMenu();
            end;
            if not (not v103.enabled() or l_UserInputService_0.VREnabled) then
                v130.FullscreenGui.Enabled = true;
                v130.FullscreenBackgroundCover.Visible = true;
                v130.FullscreenBackgroundCover.BackgroundTransparency = 1;
            end;
            if not v491 and v130.Shield:IsDescendantOf(game) then
                local v504 = 0;
                v504 = if not v103.enabled() then if l_Constants_0 then l_Constants_0.ShieldOpenAnimationTweenTime else 0.5 else if l_Constants_0 then l_Constants_0.ShieldOpenFadeTime2 else 0.3;
                if not l_GameSettings_0.ReducedMotion then
                    v130.Shield:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, v504, true, function()
                        if v33 then
                            v16.menuOpenComplete();
                        end;
                    end);
                else
                    if v61 then
                        if v130.ReducedMotionOpenTween then
                            v130.ReducedMotionOpenTween:Cancel();
                            v130.ReducedMotionOpenTween = nil;
                        end;
                        if v130.ReducedMotionCloseTween then
                            v130.ReducedMotionCloseTween:Cancel();
                            v130.ReducedMotionCloseTween = nil;
                        end;
                    end;
                    v130.Shield.Parent = v130.CanvasGroup;
                    v130.CanvasGroup.GroupTransparency = 1;
                    v130.Shield.Position = UDim2.new(0, 0, 0, 0);
                    v130.ReducedMotionOpenTween = l_TweenService_0:Create(v130.CanvasGroup, TweenInfo.new(0.25), {
                        GroupTransparency = 0
                    });
                    v130.ReducedMotionOpenTween:Play();
                    v130.ReducedMotionOpenTween.Completed:Connect(function()
                        v130.Shield.Parent = v130.ClippingShield;
                    end);
                    if v33 then
                        v16.menuOpenComplete();
                    end;
                end;
                if v130.DarkenBackground then
                    local v505 = TweenInfo.new(v504, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                    if v130.DarkenBackgroundTween then
                        v130.DarkenBackgroundTween:Cancel();
                    end;
                    v130.DarkenBackgroundTween = l_TweenService_0:Create(v130.DarkenBackground, v505, {
                        BackgroundTransparency = v25.transparency("DarkenBackground")
                    });
                    v130.DarkenBackgroundTween:Play();
                end;
                if not (not v103.enabled() or l_UserInputService_0.VREnabled) then
                    l_TweenService_0:Create(v130.FullscreenBackgroundCover, TweenInfo.new(v504, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        BackgroundTransparency = v27
                    }):Play();
                end;
            else
                v130.Shield.Position = UDim2.new(0, 0, 0, 0);
                if v130.DarkenBackground then
                    if v130.DarkenBackgroundTween then
                        v130.DarkenBackgroundTween:Cancel();
                        v130.DarkenBackgroundTween = nil;
                    end;
                    v130.DarkenBackground.BackgroundTransparency = v25.transparency("DarkenBackground");
                end;
            end;
            l_ContextActionService_0:BindCoreAction("RbxSettingsHubStopCharacter", function()
            end, false, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift, Enum.KeyCode.Tab, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            l_ContextActionService_0:BindCoreAction("RbxSettingsHubSwitchTab", v405, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1);
            l_ContextActionService_0:BindCoreAction("RbxSettingsScrollHotkey", v413, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown);
            local v506 = nil or v130.Pages.CurrentPage;
            local v507;
            if not v13:IsPortrait() and not v13:IsSmallTouchScreen() then
                v507 = false;
                if v506 ~= nil then
                    v507 = v506.ShouldShowBottomBar == true;
                end;
            else
                v507 = v25.AlwaysShowBottomBar();
            end;
            if v507 then
                v143();
            end;
            v130.TabConnection = l_UserInputService_0.InputBegan:connect(v408);
            setOverrideMouseIconBehavior();
            v83 = l_UserInputService_0.LastInputTypeChanged:connect(setOverrideMouseIconBehavior);
            if not (not l_UserInputService_0.MouseEnabled or l_VRService_0.VREnabled) then
                v17.push(v29, Enum.OverrideMouseIconBehavior.ForceShow);
            end;
            if not v492 then
                if not v57() then
                    v130:SwitchToPage(v130.PlayersPage, nil, 1, true);
                else
                    v130:SwitchToPage(v130:GetFirstPageWithTabHeader(), nil, 1, true);
                end;
            else
                v149();
                v130:SwitchToPage(v492, nil, 1, true);
            end;
            v497:HideTemp("SettingsMenu", true);
            if v117:GetVisibility() then
                v84 = true;
                v117:ToggleVisibility();
            end;
            v507 = require(l_RobloxGui_0.Modules.BackpackScript);
            if v507.IsOpen then
                v507:OpenClose();
            end;
            v130.GameSettingsPage:OpenSettingsPage();
        end;
        if v496 then
            if not v490 then
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsMenuCloseName, l_Constants_0.AnalyticsMenuActionName, {
                    source = v494
                });
            else
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsMenuOpenName, l_Constants_0.AnalyticsMenuActionName, {
                    source = v494
                });
                return ;
            end;
        end;
    end;
    v130.SetVisibility = function(_, v509, v510, v511, v512, v513, v514)
        if v130.Visible == v509 then
            return ;
        else
            v278(v509, v510, v511, v512, v513, v514);
            return ;
        end;
    end;
    v130.GetVisibility = function(_)
        return v130.Visible;
    end;
    v130.ToggleVisibility = function(_, v517, v518)
        v278(not v130.Visible, nil, nil, v517, v518);
    end;
    v130.AddToMenuStack = function(_, v520)
        if v130.MenuStack[#v130.MenuStack] ~= v520 then
            v130.MenuStack[#v130.MenuStack + 1] = v520;
        end;
    end;
    v130.InviteToGame = function(_)
        local v522 = false;
        if not (not v51() or not v49) then
            local v523 = l_GetFStringGameInviteMenuLayer_0();
            local l_v21_LayerData_0 = v21:GetLayerData(v523);
            v21:LogUserLayerExposure(v523);
            v522 = not not l_v21_LayerData_0 and (l_v21_LayerData_0.inExperienceGameInviteUXRefresh2023 == v95.UxRefresh or l_v21_LayerData_0.inExperienceGameInviteUXRefresh2023 == v95.InviteLimit);
        end;
        if (not game:GetEngineFeature("PlatformFriendsService") or not v75) or not v75:IsInviteFriendsEnabled() then
            if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
                if v74 then
                    v74:PopupGameInviteUI();
                    return ;
                end;
            elseif not v522 then
                v130:AddToMenuStack(v130.Pages.CurrentPage);
                v130:SwitchToPage(v130.ShareGamePage, nil, 1, true);
            else
                v130:ToggleVisibility();
                v94:openModal({
                    trigger = v96.Triggers.GameMenu
                });
                return ;
            end;
            return ;
        else
            v75:ShowInviteFriendsUI();
            return ;
        end;
    end;
    v130.PopMenu = function(_, _, v527)
        if v130.MenuStack and #v130.MenuStack > 0 then
            local v528 = v130.MenuStack[#v130.MenuStack];
            if type(v528) ~= "table" then
                l_BindableEvent_0:Fire(v528);
            end;
            table.remove(v130.MenuStack, #v130.MenuStack);
            v130:SwitchToPage(v130.MenuStack[#v130.MenuStack], true, 1, v527);
            if #v130.MenuStack == 0 then
                v130:SetVisibility(false);
                v130.Pages.CurrentPage:Hide(0, 0, nil, nil, v130.PageViewInnerFrame);
                return ;
            end;
        else
            v130.MenuStack = {};
            l_BindableEvent_0:Fire();
            v130:ToggleVisibility();
        end;
    end;
    v130.ShowShield = function(_)
        local _ = 0;
        v130.Shield.BackgroundTransparency = if not l_UserInputService_0.VREnabled then v103.enabled() and 1 or v27 else 1;
    end;
    v130.HideShield = function(_)
        v130.Shield.BackgroundTransparency = 1;
        if l_UserInputService_0.VREnabled then
            if not v54() then
                v130.FullscreenGui.Enabled = false;
            elseif v130.FullscreenGui then
                v130.FullscreenGui.Enabled = false;
                return ;
            end;
        end;
    end;
    local v532 = nil;
    local v533 = nil;
    local function v539()
        local v534 = require(l_RobloxGui_0.Modules.VR.VRHub);
        local v535 = require(l_RobloxGui_0.Modules.VR.Panel3D);
        local v536 = v535.Get("SettingsMenu");
        v536:ResizeStuds(4, 4, 250);
        v536:SetType(v535.Type.Standard);
        v536:SetVisible(false);
        v536:SetCanFade(false);
        v130.ClippingShield.Parent = v536:GetGUI();
        v130.Shield.Parent.ClipsDescendants = false;
        v130.VRShield.Visible = true;
        v130:HideShield();
        v532 = v130.SettingsShowSignal:connect(function(v537)
            if not v537 then
                v536:SetVisible(false);
                v534:FireModuleClosed("SettingsMenu");
                return ;
            else
                v536:SetVisible(true);
                v534:FireModuleOpened("SettingsMenu");
                return ;
            end;
        end);
        v534.ModuleOpened.Event:connect(function(v538)
            if v538 ~= "SettingsMenu" then
                v130:SetVisibility(false);
            end;
        end);
    end;
    local function v540()
        v130.ClippingShield.Parent = l_RobloxGui_0;
        v130.Shield.Parent.ClipsDescendants = true;
        v130.VRShield.Visible = false;
        v130:ShowShield();
        if v532 then
            v532:disconnect();
            v532 = nil;
        end;
        if v533 then
            v533:disconnect();
            v533 = nil;
        end;
        require(l_RobloxGui_0.Modules.VR.Panel3D).Get("SettingsMenu"):SetVisible(false);
    end;
    l_UserInputService_0.Changed:connect(function(v541)
        if v541 == "VREnabled" then
            if not l_UserInputService_0.VREnabled then
                v540();
            else
                v539();
                return ;
            end;
        end;
    end);
    if not l_UserInputService_0.VREnabled then
        v540();
    else
        v539();
    end;
    if not v34() then
        l_ContextActionService_0:BindCoreAction("RBXEscapeMainMenu", function(_, v543, _)
            if v543 ~= Enum.UserInputState.Begin then
                return ;
            else
                v130:PopMenu(false, true);
                return ;
            end;
        end, false, Enum.KeyCode.Escape);
    end;
    v130.ResetCharacterPage:SetHub(v130);
    if v24.canNavigateHome then
        v130.LeaveGamePage:SetHub(v130);
    end;
    v130.GameSettingsPage = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettings);
    v130.GameSettingsPage:SetHub(v130);
    v130.ReportAbusePage = require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage);
    v130.ReportAbusePage:SetHub(v130);
    if v35() then
        v130.ReportSentPage = require(l_RobloxGui_0.Modules.Settings.Pages.ReportSentPage);
        v130.ReportSentPage:SetHub(v130);
    end;
    v130.ReportSentPageV2 = require(l_RobloxGui_0.Modules.Settings.Pages.ReportSentPageV2);
    v130.ReportSentPageV2:SetHub(v130);
    v130.HelpPage = require(l_RobloxGui_0.Modules.Settings.Pages.Help);
    v130.HelpPage:SetHub(v130);
    local v545 = not v15:IsSubjectToChinaPolicies();
    if not (not (l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows) or not v545) then
        v130.RecordPage = require(l_RobloxGui_0.Modules.Settings.Pages.Record);
        v130.RecordPage:SetHub(v130);
    end;
    if v24.canListPeopleInSameServer then
        v130.PlayersPage = require(l_RobloxGui_0.Modules.Settings.Pages.Players);
        v130.PlayersPage:SetHub(v130);
    end;
    if l_isSubjectToDesktopPolicies_0() then
        v130.ExitModalPage = require(l_RobloxGui_0.Modules.Settings.Pages.ExitModal);
        v130.ExitModalPage:SetHub(v130);
    end;
    if not (not l_isSubjectToDesktopPolicies_0() or not v24.canNavigateHome) then
        v130.LeaveGameToHomePage = require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGameToHome);
        v130.LeaveGameToHomePage:SetHub(v130);
    end;
    if not (v9 or not v126({
        "Roact", 
        "Rodux", 
        "RoactRodux"
    })) then
        local l_CorePackages_2 = game:GetService("CorePackages");
        v130.ShareGameApp = require(l_RobloxGui_0.Modules.Settings.ShareGameMaster).createApp(v130.PageViewClipper, (l_GameInviteAnalytics_0.new():withEventStream((require(l_CorePackages_2.Workspace.Packages.Analytics).AnalyticsReporters.EventStream.new(l_RbxAnalyticsService_0))):withDiag(require(l_CorePackages_2.Workspace.Packages.Analytics).AnalyticsReporters.Diag.new(l_RbxAnalyticsService_0)):withButtonName(l_GameInviteAnalytics_0.ButtonName.SettingsHub)));
        v130.ShareGamePage = require(l_RobloxGui_0.Modules.Settings.Pages.ShareGamePlaceholderPage);
        v130.ShareGamePage:ConnectHubToApp(v130, v130.ShareGameApp);
        v130:AddPage(v130.ShareGamePage);
    end;
    local v547 = l_ScreenshotsPolicy_0.PolicyImplementation.read();
    if not not v547 and l_ScreenshotsPolicy_0.Mapper(v547).eligibleForCapturesFeature() then
        local v548 = require(l_RobloxGui_0.Modules.Settings.Pages.ShotsPageWrapper);
        local function v549()
            v130:SetVisibility(false, true);
        end;
        v130.ScreenshotsApp = v97;
        if not l_GetFFlagEnableScreenshotUtility_0() then
            v130.ScreenshotsApp.mountMenuPage(v548.Page, v549, v25);
        else
            v130.ScreenshotsApp.mountMenuPage(v548.Page, v549, v25, v47);
        end;
        v130.ShotsPage = v548;
        v130.ShotsPage:ConnectHubToApp(v130, v130.PageViewClipper, v130.ScreenshotsApp);
    end;
    if v130.PlayersPage then
        v130:AddPage(v130.PlayersPage);
    end;
    v130:AddPage(v130.ResetCharacterPage);
    if v130.LeaveGamePage then
        v130:AddPage(v130.LeaveGamePage);
    end;
    v130:AddPage(v130.GameSettingsPage);
    if v130.ShotsPage then
        v130:AddPage(v130.ShotsPage);
    end;
    if v130.ReportAbusePage then
        v130:AddPage(v130.ReportAbusePage);
    end;
    if v130.ReportSentPage then
        v130:AddPage(v130.ReportSentPage);
    end;
    if v130.ReportSentPageV2 then
        v130:AddPage(v130.ReportSentPageV2);
    end;
    v130:AddPage(v130.HelpPage);
    if not (not v130.RecordPage or v130.ShotsPage) then
        v130:AddPage(v130.RecordPage);
    end;
    if v130.ExitModalPage then
        v130:AddPage(v130.ExitModalPage);
    end;
    if v130.LeaveGameToHomePage then
        v130:AddPage(v130.LeaveGameToHomePage);
    end;
    if not v57() then
        v130:InitInPage(v130.PlayersPage);
    else
        v130:InitInPage(v130:GetFirstPageWithTabHeader());
    end;
    l_GuiService_0.ShowLeaveConfirmation:connect(function()
        if #v130.MenuStack == 0 then
            v130:SetVisibility(true, nil, nil, nil, l_Constants_0.AnalyticsMenuOpenTypes.GamepadLeaveGame);
            if not v57() then
                v130:SwitchToPage(v130.PlayersPage, nil, 1);
                return ;
            else
                v130:SwitchToPage(v130:GetFirstPageWithTabHeader(), nil, 1);
                return ;
            end;
        else
            v130:PopMenu(false, true);
            return ;
        end;
    end);
    l_ContextActionService_0:BindCoreAction("Open Dev Console", v387, false, Enum.KeyCode.F9);
    l_ContextActionService_0:BindCoreAction("Show Quick Profiler", v383, false, Enum.KeyCode.F7);
    l_UserInputService_0.InputBegan:connect(function(v550)
        if not (((not (not ((v550.KeyCode ~= Enum.KeyCode.Left and v550.KeyCode ~= Enum.KeyCode.Right) and v550.KeyCode ~= Enum.KeyCode.Up) or v550.KeyCode == Enum.KeyCode.Down) or not v130.Visible) or not v130.Active) or not v130.Pages.CurrentPage) and l_GuiService_0.SelectedCoreObject == nil then
            v130.Pages.CurrentPage:SelectARow();
        end;
    end);
    if v130.ExitModalPage then
        local function v551()
            v130.HubBar.Visible = false;
            v149();
            if not v130:GetVisibility() then
                v130:SetVisibility(true, nil, v130.ExitModalPage, false);
                return ;
            else
                v130:AddToMenuStack(v130.Pages.CurrentPage);
                v130:SwitchToPage(v130.ExitModalPage, nil, 1, true);
                return ;
            end;
        end;
        local function v552()
            if v130:GetVisibility() and v130.Pages.CurrentPage == v130.ExitModalPage then
                if v33 then
                    v16.leavingGame();
                end;
                v130.ExitModalPage.LeaveAppFunc(true);
                return ;
            else
                v551();
                return ;
            end;
        end;
        game:GetService("GuiService").NativeClose:Connect(v552);
        if v130.FullScreenTitleBar then
            v130.FullScreenTitleBar = v86.update(v130.FullScreenTitleBar, {
                onClose = v552
            });
        end;
    end;
    return v130;
end;
local v554 = {
    ModuleName = "SettingsMenu", 
    KeepVRTopbarOpen = true, 
    VRIsExclusive = true, 
    VRClosesNonExclusive = true, 
    SetVisibility = nil
};
v14:RegisterModule(v554);
v14.ModuleOpened.Event:connect(function(v555)
    if not (not (v555 ~= v554.ModuleName) or not v14:GetModule(v555).VRIsExclusive) then
        v554:SetVisibility(false);
    end;
end);
local v556 = v553();
v554.SetVisibility = function(_, v558, v559, v560, v561, v562)
    v556:SetVisibility(v558, v559, v560, v561, v562);
end;
v554.ToggleVisibility = function(_, v564, v565)
    v556:ToggleVisibility(v564, v565);
end;
v554.SwitchToPage = function(_, v567, v568)
    v556:SwitchToPage(v567, v568, 1);
end;
v554.GetVisibility = function(_)
    return v556.Visible;
end;
v554.ShowShield = function(_)
    v556:ShowShield();
end;
v554.HideShield = function(_)
    v556:HideShield();
end;
v554.GetRespawnBehaviour = function(_)
    return v556:GetRespawnBehaviour();
end;
v554.GetTakingScreenshot = function(_)
    if not v48() then
        return nil;
    else
        return v556.TakingScreenshot;
    end;
end;
v554.RespawnBehaviourChangedEvent = v556.RespawnBehaviourChangedEvent;
v554.SettingsShowSignal = v556.SettingsShowSignal;
v554.CurrentPageSignal = v556.CurrentPageSignal;
v554.SettingsShowEvent = Instance.new("BindableEvent");
v556.SettingsShowSignal:connect(function(v574)
    v554.SettingsShowEvent:Fire(v574);
end);
v554.Instance = v556;
return v554;
