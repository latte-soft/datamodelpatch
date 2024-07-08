local l_Chat_0 = game:GetService("Chat");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_VRService_0 = game:GetService("VRService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v9 = require(l_script_FirstAncestor_0.countParticipantsInTextChannel);
local v10 = require(l_script_FirstAncestor_0.Analytics);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v12 = require(l_Parent_0.Promise);
local v13 = require(l_Parent_0.Roact);
local v14 = require(l_Parent_0.UIBlox);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v16 = require(script.Parent.App);
local v17 = require(script.Parent.Logger):new("ExpChat/" .. script.Name);
local v18 = require(script.Parent.createDispatchBindableEvent);
local v19 = require(l_script_FirstAncestor_0.Events.bindableEventQueue);
local v20 = require(script.Parent.createStore);
local v21 = require(script.Parent.GetNameColor);
local v22 = require(script.Parent.reportMessageReceived);
local v23 = require(script.Parent.watchForErrors);
local _ = require(l_script_FirstAncestor_0.Commands.types);
local v25 = require(l_script_FirstAncestor_0.Commands);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v27 = require(l_Actions_0.IncomingMessageReceived);
local v28 = require(l_Actions_0.IncomingBubbleChatMessageReceived);
local v29 = require(l_Actions_0.OutgoingMessageSent);
local v30 = require(l_Actions_0.TextChannelCreated);
local v31 = require(l_Actions_0.TextChannelRemoved);
local v32 = require(l_Actions_0.PlayerAdded);
local v33 = require(l_Actions_0.PlayerRemoved);
local v34 = require(l_Actions_0.CharacterAdded);
local v35 = require(l_Actions_0.LocalCharacterLoaded);
local v36 = require(l_Actions_0.LocalTeamChanged);
local v37 = require(l_Actions_0.ClientAppLoaded);
local v38 = require(l_Actions_0.LastInputTypeChanged);
local v39 = require(l_Actions_0.ChatPrivacySettingsReceived);
local v40 = require(l_Actions_0.ChatPrivacySettingsFetchFailed);
local v41 = require(l_Actions_0.CommandAliasChanged);
local v42 = require(l_Actions_0.HumanoidDied);
local v43 = require(l_Actions_0.AdorneeAdded);
local v44 = require(l_Actions_0.LegacyBubbleChatEnabledChanged);
local v45 = require(l_Actions_0.LegacyBubbleChatSettingsChanged);
local v46 = require(l_script_FirstAncestor_0.displaySystemMessage);
local v47 = require(l_script_FirstAncestor_0.getOtherDisplayNameInWhisperChannel);
local v48 = require(l_script_FirstAncestor_0.handleChannelWelcomeMessage);
local v49 = require(l_script_FirstAncestor_0.isPlayerVerified);
local v50 = require(l_script_FirstAncestor_0.GlobalFlags);
local v51 = require(l_script_FirstAncestor_0.Flags.FFlagShowVerifiedBadgeInNewChat);
local v52 = require(l_script_FirstAncestor_0.Flags.isExperienceChatUserProfileApiEnabled);
local v53 = require(l_script_FirstAncestor_0.Flags.getEngineFeatureFlagEnableDisplayBubble);
local v54 = require(l_script_FirstAncestor_0.Flags.getFFlagEnablePerBubbleCustomization);
local v55 = game:DefineFastFlag("FixTextChatServiceNotShowingUpInVR", false);
local v56 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationUIEnabled);
local v57 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationEnableSystemMessage);
getChatTranslationEnabled = function()
    local l_status_0, l_result_0 = pcall(function()
        return l_TextChatService_0.ChatTranslationEnabled;
    end);
    return l_status_0 and l_result_0;
