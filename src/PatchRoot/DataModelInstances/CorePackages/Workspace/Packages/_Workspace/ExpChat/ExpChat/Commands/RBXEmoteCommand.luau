local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local _ = require(script.Parent.types);
local v2 = require(script:FindFirstAncestor("ExpChat").Logger):new("ExpChat/Command/Emote");
local v3 = {
    wave = true, 
    point = true, 
    dance = true, 
    dance1 = true, 
    dance2 = true, 
    dance3 = true, 
    laugh = true, 
    cheer = true
};
local function _(v4)
    local v5 = nil;
    local l_Humanoid_0 = v4:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 then
        if l_Humanoid_0.RigType == Enum.HumanoidRigType.R15 then
            return "dance";
        elseif l_Humanoid_0.RigType == Enum.HumanoidRigType.R6 then
            v5 = "dance" .. math.random(1, 3);
        end;
    end;
    return v5;
end;
local function v17(v8, v9)
    local l_status_0, l_result_0 = pcall(function()
        local l_Animate_0 = v9:FindFirstChild("Animate");
        if l_Animate_0 then
            local l_PlayEmote_0 = l_Animate_0:FindFirstChild("PlayEmote");
            if not l_PlayEmote_0 or not l_PlayEmote_0:IsA("BindableFunction") then
                v2:debug("PlayEmote BindableFunction does not exist.");
            else
                if v8 == "dance" then
                    local l_v9_0 = v9;
                    local v13 = nil;
                    local l_Humanoid_1 = l_v9_0:FindFirstChildOfClass("Humanoid");
                    if l_Humanoid_1 then
                        if l_Humanoid_1.RigType == Enum.HumanoidRigType.R15 then
                            v13 = "dance";
                        elseif l_Humanoid_1.RigType == Enum.HumanoidRigType.R6 then
                            v13 = "dance" .. math.random(1, 3);
                        end;
                    end;
                    v8 = v13;
                end;
                l_PlayEmote_0:Invoke(v8);
                return true;
            end;
        end;
        return false;
    end);
    if not l_status_0 or not l_result_0 then
        return {
            key = "InGame.EmotesMenu.ErrorMessageNotSupported", 
            metadata = "Roblox.Emote.Error.NotSupported"
        };
    else
        v2:debug("Playing legacy emote successfully");
        return ;
    end;
end;
local function v24(v18, v19)
    local v20 = tonumber(v19, 10);
    if not v20 then
        for v21, _ in pairs((v18:GetEmotes())) do
            if string.lower(v21) == v19 then
                return v21, nil;
            end;
        end;
        return nil, {
            key = "CoreScripts.TextChat.Emote.Error.NotOwnedGeneric", 
            metadata = "Roblox.Emote.Error.NotOwnedGeneric"
        };
    else
        local l_v18_EquippedEmotes_0 = v18:GetEquippedEmotes();
        if not l_v18_EquippedEmotes_0[v20] then
            if not (v20 >= 1) or v20 > 8 then
                return nil, {
                    key = "CoreScripts.TextChat.Emote.Error.DoesNotExist", 
                    metadata = "Roblox.Emote.Error.DoesNotExist"
                };
            else
                return nil, {
                    key = "CoreScripts.TextChat.Emote.Error.NotEquipped", 
                    metadata = "Roblox.Emote.Error.EmoteNotEquipped"
                };
            end;
        else
            return l_v18_EquippedEmotes_0[v20].Name, nil;
        end;
    end;
end;
return {
    name = script.Name, 
    alias = {
        "/emote", 
        "/e"
    }, 
    clientRun = function(v25, _, v27)
        local v28 = nil;
        if string.sub(v27, 1, 3):lower() == "/e " then
            v28 = string.sub(v27, 4);
        elseif string.sub(v27, 1, 7):lower() == "/emote " then
            v28 = string.sub(v27, 8);
        end;
        if v28 then
            v28 = string.lower(v28);
            local l_LocalCharacter_0 = v25:getState().LocalCharacter;
            if not v3[v28] then
                if l_StarterPlayer_0.UserEmotesEnabled then
                    if l_LocalCharacter_0 then
                        if l_LocalCharacter_0:FindFirstChild("Animate") then
                            local l_Humanoid_2 = l_LocalCharacter_0:FindFirstChildOfClass("Humanoid");
                            if l_Humanoid_2 then
                                if l_Humanoid_2.RigType ~= Enum.HumanoidRigType.R15 then
                                    v2:debug("Humanoid.RigType is not R15");
                                    return {
                                        key = "InGame.EmotesMenu.ErrorMessageSwitchToR15", 
                                        metadata = "Roblox.Emote.Error.SwitchToR15"
                                    };
                                else
                                    local l_HumanoidDescription_0 = l_Humanoid_2:FindFirstChildOfClass("HumanoidDescription");
                                    if l_HumanoidDescription_0 then
                                        local v32, v33 = v24(l_HumanoidDescription_0, v28);
                                        if v32 then
                                            local l_status_1, l_result_1 = pcall(function()
                                                return l_Humanoid_2:PlayEmote(v32);
                                            end);
                                            if l_status_1 and l_result_1 then
                                                v2:debug("Playing emote: {}", (tostring(v32)));
                                                return nil;
                                            else
                                                v2:debug("Humanoid:PlayEmote encountered an error: {}", l_result_1);
                                                return {
                                                    key = "InGame.EmotesMenu.ErrorMessageAnimationPlaying", 
                                                    metadata = "Roblox.Emote.Error.AnimationPlaying"
                                                };
                                            end;
                                        else
                                            v2:debug("Could not find a valid emote within HumanoidDescription");
                                            return v33;
                                        end;
                                    else
                                        v2:debug("HumanoidDescription missing");
                                        return {
                                            key = "InGame.EmotesMenu.ErrorMessageNotSupported", 
                                            metadata = "Roblox.Emote.Error.NotSupported"
                                        };
                                    end;
                                end;
                            else
                                v2:debug("Humanoid missing");
                                return {
                                    key = "InGame.EmotesMenu.ErrorMessageTemporarilyUnavailable", 
                                    metadata = "Roblox.Emote.Error.TemporarilyUnavailable"
                                };
                            end;
                        else
                            v2:debug("Animate script missing");
                            return {
                                key = "InGame.EmotesMenu.ErrorMessageNotSupported", 
                                metadata = "Roblox.Emote.Error.NotSupported"
                            };
                        end;
                    else
                        v2:debug("No character loaded");
                        return {
                            key = "InGame.EmotesMenu.ErrorMessageTemporarilyUnavailable", 
                            metadata = "Roblox.Emote.Error.TemporarilyUnavailable"
                        };
                    end;
                else
                    v2:debug("Experience does not have emotes enabled");
                    return {
                        key = "CoreScripts.TextChat.Emote.Error.NotEnabled", 
                        metadata = "Roblox.Emote.Error.UserEmotesNotEnabled"
                    };
                end;
            else
                v2:trace("Legacy emote found");
                return v17(v28, l_LocalCharacter_0);
            end;
        else
            v2:debug("No emote string given");
            return {
                key = "CoreScripts.TextChat.Emote.Error.DoesNotExist", 
                metadata = "Roblox.Emote.Error.DoesNotExist"
            };
        end;
    end
};
