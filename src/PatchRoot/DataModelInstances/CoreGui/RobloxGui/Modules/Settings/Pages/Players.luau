local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local l_ShareGame_0 = l_CoreGui_0.RobloxGui.Modules.Settings.Pages.ShareGame;
local v11 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
local v12 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_formatUsername_0 = v12.Formatters.formatUsername;
local l_getCombinedNameFromId_0 = v12.Selectors.getCombinedNameFromId;
local v15 = require(l_CorePackages_0.Cryo);
local v16 = require(l_CorePackages_0.Roact);
local v17 = require(l_CorePackages_0.UIBlox);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v20 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v21 = require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage);
local l_SocialUtil_0 = require(l_RobloxGui_0.Modules:WaitForChild("SocialUtil"));
local l_Diag_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.Diag;
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v25 = require(l_ShareGame_0.Spritesheets.ShareGameIcons);
local v26 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v27 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_GameInviteAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteAnalytics;
local v29 = require(script:FindFirstAncestor("Settings").onBlockButtonActivated);
local v30 = require(script:FindFirstAncestor("Settings").Analytics.VoiceAnalytics);
local v31 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v32 = require(script:FindFirstAncestor("Settings").Analytics.BlockingAnalytics);
local v33 = require(l_RobloxGui_0.Modules.BlockingUtility);
local v34 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
local v35 = require(l_RobloxGui_0.Modules.Settings.Components.MuteToggles);
local v36 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local v37 = game:DefineFastFlag("UpdateFriendLabelOnChange", false);
local v38 = game:DefineFastFlag("FixPlayersExtremeTruncation", false);
local v39 = require(l_RobloxGui_0.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification);
local v40 = require(script.Parent.Parent.Flags.GetFFlagAddAnimatedFocusState);
local v41 = nil;
if v39() then
    v41 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteAnalyticsManager;
end;
local _, l_result_0 = pcall(function()
    return game:GetService("PlatformFriendsService");
end);
local v44 = require(script.Parent.Parent.Theme);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v46 = not v26 and "rbxasset://textures/ui/Settings/Players/ReportFlagIcon.png" or "rbxasset://textures/ui/Settings/Players/ReportFlagIcon@2x.png";
local v47 = not v26 and "rbxasset://textures/ui/Settings/Players/AddFriendIcon.png" or "rbxasset://textures/ui/Settings/Players/AddFriendIcon@2x.png";
local v48 = not v26 and "rbxasset://textures/ui/Settings/Players/FriendIcon.png" or "rbxasset://textures/ui/Settings/Players/FriendIcon@2x.png";
local v49 = "rbxasset://textures/ui/InspectMenu/ico_inspect.png";
local v50 = not v26 and "rbxasset://textures/ui/Settings/Players/BlockIcon.png" or "rbxasset://textures/ui/Settings/Players/BlockIcon@2x.png";
if v44.UIBloxThemeEnabled then
    v46 = v44.Images["icons/actions/feedback"];
    v49 = v44.Images["icons/actions/zoomIn"];
    v50 = v44.Images["icons/actions/block"];
    v47 = v44.Images["icons/actions/friends/friendAdd"];
    v48 = v44.Images["icons/menu/friends"];
end;
local v51 = {
    MicOn = "rbxasset://textures/ui/Settings/Players/Unmute@2x.png", 
    MicOff = "rbxasset://textures/ui/Settings/Players/Muted@2x.png", 
    MicDisabled = "rbxasset://textures/ui/Settings/Players/Blocked@2x.png", 
    Loading = "rbxasset://textures/ui/Settings/Players/Unmuted-White@2x.png", 
    Error = l_default_0:GetIcon("Error", "MicLight")
};
local l_v51_0 = v51;
local v53 = 62;
local v54 = -4;
if v44.UIBloxThemeEnabled then
    v54 = -12;
    v53 = 52;
end;
local v55 = UDim2.new(1, -10, 0, v53);
local v56 = UDim2.new(0.5, -10, 0, v53);
local _ = nil;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_status_1, l_result_1 = pcall(function()
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v61 = l_status_1 and l_result_1;
local v62 = require(l_RobloxGui_0.Modules.Flags.FFlagExtendedExpMenuPortraitLayout);
local v63 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v64 = require(l_RobloxGui_0.Modules.Flags.GetFFlagOldMenuNewIcons);
local v65 = require(l_RobloxGui_0.Modules.Flags.GetFFlagPauseMuteFix);
local v66 = require(l_RobloxGui_0.Modules.Flags.GetFFlagPlayerListAnimateMic);
local v67 = require(l_RobloxGui_0.Modules.Flags.GetFFlagOldMenuUseSpeakerIcons);
local v68 = require(l_RobloxGui_0.Modules.Flags.GetFFlagInviteTextTruncateFix);
local v69 = require(l_RobloxGui_0.Modules.Flags.FFlagAvatarChatCoreScriptSupport);
local v70 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceRecordingIndicatorsEnabled);
local v71 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagShowMuteToggles);
local v72 = require(l_RobloxGui_0.Modules.Flags.GetFFlagWrapBlockModalScreenInProvider);
local v73 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagMuteTogglesEnableIXP);
local v74 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFStringMuteTogglesIXPLayerName);
local v75 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagUseFriendsPropsInMuteToggles);
local v76 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagFixInviteTextVisibility);
local v77 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagDefaultFriendingLabelTextNonEmpty);
local v78 = require(l_RobloxGui_0.Modules.Flags.isEngineTruncationEnabledForIngameSettings);
local l_game_EngineFeature_0 = game:GetEngineFeature("VoiceChatMultistreamSubscriptionsEnabled");
local v80 = game:DefineFastFlag("LuaFlagVoiceChatDisableSubscribeRetryForMultistream", true);
local v81 = game:DefineFastFlag("PlayerListRefactorUsernameFormatting", false);
local v82 = game:DefineFastFlag("EnablePlatformName", false);
local v83 = game:DefineFastFlag("CheckForNilUserIdOnPlayerList", false);
local v84 = require(l_RobloxGui_0.Modules.Chrome.Enabled)();
if v64() then
    v51 = l_default_0.MuteStatusIcons;
    l_v51_0 = l_default_0.PlayerMuteStatusIcons;
