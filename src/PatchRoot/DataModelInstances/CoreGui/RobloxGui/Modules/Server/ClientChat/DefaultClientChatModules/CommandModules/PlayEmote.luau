local l_Chat_0 = game:GetService("Chat");
local l_Players_0 = game:GetService("Players");
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
local v3 = nil;
pcall(function()
    v3 = require(l_Chat_0.ClientChatModules.ChatLocalization);
end);
if v3 == nil then
    v3 = {
        Get = function(_, _, v6)
            return v6;
        end
    };
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v8 = nil;
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserPlayEmoteChatTextUpdates");
end);
v8 = l_status_0 and l_result_0;
l_status_0 = {
    wave = true, 
    point = true, 
    dance = true, 
    dance2 = true, 
    dance3 = true, 
    laugh = true, 
    cheer = true
};
l_result_0 = {
    NotSupported = "InGame.Chat.Response.EmotesNotSupported", 
    R15Only = "InGame.Chat.Response.EmotesWrongAvatarType", 
    SwitchToR15 = "InGame.Chat.ErrorMessageSwitchToR15", 
    NoMatchingEmote = "InGame.Chat.Response.EmoteNotAvailable", 
    TemporarilyUnavailable = "InGame.Chat.Response.EmotesTemporarilyUnavailable", 
    AnimationPlaying = "InGame.Chat.ErrorMessageAnimationPlaying"
};
local v11 = {
    [l_result_0.NotSupported] = "You can't use Emotes here.", 
    [l_result_0.R15Only] = "Only R15 avatars can use Emotes.", 
    [l_result_0.SwitchToR15] = "Switch to your R15 avatar to play Emote.", 
    [l_result_0.NoMatchingEmote] = "You can't use that Emote.", 
    [l_result_0.TemporarilyUnavailable] = "You can't use Emotes right now.", 
    [l_result_0.AnimationPlaying] = "You cannot play Emotes during this action."
};
local v12 = Color3.fromRGB(245, 50, 50);
local function _(v13)
    if string.sub(v13, 1, 3) == "/e " then
        return (string.sub(v13, 4));
    elseif string.sub(v13, 1, 7) == "/emote " then
        return (string.sub(v13, 8));
    else
        return nil;
    end;
end;
local function _(v15, v16)
    l_Util_0:SendSystemMessageToSelf(v3:Get(v16, v11[v16]), v15, {
        ChatColor = v12
    });