end;
local l_helpers_0 = script.helpers;
local v61 = require(l_helpers_0.setUpConfigurationObjects);
local v62 = require(l_helpers_0.setUpClientSettings);
local v63 = require(l_helpers_0.waitForFirst);
local v64 = require(l_script_FirstAncestor_0.context);
local v65 = require(script.reportVersionLoaded);
local v66 = require(l_script_FirstAncestor_0.Version);
local v67 = require(l_script_FirstAncestor_0.AtomicBinding);
local function v101(v68, v69)
    v17:trace("Watching Players service");
    local v70 = {};
    local function v90(v71)
        v17:trace("Player added: {} {}", v71.Name, (tostring(v71.UserId)));
        v69:dispatch(v32(v71.UserId, v71.Name, v71.DisplayName, (not not v51() and v49(v71)) and true or nil));
        if v71 == l_Players_0.LocalPlayer then
            v17:trace("Found local player");
            v71:GetPropertyChangedSignal("Team"):Connect(function()
                v69:dispatch(v36(v71.Team));
            end);
        end;
        local function _()
            return (v67.new({
                humanoid = "Humanoid", 
                humanoidRootPart = "HumanoidRootPart"
            }, function(v72)
                local l_root_0 = v72.root;
                local l_humanoid_0 = v72.humanoid;
                local l_humanoidRootPart_0 = v72.humanoidRootPart;
                if not l_humanoid_0:IsA("Humanoid") or not l_humanoidRootPart_0:IsA("Part") then
                    return function()
                    end;
                else
                    if not (not l_root_0 or not l_humanoidRootPart_0) and v71.Character == l_root_0 then
                        v69:dispatch(v43(v71.UserId, l_root_0, l_humanoid_0));
                    end;
                    local v76 = l_humanoid_0.Died:Connect(function()
                        v69:dispatch(v42(v71.UserId));
                    end);
                    return function()
                        if v76 then
                            v76:Disconnect();
                        end;
                    end;
                end;
            end));
        end;
        local v83 = v67.new({
            humanoid = "Humanoid", 
            humanoidRootPart = "HumanoidRootPart"
        }, function(v78)
            local l_root_1 = v78.root;
            local l_humanoid_1 = v78.humanoid;
            local l_humanoidRootPart_1 = v78.humanoidRootPart;
            if not l_humanoid_1:IsA("Humanoid") or not l_humanoidRootPart_1:IsA("Part") then
                return function()
                end;
            else
                if not (not l_root_1 or not l_humanoidRootPart_1) and v71.Character == l_root_1 then
                    v69:dispatch(v43(v71.UserId, l_root_1, l_humanoid_1));
                end;
                local v82 = l_humanoid_1.Died:Connect(function()
                    v69:dispatch(v42(v71.UserId));
                end);
                return function()
                    if v82 then
                        v82:Disconnect();
                    end;
                end;
            end;
        end);
        local function v85(v84)
            if not v84.Parent then
                v63(v84.AncestryChanged, v71.CharacterAdded);
            end;
            if v71.Character == v84 and v84.Parent then
                if v71 == l_Players_0.LocalPlayer then
                    v17:debug("Local character loaded: {}", v84.Name);
                    v69:dispatch(v35(v84));
                end;
                v69:dispatch(v34(v71.UserId, v84));
                v83:bindRoot(v84);
                return ;
            else
                v17:debug("Mismatched or unparented character in onCharacterAdded for {}", (tostring(v71.UserId)));
                return ;
            end;
        end;
        local function v87(v86)
            v83:unbindRoot(v86);
        end;
        if v71.Character then
            v85(v71.Character);
        end;
        local v88 = v71.CharacterAdded:Connect(v85);
        local v89 = v71.CharacterRemoving:Connect(v87);
        if not v70[v71.UserId] then
            v70[v71.UserId] = {
                v88, 
                v89
            };
        end;
    end;
    local function v94(v91)
        v90(v91);
        if l_Players_0.LocalPlayer then
            v12.try(function()
                return v91:IsFriendsWith(l_Players_0.LocalPlayer.UserId);
            end):andThen(function(v92)
                if v92 then
                    v46("GameChat_FriendChatNotifier_JoinMessage", {
                        RBX_NAME = v91.DisplayName
                    }, "Roblox.Notification.Friend.Joined", v68.translator, v68.defaultSystemTextChannel);
                end;
            end):catch(function(v93)
                v17:error("Could not fetch friendship status. Error: {}", (tostring(v93)));
            end);
        end;
    end;
    for _, v96 in pairs(l_Players_0:GetPlayers()) do
        if v96:IsA("Player") then
            v90(v96);
        end;
    end;
    l_Players_0.PlayerAdded:Connect(v94);
    l_Players_0.PlayerRemoving:Connect(function(v97)
        v17:trace("Player removed: {} {}", v97.Name, (tostring(v97.UserId)));
        v69:dispatch(v33(v97.UserId));
        local v98 = v70[v97.UserId];
        if v98 then
            for _, v100 in ipairs(v98) do
                v100:Disconnect();
            end;
            v70[v97.UserId] = nil;
        end;
    end);
end;
local function _()
    if not v55 then
        return not l_GuiService_0:IsTenFootInterface() and not l_VRService_0.VREnabled;
    else
        return not l_GuiService_0:IsTenFootInterface();
    end;
