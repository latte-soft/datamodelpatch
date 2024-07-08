game:DefineFastFlag("AvatarMoodSearchForReplacementWhenRemovingAnimator", false);
game:DefineFastFlag("AvatarMoodValidateMoodAnimation", false);
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Logger):new(script.Name);
local v4 = nil;
local v5 = nil;
local v6 = nil;
local l_Core_0 = Enum.AnimationPriority.Core;
local v8 = nil;
local v9 = true;
local v10 = false;
local v11 = {};
local v12 = {
    EmoteStopped = "currentEmoteTrackStopped", 
    EmoteKeyframeReached = "emoteKeyframeReached", 
    AnimationInstanceChanged = "animationInstanceChanged", 
    EmoteTriggered = "localEmote", 
    AnimateScriptAdded = "animateScriptAdded", 
    AnimateScriptMoodAdded = "animateScriptMoodAdded", 
    AnimateScriptMoodRemoved = "animateScriptMoodRemoved", 
    MoodChildAdded = "moodChildAdded", 
    HeadChildAdded = "headChildAdded", 
    CharacterHumanoidAdded = "characterHumanoidAdded", 
    HumanoidAnimatorAdded = "humanoidAnimatorAdded", 
    CharacterChildAdded = "characterChildAdded", 
    CharacterChildRemoved = "characterChildRemoved", 
    DescendantAdded = "DescendantAdded", 
    DescendantRemoving = "DescendantRemoving", 
    AnimationStreamTrackPlayed = "AnimationStreamTrackPlayed", 
    StreamTrackStopped = "StreamTrackStopped"
};
local v13 = {
    wave = true, 
    point = true, 
    dance = true, 
    dance2 = true, 
    dance3 = true, 
    laugh = true, 
    cheer = true
};
local function _(v14)
    if not v14.Character then
        return nil;
    else
        return v14.Character:FindFirstChildOfClass("Humanoid");
    end;
end;
local function _(v16)
    local v17 = if not v16.Character then nil else v16.Character:FindFirstChildOfClass("Humanoid");
    if not v17 then
        return nil;
    else
        return v17:FindFirstChildOfClass("Animator");
    end;
end;
local function _(v19)
    l_Core_0 = v19;
    if v6 then
        v6.Priority = l_Core_0;
    end;
end;
local function _(v21)
    if v11[v21] ~= nil then
        v11[v21]:Disconnect();
        v11[v21] = nil;
    end;
end;
local function _()
    v8 = nil;
    if v6 ~= nil then
        v6:Play();
    end;
    local l_EmoteStopped_0 = v12.EmoteStopped;
    if v11[l_EmoteStopped_0] ~= nil then
        v11[l_EmoteStopped_0]:Disconnect();
        v11[l_EmoteStopped_0] = nil;
    end;
    l_EmoteStopped_0 = v12.EmoteKeyframeReached;
    if v11[l_EmoteStopped_0] ~= nil then
        v11[l_EmoteStopped_0]:Disconnect();
        v11[l_EmoteStopped_0] = nil;
    end;
end;
local function v31(v25, v26)
    if not v9 or v6 == nil then
        return ;
    else
        if not (not v25 or not v26) then
            v6:Stop();
            v8 = v26;
            v10 = true;
            local l_EmoteStopped_1 = v12.EmoteStopped;
            if v11[l_EmoteStopped_1] ~= nil then
                v11[l_EmoteStopped_1]:Disconnect();
                v11[l_EmoteStopped_1] = nil;
            end;
            l_EmoteStopped_1 = v12.EmoteKeyframeReached;
            if v11[l_EmoteStopped_1] ~= nil then
                v11[l_EmoteStopped_1]:Disconnect();
                v11[l_EmoteStopped_1] = nil;
            end;
            v11[v12.EmoteStopped] = v8.Stopped:Connect(function()
                v8 = nil;
                if v6 ~= nil then
                    v6:Play();
                end;
                local l_EmoteStopped_2 = v12.EmoteStopped;
                if v11[l_EmoteStopped_2] ~= nil then
                    v11[l_EmoteStopped_2]:Disconnect();
                    v11[l_EmoteStopped_2] = nil;
                end;
                l_EmoteStopped_2 = v12.EmoteKeyframeReached;
                if v11[l_EmoteStopped_2] ~= nil then
                    v11[l_EmoteStopped_2]:Disconnect();
                    v11[l_EmoteStopped_2] = nil;
                end;
                v10 = false;
            end);
            v11[v12.EmoteKeyframeReached] = v8.KeyframeReached:Connect(function(v29)
                if not (not (v29 == "End") or v8.Looped) then
                    v8 = nil;
                    if v6 ~= nil then
                        v6:Play();
                    end;
                    local l_EmoteStopped_3 = v12.EmoteStopped;
                    if v11[l_EmoteStopped_3] ~= nil then
                        v11[l_EmoteStopped_3]:Disconnect();
                        v11[l_EmoteStopped_3] = nil;
                    end;
                    l_EmoteStopped_3 = v12.EmoteKeyframeReached;
                    if v11[l_EmoteStopped_3] ~= nil then
                        v11[l_EmoteStopped_3]:Disconnect();
                        v11[l_EmoteStopped_3] = nil;
                    end;
                    v10 = false;
                end;
            end);
        end;
        return ;
    end;
