local l_TextChatService_0 = game:GetService("TextChatService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Dictionary_0 = require(l_script_FirstAncestor_0.Parent.llama).Dictionary;
local v4 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/Command/Whisper");
local v5 = require(l_script_FirstAncestor_0.Actions.ChatInputBarActivatedWhisperMode);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("Commands");
local v7 = require(l_script_FirstAncestor_1.getAutocompletePlayersFromString);
local v8 = require(l_script_FirstAncestor_1.Whisper.getNameFromWhisper);
local _ = require(l_script_FirstAncestor_1.types);
return {
    name = script.Name, 
    alias = {
        "/whisper", 
        "/w"
    }, 
    clientRun = function(v10, v11, v12)
        local v13 = v8(v12, v10:getState().AutoCastCommands[script.Name]);
        if v13 then
            local l_Players_0 = v10:getState().Players;
            local v15 = v7(l_Dictionary_0.join(l_Players_0, {
                byUserId = l_Dictionary_0.removeKey(l_Players_0.byUserId, (tostring(v11)))
            }), v13);
            if #v15 == 0 then
                v4:debug("Autocomplete: No matches");
                local v16 = l_Players_0.byUserId[tostring(v11)];
                if v16 and (not (v13 ~= v16.displayName) or v13 == "@" .. v16.username) then
                    return {
                        key = "GameChat_PrivateMessaging_CannotWhisperToSelf", 
                        args = nil, 
                        metadata = "Roblox.Whisper.Error.CannotWhisperToSelf"
                    };
                else
                    return {
                        key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist", 
                        args = {
                            RBX_NAME = v13 or ""
                        }, 
                        metadata = "Roblox.Whisper.Error.TargetDoesNotExist"
                    };
                end;
            elseif #v15 == 1 then
                local v17 = v15[1];
                local v18 = tonumber(v17.userId);
                if v18 then
                    local v19 = string.format("RBXWhisper:%d_%d", v11 < v18 and v11 or v18, v18 < v11 and v11 or v18);
                    if not l_TextChatService_0:FindFirstChild(v19, true) then
                        local l_ExperienceChat_0 = l_RobloxReplicatedStorage_0:FindFirstChild("ExperienceChat");
                        if not l_ExperienceChat_0 then
                            v4:error("Could not create whisper channel because RobloxReplicatedStorage.ExperienceChat is missing.");
                            return {
                                key = "", 
                                metadata = "Roblox.Whisper.Error.Unknown"
                            };
                        else
                            local l_WhisperChat_0 = l_ExperienceChat_0:FindFirstChild("WhisperChat");
                            if not l_WhisperChat_0 or not l_WhisperChat_0:IsA("RemoteFunction") then
                                v4:error("Could not create whisper channel because WhisperChat RemoteFunction is missing.");
                                return {
                                    key = "", 
                                    metadata = "Roblox.Whisper.Error.Unknown"
                                };
                            elseif not l_WhisperChat_0:InvokeServer(v17.userId) then
                                v4:error("Could not create whisper channel for some reason.");
                                return {
                                    key = "CoreScripts.TextChat.Whisper.Error.CannotChat", 
                                    args = nil, 
                                    metadata = "Roblox.Whisper.Error.Unknown"
                                };
                            end;
                        end;
                    end;
                    v10:dispatch(v5(v19));
                    return {
                        key = "CoreScripts.TextChat.Notification.WhisperChat.Created", 
                        args = {
                            RBX_NAME = v13
                        }, 
                        metadata = "Roblox.Whisper.Info.Success"
                    };
                end;
            else
                v4:debug("Autocomplete: Too many matches");
                return {
                    key = "CoreScripts.TextChat.Whisper.Error.CannotChat", 
                    metadata = "Roblox.Whisper.Error.TooManyMatches"
                };
            end;
        end;
        return {
            key = "", 
            metadata = "Roblox.Whisper.Error.Unknown"
        };
    end
};