end;
return {
    [l_Util_0.KEY_COMMAND_PROCESSOR_TYPE] = l_Util_0.COMPLETED_MESSAGE_PROCESSOR, 
    [l_Util_0.KEY_PROCESSOR_FUNCTION] = function(v18, v19, _)
        local v21 = if string.sub(v18, 1, 3) == "/e " then string.sub(v18, 4) else if string.sub(v18, 1, 7) == "/emote " then string.sub(v18, 8) else nil;
        if v21 then
            if not l_status_0[v21] then
                local l_v19_CurrentChannel_0 = v19:GetCurrentChannel();
                if l_v19_CurrentChannel_0 then
                    local l_Character_0 = l_LocalPlayer_0.Character;
                    if l_Character_0 then
                        local l_Animate_0 = l_Character_0:FindFirstChild("Animate");
                        if l_Animate_0 then
                            if l_Animate_0:FindFirstChild("PlayEmote") then
                                local l_Humanoid_0 = l_Character_0:FindFirstChildOfClass("Humanoid");
                                if l_Humanoid_0 then
                                    if l_Humanoid_0.RigType ~= Enum.HumanoidRigType.R15 then
                                        if not v8 then
                                            local l_R15Only_0 = l_result_0.R15Only;
                                            l_Util_0:SendSystemMessageToSelf(v3:Get(l_R15Only_0, v11[l_R15Only_0]), l_v19_CurrentChannel_0, {
                                                ChatColor = v12
                                            });
                                        else
                                            local l_SwitchToR15_0 = l_result_0.SwitchToR15;
                                            l_Util_0:SendSystemMessageToSelf(v3:Get(l_SwitchToR15_0, v11[l_SwitchToR15_0]), l_v19_CurrentChannel_0, {
                                                ChatColor = v12
                                            });
                                        end;
                                        return true;
                                    else
                                        local l_HumanoidDescription_0 = l_Humanoid_0:FindFirstChildOfClass("HumanoidDescription");
                                        if l_HumanoidDescription_0 then
                                            local v29 = {};
                                            for v30, _ in pairs((l_HumanoidDescription_0:GetEmotes())) do
                                                v29[string.lower(v30)] = v30;
                                            end;
                                            local v32 = tonumber(v21);
                                            if v32 then
                                                for _, v34 in pairs((l_HumanoidDescription_0:GetEquippedEmotes())) do
                                                    if v34.Slot == v32 then
                                                        v21 = v34.Name;
                                                    end;
                                                end;
                                            end;
                                            v21 = v29[string.lower(v21)];
                                            if v21 then
                                                spawn(function()
                                                    local l_status_1, l_result_1 = pcall(function()
                                                        return l_Humanoid_0:PlayEmote(v21);
                                                    end);
                                                    if l_status_1 then
                                                        if not l_result_1 then
                                                            if not v8 then
                                                                local l_l_v19_CurrentChannel_0_0 = l_v19_CurrentChannel_0;
                                                                local l_TemporarilyUnavailable_0 = l_result_0.TemporarilyUnavailable;
                                                                l_Util_0:SendSystemMessageToSelf(v3:Get(l_TemporarilyUnavailable_0, v11[l_TemporarilyUnavailable_0]), l_l_v19_CurrentChannel_0_0, {
                                                                    ChatColor = v12
                                                                });
                                                            else
                                                                local l_l_v19_CurrentChannel_0_1 = l_v19_CurrentChannel_0;
                                                                local l_AnimationPlaying_0 = l_result_0.AnimationPlaying;
                                                                l_Util_0:SendSystemMessageToSelf(v3:Get(l_AnimationPlaying_0, v11[l_AnimationPlaying_0]), l_l_v19_CurrentChannel_0_1, {
                                                                    ChatColor = v12
                                                                });
                                                                return ;
                                                            end;
                                                        end;
                                                        return ;
                                                    else
                                                        local l_l_v19_CurrentChannel_0_2 = l_v19_CurrentChannel_0;
                                                        local l_NotSupported_0 = l_result_0.NotSupported;
                                                        l_Util_0:SendSystemMessageToSelf(v3:Get(l_NotSupported_0, v11[l_NotSupported_0]), l_l_v19_CurrentChannel_0_2, {
                                                            ChatColor = v12
                                                        });
                                                        return ;
                                                    end;
                                                end);
                                                return true;
                                            else
                                                local l_NoMatchingEmote_0 = l_result_0.NoMatchingEmote;
                                                l_Util_0:SendSystemMessageToSelf(v3:Get(l_NoMatchingEmote_0, v11[l_NoMatchingEmote_0]), l_v19_CurrentChannel_0, {
                                                    ChatColor = v12
                                                });
                                                return true;
                                            end;
                                        else
                                            local l_TemporarilyUnavailable_1 = l_result_0.TemporarilyUnavailable;
                                            l_Util_0:SendSystemMessageToSelf(v3:Get(l_TemporarilyUnavailable_1, v11[l_TemporarilyUnavailable_1]), l_v19_CurrentChannel_0, {
                                                ChatColor = v12
                                            });
                                            return true;
                                        end;
                                    end;
                                else
                                    local l_TemporarilyUnavailable_2 = l_result_0.TemporarilyUnavailable;
                                    l_Util_0:SendSystemMessageToSelf(v3:Get(l_TemporarilyUnavailable_2, v11[l_TemporarilyUnavailable_2]), l_v19_CurrentChannel_0, {
                                        ChatColor = v12
                                    });
                                    return true;
                                end;
                            else
                                local l_NotSupported_1 = l_result_0.NotSupported;
                                l_Util_0:SendSystemMessageToSelf(v3:Get(l_NotSupported_1, v11[l_NotSupported_1]), l_v19_CurrentChannel_0, {
                                    ChatColor = v12
                                });
                                return true;
                            end;
                        else
                            local l_NotSupported_2 = l_result_0.NotSupported;
                            l_Util_0:SendSystemMessageToSelf(v3:Get(l_NotSupported_2, v11[l_NotSupported_2]), l_v19_CurrentChannel_0, {
                                ChatColor = v12
                            });
                            return true;
                        end;
                    else
                        local l_TemporarilyUnavailable_3 = l_result_0.TemporarilyUnavailable;
                        l_Util_0:SendSystemMessageToSelf(v3:Get(l_TemporarilyUnavailable_3, v11[l_TemporarilyUnavailable_3]), l_v19_CurrentChannel_0, {
                            ChatColor = v12
                        });
                        return true;
                    end;
                else
                    return true;
                end;
            else
                return true;
            end;
        else
            return false;
        end;
    end
};