end;
local function v32(v33)
    local l_v33_PlayingAnimationTracks_0 = v33:GetPlayingAnimationTracks();
    local v35 = false;
    for _, v37 in pairs(l_v33_PlayingAnimationTracks_0) do
        if not ((not v37.IsPlaying or not v37.Animation.Parent) or not v13[v37.Animation.Parent.Name]) then
            local l_EmoteStopped_4 = v12.EmoteStopped;
            if v11[l_EmoteStopped_4] ~= nil then
                v11[l_EmoteStopped_4]:Disconnect();
                v11[l_EmoteStopped_4] = nil;
            end;
            l_EmoteStopped_4 = v12.EmoteKeyframeReached;
            if v11[l_EmoteStopped_4] ~= nil then
                v11[l_EmoteStopped_4]:Disconnect();
                v11[l_EmoteStopped_4] = nil;
            end;
            v8 = v37;
            v10 = false;
            v6:Stop();
            v11[v12.EmoteStopped] = v8.Stopped:Connect(function()
                wait(0.3);
                if not (v32(v33) or v10) then
                    v8 = nil;
                    if v6 ~= nil then
                        v6:Play();
                    end;
                    local l_EmoteStopped_5 = v12.EmoteStopped;
                    if v11[l_EmoteStopped_5] ~= nil then
                        v11[l_EmoteStopped_5]:Disconnect();
                        v11[l_EmoteStopped_5] = nil;
                    end;
                    l_EmoteStopped_5 = v12.EmoteKeyframeReached;
                    if v11[l_EmoteStopped_5] ~= nil then
                        v11[l_EmoteStopped_5]:Disconnect();
                        v11[l_EmoteStopped_5] = nil;
                    end;
                end;
            end);
            v11[v12.EmoteKeyframeReached] = v8.KeyframeReached:Connect(function(v40)
                if v40 == "End" then
                    wait(0.3);
                    if not (v32(v33) or v10) then
                        v8 = nil;
                        if v6 ~= nil then
                            v6:Play();
                        end;
                        local l_EmoteStopped_6 = v12.EmoteStopped;
                        if v11[l_EmoteStopped_6] ~= nil then
                            v11[l_EmoteStopped_6]:Disconnect();
                            v11[l_EmoteStopped_6] = nil;
                        end;
                        l_EmoteStopped_6 = v12.EmoteKeyframeReached;
                        if v11[l_EmoteStopped_6] ~= nil then
                            v11[l_EmoteStopped_6]:Disconnect();
                            v11[l_EmoteStopped_6] = nil;
                        end;
                    end;
                end;
            end);
            v35 = true;
        end;
    end;
    return v35;
end;
v4 = l_LocalPlayer_0.Chatted:Connect(function(v42)
    if not v9 or v6 == nil then
        return ;
    else
        if l_LocalPlayer_0.Character then
            local l_Humanoid_0 = l_LocalPlayer_0.Character:FindFirstChildWhichIsA("Humanoid");
            if l_Humanoid_0 then
                local v44 = "";
                if string.sub(v42, 1, 3) == "/e " then
                    v44 = string.sub(v42, 4);
                elseif string.sub(v42, 1, 7) == "/emote " then
                    v44 = string.sub(v42, 8);
                end;
                if v13[v44] then
                    wait(0.3);
                    v32(l_Humanoid_0);
                end;
            end;
        end;
        return ;
    end;
end);
local function _()
    if v6 ~= nil then
        v6:Stop();
        v6:Destroy();
        v6 = nil;
    end;