end;
local v104 = {
    canUserChatAsync = function(v103)
        return l_Chat_0:CanUserChatAsync(v103);
    end
};
return function(v105)
    v17:trace("mountClientApp started");
    v105 = l_Dictionary_0.join(v104, v105);
    local v106 = v20();
    v18(v106);
    v19:flush();
    v23(game:GetService("ScriptContext"), v105.script, false);
    v64.translator = v105.translator;
    v64.store = v106;
    v64.apolloClient = if not v52() then nil else v105.apolloClient;
    if v105.analytics then
        v10.with(v105.analytics);
    end;
    l_UserInputService_0.LastInputTypeChanged:Connect(function(v107)
        v106:dispatch(v38(v107));
    end);
    if v105.defaultSystemTextChannel then
        v105.defaultSystemTextChannel.OnIncomingMessage = function(v108)
            v17:trace("System OnIncomingMessage started: {} {}", v108.PrefixText, v108.Text);
            local l_TextChatMessageProperties_0 = Instance.new("TextChatMessageProperties");
            l_TextChatMessageProperties_0.Text = string.format("<font color=\"#%s\">%s</font>", if not string.find(v108.Metadata, "Error") then v14.App.Style.Colors.LightGrey:ToHex() else v14.App.Style.Colors.Red:ToHex(), v108.Text);
            v17:trace("System OnIncomingMessage finished: {} {}", l_TextChatMessageProperties_0.PrefixText, l_TextChatMessageProperties_0.Text);
            return l_TextChatMessageProperties_0;
        end;
    end;
    v61(v106, v105);
    v62(v106);
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        l_LocalPlayer_0:GetPropertyChangedSignal("Team"):Connect(function()
            local l_Team_0 = l_LocalPlayer_0.Team;
            if l_Team_0 then
                v46("GameChat_TeamChat_NowInTeam", {
                    RBX_NAME = l_Team_0.Name
                }, "Roblox.Team.Success.NowInTeam", v105.translator, v105.defaultSystemTextChannel);
            end;
        end);
    end;
    local function v124(v112)
        v106:dispatch(v30(v112));
        if not string.find(v112.Name, "RBXGeneral") then
            if not string.find(v112.Name, "^RBXTeam") then
                if not (not string.find(v112.Name, "^RBXWhisper") or not l_LocalPlayer_0) then
                    v112.OnIncomingMessage = function(v113)
                        local l_TextSource_0 = v113.TextSource;
                        if l_TextSource_0 then
                            local v115 = v47(v112, l_LocalPlayer_0);
                            if v115 then
                                local v116 = nil;
                                v116 = if l_TextSource_0.UserId == l_LocalPlayer_0.UserId then v105.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing", {
                                    RBX_NAME = v115
                                }) else v105.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Incoming", {
                                    RBX_NAME = v115
                                });
                                local l_TextChatMessageProperties_1 = Instance.new("TextChatMessageProperties");
                                l_TextChatMessageProperties_1.PrefixText = string.format("%s <font color=\"#%s\">%s</font>", v116, v21(l_TextSource_0.UserId):ToHex(), v113.PrefixText);
                                return l_TextChatMessageProperties_1;
                            end;
                        end;
                        return nil;
                    end;
                end;
            else
                v112.OnIncomingMessage = function(v118)
                    v17:trace("Team OnIncomingMessage started: {} {}", v118.PrefixText, v118.Text);
                    local l_TextChatMessageProperties_2 = Instance.new("TextChatMessageProperties");
                    if l_Players_0.LocalPlayer then
                        l_TextChatMessageProperties_2.PrefixText = string.format("<font color=\"#%s\">[Team] %s</font>", l_Players_0.LocalPlayer.TeamColor.Color:ToHex(), v118.PrefixText);
                    end;
                    v17:trace("Team OnIncomingMessage finished: {} {}", l_TextChatMessageProperties_2.PrefixText, l_TextChatMessageProperties_2.Text);
                    return l_TextChatMessageProperties_2;
                end;
            end;
        else
            v112.OnIncomingMessage = function(v120)
                local l_TextChatMessageProperties_3 = Instance.new("TextChatMessageProperties");
                if v120.TextSource then
                    l_TextChatMessageProperties_3.PrefixText = string.format("<font color=\"#%s\">%s</font>", v21(v120.TextSource.UserId):ToHex(), v120.PrefixText);
                end;
                return l_TextChatMessageProperties_3;
            end;
        end;
        v112.MessageReceived:Connect(function(v122)
            v17:debug("Incoming MessageReceived Status: {} Text: {}", v122.Status.Name, v122.Text);
            if l_LocalPlayer_0 then
                v22(l_LocalPlayer_0.UserId, v122);
            end;
            if not (not l_LocalPlayer_0 or not v122.TextSource) and v122.TextSource.UserId ~= l_LocalPlayer_0.UserId then
                local v123 = v48(v122, l_LocalPlayer_0);
                if v123 then
                    v46(v123.key, v123.args, v123.metadata, v105.translator, v105.defaultSystemTextChannel);
                end;
            end;
            v106:dispatch(v27(v122));
            if v122.Status == Enum.TextChatMessageStatus.Floodchecked then
                v46("CoreScripts.TextChat.MessageStatus.Warning.Floodchecked", nil, "Roblox.MessageStatus.Warning.Floodchecked", v105.translator, v105.defaultSystemTextChannel);
            elseif v122.Status == Enum.TextChatMessageStatus.TextFilterFailed then
                v46("CoreScripts.TextChat.MessageStatus.Warning.TextFilterFailed", nil, "Roblox.MessageStatus.Warning.TextFilterFailed", v105.translator, v105.defaultSystemTextChannel);
            elseif v122.Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then
                v46("CoreScripts.TextChat.MessageStatus.Warning.InvalidPrivacySettings", nil, "Roblox.MessageStatus.Warning.InvalidPrivacySettings", v105.translator, v105.defaultSystemTextChannel);
            elseif v122.Status == Enum.TextChatMessageStatus.MessageTooLong then
                v46("CoreScripts.TextChat.MessageStatus.Warning.MessageTooLong", nil, "Roblox.MessageStatus.Warning.MessageTooLong", v105.translator, v105.defaultSystemTextChannel);
            elseif v122.Status == Enum.TextChatMessageStatus.Unknown then
                v46("CoreScripts.TextChat.MessageStatus.Warning.Unknown", nil, "Roblox.MessageStatus.Warning.Unknown", v105.translator, v105.defaultSystemTextChannel);
            end;
            v10.FireClientAnalyticsWithEventName("MessageResponse", {
                messageStatus = v122.Status.Name
            });
        end);
    end;
    local function _(v125)
        v125.Triggered:Connect(function()
            v10.FireClientAnalyticsWithEventName("CommandSent", {
                commandName = v125.Name
            });
        end);
    end;
    for _, v128 in pairs(l_TextChatService_0:GetDescendants()) do
        if not v128:IsA("TextChannel") then
            if v128:IsA("TextChatCommand") then
                v128.Triggered:Connect(function()
                    v10.FireClientAnalyticsWithEventName("CommandSent", {
                        commandName = v128.Name
                    });
                end);
            end;
        else
            v124(v128);
        end;
    end;
    l_TextChatService_0.DescendantAdded:Connect(function(v129)
        if not v129:IsA("TextChannel") then
            if v129:IsA("TextChatCommand") then
                v129.Triggered:Connect(function()
                    v10.FireClientAnalyticsWithEventName("CommandSent", {
                        commandName = v129.Name
                    });
                end);
            end;
            return ;
        else
            v124(v129);
            return ;
        end;
    end);
    l_TextChatService_0.DescendantRemoving:Connect(function(v130)
        if v130:IsA("TextChannel") then
            v106:dispatch(v31(v130));
        end;
    end);
    l_TextChatService_0.SendingMessage:Connect(function(v131)
        v17:debug("Outgoing SendingMessage Status: {} Text: {}", v131.Status.Name, v131.Text);
        if l_LocalPlayer_0 then
            local v132 = v48(v131, l_LocalPlayer_0);
            if not (not v132 or not v132.key) then
                v46(v132.key, v132.args, v132.metadata, v105.translator, v105.defaultSystemTextChannel);
            end;
        end;
        v106:dispatch(v29(v131));
        local l_TextChannel_0 = v131.TextChannel;
        if l_TextChannel_0 then
            v10.FireClientAnalyticsWithEventName("MessageSent", {
                channelName = l_TextChannel_0.Name, 
                totalParticipants = v9(l_TextChannel_0)
            });
        end;
    end);
    local function v141(v134, v135, v136)
        local v137 = nil;
        if v134:IsA("Model") then
            v137 = l_Players_0:GetPlayerFromCharacter(v134);
        end;
        local v138 = l_HttpService_0:GenerateGUID(false);
        local v139 = nil;
        local v140 = nil;
        if v136 then
            v138 = v136.MessageId;
            v139 = v136.BubbleChatMessageProperties;
            v140 = if not v56() then nil else v136.Translation;
        end;
        v106:dispatch(v28({
            message = v135, 
            translation = v140, 
            bubbleChatMessageId = v138, 
            bubbleChatMessageUserId = not not v137 and tostring(v137.UserId) or nil, 
            partOrModel = v134, 
            timestamp = if not v50.ConsolidateBubbleChat then DateTime.now() else DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000), 
            bubbleChatMessageProperties = v139
        }));
    end;
    l_Chat_0.Chatted:Connect(function(v142, v143)
        v141(v142, v143);
    end);
    if v50.ConsolidateBubbleChat then
        l_Chat_0:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(function()
            v106:dispatch(v44("Enabled", l_Chat_0.BubbleChatEnabled));
        end);
        v106:dispatch(v44("Enabled", l_Chat_0.BubbleChatEnabled));
        l_Chat_0.BubbleChatSettingsChanged:Connect(function(v144)
            if v105.validateLegacyBubbleChatSettings then
                local v145, v146 = v105.validateLegacyBubbleChatSettings(v144);
                assert(v145, "Bad settings object passed to Chat:SetBubbleChatSettings:\n inside consolidated BubbleChat " .. (v146 or ""));
                v106:dispatch(v45(v144));
            end;
        end);
    end;
    if not (not v53() or not v54()) then
        l_TextChatService_0.BubbleDisplayed:Connect(function(v147, v148)
            v141(v147, v148 and v148.Text, v148);
        end);
    end;
    local function v152(v149)
        for _, v151 in ipairs(l_TextChatService_0:GetDescendants()) do
            if not (not (v151.Name == v149) or not v151:IsA("TextChatCommand")) then
                return v151;
            end;
        end;
        return nil;
    end;
    for _, v154 in ipairs(v25) do
        if v154.clientRun then
            local v155 = v152(v154.name);
            if v155 then
                v155.Triggered:Connect(function(v156, ...)
                    if v156 then
                        local v157 = v154.clientRun(v106, v156.UserId, ...);
                        if v157 then
                            v46(v157.key, v157.args, v157.metadata, v105.translator, v105.defaultSystemTextChannel);
                        end;
                    end;
                end);
                if not (not string.find(v155.Name, "RBXTeamCommand") and not string.find(v155.Name, "RBXWhisperCommand")) then
                    for _, v159 in {
                        "PrimaryAlias", 
                        "SecondaryAlias"
                    }, nil, nil do
                        v155:GetPropertyChangedSignal(v159):Connect(function()
                            v106:dispatch(v41(v155.Name, v155.PrimaryAlias, v155.SecondaryAlias));
                        end);
                    end;
                end;
            end;
        end;
    end;
    if not (not v105.canUserChatAsync or not l_Players_0.LocalPlayer) then
        v12.try(function()
            return v105.canUserChatAsync(l_Players_0.LocalPlayer.UserId);
        end):andThen(function(v160)
            v106:dispatch(v39(v160));
        end):catch(function()
            v106:dispatch(v40());
        end);
    end;
    v101(v105, v106);
    local l_AppStyleProvider_0 = v14.App.Style.AppStyleProvider;
    local l_Constants_0 = v14.App.Style.Constants;
    local v163 = v13.createElement(l_AppStyleProvider_0, {
        style = ({
            Dark = {
                themeName = l_Constants_0.ThemeName.Dark, 
                fontName = l_Constants_0.FontName.Gotham
            }
        }).Dark
    }, {
        app = v13.createElement(v16, {
            store = v106, 
            translator = v105.translator, 
            isChatWindowVisible = true, 
            isChatInputBarVisible = true, 
            isDefaultChatEnabled = if not v55 then not l_GuiService_0:IsTenFootInterface() and not l_VRService_0.VREnabled else not l_GuiService_0:IsTenFootInterface(), 
            getIconVoiceIndicator = v105.getIconVoiceIndicator, 
            onClickedVoiceIndicator = v105.onClickedVoiceIndicator, 
            onClickedCameraIndicator = v105.onClickedCameraIndicator, 
            selfViewListenerChanged = v105.selfViewListenerChanged, 
            getPermissions = v105.getPermissions, 
            displayCameraDeniedToast = v105.displayCameraDeniedToast, 
            isCamEnabledForUserAndPlace = v105.isCamEnabledForUserAndPlace, 
            isCameraOnlyUser = v105.isCameraOnlyUser, 
            isVoiceServiceInitialized = v105.isVoiceServiceInitialized
        })
    });
    v106:dispatch(v37({
        team = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Team, 
        isChatCoreGuiEnabled = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Chat), 
        isTouchEnabled = l_UserInputService_0.TouchEnabled
    }));
    v65(v10, v66[1]);
    v17:trace("Roact.mount to {}", (tostring(v105.parent)));
    local v164 = v13.mount(v163, v105.parent, "ExperienceChat");
    if not ((not v56() or not v57()) or not getChatTranslationEnabled()) then
        v46("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", v105.translator, v105.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat");
    end;
    return {
        roactInstance = v164
    };
end;
