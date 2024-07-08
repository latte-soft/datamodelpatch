local l_Players_0 = game:GetService("Players");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Promise);
local l_List_0 = require(l_Parent_0.llama).List;
local v6 = require(l_script_FirstAncestor_0.Analytics);
local v7 = require(script.Parent.Logger);
local v8 = require(l_script_FirstAncestor_0.Config);
local v9 = require(l_script_FirstAncestor_0.Commands.autoCastCommand);
local v10 = require(l_script_FirstAncestor_0.Commands.Whisper.RBXWhisperCommand);
local v11 = require(l_script_FirstAncestor_0.Actions.ChatInputBarResetTargetChannel);
local v12 = require(l_script_FirstAncestor_0.Actions.UserInteraction);
local v13 = require(l_script_FirstAncestor_0.Actions.ChatTranslationGlobalToggled);
local v14 = require(l_script_FirstAncestor_0.Actions.ChatTranslationMessageToggled);
local v15 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationUIEnabled);
return function(v16)
    return {
        activateWhisperMode = function(v17)
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v17);
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if l_l_Players_0_PlayerByUserId_0 then
                if l_l_Players_0_PlayerByUserId_0 == l_LocalPlayer_0 then
                    return ;
                else
                    assert(l_LocalPlayer_0, "Players.LocalPlayer should be non-nil");
                    v4.any({
                        v9(v10, l_LocalPlayer_0.UserId, "/w @" .. l_l_Players_0_PlayerByUserId_0.Name)
                    }):catch(function(v20)
                        v7:debug("Could not send autoCastCommand. Error: {}", v20);
                    end);
                    return ;
                end;
            else
                return ;
            end;
        end, 
        onToggleTranslation = if not v15() then nil else function(v21)
            v16(v13(v21));
        end, 
        onToggleIndividualTranslation = if not v15() then nil else function(v22, v23)
            v6.FireClientAnalyticsWithEventName("MessageTranslationToggled", {
                useTranslation = v22, 
                senderUserId = if not l_Players_0.LocalPlayer then nil else l_Players_0.LocalPlayer.UserId, 
                localeId = if not l_Players_0.LocalPlayer then nil else l_Players_0.LocalPlayer.LocaleId
            });
            v16(v14(v22, v23));
        end, 
        resetTargetChannel = function()
            v16(v11());
        end, 
        onHovered = function()
            v16(v12("hover"));
        end, 
        onUnhovered = function()
            v16(v12("unhover"));
        end, 
        onSendChat = function(v24)
            local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            local v26 = nil;
            if l_ChatInputBarConfiguration_0 then
                v26 = l_ChatInputBarConfiguration_0.TargetTextChannel;
            end;
            v7:debug("onSendChat: {} to {}", v24, not v26 and "nil" or v26.Name);
            if not v26 then
                v7:warning("TargetTextChannel was nil");
            else
                v4.try(function()
                    v26:SendAsync(v24);
                    v6.FireClientAnalyticsWithEventName("LuaMessageSent", {
                        channelName = v26.Name, 
                        senderUserId = if not l_Players_0.LocalPlayer then nil else l_Players_0.LocalPlayer.UserId, 
                        numParticipants = l_List_0.count(v26:GetChildren(), function(v27)
                            return v27:IsA("TextSource");
                        end), 
                        isDefaultChannel = not v8[v26.Name] and "false" or "true"
                    });
                end):catch(function(v28)
                    warn(v28.error);
                end);
            end;
        end
    };
end;
