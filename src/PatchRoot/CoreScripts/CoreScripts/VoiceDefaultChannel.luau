local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).CallProtocol.default;
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).Enums;
local v8 = game:DefineFastFlag("DebugDefaultChannelStartMuted", true);
local v9 = game:DefineFastFlag("UseNotificationServiceIsConnected", false);
local v10 = game:DefineFastFlag("DefaultChannelEnableDefaultVoice", true);
local v11 = game:DefineFastFlag("AlwaysJoinWhenUsingAudioAPI", false);
local v12 = game:DefineFastFlag("DefaultChannelDontWaitOnCharacterWithAudioApi", false);
local v13 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableLuaVoiceChatAnalytics);
local v14 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences);
local _ = game:GetEngineFeature("VoiceServiceGenerateDefaultChannelAvailable");
local l_game_EngineFeature_1 = game:GetEngineFeature("VoiceServiceEnableDefaultVoiceAvailable");
local l_game_EngineFeature_2 = game:GetEngineFeature("NotificationServiceIsConnectedAvailable");
local v18 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Logger)(script.Name);
if v14() then
    v18 = require(l_RobloxGui_0.Modules.VoiceChat.Logger)(script.Name);
end;
local v19 = require(l_RobloxGui_0.Modules.VoiceChat.Analytics).new();
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local function v24(v21)
    local v22 = l_default_0:getService();
    if v22 then
        v18:info("Joining default channel");
        local v23 = v22:JoinByGroupIdToken("default", v21);
        if v13() then
            if not v23 then
                v19:reportVoiceChatJoinResult(false, "defaultJoinFailed", "error");
            else
                v19:reportVoiceChatJoinResult(true, "defaultJoinSuccess");
                return v23;
            end;
        end;
        return v23;
    else
        return nil;
    end;
end;
if not (not l_game_EngineFeature_2 or not v9) then
    if not l_NotificationService_0.IsConnected then
        v18:debug("NotificationService is not yet connected");
        l_NotificationService_0:GetPropertyChangedSignal("IsConnected"):Wait();
    end;
    v18:debug("NotificationService connected");
end;
if not (v12 and l_VoiceChatService_0.UseNewAudioApi) then
    if l_Players_0.LocalPlayer.Character then
        v18:debug("Player character already loaded");
    else
        l_Players_0.LocalPlayer.CharacterAdded:Wait();
        v18:debug("Player character loaded");
    end;
end;
if not (not l_game_EngineFeature_1 or not v10) then
    local l_game_Service_0 = game:FindService("VoiceChatService");
    if not v11 then
        if l_game_Service_0 then
            if not l_game_Service_0.EnableDefaultVoice then
                v18:debug("Default channel is disabled.");
                if v13() then
                    v19:reportVoiceChatJoinResult(false, "defaultDisabled");
                end;
                return ;
            end;
        else
            v18:info("VoiceChatService not found. Assuming default values.");
        end;
    elseif l_game_Service_0 then
        if not (l_game_Service_0.EnableDefaultVoice or l_game_Service_0.UseNewAudioApi) then
            v18:debug("Default channel is disabled.");
            if v13() then
                v19:reportVoiceChatJoinResult(false, "defaultDisabled");
            end;
            return ;
        end;
    else
        v18:info("VoiceChatService not found. Assuming default values.");
    end;
end;
l_default_1:getCallState():andThen(function(v26)
    local v27 = if v26.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v26.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then v26.muted else v8;
    l_default_0:asyncInit():andThen(function()
        if v24(v27) == false then
            l_default_0:InitialJoinFailedPrompt();
        end;
    end):catch(function()
        v18:info("VoiceChatServiceManager did not initialize");
    end);
end);