end;
local function _()
    if v6 ~= nil then
        v6:Stop();
        v6:Destroy();
        v6 = nil;
    end;
    local l_EmoteStopped_7 = v12.EmoteStopped;
    if v11[l_EmoteStopped_7] ~= nil then
        v11[l_EmoteStopped_7]:Disconnect();
        v11[l_EmoteStopped_7] = nil;
    end;
    l_EmoteStopped_7 = v12.EmoteKeyframeReached;
    if v11[l_EmoteStopped_7] ~= nil then
        v11[l_EmoteStopped_7]:Disconnect();
        v11[l_EmoteStopped_7] = nil;
    end;
    l_EmoteStopped_7 = v12.AnimationInstanceChanged;
    if v11[l_EmoteStopped_7] ~= nil then
        v11[l_EmoteStopped_7]:Disconnect();
        v11[l_EmoteStopped_7] = nil;
    end;
    l_EmoteStopped_7 = v12.EmoteTriggered;
    if v11[l_EmoteStopped_7] ~= nil then
        v11[l_EmoteStopped_7]:Disconnect();
        v11[l_EmoteStopped_7] = nil;
    end;
    v5 = nil;
end;
local _ = function(_, _, v50, v51)
    v6 = v51:LoadAnimation(v5);
    v6.Priority = l_Core_0;
    if v8 == nil then
        v6:Play();
    end;
    local l_EmoteTriggered_0 = v12.EmoteTriggered;
    if v11[l_EmoteTriggered_0] ~= nil then
        v11[l_EmoteTriggered_0]:Disconnect();
        v11[l_EmoteTriggered_0] = nil;
    end;
    v11[v12.EmoteTriggered] = v50.EmoteTriggered:Connect(v31);
end;
local function v65(v54, v55, v56)
    local l_Animator_0 = v56:FindFirstChild("Animator");
    if l_Animator_0 then
        v6 = l_Animator_0:LoadAnimation(v5);
        v6.Priority = l_Core_0;
        if v8 == nil then
            v6:Play();
        end;
        local l_EmoteTriggered_1 = v12.EmoteTriggered;
        if v11[l_EmoteTriggered_1] ~= nil then
            v11[l_EmoteTriggered_1]:Disconnect();
            v11[l_EmoteTriggered_1] = nil;
        end;
        v11[v12.EmoteTriggered] = v56.EmoteTriggered:Connect(v31);
    end;
    if v11[v12.HumanoidAnimatorAdded] then
        local l_HumanoidAnimatorAdded_0 = v12.HumanoidAnimatorAdded;
        if v11[l_HumanoidAnimatorAdded_0] ~= nil then
            v11[l_HumanoidAnimatorAdded_0]:Disconnect();
            v11[l_HumanoidAnimatorAdded_0] = nil;
        end;
    end;
    v11[v12.HumanoidAnimatorAdded] = v56.ChildAdded:Connect(function(v60)
        if v60.Name == "Animator" then
            local _ = v54;
            local _ = v55;
            local l_v56_0 = v56;
            v6 = v60:LoadAnimation(v5);
            v6.Priority = l_Core_0;
            if v8 == nil then
                v6:Play();
            end;
            local l_EmoteTriggered_2 = v12.EmoteTriggered;
            if v11[l_EmoteTriggered_2] ~= nil then
                v11[l_EmoteTriggered_2]:Disconnect();
                v11[l_EmoteTriggered_2] = nil;
            end;
            v11[v12.EmoteTriggered] = l_v56_0.EmoteTriggered:Connect(v31);
        end;
    end);
