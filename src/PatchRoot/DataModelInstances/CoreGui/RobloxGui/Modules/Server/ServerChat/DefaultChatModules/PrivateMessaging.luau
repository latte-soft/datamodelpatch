local l_Chat_0 = game:GetService("Chat");
local l_RunService_0 = game:GetService("RunService");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatModules_0 = l_Chat_0:WaitForChild("ChatModules");
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local v6 = require(l_ChatModules_0.Utility.DisplayNameHelpers);
local v7 = nil;
pcall(function()
    v7 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v7 == nil then
    v7 = {};
end;
if not (v7.FormatMessageToSend and v7.LocalizeFormattedMessage) then
    v7.FormatMessageToSend = function(_, _, v10)
        return v10;
    end;
end;
local v11 = {
    ChatColor = l_ChatSettings_0.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
};
local function _()
    if not l_ChatConstants_0.WhisperChannelPrefix then
        return "To ";
    else
        return l_ChatConstants_0.WhisperChannelPrefix;
    end;
end;
local function _(v13)
    return (not l_ChatConstants_0.WhisperChannelPrefix and "To " or l_ChatConstants_0.WhisperChannelPrefix) .. v13;
end;
return function(v15)
    local function v22(v16, v17)
        if not l_RunService_0:IsStudio() then
            local l_v16_Player_0 = v16:GetPlayer();
            local l_v17_Player_0 = v17:GetPlayer();
            if not l_v16_Player_0 or not l_v17_Player_0 then
                return false;
            else
                local l_status_0, l_result_0 = pcall(function()
                    return l_Chat_0:CanUsersChatAsync(l_v16_Player_0.UserId, l_v17_Player_0.UserId);
                end);
                return l_status_0 and l_result_0;
            end;
        else
            return true;
        end;
    end;
    local function v40(v23, v24, v25)
        local l_v15_Speaker_0 = v15:GetSpeaker(v23);
        local l_v24_0 = v24;
        local v28 = nil;
        if string.sub(v24, 1, 1) == "\"" then
            local v29 = string.find(v24, "\"", 2);
            if v29 then
                l_v24_0 = string.sub(v24, 2, v29 - 1);
                v28 = string.sub(v24, v29 + 2);
            end;
        else
            local v30 = string.match(v24, "^[^%s]+");
            if v30 then
                l_v24_0 = v30;
                v28 = string.sub(v24, string.len(l_v24_0) + 2);
            end;
        end;
        local v31 = nil;
        local v32 = nil;
        if not l_ChatSettings_0.PlayerDisplayNamesEnabled or not l_ChatSettings_0.WhisperByDisplayNameEnabled then
            local v33, v34 = v6.getUserNameFromChattedName(l_v24_0, v23, nil);
            v31 = v33;
            v32 = v34;
        else
            local v35, v36 = v6.getUserNameFromChattedName(l_v24_0, v23, l_v15_Speaker_0:GetNameForDisplay());
            v31 = v35;
            v32 = v36;
        end;
        local l_v15_Speaker_1 = v15:GetSpeaker(v31);
        if v32 == v6.CommandErrorCodes.ChattingToSelf then
            l_v15_Speaker_0:SendSystemMessage(v7:FormatMessageToSend("GameChat_PrivateMessaging_CannotWhisperToSelf", "You cannot whisper to yourself."), v25, v11);
            return ;
        elseif v32 == v6.CommandErrorCodes.NoMatches then
            l_v15_Speaker_0:SendSystemMessage(v7:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", (tostring(l_v24_0))), "RBX_NAME", (tostring(v31))), v25, v11);
            return ;
        elseif v32 == v6.CommandErrorCodes.MultipleMatches then
            local v38 = v6.getUsersWithDisplayNameString(l_v24_0, v23);
            l_v15_Speaker_0:SendSystemMessage(v7:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), v25, v11);
            l_v15_Speaker_0:SendSystemMessage(v38, v25, v11);
            return ;
        else
            if l_v15_Speaker_1 then
                local l_v15_Channel_0 = v15:GetChannel((not l_ChatConstants_0.WhisperChannelPrefix and "To " or l_ChatConstants_0.WhisperChannelPrefix) .. v31);
                if not l_v15_Channel_0 then
                    l_v15_Speaker_0:SendSystemMessage(v7:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", (tostring(l_v24_0))), "RBX_NAME", (tostring(v31))), v25, v11);
                elseif v22(l_v15_Speaker_0, l_v15_Speaker_1) then
                    if not l_v15_Speaker_0:IsInChannel(l_v15_Channel_0.Name) then
                        l_v15_Speaker_0:JoinChannel(l_v15_Channel_0.Name);
                    end;
                    if v28 and string.len(v28) > 0 then
                        l_v15_Speaker_0:SayMessage(v28, l_v15_Channel_0.Name);
                    end;
                    l_v15_Speaker_0:SetMainChannel(l_v15_Channel_0.Name);
                    return ;
                else
                    l_v15_Speaker_0:SendSystemMessage(v7:FormatMessageToSend("GameChat_PrivateMessaging_CannotChat", "You are not able to chat with this player."), v25, v11);
                    return ;
                end;
            end;
            return ;
        end;
    end;
    local function v45(v41, v42, v43)
        local v44 = false;
        if string.sub(v42, 1, 3):lower() == "/w " then
            v40(v41, string.sub(v42, 4), v43);
            return true;
        else
            if string.sub(v42, 1, 9):lower() == "/whisper " then
                v40(v41, string.sub(v42, 10), v43);
                v44 = true;
            end;
            return v44;
        end;
    end;
    local function v53(v46, v47, v48)
        local l_v15_Speaker_2 = v15:GetSpeaker(v46);
        local l_ExtraData_0 = l_v15_Speaker_2.ExtraData;
        l_v15_Speaker_2:SendMessage(v47, v48, v46, l_ExtraData_0);
        local l_v15_Speaker_3 = v15:GetSpeaker((string.sub(v48, 4)));
        local v52 = (not l_ChatConstants_0.WhisperChannelPrefix and "To " or l_ChatConstants_0.WhisperChannelPrefix) .. v46;
        if l_v15_Speaker_3 then
            if not l_v15_Speaker_3:IsInChannel(v52) then
                l_v15_Speaker_3:JoinChannel(v52);
            end;
            l_v15_Speaker_3:SendMessage(v47, v52, v46, l_ExtraData_0);
        end;
        return true;
    end;
    local function v57(_, v55, _)
        if l_ChatConstants_0.MessageTypeWhisper then
            v55.MessageType = l_ChatConstants_0.MessageTypeWhisper;
        end;
    end;
    v15:RegisterProcessCommandsFunction("whisper_commands", v45, l_ChatConstants_0.StandardPriority);
    local function _()
        if not l_ChatSettings_0.WhisperChannelNameColor then
            return Color3.fromRGB(102, 14, 102);
        else
            return l_ChatSettings_0.WhisperChannelNameColor;
        end;
    end;
    v15.SpeakerAdded:connect(function(v59)
        local l_v15_Speaker_4 = v15:GetSpeaker(v59);
        local v61 = nil;
        v61 = if not not l_ChatSettings_0.PlayerDisplayNamesEnabled and l_v15_Speaker_4:GetPlayer() then l_v15_Speaker_4:GetNameForDisplay() .. "(@" .. v59 .. ")" else v59;
        local v62 = (not l_ChatConstants_0.WhisperChannelPrefix and "To " or l_ChatConstants_0.WhisperChannelPrefix) .. v59;
        if v15:GetChannel(v62) then
            v15:RemoveChannel(v62);
        end;
        local v63 = v15:AddChannel(v62);
        v63.Joinable = false;
        v63.Leavable = true;
        v63.AutoJoin = false;
        v63.Private = true;
        v63.WelcomeMessage = v7:FormatMessageToSend("GameChat_PrivateMessaging_NowChattingWith", "You are now privately chatting with " .. v61 .. ".", "RBX_NAME", (tostring(v61)));
        v63.ChannelNameColor = if not l_ChatSettings_0.WhisperChannelNameColor then Color3.fromRGB(102, 14, 102) else l_ChatSettings_0.WhisperChannelNameColor;
        v63:RegisterProcessCommandsFunction("replication_function", v53, l_ChatConstants_0.LowPriority);
        v63:RegisterFilterMessageFunction("message_type_function", v57);
    end);
    v15.SpeakerRemoved:connect(function(v64)
        local v65 = (not l_ChatConstants_0.WhisperChannelPrefix and "To " or l_ChatConstants_0.WhisperChannelPrefix) .. v64;
        if v15:GetChannel(v65) then
            v15:RemoveChannel(v65);
        end;
    end);
end;
