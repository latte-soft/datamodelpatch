local v0 = {};
local v1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Logger):new(script.Name);
v0.EMOTE_LOOP_TRANSITION_WAIT_TIME = 0.3;
v0.EMOTE_LOOP_WAIT_TIMEOUT = 5;
v0.LegacyDefaultEmotes = {
    wave = true, 
    point = true, 
    dance = true, 
    dance2 = true, 
    dance3 = true, 
    laugh = true, 
    cheer = true
};
local function _(v2)
    if v2 then
        v2:Disconnect();
    end;
end;
v0.getAnyActiveDefaultChatTriggeredEmoteTrack = function(v4)
    if v4.Character then
        local l_Humanoid_0 = v4.Character:FindFirstChildOfClass("Humanoid");
        if l_Humanoid_0 then
            local l_Animator_0 = l_Humanoid_0:FindFirstChildOfClass("Animator");
            if l_Animator_0 then
                for _, v8 in pairs((l_Animator_0:GetPlayingAnimationTracks())) do
                    if not ((((not v8.Animation or not v8.Animation.Parent) or not v8:IsA("AnimationTrack")) or not v0.LegacyDefaultEmotes[v8.Animation.Parent.Name]) or not v8.IsPlaying) then
                        return v8;
                    end;
                end;
                return nil;
            else
                return nil;
            end;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
local function v9(v10, v11, v12, v13)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v15 = os.clock();
    local v16 = true;
    local function _()
        if not (not v16 or not l_BindableEvent_0) then
            v16 = false;
            l_BindableEvent_0:Fire();
        end;
    end;
    local v18 = v11.Stopped:Connect(function()
        v1:trace("EmoteHelper.waitForEmoteEventInternal: Stopped");
        if not (not v16 or not l_BindableEvent_0) then
            v16 = false;
            l_BindableEvent_0:Fire();
        end;
    end);
    local v20 = v11.KeyframeReached:Connect(function(v19)
        if not (v19 == "End") or v11.Looped and not v12 then
            v15 = os.clock();
        else
            v1:trace("EmoteHelper.waitForEmoteEventInternal: KeyframeReached");
            if not (not v16 or not l_BindableEvent_0) then
                v16 = false;
                l_BindableEvent_0:Fire();
                return ;
            end;
        end;
    end);
    task.spawn(function()
        local v21 = os.clock() - v15;
        while v16 and v21 < v0.EMOTE_LOOP_WAIT_TIMEOUT do
            wait(v0.EMOTE_LOOP_WAIT_TIMEOUT - v21);
            v21 = os.clock() - v15;
        end;
        if v16 then
            v1:trace("EmoteHelper.waitForEmoteEventInternal: Timeout");
            if not (not v16 or not l_BindableEvent_0) then
                v16 = false;
                l_BindableEvent_0:Fire();
            end;
        end;
    end);
    l_BindableEvent_0.Event:Wait();
    l_BindableEvent_0:Destroy();
    if v18 then
        v18:Disconnect();
    end;
    if v20 then
        v20:Disconnect();
    end;
    if not v12 then
        if v13 then
            v13();
        end;
    else
        wait(v0.EMOTE_LOOP_TRANSITION_WAIT_TIME);
        local v22 = v0.getAnyActiveDefaultChatTriggeredEmoteTrack(v10);
        if not v22 then
            if v13 then
                v13();
            end;
        else
            v9(v10, v22, v12, v13);
        end;
    end;
end;
v0.createEmoteFinishEvent = function(v23, v24, v25)
    local l_BindableEvent_1 = Instance.new("BindableEvent");
    task.spawn(v9, v23, v24, v25, function()
        l_BindableEvent_1:Fire();
        l_BindableEvent_1:Destroy();
    end);
    return l_BindableEvent_1.Event;
end;
return v0;