end;
local function v66(v67, v68)
    if (v67 ~= nil and v68 ~= nil) and v9 then
        if v11[v12.AnimationInstanceChanged] then
            local l_AnimationInstanceChanged_0 = v12.AnimationInstanceChanged;
            if v11[l_AnimationInstanceChanged_0] ~= nil then
                v11[l_AnimationInstanceChanged_0]:Disconnect();
                v11[l_AnimationInstanceChanged_0] = nil;
            end;
        end;
        if v11[v12.CharacterHumanoidAdded] then
            local l_CharacterHumanoidAdded_0 = v12.CharacterHumanoidAdded;
            if v11[l_CharacterHumanoidAdded_0] ~= nil then
                v11[l_CharacterHumanoidAdded_0]:Disconnect();
                v11[l_CharacterHumanoidAdded_0] = nil;
            end;
        end;
        if v6 ~= nil then
            v6:Stop();
            v6:Destroy();
            v6 = nil;
        end;
        v5 = v68;
        v11[v12.AnimationInstanceChanged] = v5.Changed:Connect(function(_)
            v66(v67, v68);
        end);
        local l_Humanoid_1 = v67:FindFirstChildWhichIsA("Humanoid");
        if l_Humanoid_1 then
            v65(v67, v68, l_Humanoid_1);
        end;
        v11[v12.CharacterHumanoidAdded] = v67.ChildAdded:Connect(function(v73)
            if v73:IsA("Humanoid") then
                v65(v67, v68, l_Humanoid_1);
            end;
        end);
        return ;
    else
        return ;
    end;
end;
initAvatarMood = function(v74)
    local l_MoodsEnabled_0 = v74:FindFirstChild("MoodsEnabled");
    local l_AnimateScriptMoodAdded_0 = v12.AnimateScriptMoodAdded;
    if v11[l_AnimateScriptMoodAdded_0] ~= nil then
        v11[l_AnimateScriptMoodAdded_0]:Disconnect();
        v11[l_AnimateScriptMoodAdded_0] = nil;
    end;
    l_AnimateScriptMoodAdded_0 = v12.AnimateScriptMoodRemoved;
    if v11[l_AnimateScriptMoodAdded_0] ~= nil then
        v11[l_AnimateScriptMoodAdded_0]:Disconnect();
        v11[l_AnimateScriptMoodAdded_0] = nil;
    end;
    if not l_MoodsEnabled_0 then
        l_AnimateScriptMoodAdded_0 = v74:FindFirstChild("mood");
        if not l_AnimateScriptMoodAdded_0 then
            if v6 ~= nil then
                v6:Stop();
                v6:Destroy();
                v6 = nil;
            end;
            local l_EmoteStopped_8 = v12.EmoteStopped;
            if v11[l_EmoteStopped_8] ~= nil then
                v11[l_EmoteStopped_8]:Disconnect();
                v11[l_EmoteStopped_8] = nil;
            end;
            l_EmoteStopped_8 = v12.EmoteKeyframeReached;
            if v11[l_EmoteStopped_8] ~= nil then
                v11[l_EmoteStopped_8]:Disconnect();
                v11[l_EmoteStopped_8] = nil;
            end;
            l_EmoteStopped_8 = v12.AnimationInstanceChanged;
            if v11[l_EmoteStopped_8] ~= nil then
                v11[l_EmoteStopped_8]:Disconnect();
                v11[l_EmoteStopped_8] = nil;
            end;
            l_EmoteStopped_8 = v12.EmoteTriggered;
            if v11[l_EmoteStopped_8] ~= nil then
                v11[l_EmoteStopped_8]:Disconnect();
                v11[l_EmoteStopped_8] = nil;
            end;
            v5 = nil;
        else
            if #l_AnimateScriptMoodAdded_0:GetChildren() > 0 then
                if not game:GetFastFlag("AvatarMoodValidateMoodAnimation") then
                    v66(l_LocalPlayer_0.Character, l_AnimateScriptMoodAdded_0:GetChildren()[1]);
                else
                    v66(l_LocalPlayer_0.Character, l_AnimateScriptMoodAdded_0:FindFirstChildWhichIsA("Animation"));
                end;
            end;
            local l_MoodChildAdded_0 = v12.MoodChildAdded;
            if v11[l_MoodChildAdded_0] ~= nil then
                v11[l_MoodChildAdded_0]:Disconnect();
                v11[l_MoodChildAdded_0] = nil;
            end;
            v11[v12.MoodChildAdded] = l_AnimateScriptMoodAdded_0.ChildAdded:Connect(function(v79)
                if not game:GetFastFlag("AvatarMoodValidateMoodAnimation") then
                    v66(l_LocalPlayer_0.Character, v79);
                elseif v79:IsA("Animation") then
                    v66(l_LocalPlayer_0.Character, v79);
                    return ;
                end;
            end);
        end;
        v11[v12.AnimateScriptMoodAdded] = v74.ChildAdded:Connect(function(v80)
            if v80.Name == "mood" then
                if #v80:GetChildren() > 0 then
                    v66(l_LocalPlayer_0.Character, v80:GetChildren()[1]);
                end;
                local l_MoodChildAdded_1 = v12.MoodChildAdded;
                if v11[l_MoodChildAdded_1] ~= nil then
                    v11[l_MoodChildAdded_1]:Disconnect();
                    v11[l_MoodChildAdded_1] = nil;
                end;
                v11[v12.MoodChildAdded] = v80.ChildAdded:Connect(function(v82)
                    v66(l_LocalPlayer_0.Character, v82);
                end);
                return ;
            else
                if v80.Name == "MoodsEnabled" then
                    v9 = false;
                end;
                return ;
            end;
        end);
        v11[v12.AnimateScriptMoodRemoved] = v74.ChildRemoved:Connect(function(v83)
            if v83.Name == "mood" then
                local l_mood_0 = v74:FindFirstChild("mood");
                if not l_mood_0 then
                    if v6 ~= nil then
                        v6:Stop();
                        v6:Destroy();
                        v6 = nil;
                    end;
                    local l_EmoteStopped_9 = v12.EmoteStopped;
                    if v11[l_EmoteStopped_9] ~= nil then
                        v11[l_EmoteStopped_9]:Disconnect();
                        v11[l_EmoteStopped_9] = nil;
                    end;
                    l_EmoteStopped_9 = v12.EmoteKeyframeReached;
                    if v11[l_EmoteStopped_9] ~= nil then
                        v11[l_EmoteStopped_9]:Disconnect();
                        v11[l_EmoteStopped_9] = nil;
                    end;
                    l_EmoteStopped_9 = v12.AnimationInstanceChanged;
                    if v11[l_EmoteStopped_9] ~= nil then
                        v11[l_EmoteStopped_9]:Disconnect();
                        v11[l_EmoteStopped_9] = nil;
                    end;
                    l_EmoteStopped_9 = v12.EmoteTriggered;
                    if v11[l_EmoteStopped_9] ~= nil then
                        v11[l_EmoteStopped_9]:Disconnect();
                        v11[l_EmoteStopped_9] = nil;
                    end;
                    v5 = nil;
                else
                    v66(l_LocalPlayer_0.Character, l_mood_0:FindFirstChildWhichIsA("Animation"));
                    return ;
                end;
            end;
        end);
        return ;
    else
        v9 = false;
        return ;
    end;