end;
return ((function()
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    if not v44.UIBloxThemeEnabled then
        l_NewPage_0.PageListLayout.Padding = UDim.new(0, 18);
    else
        l_NewPage_0.PageListLayout.Padding = UDim.new(0, 16);
    end;
    l_NewPage_0.TabHeader.Name = "PlayersTab";
    if not v44.UIBloxThemeEnabled then
        l_NewPage_0.TabHeader.Icon.Image = not v26 and "rbxasset://textures/ui/Settings/MenuBarIcons/PlayersTabIcon.png" or "rbxasset://textures/ui/Settings/MenuBarIcons/PlayersTabIcon@2x.png";
        if not v61 then
            l_NewPage_0.TabHeader.Icon.Title.Text = "People";
        else
            l_NewPage_0.TabHeader.Title.Text = "People";
        end;
    else
        l_NewPage_0.TabHeader.TabLabel.Icon.Image = not v26 and "rbxasset://textures/ui/Settings/MenuBarIcons/PlayersTabIcon.png" or "rbxasset://textures/ui/Settings/MenuBarIcons/PlayersTabIcon@2x.png";
        local v86 = v44.Images["icons/menu/friends"];
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectOffset = v86.ImageRectOffset;
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectSize = v86.ImageRectSize;
        l_NewPage_0.TabHeader.TabLabel.Icon.Image = v86.Image;
        l_NewPage_0.TabHeader.TabLabel.Title.Text = "People";
    end;
    local function _(v87)
        local l_status_2, l_result_2 = pcall(function()
            return l_LocalPlayer_0:GetFriendStatus(v87);
        end);
        if not l_status_2 then
            return Enum.FriendStatus.NotFriend;
        else
            return l_result_2;
        end;
    end;
    l_NewPage_0.Page.Name = "Players";
    local function _(v91)
        local l_v91_0 = v91;
        if l_v91_0 then
            l_v91_0 = false;
            if v91 ~= l_LocalPlayer_0 then
                l_v91_0 = false;
                if v91.UserId > 0 then
                    l_v91_0 = l_LocalPlayer_0.UserId > 0;
                end;
            end;
        end;
        return l_v91_0;
    end;
    local function _()
        return (v62 and v20:IsSmallTouchScreen()) and v20:IsPortrait();
    end;
    local function _(v95)
        return v33:IsPlayerBlockedByUserId(v95.UserId);
    end;
    local function v104(v97, v98)
        if v97 == nil then
            return nil;
        else
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.BackgroundTransparency = 1;
            local v100 = nil;
            local v101 = nil;
            if not (v97 ~= Enum.FriendStatus.Friend) or v97 == Enum.FriendStatus.FriendRequestSent then
                v100 = Instance.new("TextButton");
                v100.BackgroundTransparency = 1;
                v100.FontSize = v44.fontSize(Enum.FontSize.Size24);
                v100.Font = v44.font(Enum.Font.SourceSans);
                v100.TextColor3 = Color3.new(1, 1, 1);
                v100.SelectionImageObject = l_Frame_0;
                if v97 == Enum.FriendStatus.Friend then
                    v100.Text = "Friend";
                else
                    v100.Text = "Request Sent";
                end;
            elseif not (v97 ~= Enum.FriendStatus.Unknown and v97 ~= Enum.FriendStatus.NotFriend) or v97 == Enum.FriendStatus.FriendRequestReceived then
                local v102, v103 = v20:MakeStyledButton("FriendStatus", "Add Friend", UDim2.new(0, 182, 0, v44.ButtonHeight), function()
                    if not (not v100 or not v101) and v101.Text ~= "" then
                        v100.ImageTransparency = 1;
                        v101.Text = "";
                        if v77() then
                            v101.Text = "Add Friend";
                        end;
                        if not (not l_LocalPlayer_0 or not v98) then
                            l_RbxAnalyticsService_0:ReportCounter("PlayersMenu-RequestFriendship");
                            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsRequestFriendContext, l_Constants_0.AnalyticsRequestFriendName, {
                                category = "Game"
                            });
                            l_LocalPlayer_0:RequestFriendship(v98);
                        end;
                    end;
                end);
                v100 = v102;
                v101 = v103;
                v101.ZIndex = 3;
                v101.Position = v101.Position + UDim2.new(0, 0, 0, 1);
            end;
            if v100 then
                v100.Name = "FriendStatus";
                v100.ZIndex = 3;
                if not v44.UIBloxThemeEnabled then
                    v100.Size = UDim2.new(0, 150, 0, 46);
                    v100.Position = UDim2.new(1, -198, 0, 7);
                else
                    v100.Size = UDim2.new(0, 150, 0, v44.ButtonHeight);
                    v100.Position = UDim2.new(1, -198, 0, 7);
                    if v101 then
                        v101.Position = UDim2.new(0, 0, 0, 0);
                    end;
                end;
            end;
            return v100;
        end;
    end;
    local function v117(v105, v106)
        if not (v105 ~= Enum.FriendStatus.Friend) or v105 == Enum.FriendStatus.FriendRequestSent then
            if not v44.UIBloxThemeEnabled then
                local l_ImageButton_0 = Instance.new("ImageButton");
                l_ImageButton_0.Name = "FriendStatus";
                l_ImageButton_0.Size = UDim2.new(0, v44.ButtonHeight, 0, v44.ButtonHeight);
                l_ImageButton_0.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";
                l_ImageButton_0.ScaleType = Enum.ScaleType.Slice;
                l_ImageButton_0.SliceCenter = Rect.new(8, 6, 46, 44);
                l_ImageButton_0.AutoButtonColor = false;
                l_ImageButton_0.BackgroundTransparency = 1;
                l_ImageButton_0.ZIndex = 2;
                local l_ImageLabel_0 = Instance.new("ImageLabel");
                l_ImageLabel_0.BackgroundTransparency = 1;
                l_ImageLabel_0.Position = UDim2.new(0.5, 0, 0.5, 0);
                l_ImageLabel_0.Size = UDim2.new(0, 28, 0, 28);
                l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
                l_ImageLabel_0.ZIndex = 3;
                l_ImageLabel_0.Image = v48;
                if v105 == Enum.FriendStatus.Friend then
                    l_ImageLabel_0.ImageTransparency = 0;
                else
                    l_ImageLabel_0.Image = v47;
                    l_ImageLabel_0.ImageTransparency = 0.5;
                end;
                l_ImageLabel_0.Parent = l_ImageButton_0;
                return l_ImageButton_0;
            else
                local l_v48_0 = v48;
                local v110 = 0;
                if v105 ~= Enum.FriendStatus.Friend then
                    l_v48_0 = v47;
                    v110 = 0.5;
                end;
                local v111, _ = v20:MakeStyledImageButton("FriendStatus", l_v48_0, UDim2.new(0, v44.ButtonHeight, 0, v44.ButtonHeight), UDim2.new(0, 28, 0, 28));
                v111.Name = "FriendStatus";
                v111.Selectable = false;
                v111.FriendStatusImageLabel.ImageTransparency = v110;
                return v111;
            end;
        elseif not (v105 ~= Enum.FriendStatus.Unknown and v105 ~= Enum.FriendStatus.NotFriend) or v105 == Enum.FriendStatus.FriendRequestReceived then
            local v113 = nil;
            local v114 = nil;
            local v115, v116 = v20:MakeStyledImageButton("FriendStatus", v47, UDim2.new(0, v44.ButtonHeight, 0, v44.ButtonHeight), UDim2.new(0, 28, 0, 28), function()
                if not (not v113 or not v114) and v113.ImageTransparency ~= 1 then
                    v113.ImageTransparency = 1;
                    v114.ImageTransparency = 1;
                    if not (not l_LocalPlayer_0 or not v106) then
                        l_RbxAnalyticsService_0:ReportCounter("PlayersMenu-RequestFriendship");
                        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsRequestFriendContext, l_Constants_0.AnalyticsRequestFriendName, {
                            category = "Game"
                        });
                        l_LocalPlayer_0:RequestFriendship(v106);
                    end;
                end;
            end);
            v113 = v115;
            v114 = v116;
            v113.Name = "FriendStatus";
            v113.Selectable = true;
            return v113;
        else
            return nil;
        end;
    end;
    local v118 = nil;
    local v119 = nil;
    local v120 = nil;
    local v121 = {};
    local v122 = v71();
    local v123 = false;
    local v124 = {};
    local v125 = v30.new(l_RbxAnalyticsService_0, "Players");
    local function v134(v126, v127, v128, v129)
        local l_FriendStatus_0 = v126:FindFirstChild("FriendStatus");
        if l_FriendStatus_0 and v128 == v129 then
            return ;
        else
            if l_FriendStatus_0 then
                l_FriendStatus_0:Destroy();
                l_FriendStatus_0 = nil;
            end;
            local v131 = nil;
            local l_v127_0 = v127;
            if l_v127_0 then
                l_v127_0 = false;
                if v127 ~= l_LocalPlayer_0 then
                    l_v127_0 = false;
                    if v127.UserId > 0 then
                        l_v127_0 = l_LocalPlayer_0.UserId > 0;
                    end;
                end;
            end;
            if l_v127_0 then
                local v133;
                l_v127_0, v133 = pcall(function()
                    return l_LocalPlayer_0:GetFriendStatus(v127);
                end);
                v131 = if not l_v127_0 then Enum.FriendStatus.NotFriend else v133;
                if v75() then
                    v124[v127.UserId] = v131 == Enum.FriendStatus.Friend;
                end;
            end;
            if v33:IsPlayerBlockedByUserId(v127.UserId) == false then
                l_FriendStatus_0 = if not v128 then v104(v131, v127) else v117(v131, v127);
            end;
            if l_FriendStatus_0 then
                l_FriendStatus_0.Name = "FriendStatus";
                l_FriendStatus_0.LayoutOrder = 5;
                l_FriendStatus_0.Selectable = true;
                if not (not v40() or not v44.UIBloxThemeEnabled) then
                    v20:MakeFocusState(l_FriendStatus_0, "utility-focus-state" .. "-friendstatuslabel-" .. v127.Name);
                end;
                l_FriendStatus_0.Parent = v126;
            end;
            return ;
        end;
    end;
    local function v140(v135, v136)
        local v137 = nil;
        if v135 then
            v137 = v135:FindFirstChild("RightSideButtons");
        end;
        if v137 then
            for _, v139 in pairs(v137:GetChildren()) do
                if v139 and v139.Name == "FriendStatus" then
                    if l_GuiService_0.SelectedCoreObject == v139 then
                        l_GuiService_0.SelectedCoreObject = v118;
                    end;
                    v139:Destroy();
                end;
            end;
            if v37 then
                v134(v137, v136, v20:IsPortrait(), nil);
            end;
        end;
    end;
    l_LocalPlayer_0.FriendStatusChanged:connect(function(v141, v142)
        if v141 then
            local l_FirstChild_0 = l_NewPage_0.Page:FindFirstChild("PlayerLabel" .. v141.Name);
            if l_FirstChild_0 then
                v140(l_FirstChild_0, v141);
            end;
            if v75() then
                v124[v141.UserId] = v142 == Enum.FriendStatus.Friend;
            end;
        end;
    end);
    local v144 = nil;
    local v145 = nil;
    local v146 = v32.new(l_LocalPlayer_0.UserId, {
        EventStream = l_RbxAnalyticsService_0
    });
    local function v162(v147, v148, v149, _)
        local v151 = v33:IsPlayerBlockedByUserId(v148.UserId);
        local function _(v152)
            local v153 = v144(v147, v148, v149, not v149);
            v134(v147, v148, v149, not v149);
            if not (not v72() or not v152) then
                v145(v153);
            end;
        end;
        local function v158()
            local v155 = true;
            if l_GuiService_0.SelectedCoreObject == nil then
                v155 = l_GuiService_0.SelectedObject ~= nil;
            end;
            v29(v148, v146, l_Constants_0.AnalyticsInGameMenuName):andThen(function()
                local l_v155_0 = v155;
                local v157 = v144(v147, v148, v149, not v149);
                v134(v147, v148, v149, not v149);
                if not (not v72() or not l_v155_0) then
                    v145(v157);
                end;
            end);
        end;
        local function v161()
            if v33:UnblockPlayerAsync(v148) then
                v146:action("SettingsHub", "unblockUser", {
                    blockeeUserId = v148.UserId
                });
                local _ = v144(v147, v148, v149, not v149);
                v134(v147, v148, v149, not v149);
                local _ = v72();
            end;
        end;
        if not v151 then
            return v20:MakeStyledImageButton("BlockButton", v50, UDim2.new(0, v44.ButtonHeight, 0, v44.ButtonHeight), UDim2.new(0, 28, 0, 28), v158);
        else
            return v20:MakeStyledButton("BlockButton", v27:FormatByKey("Feature.SettingsHub.Action.Unblock"), UDim2.new(0, 110, 0, v44.ButtonHeight), v161);
        end;
    end;
    v145 = function(v163)
        if not v163 or v163.Selectable then
            l_GuiService_0.SelectedCoreObject = v163;
            return ;
        else
            l_GuiService_0:Select(v163);
            return ;
        end;
    end;
    v144 = function(v164, v165, v166, v167)
        local l_BlockButton_0 = v164:FindFirstChild("BlockButton");
        if l_BlockButton_0 and v166 == v167 then
            return l_BlockButton_0;
        else
            if l_BlockButton_0 then
                l_BlockButton_0:Destroy();
                l_BlockButton_0 = nil;
            end;
            local l_v165_0 = v165;
            if l_v165_0 then
                l_v165_0 = false;
                if v165 ~= l_LocalPlayer_0 then
                    l_v165_0 = false;
                    if v165.UserId > 0 then
                        l_v165_0 = l_LocalPlayer_0.UserId > 0;
                    end;
                end;
            end;
            if l_v165_0 then
                l_BlockButton_0 = v162(v164, v165, v166, v167);
            end;
            if l_BlockButton_0 then
                l_BlockButton_0.Name = "BlockButton";
                l_BlockButton_0.LayoutOrder = 4;
                l_BlockButton_0.Selectable = true;
                if not (not v40() or not v44.UIBloxThemeEnabled) then
                    v20:MakeFocusState(l_BlockButton_0, "utility-focus-state" .. "-blockbutton-" .. v165.Name);
                end;
                l_BlockButton_0.Parent = v164;
            end;
            return l_BlockButton_0;
        end;
    end;
    local v170 = false;
    local v171 = false;
    local function v184(v172, v173)
        local v174 = nil;
        if v172 then
            v174 = v172:FindFirstChild("RightSideButtons");
        end;
        if v174 then
            local l_MuteStatusButton_0 = v174:FindFirstChild("MuteStatusButton");
            if v173 == nil then
                if l_MuteStatusButton_0 then
                    l_MuteStatusButton_0:Destroy();
                end;
                return ;
            else
                local v176 = not not v64() and UDim2.fromOffset(36, 36) or UDim2.fromOffset(20, 26);
                local v177 = not not v64() and UDim2.fromOffset(0, 0) or UDim2.new(0, 0, 0, 1);
                local v178 = 0;
                local v179 = not not v173.isMuted and v51.MicOff or v51.MicOn;
                if not v173.subscriptionFailed then
                    if not v173.isMutedLocally then
                        if v173.subscriptionCompleted then
                            if not ((not v64() or not v66()) or not v173.isSignalActive) then
                                v179 = l_default_0:GetIcon("Unmuted" .. tostring(20 * math.floor(0.5 + 5 * math.random())), not v67() and "MicLight" or "SpeakerLight");
                            end;
                        else
                            v179 = v51.Loading;
                        end;
                    else
                        v179 = v51.MicDisabled;
                        if v64() then
                            v178 = 0.5;
                        end;
                    end;
                else
                    v179 = v51.Error;
                    v176 = UDim2.fromOffset(36, 36);
                    v177 = UDim2.fromOffset(2, -2);
                    if not (not v80 or not l_game_EngineFeature_0) then
                        v178 = 0.5;
                    end;
                end;
                if not l_MuteStatusButton_0 then
                    local v181, v182 = v20:MakeStyledImageButton("MuteStatus", v179, UDim2.fromOffset(v44.ButtonHeight, v44.ButtonHeight), v176, function()
                        local v180 = l_default_0.participants[tostring(v173.userId)];
                        if not v180.subscriptionCompleted then
                            if v180.subscriptionFailed then
                                if not v80 then
                                    l_default_0:SubscribeRetry(v173.userId);
                                elseif not l_game_EngineFeature_0 then
                                    l_default_0:SubscribeRetry(v173.userId);
                                    return ;
                                end;
                            end;
                            return ;
                        else
                            if v125 then
                                v125:onToggleMutePlayer(v173.userId, not v180.isMutedLocally);
                            end;
                            l_default_0:ToggleMutePlayer(v173.userId, v31.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                            return ;
                        end;
                    end);
                    if v66() then
                        v121[v173.userId] = v182;
                    end;
                    v182.ZIndex = 3;
                    v182.Position = v182.Position + v177;
                    if v64() then
                        v182.ImageTransparency = v178;
                    end;
                    if not (not v40() or not v44.UIBloxThemeEnabled) then
                        v20:MakeFocusState(v181, "utility-focus-state" .. "-mutestatusbutton-" .. v173.userId);
                    end;
                    v181.Parent = v174;
                else
                    local v183 = nil;
                    v183 = if not v66() then v174:FindFirstChild("MuteStatusImageLabel", true) else v121[v173.userId] or v174:FindFirstChild("MuteStatusImageLabel", true);
                    v183.Image = v179;
                    v183.Size = v176;
                    if v64() then
                        v183.ImageTransparency = v178;
                        return ;
                    end;
                end;
                return ;
            end;
        else
            return ;
        end;
    end;
    local v185 = v20:Create("Frame")({
        Name = "ButtonsContainer", 
        Size = UDim2.new(1, 0, 0, 62), 
        BackgroundTransparency = 1, 
        Parent = l_NewPage_0.Page, 
        Visible = false
    });
    local v186 = 5;
    if v44.UIBloxThemeEnabled then
        v20:Create("UIPadding")({
            PaddingBottom = UDim.new(0, 1), 
            PaddingTop = UDim.new(0, 1), 
            PaddingLeft = UDim.new(0, 1), 
            PaddingRight = UDim.new(0, 1), 
            Parent = v185
        });
        v186 = 12;
        v185.Size = UDim2.new(1, 0, 0, v44.ButtonHeight);
    end;
    local v187, v188 = v20:MakeStyledButton("LeaveButton", "Leave", UDim2.new(0.3333333333333333, -v186, 1, 0), function()
        l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.LeaveGamePage, false, 1);
    end);
    v187.AnchorPoint = Vector2.new(0, 0);
    v187.Position = UDim2.new(0, 0, 0, 0);
    if not v44.UIBloxThemeEnabled then
        v188.Size = UDim2.new(1, 0, 1, -6);
    else
        v188.Size = UDim2.new(1, -4, 1, 0);
        v188.Position = UDim2.new(0, 2, 0, 0);
    end;
    v187.Parent = v185;
    local v189, v190 = v20:MakeStyledButton("ResetButton", "Reset Character", UDim2.new(0.3333333333333333, -v186, 1, 0), function()
        l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.ResetCharacterPage, false, 1);
    end);
    v189.AnchorPoint = Vector2.new(0.5, 0);
    v189.Position = UDim2.new(0.5, 0, 0, 0);
    if not v44.UIBloxThemeEnabled then
        v190.Size = UDim2.new(1, 0, 1, -6);
    else
        v190.Size = UDim2.new(1, -4, 1, 0);
        v190.Position = UDim2.new(0, 2, 0, 0);
    end;
    v189.Parent = v185;
    local v191, v192 = v20:MakeStyledButton("ResumeButton", "Resume", UDim2.new(0.3333333333333333, -v186, 1, 0), function()
        l_NewPage_0.HubRef:SetVisibility(false);
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
            source = l_Constants_0.AnalyticsResumeButtonSource
        });
    end);
    v191.AnchorPoint = Vector2.new(1, 0);
    v191.Position = UDim2.new(1, 0, 0, 0);
    if not v44.UIBloxThemeEnabled then
        v192.Size = UDim2.new(1, 0, 1, -6);
    else
        v192.Size = UDim2.new(1, -4, 1, 0);
        v192.Position = UDim2.new(0, 2, 0, 0);
    end;
    v191.Parent = v185;
    local function v195()
        local l_localMuted_0 = l_default_0.localMuted;
        local _ = nil;
        if l_localMuted_0 == nil then
            if not v67() then
                return v51.Loading;
            else
                return l_v51_0.Loading;
            end;
        elseif not l_localMuted_0 then
            if not l_default_0.isTalking or not v66() then
                if not v67() then
                    return v51.MicOn;
                else
                    return l_v51_0.MicOn;
                end;
            else
                return (l_default_0:GetIcon("Unmuted" .. tostring(20 * math.floor(0.5 + 5 * math.random())), "MicLight"));
            end;
        elseif not v67() then
            return v51.MicOff;
        else
            return l_v51_0.MicOff;
        end;
    end;
    local function _(v196, v197, v198, v199)
        local l_v185_FirstChild_0 = v185:FindFirstChild(v196 .. "Button", true);
        if l_v185_FirstChild_0 then
            l_v185_FirstChild_0.Position = v197;
            l_v185_FirstChild_0.Size = v198;
            l_v185_FirstChild_0.AnchorPoint = v199;
            return ;
        else
            return ;
        end;
    end;
    local function v208()
        local v202 = 6;
        local v203 = 0;
        if v44.UIBloxThemeEnabled then
            v202 = 0;
            v203 = 12;
        end;
        local v204 = UDim2.new(0.8571428571428571, 0, 0, 0);
        local v205 = UDim2.new(0.2857142857142857, -v203, 1, -v202);
        local v206 = Vector2.new(1, 0);
        local l_v185_FirstChild_1 = v185:FindFirstChild("ResumeButton" .. "Button", true);
        if l_v185_FirstChild_1 then
            l_v185_FirstChild_1.Position = v204;
            l_v185_FirstChild_1.Size = v205;
            l_v185_FirstChild_1.AnchorPoint = v206;
        end;
        v204 = UDim2.new(0.42857142857142855, 0, 0, 0);
        v205 = UDim2.new(0.2857142857142857, -v203, 1, -v202);
        v206 = Vector2.new(0.5, 0);
        l_v185_FirstChild_1 = v185:FindFirstChild("ResetButton" .. "Button", true);
        if l_v185_FirstChild_1 then
            l_v185_FirstChild_1.Position = v204;
            l_v185_FirstChild_1.Size = v205;
            l_v185_FirstChild_1.AnchorPoint = v206;
        end;
        v204 = UDim2.new(0, 0, 0, 0);
        v205 = UDim2.new(0.2857142857142857, -v203, 1, -v202);
        v206 = Vector2.new(0, 0);
        l_v185_FirstChild_1 = v185:FindFirstChild("LeaveButton" .. "Button", true);
        if l_v185_FirstChild_1 then
            l_v185_FirstChild_1.Position = v204;
            l_v185_FirstChild_1.Size = v205;
            l_v185_FirstChild_1.AnchorPoint = v206;
            return ;
        else
            return ;
        end;
    end;
    local function _()
        local l_v185_FirstChild_2 = v185:FindFirstChild("PlayerMuteButtonImageLabel", true);
        if l_v185_FirstChild_2 then
            l_v185_FirstChild_2.Image = v195();
            return ;
        else
            return ;
        end;
    end;
    local function v215()
        local v211, v212 = v20:MakeStyledImageButton("PlayerMuteButton", v195(), not not v65() and UDim2.new(1, 0, 1, 0) or UDim2.new(0.2, -5, 0.8, 0), not not v65() and UDim2.new(1, -6, 1, -4) or UDim2.new(0.5, -6, 0.65, -4), function()
            l_default_0:ToggleMic("InGameMenuPlayers");
            if v125 then
                v125:onToggleMuteSelf(v170);
            end;
        end, nil, nil, "DefaultButton");
        if not v44.UIBloxThemeEnabled then
            v211.Position = UDim2.new(1, 0, 0, 0);
            v211.Size = UDim2.new(0.14285714285714285, 0, 1, -6);
        else
            v211.Position = UDim2.new(1, 0, 0, 0);
            v211.Size = UDim2.new(0.14285714285714285, -12, 1, 0);
            v212.Size = UDim2.new(1, -6, 1, -4);
            v20:Create("UIAspectRatioConstraint")({
                AspectRatio = 1, 
                Parent = v212
            });
        end;
        v211.AnchorPoint = Vector2.new(1, 0);
        if v65() then
            v212.SizeConstraint = Enum.SizeConstraint.RelativeYY;
        end;
        v211.Parent = v185;
        l_default_0.muteChanged.Event:Connect(function(v213)
            v170 = v213;
            local l_v185_FirstChild_3 = v185:FindFirstChild("PlayerMuteButtonImageLabel", true);
            if l_v185_FirstChild_3 then
                l_v185_FirstChild_3.Image = v195();
                return ;
            else
                return ;
            end;
        end);
    end;
    local function _()
        if not v84 then
            v208();
            v215();
            return ;
        else
            return ;
        end;
    end;
    v20:OnResized(v185, function(_, v218)
        if not v218 and not v20:IsSmallTouchScreen() or v44.AlwaysShowBottomBar() then
            v185.Visible = false;
            v185.Size = UDim2.new(1, 0, 0, 0);
            return ;
        else
            local v219 = not not v218 and v44.textSize(18) or v44.textSize(24);
            if not (not v44.UIBloxThemeEnabled or not v44.UseBiggerText) then
                v219 = v44.textSize(20);
            end;
            v185.Visible = not v44.UIBloxThemeEnabled or not v44.EnableVerticalBottomBar;
            if not v44.UIBloxThemeEnabled then
                v185.Size = UDim2.new(1, 0, 0, not v218 and 62 or 50);
            else
                v185.Size = UDim2.new(1, 0, 0, v44.ButtonHeight);
            end;
            v190.TextSize = v219;
            v188.TextSize = v219;
            v192.TextSize = v219;
            return ;
        end;
    end);
    if v61 then
        local function v221(v220)
            v220.AnchorPoint = Vector2.new(0.5, 0.5);
            v220.Position = UDim2.new(0.5, 0, 0.5, -3);
            v220.Size = UDim2.new(0.75, 0, 0.5, 0);
        end;
        v221(v188);
        v221(v190);
        v221(v190);
    end;
    local function v228(v222, v223)
        local l_RightSideButtons_0 = v222:FindFirstChild("RightSideButtons");
        if l_RightSideButtons_0 then
            local l_ReportPlayer_0 = l_RightSideButtons_0:FindFirstChild("ReportPlayer");
            if l_ReportPlayer_0 then
                l_ReportPlayer_0:Destroy();
            end;
            local l_v223_0 = v223;
            if l_v223_0 then
                l_v223_0 = false;
                if v223 ~= l_LocalPlayer_0 then
                    l_v223_0 = false;
                    if v223.UserId > 0 then
                        l_v223_0 = l_LocalPlayer_0.UserId > 0;
                    end;
                end;
            end;
            if l_v223_0 then
                local v227 = v20:MakeStyledImageButton("ReportPlayer", v46, UDim2.new(0, v44.ButtonHeight, 0, v44.ButtonHeight), UDim2.new(0, 28, 0, 28), function()
                    v21:ReportPlayer(v223, "MenuPlayerList");
                end);
                v227.Name = "ReportPlayer";
                v227.Position = UDim2.new(1, -260, 0, 7);
                v227.LayoutOrder = 3;
                v227.Selectable = true;
                if not (not v40() or not v44.UIBloxThemeEnabled) then
                    v20:MakeFocusState(v227, "utility-focus-state" .. "-reportplayer-" .. v223.Name);
                end;
                v227.Parent = l_RightSideButtons_0;
            end;
        end;
    end;
    local v229 = nil;
    local v230 = nil;
    local v231 = nil;
    local v232 = false;
    local function _()
        if not v122 then
            if v119 then
                v119.Visible = false;
                v119:Destroy();
            end;
            if v118 then
                v118.Size = v55;
            end;
        elseif v120 then
            v16.unmount(v120);
            return ;
        end;
    end;
    local function v240(v234, v235)
        local v236 = Instance.new(v234);
        v236.Size = UDim2.new(1, 0, 0, 62);
        v236.Position = UDim2.new(0, 0, 0, 0);
        v236.ZIndex = 2;
        if not v44.UIBloxThemeEnabled then
            v236.Image = "rbxasset://textures/ui/dialog_white.png";
            v236.ScaleType = "Slice";
            v236.SliceCenter = Rect.new(10, 10, 10, 10);
            v236.BackgroundTransparency = 1;
            v236.ImageTransparency = 0.85;
        else
            v236.BackgroundColor3 = v44.color("PlayerRowFrame");
            v236.BackgroundTransparency = v44.transparency("PlayerRowFrame");
            v20:Create("UICorner")({
                CornerRadius = v44.DefaultCornerRadius, 
                Parent = v236
            });
        end;
        local l_ImageLabel_1 = Instance.new("ImageLabel");
        l_ImageLabel_1.Name = "Icon";
        l_ImageLabel_1.BackgroundTransparency = 1;
        l_ImageLabel_1.Size = UDim2.new(0, 36, 0, 36);
        l_ImageLabel_1.Position = UDim2.new(0, 12, 0, 12);
        l_ImageLabel_1.ZIndex = 3;
        l_ImageLabel_1.Parent = v236;
        local l_TextLabel_0 = Instance.new("TextLabel");
        l_TextLabel_0.Text = "";
        l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
        l_TextLabel_0.Font = v44.font(Enum.Font.SourceSans, "DisplayName");
        l_TextLabel_0.FontSize = not not v235 and v44.fontSize(Enum.FontSize.Size36, "DisplayName") or v44.fontSize(Enum.FontSize.Size24, "DisplayName");
        l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
        l_TextLabel_0.BackgroundTransparency = 1;
        l_TextLabel_0.Position = not not v235 and UDim2.new(0, 60, 0.5, -10) or UDim2.new(0, 60, 0.5, 0);
        l_TextLabel_0.Size = UDim2.new(0, 0, 0, 0);
        l_TextLabel_0.ZIndex = 3;
        l_TextLabel_0.Parent = v236;
        if v235 then
            local l_TextLabel_1 = Instance.new("TextLabel");
            l_TextLabel_1.Text = "";
            l_TextLabel_1.Name = "SecondRow";
            l_TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left;
            l_TextLabel_1.Font = v44.font(Enum.Font.SourceSans);
            l_TextLabel_1.FontSize = v44.fontSize(Enum.FontSize.Size24, "Username");
            l_TextLabel_1.TextColor3 = Color3.fromRGB(162, 162, 162);
            l_TextLabel_1.BackgroundTransparency = 1;
            l_TextLabel_1.Position = UDim2.new(0, 60, 0.5, 12);
            l_TextLabel_1.Size = UDim2.new(0, 0, 0, 0);
            l_TextLabel_1.ZIndex = 3;
            l_TextLabel_1.Parent = v236;
        end;
        return v236;
    end;
    v229 = function()
        local v241 = v240("ImageButton");
        if v44.UIBloxThemeEnabled then
            v241.Size = UDim2.new(1, 0, 0, v53);
        end;
        local l_TextLabel_2 = v241.TextLabel;
        local l_Icon_0 = v241.Icon;
        if v232 then
            if not v122 then
                v241.Size = v56;
            end;
            if not v38 then
                if v68() then
                    l_TextLabel_2.Size = UDim2.new(0.5, 0, 0, 0);
                    l_TextLabel_2.TextTruncate = Enum.TextTruncate.AtEnd;
                end;
            else
                l_TextLabel_2.Size = UDim2.new(1, -60, 0, 0);
                l_TextLabel_2.TextTruncate = Enum.TextTruncate.AtEnd;
            end;
            v241.AnchorPoint = Vector2.new(0, 0);
        end;
        l_TextLabel_2.Font = v44.font(Enum.Font.SourceSansSemibold, "Semibold");
        l_TextLabel_2.AutoLocalize = false;
        l_TextLabel_2.Text = v27:FormatByKey("Feature.SettingsHub.Action.InviteFriendsToPlay");
        if not v44.UIBloxThemeEnabled then
            l_Icon_0.Size = UDim2.new(0, 24, 0, 24);
            l_Icon_0.Position = UDim2.new(0, 18, 0, 18);
            v25:ApplyImage(l_Icon_0, "invite");
        else
            l_Icon_0.AnchorPoint = Vector2.new(0, 0.5);
            l_Icon_0.Position = UDim2.new(0, 18, 0.5, 0);
            local v244 = v44.Images["icons/actions/friends/friendInvite"];
            if v244 then
                l_Icon_0.Image = v244.Image;
                l_Icon_0.ImageRectOffset = v244.ImageRectOffset;
                l_Icon_0.ImageRectSize = v244.ImageRectSize;
            end;
        end;
        local function _(v245)
            if not v245 then
                v241.ImageTransparency = 0.85;
                return ;
            else
                v241.ImageTransparency = 0.65;
                return ;
            end;
        end;
        v241.InputBegan:Connect(function()
            v241.ImageTransparency = 0.65;
        end);
        v241.InputEnded:Connect(function()
            v241.ImageTransparency = 0.85;
        end);
        v241.Activated:Connect(function()
            v241.ImageTransparency = 0.85;
        end);
        v241.TouchPan:Connect(function(_, v248)
            if math.abs(v248.Y) > 20 then
                v241.ImageTransparency = 0.85;
            end;
        end);
        v241.SelectionGained:connect(function()
            v241.ImageTransparency = 0.65;
        end);
        v241.SelectionLost:connect(function()
            v241.ImageTransparency = 0.85;
        end);
        v241.SelectionImageObject = v241:Clone();
        if not ((not v76() or not v44.UIBloxThemeEnabled) or v40()) then
            local v249 = v20:Create("Frame")({
                BackgroundTransparency = v44.transparency("PlayerRowSelection"), 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v44.color("PlayerRowSelection")
            });
            v20:Create("UICorner")({
                CornerRadius = v44.DefaultCornerRadius, 
                Parent = v249
            });
            v241.SelectionImageObject = v249;
        end;
        if not (not v40() or not v44.UIBloxThemeEnabled) then
            v20:MakeFocusState(v241, "utility-focus-state" .. "-sharegame");
        end;
        return v241;
    end;
    v230 = function()
        local v250 = v240("ImageButton");
        v250.Size = UDim2.new(not v118 and 1 or 0.5, -10, 0, v53);
        v250.Position = UDim2.new(1, 0, 0, 0);
        v250.AnchorPoint = Vector2.new(1, 0);
        local l_TextLabel_3 = v250.TextLabel;
        local l_Icon_1 = v250.Icon;
        l_TextLabel_3.Size = if not v38 then UDim2.new(0.5, 0, 0, 0) else UDim2.new(1, -60, 0, 0);
        l_TextLabel_3.TextTruncate = Enum.TextTruncate.AtEnd;
        l_TextLabel_3.Font = v44.font(Enum.Font.SourceSansSemibold, "Semibold");
        l_TextLabel_3.AutoLocalize = false;
        l_TextLabel_3.Text = v27:FormatByKey("Feature.SettingsHub.Action.MuteAll");
        l_Icon_1.Size = UDim2.new(0, 24, 0, 24);
        l_Icon_1.Position = UDim2.new(0, 18, 0, 18);
        if v64() then
            l_Icon_1.Size = UDim2.new(0, 32, 0, 32);
            l_Icon_1.Position = UDim2.new(0, 18, 0, 16);
            l_Icon_1.Image = l_default_0:GetIcon("UnmuteAll", "Misc");
        end;
        if v44.UIBloxThemeEnabled then
            l_Icon_1.AnchorPoint = Vector2.new(0, 0.5);
            l_Icon_1.Position = UDim2.new(0, 18, 0.5, 0);
        end;
        local function _(v253)
            if not v253 then
                v250.ImageTransparency = 0.85;
                return ;
            else
                v250.ImageTransparency = 0.65;
                return ;
            end;
        end;
        v250.InputBegan:Connect(function()
            v250.ImageTransparency = 0.65;
        end);
        v250.InputEnded:Connect(function()
            v250.ImageTransparency = 0.85;
        end);
        v250.Activated:Connect(function()
            v250.ImageTransparency = 0.85;
        end);
        v250.TouchPan:Connect(function(_, v256)
            if math.abs(v256.Y) > 20 then
                v250.ImageTransparency = 0.85;
            end;
        end);
        v250.SelectionGained:connect(function()
            v250.ImageTransparency = 0.65;
        end);
        v250.SelectionLost:connect(function()
            v250.ImageTransparency = 0.85;
        end);
        v250.SelectionImageObject = v250:Clone();
        if not ((not v76() or not v44.UIBloxThemeEnabled) or v40()) then
            local v257 = v20:Create("Frame")({
                BackgroundTransparency = v44.transparency("PlayerRowSelection"), 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v44.color("PlayerRowSelection")
            });
            v20:Create("UICorner")({
                CornerRadius = v44.DefaultCornerRadius, 
                Parent = v257
            });
            v250.SelectionImageObject = v257;
        end;
        if not (not v40() or not v44.UIBloxThemeEnabled) then
            v20:MakeFocusState(v250, "utility-focus-state" .. "-muteall");
        end;
        return v250;
    end;
    local function v260(v258, v259)
        return v16.createElement(v17.Core.Style.Provider, {
            style = v44
        }, {
            LocalizationProvider = v16.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                MuteToggles = v16.createElement(v35, {
                    Players = l_Players_0, 
                    initialTogglesState = v258, 
                    playersFriends = v259
                })
            })
        });
    end;
    local function _(v261)
        return (v20:MakeStyledImageButton("InspectButton", v49, UDim2.new(0, v44.ButtonHeight, 0, v44.ButtonHeight), UDim2.new(0, 28, 0, 28), v261));
    end;
    local function v268(v263, v264, v265, v266)
        local l_Inspect_0 = v263:FindFirstChild("Inspect");
        if l_Inspect_0 and v265 == v266 then
            return ;
        else
            if l_Inspect_0 then
                l_Inspect_0:Destroy();
            end;
            l_Inspect_0 = v20:MakeStyledImageButton("InspectButton", v49, UDim2.new(0, v44.ButtonHeight, 0, v44.ButtonHeight), UDim2.new(0, 28, 0, 28), function()
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsExamineAvatarName, l_Constants_0.AnalyticsMenuActionName, {});
                l_GuiService_0:InspectPlayerFromUserIdWithCtx(v264.UserId, "escapeMenu");
                l_NewPage_0.HubRef:SetVisibility(false);
            end);
            l_Inspect_0.Name = "Inspect";
            l_Inspect_0.LayoutOrder = 2;
            l_Inspect_0.Selectable = true;
            l_Inspect_0.Parent = v263;
            if not (not v40() or not v44.UIBloxThemeEnabled) then
                v20:MakeFocusState(l_Inspect_0, "utility-focus-state" .. "-inspect-" .. v264.Name);
            end;
            return ;
        end;
    end;
    local function v277(v269, v270, v271)
        local l_PlatformNameContainer_0 = v269:FindFirstChild("PlatformNameContainer");
        if l_PlatformNameContainer_0 then
            l_PlatformNameContainer_0:Destroy();
            l_PlatformNameContainer_0 = nil;
        end;
        if v270 == nil then
            return ;
        else
            l_PlatformNameContainer_0 = Instance.new("Frame");
            l_PlatformNameContainer_0.Name = "PlatformNameContainer";
            l_PlatformNameContainer_0.BackgroundTransparency = 1;
            l_PlatformNameContainer_0.ZIndex = 3;
            l_PlatformNameContainer_0.Position = UDim2.new(0, 0, 0, 0);
            l_PlatformNameContainer_0.Size = UDim2.new(0, 0, 1, 0);
            l_PlatformNameContainer_0.AutomaticSize = Enum.AutomaticSize.X;
            l_PlatformNameContainer_0.Selectable = false;
            l_PlatformNameContainer_0.LayoutOrder = -1;
            l_PlatformNameContainer_0.Parent = v269;
            local v273 = nil;
            if not ((((not game:GetEngineFeature("PlatformFriendsService") or not game:GetEngineFeature("PlatformFriendsProfile")) or not l_result_0) or not l_result_0:IsProfileEnabled()) or not v271) and v271 ~= "" then
                v273 = function()
                    l_result_0:ShowProfile(v271);
                end;
            end;
            local v274, v275 = v20:MakeStyledButton("consoleNameContainer", v270, UDim2.new(0, 0, 0, v44.ButtonHeight), v273);
            v274.AnchorPoint = Vector2.new(0, 0.5);
            v274.Position = UDim2.fromScale(0, 0.5);
            v274.AutomaticSize = Enum.AutomaticSize.X;
            v274.Parent = l_PlatformNameContainer_0;
            v275.Size = UDim2.fromScale(0, 1);
            v275.AutoLocalize = false;
            v275.TextSize = v44.platformNameTextSize;
            v275.TextScaled = false;
            v275.TextWrapped = false;
            v275.AutomaticSize = Enum.AutomaticSize.X;
            local v276 = v20:Create("ImageLabel")({
                Name = "iconLabel", 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = v44.platformNameIconSize, 
                Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png", 
                ImageColor3 = Color3.new(1, 1, 1)
            });
            v276.Parent = v274;
            v20:Create("UIListLayout")({
                Name = "PLatformNameUIListLayout", 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }).Parent = v274;
            v276.LayoutOrder = 1;
            v275.LayoutOrder = 2;
            v20:Create("UIPadding")({
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                Parent = v274
            });
            return l_PlatformNameContainer_0;
        end;
    end;
    v231 = function()
        local v278 = v240("ImageLabel", true);
        v278.TextLabel.Name = "DisplayNameLabel";
        v278.SecondRow.Name = "NameLabel";
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.Name = "RightSideButtons";
        l_Frame_1.BackgroundTransparency = 1;
        l_Frame_1.ZIndex = 2;
        l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
        l_Frame_1.Size = UDim2.new(1, v54, 1, 0);
        l_Frame_1.Parent = v278;
        local function _(v280)
            if v278 then
                if (l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= v280) and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                    v278.ImageTransparency = 0.65;
                    return ;
                else
                    v278.ImageTransparency = 0.85;
                end;
            end;
        end;
        local v282 = nil;
        l_Frame_1.ChildAdded:connect(function(v283)
            if v283:IsA("GuiObject") then
                if v282 and v283 ~= v282 then
                    v282:Destroy();
                    v282 = nil;
                end;
                v283.SelectionGained:connect(function()
                    if v278 then
                        if (l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= nil) and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                            v278.ImageTransparency = 0.65;
                            return ;
                        else
                            v278.ImageTransparency = 0.85;
                        end;
                    end;
                end);
                v283.SelectionLost:connect(function()
                    local l_v283_0 = v283;
                    if v278 then
                        if (l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= l_v283_0) and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                            v278.ImageTransparency = 0.65;
                            return ;
                        else
                            v278.ImageTransparency = 0.85;
                        end;
                    end;
                end);
            end;
        end);
        v282 = Instance.new("Frame");
        v282.Selectable = true;
        v282.Size = UDim2.new(1, 0, 1, 0);
        v282.BackgroundTransparency = 1;
        v282.SelectionImageObject = v282:Clone();
        v282.Parent = l_Frame_1;
        local l_UIListLayout_0 = Instance.new("UIListLayout");
        l_UIListLayout_0.Name = "RightSideListLayout";
        l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
        l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Right;
        l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Center;
        l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
        l_UIListLayout_0.Padding = UDim.new(0, 12);
        l_UIListLayout_0.Parent = l_Frame_1;
        pcall(function()
            v278.NameLabel.Localize = false;
            v278.DisplayNameLabel.Localize = false;
        end);
        return v278;
    end;
    local function v320(v286, v287)
        local v288 = nil;
        local v289 = nil;
        local function v297(v290, v291, v292)
            if not (not (v291 == "AbsolutePosition") or not v288) then
                local v293 = (v290.AbsolutePosition.X - 20) - v286.NameLabel.AbsolutePosition.X;
                v286.NameLabel.Text = "@" .. v287.Name;
                v286.DisplayNameLabel.Text = v287.DisplayName;
                if v292 then
                    v286.DisplayNameLabel.Text = v292;
                end;
                local v294 = utf8.len(v287.DisplayName);
                if v292 then
                    v294 = utf8.len(v292);
                end;
                while v293 < v286.NameLabel.TextBounds.X and v294 > 0 do
                    if not v292 then
                        v286.NameLabel.Text = string.sub(v287.DisplayName, 1, (utf8.offset(v287.DisplayName, v294))) .. "...";
                    else
                        v286.NameLabel.Text = string.sub(v292, 1, (utf8.offset(v292, v294))) .. "...";
                    end;
                    v294 = v294 - 1;
                end;
                local v295 = "@" .. v287.Name;
                local v296 = string.len(v295);
                while v293 < v286.NameLabel.TextBounds.X and v296 > 0 do
                    v286.NameLabel.Text = string.sub(v295, 1, v296) .. "...";
                    v296 = v296 - 1;
                end;
            end;
        end;
        local function v302(v298, _, _)
            if not v83 or v287.UserId then
                v11:query({
                    query = v12.Queries.userProfilesAllNamesByUserIds, 
                    variables = {
                        userIds = {
                            (tostring(v287.UserId))
                        }
                    }
                }):andThen(function(v301)
                    v297(v298, "AbsolutePosition", l_getCombinedNameFromId_0(v301.data, v287.UserId));
                end):catch(function()
                    v297(v298, "AbsolutePosition");
                end);
                return ;
            else
                v297(v298, "AbsolutePosition");
                return ;
            end;
        end;
        if not v78() then
            v20:OnResized(v286.NameLabel, function(_, v304)
                if v288 ~= nil and v288 == v304 then
                    return ;
                else
                    v304 = v304 and not ((v62 and v20:IsSmallTouchScreen()) and v20:IsPortrait());
                    v288 = v304;
                    if not v304 then
                        v286.NameLabel.Text = "@" .. v287.Name;
                        if not v83 or v287.UserId then
                            v11:query({
                                query = v12.Queries.userProfilesAllNamesByUserIds, 
                                variables = {
                                    userIds = {
                                        (tostring(v287.UserId))
                                    }
                                }
                            }):andThen(function(v305)
                                v286.DisplayNameLabel.Text = l_getCombinedNameFromId_0(v305.data, v287.UserId);
                            end):catch(function()
                                v286.DisplayNameLabel.Text = v287.DisplayName;
                            end);
                        else
                            v286.DisplayNameLabel.Text = v287.DisplayName;
                            return ;
                        end;
                    else
                        if v289 == nil then
                            v289 = v286.RightSideButtons.ChildAdded:connect(function(v306)
                                if v306.Name == "Inspect" then
                                    v306.Changed:connect(function(_)
                                        v302(v306, "AbsolutePosition");
                                    end);
                                    v302(v306, "AbsolutePosition");
                                end;
                            end);
                        end;
                        local l_Inspect_1 = v286.RightSideButtons:FindFirstChild("Inspect");
                        if l_Inspect_1 then
                            l_Inspect_1.Changed:connect(function(v309)
                                v302(l_Inspect_1, v309);
                            end);
                            v302(l_Inspect_1, "AbsolutePosition");
                            return ;
                        end;
                    end;
                    return ;
                end;
            end);
        end;
        local function v313()
            local v310 = nil;
            for _, v312 in pairs(v286.RightSideButtons:GetChildren()) do
                if v312:IsA("ImageButton") and (not v310 or v312.AbsolutePosition.X < v310) then
                    v310 = v312.AbsolutePosition.X;
                end;
            end;
            return v310;
        end;
        local v314 = nil;
        local function v318()
            local v315 = v313();
            if v315 == v314 then
                return ;
            else
                v314 = v315;
                local v316 = nil;
                v316 = if not v315 then UDim2.new(1, -20, 0, 0) else UDim2.new(0, (v315 - v286.NameLabel.AbsolutePosition.X) - 20, 0, 0);
                v286.NameLabel.Size = v316;
                v286.DisplayNameLabel.Size = v316;
                v286.NameLabel.Text = if not v81 then "@" .. v287.Name else l_formatUsername_0(v287.Name);
                if not v83 or v287.UserId then
                    v11:query({
                        query = v12.Queries.userProfilesAllNamesByUserIds, 
                        variables = {
                            userIds = {
                                (tostring(v287.UserId))
                            }
                        }
                    }):andThen(function(v317)
                        v286.DisplayNameLabel.Text = l_getCombinedNameFromId_0(v317.data, v287.UserId);
                    end):catch(function()
                        v286.DisplayNameLabel.Text = v287.DisplayName;
                    end);
                    return ;
                else
                    v286.DisplayNameLabel.Text = v287.DisplayName;
                    return ;
                end;
            end;
        end;
        if v78() then
            v289 = v286.RightSideButtons.ChildAdded:connect(function(v319)
                v318();
                v319:GetPropertyChangedSignal("AbsolutePosition"):Connect(v318);
            end);
            v318();
        end;
    end;
    local function _()
        return l_LocalPlayer_0.UserId > 0;
    end;
    local v322 = nil;
    local v323 = {};
    local v324 = {};
    local v325 = false;
    local function v333()
        if not v122 then
            if not v119 then
                return ;
            end;
        elseif not v120 then
            return ;
        end;
        local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
        local v327 = true;
        for _, v329 in ipairs(l_l_Players_0_Players_0) do
            local v330 = v323[v329.Name];
            if not (not v329 or not v330) then
                local v331 = l_default_0.participants[tostring(v329.UserId)];
                if not (((not v69 or not v331) or v331.isMutedLocally) or v331.isMuted) then
                    v327 = false;
                end;
                v184(v330, v331);
            end;
        end;
        if not (not v69 or v122) then
            if not v327 then
                v171 = false;
            else
                v171 = true;
            end;
            local v332 = not not v171 and v27:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or v27:FormatByKey("Feature.SettingsHub.Action.MuteAll");
            if not v69 or v119 and v119:FindFirstChild("TextLabel") then
                v119.TextLabel.Text = v332;
                if v64() then
                    v119.Icon.Image = l_default_0:GetIcon(not v171 and "UnmuteAll" or "MuteAll", "Misc");
                end;
            else
                return ;
            end;
        end;
    end;
    local function v378(_)
        v322 = l_Players_0:GetPlayers();
        if not v84 then
            table.sort(v322, function(v335, v336)
                return v335.Name:lower() < v336.Name:lower();
            end);
        else
            table.sort(v322, function(v337, v338)
                local v339 = v337.Name:lower();
                local v340 = v338.Name:lower();
                if v337 == l_LocalPlayer_0 then
                    v339 = " ";
                end;
                if v338 == l_LocalPlayer_0 then
                    v340 = " ";
                end;
                return v339 < v340;
            end);
        end;
        local v341 = not v122 and 20 or 60;
        if not (not v20:IsSmallTouchScreen() and not v20:IsPortrait()) then
            v341 = not v122 and 85 or 125;
        end;
        local v342 = nil;
        local v343 = v232 and not v119;
        local v344 = v232 and not v120;
        if not (v122 or not v343) then
            v342 = v20:Create("Frame")({
                Name = "Holder", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v53), 
                Parent = l_NewPage_0.Page, 
                LayoutOrder = 1
            });
        end;
        local v345 = not l_RunService_0:IsStudio();
        if not ((not (l_LocalPlayer_0.UserId > 0) or v118) or not v345) then
            local v346 = nil;
            v346 = if not v39() then l_GameInviteAnalytics_0.new():withEventStream(l_EventStream_0.new(l_RbxAnalyticsService_0)):withDiag(l_Diag_0.new(l_RbxAnalyticsService_0)):withButtonName(l_GameInviteAnalytics_0.ButtonName.SettingsHub) else v41:withButtonName(v41.ButtonName.SettingsHub);
            v118 = v229();
            do
                local l_v346_0 = v346;
                v118.Activated:connect(function()
                    l_v346_0:inputShareGameEntryPoint();
                    l_NewPage_0.HubRef:InviteToGame();
                end);
                v118.LayoutOrder = 1;
                if v122 or not v343 then
                    v118.Parent = l_NewPage_0.Page;
                else
                    v118.Parent = v342;
                end;
            end;
        end;
        local l_l_GuiService_0_InspectMenuEnabled_0 = l_GuiService_0:GetInspectMenuEnabled();
        for v349 = 1, #v322 do
            local v350 = v322[v349];
            local v351 = nil;
            v351 = v323[v350.Name];
            do
                local l_v351_0 = v351;
                if v350 then
                    v324[v350.Name] = true;
                    if not (l_v351_0 and l_v351_0.Parent) then
                        l_v351_0 = v231((v349 - 1) * 80 + v341);
                        l_v351_0.Parent = l_NewPage_0.Page;
                        v323[v350.Name] = l_v351_0;
                    end;
                    l_v351_0.Name = "PlayerLabel" .. v350.Name;
                    if v232 then
                        v184(l_v351_0, l_default_0.participants[tostring(v350.UserId)]);
                    end;
                    l_v351_0.Icon.Image = l_SocialUtil_0.GetPlayerImage(math.max(1, v350.UserId), Enum.ThumbnailSize.Size100x100, Enum.ThumbnailType.AvatarThumbnail);
                    l_v351_0.NameLabel.Text = if not v81 then "@" .. v350.Name else l_formatUsername_0(v350.Name);
                    l_v351_0.ImageTransparency = 0.85;
                    l_v351_0.LayoutOrder = v349 + 1;
                    if v78() then
                        l_v351_0.NameLabel.TextTruncate = Enum.TextTruncate.AtEnd;
                        l_v351_0.DisplayNameLabel.TextTruncate = Enum.TextTruncate.AtEnd;
                    end;
                    v320(l_v351_0, v350);
                    v140(l_v351_0, v350);
                    local v353 = nil;
                    do
                        local l_v353_0 = v353;
                        v20:OnResized(l_v351_0, function(_, v356)
                            local l_RightSideButtons_1 = l_v351_0:FindFirstChild("RightSideButtons");
                            if v62 then
                                local l_DisplayNameLabel_0 = l_v351_0:FindFirstChild("DisplayNameLabel");
                                local l_NameLabel_0 = l_v351_0:FindFirstChild("NameLabel");
                                local v360 = l_RightSideButtons_1 and l_RightSideButtons_1:FindFirstChild("RightSideListLayout");
                                if not ((v62 and v20:IsSmallTouchScreen()) and v20:IsPortrait()) then
                                    l_v351_0.Size = UDim2.new(1, 0, 0, 62);
                                    if l_DisplayNameLabel_0 then
                                        if not l_NameLabel_0 then
                                            l_DisplayNameLabel_0.Position = UDim2.new(0, 60, 0.5, 0);
                                        else
                                            l_DisplayNameLabel_0.Position = UDim2.new(0, 60, 0.5, -10);
                                            l_NameLabel_0.Position = UDim2.new(0, 60, 0.5, 12);
                                        end;
                                    end;
                                    if l_RightSideButtons_1 then
                                        l_RightSideButtons_1.Position = UDim2.new(0, 0, 0, 0);
                                        l_RightSideButtons_1.Size = UDim2.new(1, v54, 1, 0);
                                    end;
                                    if v360 then
                                        v360.HorizontalAlignment = Enum.HorizontalAlignment.Right;
                                        v360.VerticalAlignment = Enum.VerticalAlignment.Center;
                                    end;
                                else
                                    l_v351_0.Size = UDim2.new(1, 0, 0, 105);
                                    if l_DisplayNameLabel_0 then
                                        if not l_NameLabel_0 then
                                            l_DisplayNameLabel_0.Position = UDim2.new(0, 60, 0.275, 0);
                                        else
                                            l_DisplayNameLabel_0.Position = UDim2.new(0, 60, 0.275, -10);
                                            l_NameLabel_0.Position = UDim2.new(0, 60, 0.275, 12);
                                        end;
                                    end;
                                    if l_RightSideButtons_1 then
                                        l_RightSideButtons_1.Position = UDim2.new(0, 57, 0, -2);
                                        if not v44.UIBloxThemeEnabled then
                                            l_RightSideButtons_1.Size = UDim2.new(1, v54, 0.99, 0);
                                        else
                                            l_RightSideButtons_1.Size = UDim2.new(1, v54, 0.99, -8);
                                        end;
                                    end;
                                    if v360 then
                                        v360.HorizontalAlignment = Enum.HorizontalAlignment.Left;
                                        v360.VerticalAlignment = Enum.VerticalAlignment.Bottom;
                                    end;
                                end;
                            end;
                            if l_RightSideButtons_1 then
                                v134(l_RightSideButtons_1, v350, v356, l_v353_0);
                                v144(l_RightSideButtons_1, v350, v356, l_v353_0);
                                if l_l_GuiService_0_InspectMenuEnabled_0 then
                                    v268(l_RightSideButtons_1, v350, v356, l_v353_0);
                                end;
                                l_v353_0 = v356;
                            end;
                        end);
                        v228(l_v351_0, v350);
                    end;
                end;
            end;
        end;
        if not v122 then
            if v343 then
                v119 = v230();
                v119.Activated:connect(function()
                    v171 = not v171;
                    v119.TextLabel.Text = not not v171 and v27:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or v27:FormatByKey("Feature.SettingsHub.Action.MuteAll");
                    if v64() then
                        v119.Icon.Image = l_default_0:GetIcon(not v171 and "UnmuteAll" or "MuteAll", "Misc");
                    end;
                    if v63() then
                        v34:debug("{} all players", not v171 and "Unmuting" or "Muting");
                    end;
                    if v125 then
                        v125:onToggleMuteAll(v171);
                    end;
                    l_default_0:MuteAll(v171, v31.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                    v333();
                end);
                v119.LayoutOrder = 1;
                v119.Parent = v342;
            end;
        elseif v344 then
            v120 = v16.mount(v260(v123, v124), l_NewPage_0.Page, "MuteToggles");
        end;
        local _ = nil;
        v11:query({
            query = v12.Queries.userProfilesAllNamesByUserIds, 
            variables = {
                userIds = if not v83 then v15.List.filter(v322, function(v362)
                    return (tostring(v362.UserId));
                end) else v15.List.filterMap(v322, function(v363)
                    if v363.UserId then
                        return (tostring(v363.UserId));
                    else
                        return nil;
                    end;
                end)
            }
        }):andThen(function(v364)
            v15.List.map(v364.data.userProfiles, function(v365)
                local v366 = v323[v365.names.username];
                if v366 then
                    v366.DisplayNameLabel.Text = v365.names.combinedName;
                    if v82 then
                        local l_RightSideButtons_2 = v366:FindFirstChild("RightSideButtons");
                        local v368 = nil;
                        if v365.names.platformName ~= "" then
                            v368 = v365.names.platformName;
                        end;
                        if not game:GetEngineFeature("PlatformFriendsService") or not game:GetEngineFeature("PlatformFriendsProfile") then
                            v277(l_RightSideButtons_2, v368);
                        else
                            v277(l_RightSideButtons_2, v368, v365.platformProfileId);
                            return ;
                        end;
                    end;
                end;
            end);
        end):catch(function()
            v15.List.map(v322, function(v369)
                v323[v369.Name].DisplayNameLabel.Text = v369.DisplayName;
            end);
        end);
        local v370 = 0;
        if not ((not v232 or v325) or not v66()) then
            v34:debug("Setting Up Playerlist Mic Update Renderstep Hook");
            l_RunService_0:BindToRenderStep("player-list-mute-update", Enum.RenderPriority.Last.Value, function()
                v370 = v370 + 1;
                if v370 % 3 == 0 then
                    v333();
                    local l_v185_FirstChild_4 = v185:FindFirstChild("PlayerMuteButtonImageLabel", true);
                    if l_v185_FirstChild_4 then
                        l_v185_FirstChild_4.Image = v195();
                    else
                        return ;
                    end;
                end;
            end);
            v325 = true;
        end;
        for v372, v373 in pairs(v323) do
            if not v324[v372] then
                v373:Destroy();
                v323[v372] = nil;
            end;
        end;
        if l_UserInputService_0.GamepadEnabled then
            l_GuiService_0.SelectedCoreObject = v118;
        end;
        v20:OnResized("MenuPlayerListExtraPageSize", function(_, _)
            local v376 = not v122 and 20 or 60;
            if not (not v20:IsSmallTouchScreen() and not v20:IsPortrait()) then
                v376 = not v122 and 85 or 125;
            end;
            local v377 = #v322 + 1;
            if not ((v62 and v20:IsSmallTouchScreen()) and v20:IsPortrait()) then
                l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, (v376 + 80 * v377) - 5);
                return ;
            else
                l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, (v376 + 123 * v377) - 5);
                return ;
            end;
        end);
    end;
    local function v379()
        if not (not v325 or not v66()) then
            v34:debug("Unbinding Playerlist Mic Update Renderstep Hook");
            v325 = false;
            l_RunService_0:UnbindFromRenderStep("player-list-mute-update");
        end;
    end;
    if not (not game:GetEngineFeature("VoiceChatSupported") or v232) then
        l_default_0:asyncInit():andThen(function()
            if not (not v71() or not v73()) then
                local l_status_3, l_result_3 = pcall(function()
                    return v36:GetLayerData(v74());
                end);
                if l_status_3 then
                    if l_result_3 then
                        if l_result_3.ShowMuteToggles then
                            v122 = true;
                        else
                            v122 = false;
                        end;
                    else
                        v122 = false;
                    end;
                else
                    v122 = false;
                end;
            end;
            v232 = true;
            l_default_0:SetupParticipantListeners();
            if not v84 then
                v208();
                v215();
            end;
            l_default_0.participantsUpdate.Event:Connect(function()
                v333();
            end);
            l_default_0.participantLeft.Event:Connect(function(_, v383)
                v333();
                if v66() then
                    v121[v383] = nil;
                end;
                if v75() then
                    v124[v383] = nil;
                end;
            end);
            if v70() then
                l_default_0:getService().StateChanged:Connect(function(_, v385)
                    if v385 == Enum.VoiceChatState.Ended then
                        if not v122 then
                            if v119 then
                                v119.Visible = false;
                                v119:Destroy();
                            end;
                            if v118 then
                                v118.Size = v55;
                            end;
                        elseif v120 then
                            v16.unmount(v120);
                        end;
                        v232 = false;
                        return ;
                    else
                        if not (v385 == Enum.VoiceChatState.Joined) or v232 == false then
                        end;
                        return ;
                    end;
                end);
            end;
            if v71() then
                l_default_0.userAgencySelected.Event:Connect(function(v386)
                    v123 = v386;
                end);
            end;
        end):catch(function(_)
            if v63() then
                v34:warning("Failed to init VoiceChatServiceManager");
            end;
        end);
    end;
    l_NewPage_0.Displayed.Event:connect(v378);
    l_NewPage_0.Hidden.Event:connect(v379);
    l_Players_0.PlayerRemoving:Connect(function(v388)
        v324[v388.Name] = nil;
        if v75() then
            v124[v388.UserId] = nil;
        end;
        local v389 = v323[v388.Name];
        if v389 then
            local l_RightSideButtons_3 = v389:FindFirstChild("RightSideButtons");
            if l_RightSideButtons_3 then
                local l_FriendStatus_1 = l_RightSideButtons_3:FindFirstChild("FriendStatus");
                if l_FriendStatus_1 then
                    if l_GuiService_0.SelectedCoreObject == l_FriendStatus_1 then
                        if not l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = nil;
                        else
                            l_GuiService_0.SelectedCoreObject = v118;
                        end;
                    end;
                    l_FriendStatus_1:Destroy();
                end;
                local l_ReportPlayer_1 = l_RightSideButtons_3:FindFirstChild("ReportPlayer");
                if l_ReportPlayer_1 then
                    if l_GuiService_0.SelectedCoreObject == l_ReportPlayer_1 then
                        if not l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = nil;
                        else
                            l_GuiService_0.SelectedCoreObject = v118;
                        end;
                    end;
                    l_ReportPlayer_1:Destroy();
                end;
                local l_MuteStatusButton_1 = l_RightSideButtons_3:FindFirstChild("MuteStatusButton");
                if l_MuteStatusButton_1 then
                    if l_GuiService_0.SelectedCoreObject == l_MuteStatusButton_1 then
                        if not l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = nil;
                        else
                            l_GuiService_0.SelectedCoreObject = v118;
                        end;
                    end;
                    l_MuteStatusButton_1:Destroy();
                end;
                local l_BlockButton_1 = l_RightSideButtons_3:FindFirstChild("BlockButton");
                if l_BlockButton_1 then
                    if l_GuiService_0.SelectedCoreObject == l_BlockButton_1 then
                        if not l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = nil;
                        else
                            l_GuiService_0.SelectedCoreObject = v118;
                        end;
                    end;
                    l_BlockButton_1:Destroy();
                end;
                local l_Inspect_2 = l_RightSideButtons_3:FindFirstChild("Inspect");
                if l_Inspect_2 then
                    if l_GuiService_0.SelectedCoreObject == l_Inspect_2 then
                        l_GuiService_0.SelectedCoreObject = nil;
                    end;
                    l_Inspect_2:Destroy();
                end;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end);
    local function v400()
        for _, v397 in pairs(v323) do
            local l_RightSideButtons_4 = v397:FindFirstChild("RightSideButtons");
            if l_RightSideButtons_4 then
                local l_Inspect_3 = l_RightSideButtons_4:FindFirstChild("Inspect");
                if l_Inspect_3 then
                    if l_GuiService_0.SelectedCoreObject == l_Inspect_3 then
                        l_GuiService_0.SelectedCoreObject = nil;
                    end;
                    l_Inspect_3:Destroy();
                end;
            end;
        end;
    end;
    l_GuiService_0.InspectMenuEnabledChangedSignal:Connect(function(v401)
        if not v401 then
            v400();
        end;
    end);
    return l_NewPage_0;
end)());
