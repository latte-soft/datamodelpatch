local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local v3 = nil;
pcall(function()
    v3 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v3 == nil then
    v3 = {};
end;
if not (v3.FormatMessageToSend and v3.LocalizeFormattedMessage) then
    v3.FormatMessageToSend = function(_, _, v6)
        return v6;
    end;
end;
return function(v7)
    local function _()
        if l_ChatSettings_0.ShowJoinAndLeaveHelpText ~= nil then
            return l_ChatSettings_0.ShowJoinAndLeaveHelpText;
        else
            return false;
        end;
    end;
    v7:RegisterProcessCommandsFunction("chat_commands_inquiry", function(v9, v10, v11)
        if not (v10:lower() ~= "/?") or v10:lower() == "/help" then
            local l_v7_Speaker_0 = v7:GetSpeaker(v9);
            l_v7_Speaker_0:SendSystemMessage(v3:FormatMessageToSend("GameChat_ChatCommandsTeller_Desc", "These are the basic chat commands."), v11);
            if l_ChatSettings_0.AllowMeCommand then
                l_v7_Speaker_0:SendSystemMessage(v3:FormatMessageToSend("GameChat_ChatCommandsTeller_MeCommand", "/me <text> : roleplaying command for doing actions."), v11);
            end;
            l_v7_Speaker_0:SendSystemMessage(v3:FormatMessageToSend("GameChat_ChatCommandsTeller_SwitchChannelCommand", "/c <channel> : switch channel menu tabs."), v11);
            if if l_ChatSettings_0.ShowJoinAndLeaveHelpText ~= nil then l_ChatSettings_0.ShowJoinAndLeaveHelpText else false then
                l_v7_Speaker_0:SendSystemMessage(v3:FormatMessageToSend("GameChat_ChatCommandsTeller_JoinChannelCommand", "/join <channel> or /j <channel> : join channel."), v11);
                l_v7_Speaker_0:SendSystemMessage(v3:FormatMessageToSend("GameChat_ChatCommandsTeller_LeaveChannelCommand", "/leave <channel> or /l <channel> : leave channel. (leaves current if none specified)"), v11);
            end;
            l_v7_Speaker_0:SendSystemMessage(v3:FormatMessageToSend("GameChat_ChatCommandsTeller_WhisperCommand", "/whisper <speaker> or /w <speaker> : open private message channel with speaker."), v11);
            l_v7_Speaker_0:SendSystemMessage(v3:FormatMessageToSend("GameChat_ChatCommandsTeller_MuteCommand", "/mute <speaker> : mute a speaker."), v11);
            l_v7_Speaker_0:SendSystemMessage(v3:FormatMessageToSend("GameChat_ChatCommandsTeller_UnMuteCommand", "/unmute <speaker> : unmute a speaker."), v11);
            local l_l_v7_Speaker_0_Player_0 = l_v7_Speaker_0:GetPlayer();
            if not (not l_l_v7_Speaker_0_Player_0 or not l_l_v7_Speaker_0_Player_0.Team) then
                l_v7_Speaker_0:SendSystemMessage(v3:FormatMessageToSend("GameChat_ChatCommandsTeller_TeamCommand", "/team <message> or /t <message> : send a team chat to players on your team."), v11);
            end;
            return true;
        else
            return false;
        end;
    end, l_ChatConstants_0.StandardPriority);
    if l_ChatSettings_0.GeneralChannelName then
        local l_v7_Channel_0 = v7:GetChannel(l_ChatSettings_0.GeneralChannelName);
        if l_v7_Channel_0 then
            l_v7_Channel_0.WelcomeMessage = v3:FormatMessageToSend("GameChat_ChatCommandsTeller_AllChannelWelcomeMessage", "Chat '/?' or '/help' for a list of chat commands.");
        end;
    end;
end;
