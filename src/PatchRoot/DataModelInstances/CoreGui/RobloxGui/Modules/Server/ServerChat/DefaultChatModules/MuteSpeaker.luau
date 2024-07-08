local l_Chat_0 = game:GetService("Chat");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatModules_0 = l_Chat_0:WaitForChild("ChatModules");
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local v5 = require(l_ChatModules_0.Utility.DisplayNameHelpers);
local v6 = nil;
pcall(function()
    v6 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v6 == nil then
    v6 = {};
end;
if not (v6.FormatMessageToSend and v6.LocalizeFormattedMessage) then
    v6.FormatMessageToSend = function(_, _, v9)
        return v9;
    end;
end;
local v10 = {
    ChatColor = l_ChatSettings_0.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
};
return function(v11)
    local function v16(v12)
        local l_v12_0 = v12;
        if string.sub(v12, 1, 1) == "\"" then
            local v14 = string.find(v12, "\"", 2);
            if v14 then
                return (string.sub(v12, 2, v14 - 1));
            end;
        else
            local v15 = string.match(v12, "^[^%s]+");
            if v15 then
                l_v12_0 = v15;
            end;
        end;
        return l_v12_0;
    end;
    local function v31(v17, v18, v19)
        local v20 = v16(v18);
        local l_v11_Speaker_0 = v11:GetSpeaker(v17);
        if l_v11_Speaker_0 then
            local v22 = nil;
            local v23 = nil;
            if not l_ChatSettings_0.PlayerDisplayNamesEnabled then
                local v24, v25 = v5.getUserNameFromChattedName(v20, v17, nil);
                v22 = v24;
                v23 = v25;
            else
                local v26, v27 = v5.getUserNameFromChattedName(v20, v17, l_v11_Speaker_0:GetNameForDisplay());
                v22 = v26;
                v23 = v27;
            end;
            local l_v11_Speaker_1 = v11:GetSpeaker(v22);
            if v23 == v5.CommandErrorCodes.ChattingToSelf then
                l_v11_Speaker_0:SendSystemMessage(v6:FormatMessageToSend("GameChat_DoMuteCommand_CannotMuteSelf", "You cannot mute yourself."), v19, v10);
                return ;
            elseif v23 == v5.CommandErrorCodes.NoMatches then
                l_v11_Speaker_0:SendSystemMessage(v6:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", (tostring(v20))), "RBX_NAME", (tostring(v22))), v19, v10);
                return ;
            elseif v23 == v5.CommandErrorCodes.MultipleMatches then
                local v29 = v5.getUsersWithDisplayNameString(v20, v17);
                l_v11_Speaker_0:SendSystemMessage(v6:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), v19, v10);
                l_v11_Speaker_0:SendSystemMessage(v29, v19, v10);
                return ;
            elseif l_v11_Speaker_1 then
                l_v11_Speaker_0:AddMutedSpeaker(l_v11_Speaker_1.Name);
                local l_v22_0 = v22;
                if l_ChatSettings_0.PlayerDisplayNamesEnabled then
                    l_v22_0 = l_v11_Speaker_1:GetNameForDisplay();
                end;
                l_v11_Speaker_0:SendSystemMessage(v6:FormatMessageToSend("GameChat_ChatMain_SpeakerHasBeenMuted", string.format("Speaker '%s' has been muted.", l_v22_0), "RBX_NAME", l_v22_0), v19);
            end;
        end;
    end;
    local function v46(v32, v33, v34)
        local v35 = v16(v33);
        local l_v11_Speaker_2 = v11:GetSpeaker(v32);
        if l_v11_Speaker_2 then
            local v37 = nil;
            local v38 = nil;
            if not l_ChatSettings_0.PlayerDisplayNamesEnabled then
                local v39, v40 = v5.getUserNameFromChattedName(v35, v32, nil);
                v37 = v39;
                v38 = v40;
            else
                local v41, v42 = v5.getUserNameFromChattedName(v35, v32, l_v11_Speaker_2:GetNameForDisplay());
                v37 = v41;
                v38 = v42;
            end;
            local l_v11_Speaker_3 = v11:GetSpeaker(v37);
            if v38 == v5.CommandErrorCodes.ChattingToSelf then
                l_v11_Speaker_2:SendSystemMessage(v6:FormatMessageToSend("GameChat_DoMuteCommand_CannotMuteSelf", "You cannot mute yourself."), v34, v10);
                return ;
            elseif v38 == v5.CommandErrorCodes.NoMatches then
                l_v11_Speaker_2:SendSystemMessage(v6:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", (tostring(v37))), "RBX_NAME", (tostring(v37))), v34, v10);
                return ;
            elseif v38 == v5.CommandErrorCodes.MultipleMatches then
                local v44 = v5.getUsersWithDisplayNameString(v35, v32);
                l_v11_Speaker_2:SendSystemMessage(v6:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), v34, v10);
                l_v11_Speaker_2:SendSystemMessage(v44, v34, v10);
                return ;
            elseif l_v11_Speaker_3 then
                l_v11_Speaker_2:RemoveMutedSpeaker(l_v11_Speaker_3.Name);
                local l_v37_0 = v37;
                if l_ChatSettings_0.PlayerDisplayNamesEnabled then
                    l_v37_0 = l_v11_Speaker_3:GetNameForDisplay();
                end;
                l_v11_Speaker_2:SendSystemMessage(v6:FormatMessageToSend("GameChat_ChatMain_SpeakerHasBeenUnMuted", string.format("Speaker '%s' has been unmuted.", l_v37_0), "RBX_NAME", l_v37_0), v34);
                return ;
            end;
        end;
    end;
    v11:RegisterProcessCommandsFunction("mute_commands", function(v47, v48, v49)
        local v50 = false;
        if string.sub(v48, 1, 6):lower() == "/mute " then
            v31(v47, string.sub(v48, 7), v49);
            return true;
        else
            if string.sub(v48, 1, 8):lower() == "/unmute " then
                v46(v47, string.sub(v48, 9), v49);
                v50 = true;
            end;
            return v50;
        end;
    end, l_ChatConstants_0.StandardPriority);
end;