end;
local function v89()
    local l_Animate_0 = l_LocalPlayer_0.Character:FindFirstChild("Animate");
    if l_Animate_0 then
        initAvatarMood(l_Animate_0);
    end;
    local l_AnimateScriptAdded_0 = v12.AnimateScriptAdded;
    if v11[l_AnimateScriptAdded_0] ~= nil then
        v11[l_AnimateScriptAdded_0]:Disconnect();
        v11[l_AnimateScriptAdded_0] = nil;
    end;
    v11[v12.AnimateScriptAdded] = l_LocalPlayer_0.Character.ChildAdded:Connect(function(v88)
        if v88.Name == "Animate" then
            initAvatarMood(v88);
        end;
    end);
end;
local function v93(v90)
    if v90:FindFirstChildWhichIsA("FaceControls") then
        v89();
    end;
    local l_HeadChildAdded_0 = v12.HeadChildAdded;
    if v11[l_HeadChildAdded_0] ~= nil then
        v11[l_HeadChildAdded_0]:Disconnect();
        v11[l_HeadChildAdded_0] = nil;
    end;
    v11[v12.HeadChildAdded] = v90.ChildAdded:Connect(function(v92)
        if v92:IsA("FaceControls") then
            v89();
        end;
    end);
end;
local function _(v94)
    local l_StreamTrackStopped_0 = v12.StreamTrackStopped;
    if v11[l_StreamTrackStopped_0] ~= nil then
        v11[l_StreamTrackStopped_0]:Disconnect();
        v11[l_StreamTrackStopped_0] = nil;
    end;
    l_Core_0 = Enum.AnimationPriority.Idle;
    if v6 then
        v6.Priority = l_Core_0;
    end;
    v11[v12.StreamTrackStopped] = v94.Stopped:Connect(function()
        local l_StreamTrackStopped_1 = v12.StreamTrackStopped;
        if v11[l_StreamTrackStopped_1] ~= nil then
            v11[l_StreamTrackStopped_1]:Disconnect();
            v11[l_StreamTrackStopped_1] = nil;
        end;
        l_Core_0 = Enum.AnimationPriority.Core;
        if v6 then
            v6.Priority = l_Core_0;
        end;
    end);
end;
local function v109(v98)
    local l_AnimationStreamTrackPlayed_0 = v12.AnimationStreamTrackPlayed;
    if v11[l_AnimationStreamTrackPlayed_0] ~= nil then
        v11[l_AnimationStreamTrackPlayed_0]:Disconnect();
        v11[l_AnimationStreamTrackPlayed_0] = nil;
    end;
    v11[v12.AnimationStreamTrackPlayed] = v98.AnimationStreamTrackPlayed:Connect(function(v100)
        local l_StreamTrackStopped_2 = v12.StreamTrackStopped;
        if v11[l_StreamTrackStopped_2] ~= nil then
            v11[l_StreamTrackStopped_2]:Disconnect();
            v11[l_StreamTrackStopped_2] = nil;
        end;
        l_Core_0 = Enum.AnimationPriority.Idle;
        if v6 then
            v6.Priority = l_Core_0;
        end;
        v11[v12.StreamTrackStopped] = v100.Stopped:Connect(function()
            local l_StreamTrackStopped_3 = v12.StreamTrackStopped;
            if v11[l_StreamTrackStopped_3] ~= nil then
                v11[l_StreamTrackStopped_3]:Disconnect();
                v11[l_StreamTrackStopped_3] = nil;
            end;
            l_Core_0 = Enum.AnimationPriority.Core;
            if v6 then
                v6.Priority = l_Core_0;
            end;
        end);
    end);
    l_AnimationStreamTrackPlayed_0 = v98:GetPlayingAnimationTracksCoreScript();
    local v103 = nil;
    for _, v105 in l_AnimationStreamTrackPlayed_0, nil, nil do
        if v105:IsA("AnimationStreamTrack") then
            v103 = v105;
            break;
        end;
    end;
    if not v103 then
        l_Core_0 = Enum.AnimationPriority.Core;
        if v6 then
            v6.Priority = l_Core_0;
        end;
        return ;
    else
        local l_v103_0 = v103;
        local l_StreamTrackStopped_4 = v12.StreamTrackStopped;
        if v11[l_StreamTrackStopped_4] ~= nil then
            v11[l_StreamTrackStopped_4]:Disconnect();
            v11[l_StreamTrackStopped_4] = nil;
        end;
        l_Core_0 = Enum.AnimationPriority.Idle;
        if v6 then
            v6.Priority = l_Core_0;
        end;
        v11[v12.StreamTrackStopped] = l_v103_0.Stopped:Connect(function()
            local l_StreamTrackStopped_5 = v12.StreamTrackStopped;
            if v11[l_StreamTrackStopped_5] ~= nil then
                v11[l_StreamTrackStopped_5]:Disconnect();
                v11[l_StreamTrackStopped_5] = nil;
            end;
            l_Core_0 = Enum.AnimationPriority.Core;
            if v6 then
                v6.Priority = l_Core_0;
            end;
        end);
        return ;
    end;
end;
local _ = function(_)
    assert(not game:GetFastFlag("AvatarMoodSearchForReplacementWhenRemovingAnimator"));
    local l_AnimationStreamTrackPlayed_1 = v12.AnimationStreamTrackPlayed;
    if v11[l_AnimationStreamTrackPlayed_1] ~= nil then
        v11[l_AnimationStreamTrackPlayed_1]:Disconnect();
        v11[l_AnimationStreamTrackPlayed_1] = nil;
    end;
    l_AnimationStreamTrackPlayed_1 = v12.StreamTrackStopped;
    if v11[l_AnimationStreamTrackPlayed_1] ~= nil then
        v11[l_AnimationStreamTrackPlayed_1]:Disconnect();
        v11[l_AnimationStreamTrackPlayed_1] = nil;
    end;
    l_Core_0 = Enum.AnimationPriority.Core;
    if v6 then
        v6.Priority = l_Core_0;
    end;
end;
local function v117(v113, _)
    assert(game:GetFastFlag("AvatarMoodSearchForReplacementWhenRemovingAnimator"));
    local l_AnimationStreamTrackPlayed_2 = v12.AnimationStreamTrackPlayed;
    if v11[l_AnimationStreamTrackPlayed_2] ~= nil then
        v11[l_AnimationStreamTrackPlayed_2]:Disconnect();
        v11[l_AnimationStreamTrackPlayed_2] = nil;
    end;
    l_AnimationStreamTrackPlayed_2 = v12.StreamTrackStopped;
    if v11[l_AnimationStreamTrackPlayed_2] ~= nil then
        v11[l_AnimationStreamTrackPlayed_2]:Disconnect();
        v11[l_AnimationStreamTrackPlayed_2] = nil;
    end;
    l_Core_0 = Enum.AnimationPriority.Core;
    if v6 then
        v6.Priority = l_Core_0;
    end;
    local v116 = if not v113.Character then nil else v113.Character:FindFirstChildOfClass("Humanoid");
    l_AnimationStreamTrackPlayed_2 = if not v116 then nil else v116:FindFirstChildOfClass("Animator");
    if l_AnimationStreamTrackPlayed_2 then
        v109(l_AnimationStreamTrackPlayed_2);
    end;
end;
local function v128(v118, v119)
    local l_Head_0 = v119:FindFirstChild("Head");
    if l_Head_0 then
        v93(l_Head_0);
    end;
    v11[v12.CharacterChildAdded] = v119.ChildAdded:Connect(function(v121)
        if v121.Name == "Head" then
            v93(v121);
        end;
    end);
    v11[v12.CharacterChildRemoved] = v119.ChildRemoved:Connect(function(v122)
        if v122.Name == "Head" then
            if v6 ~= nil then
                v6:Stop();
                v6:Destroy();
                v6 = nil;
            end;
            local l_Head_1 = v119:FindFirstChild("Head");
            if l_Head_1 then
                v93(l_Head_1);
            end;
        end;
    end);
    v11[v12.DescendantAdded] = v119.DescendantAdded:Connect(function(v124)
        if v124:IsA("Animator") then
            v109(v124);
        end;
    end);
    local l_v119_FirstChildWhichIsA_0 = v119:FindFirstChildWhichIsA("Animator", true);
    if l_v119_FirstChildWhichIsA_0 then
        v109(l_v119_FirstChildWhichIsA_0);
    end;
    v11[v12.DescendantRemoving] = v119.DescendantRemoving:Connect(function(v126)
        if v126:IsA("Animator") then
            if not game:GetFastFlag("AvatarMoodSearchForReplacementWhenRemovingAnimator") then
                assert(not game:GetFastFlag("AvatarMoodSearchForReplacementWhenRemovingAnimator"));
                local l_AnimationStreamTrackPlayed_3 = v12.AnimationStreamTrackPlayed;
                if v11[l_AnimationStreamTrackPlayed_3] ~= nil then
                    v11[l_AnimationStreamTrackPlayed_3]:Disconnect();
                    v11[l_AnimationStreamTrackPlayed_3] = nil;
                end;
                l_AnimationStreamTrackPlayed_3 = v12.StreamTrackStopped;
                if v11[l_AnimationStreamTrackPlayed_3] ~= nil then
                    v11[l_AnimationStreamTrackPlayed_3]:Disconnect();
                    v11[l_AnimationStreamTrackPlayed_3] = nil;
                end;
                l_Core_0 = Enum.AnimationPriority.Core;
                if v6 then
                    v6.Priority = l_Core_0;
                end;
            else
                v117(v118, v126);
                return ;
            end;
        end;
    end);
end;
local function v132(_)
    if v6 ~= nil then
        v6:Stop();
        v6:Destroy();
        v6 = nil;
    end;
    for _, v131 in pairs(v11) do
        if v131 then
            v131:Disconnect();
        end;
    end;
    table.clear(v11);
end;
if l_LocalPlayer_0.Character then
    v128(l_LocalPlayer_0, l_LocalPlayer_0.Character);
end;
l_LocalPlayer_0.CharacterAdded:Connect(function(v133)
    v128(l_LocalPlayer_0, v133);
end);
l_LocalPlayer_0.CharacterRemoving:Connect(v132);
