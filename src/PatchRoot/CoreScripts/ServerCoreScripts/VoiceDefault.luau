local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_SoundService_0 = game:GetService("SoundService");
local v4 = game:DefineFastFlag("DebugLogVoiceDefault", false);
local v5 = game:DefineFastFlag("SetNewDeviceToFalse", false);
local v6 = game:DefineFastFlag("FixNewPlayerCheck", false);
local v7 = game:DefineFastFlag("OnlyMakeInputsForVoiceUsers", false);
local v8 = game:DefineFastFlag("SendLikelySpeakingUsers", false);
local v9 = game:DefineFastFlag("VoiceDefaultUseAudioInstanceAdded", false) and game:GetEngineFeature("AudioInstanceAddedApiEnabled");
local function v10(...)
    if v4 then
        print("[VoiceDefault]", ...);
    end;
end;
local v11 = {};
local v12 = {};
local v13 = {};
local function _(v14, v15)
    if v14 == nil then
        return {
            [v15] = true
        };
    else
        v14[v15] = true;
        return v14;
    end;
end;
local function _(v17)
    local l_AudioEmitter_0 = Instance.new("AudioEmitter");
    l_AudioEmitter_0.Parent = v17;
    l_AudioEmitter_0:AddTag("RbxDefaultVoiceEmitter");
    v10("Adding emitter", l_AudioEmitter_0, " to ", v17);
    return l_AudioEmitter_0;
end;
local function _(v20, v21)
    local l_AudioEmitter_1 = Instance.new("AudioEmitter");
    l_AudioEmitter_1.Parent = v20;
    l_AudioEmitter_1:AddTag("RbxDefaultVoiceEmitter");
    v10("Adding emitter", l_AudioEmitter_1, " to ", v20);
    local l_l_AudioEmitter_1_0 = l_AudioEmitter_1;
    v10("Hooking input device to emitter", v20, v21, l_l_AudioEmitter_1_0);
    l_AudioEmitter_1 = Instance.new("Wire");
    l_AudioEmitter_1.Parent = l_l_AudioEmitter_1_0;
    l_AudioEmitter_1.SourceInstance = v21;
    l_AudioEmitter_1.TargetInstance = l_l_AudioEmitter_1_0;
end;
local function _(v25)
    if v25.Player then
        v11[v25.Player][v25] = nil;
    end;
    local v26 = v12[v25];
    if v26 then
        v26.onPlayerChanged:Disconnect();
        v12[v25] = nil;
        return ;
    else
        v10("Attempting to remove connections from untracked AudioDeviceInput");
        return ;
    end;
end;
local function _(v28, v29)
    if v29 then
        local v30 = v11[v29];
        if v30 then
            v30[v28] = nil;
        end;
    end;
    local v31 = v12[v28];
    if v31 then
        v31.onPlayerChanged:Disconnect();
        v12[v28] = nil;
        return ;
    else
        v10("Attempting to remove connections from untracked AudioDeviceInput");
        return ;
    end;
end;
local function v33(v34)
    local l_Player_0 = v34.Player;
    if l_Player_0 then
        local l_v11_0 = v11;
        local v37 = v11[l_Player_0];
        local v38;
        if v37 == nil then
            v38 = {
                [v34] = true
            };
        else
            v37[v34] = true;
            v38 = v37;
        end;
        l_v11_0[l_Player_0] = v38;
    end;
    local v39 = {};
    local l_l_Player_0_0 = l_Player_0;
    v39.onPlayerChanged = v34:GetPropertyChangedSignal("Player"):Connect(function()
        if not v6 then
            local l_v34_0 = v34;
            if l_v34_0.Player then
                v11[l_v34_0.Player][l_v34_0] = nil;
            end;
            local v42 = v12[l_v34_0];
            if v42 then
                v42.onPlayerChanged:Disconnect();
                v12[l_v34_0] = nil;
            else
                v10("Attempting to remove connections from untracked AudioDeviceInput");
            end;
        else
            local l_v34_1 = v34;
            local l_l_l_Player_0_0_0 = l_l_Player_0_0;
            if l_l_l_Player_0_0_0 then
                local v45 = v11[l_l_l_Player_0_0_0];
                if v45 then
                    v45[l_v34_1] = nil;
                end;
            end;
            local v46 = v12[l_v34_1];
            if v46 then
                v46.onPlayerChanged:Disconnect();
                v12[l_v34_1] = nil;
            else
                v10("Attempting to remove connections from untracked AudioDeviceInput");
            end;
        end;
        l_l_Player_0_0 = v34.Player;
        v33(v34);
    end);
    v12[v34] = v39;
end;
local function v58(v47)
    if v7 then
        local l_status_0, l_result_0 = pcall(function()
            return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(v47.UserId);
        end);
        if not l_status_0 then
            v10("Error getting voice enabled status: \"", l_result_0, "\"");
        end;
        if not (l_status_0 and l_result_0) then
            return ;
        end;
    end;
    local l_AudioDeviceInput_0 = Instance.new("AudioDeviceInput");
    l_AudioDeviceInput_0.Player = v47;
    l_AudioDeviceInput_0.Parent = v47;
    l_AudioDeviceInput_0.Active = false;
    v33(l_AudioDeviceInput_0);
    if v47.Character then
        local l_Character_0 = v47.Character;
        local l_AudioEmitter_2 = Instance.new("AudioEmitter");
        l_AudioEmitter_2.Parent = l_Character_0;
        l_AudioEmitter_2:AddTag("RbxDefaultVoiceEmitter");
        v10("Adding emitter", l_AudioEmitter_2, " to ", l_Character_0);
        local l_l_AudioEmitter_2_0 = l_AudioEmitter_2;
        v10("Hooking input device to emitter", l_Character_0, l_AudioDeviceInput_0, l_l_AudioEmitter_2_0);
        l_AudioEmitter_2 = Instance.new("Wire");
        l_AudioEmitter_2.Parent = l_l_AudioEmitter_2_0;
        l_AudioEmitter_2.SourceInstance = l_AudioDeviceInput_0;
        l_AudioEmitter_2.TargetInstance = l_l_AudioEmitter_2_0;
    end;
    v13[v47] = v47.CharacterAdded:Connect(function(v54)
        local l_l_AudioDeviceInput_0_0 = l_AudioDeviceInput_0;
        local l_AudioEmitter_3 = Instance.new("AudioEmitter");
        l_AudioEmitter_3.Parent = v54;
        l_AudioEmitter_3:AddTag("RbxDefaultVoiceEmitter");
        v10("Adding emitter", l_AudioEmitter_3, " to ", v54);
        local l_l_AudioEmitter_3_0 = l_AudioEmitter_3;
        v10("Hooking input device to emitter", v54, l_l_AudioDeviceInput_0_0, l_l_AudioEmitter_3_0);
        l_AudioEmitter_3 = Instance.new("Wire");
        l_AudioEmitter_3.Parent = l_l_AudioEmitter_3_0;
        l_AudioEmitter_3.SourceInstance = l_l_AudioDeviceInput_0_0;
        l_AudioEmitter_3.TargetInstance = l_l_AudioEmitter_3_0;
    end);
    v10("Creating device for ", v47.Name);
end;
if l_VoiceChatService_0.UseNewAudioApi then
    v10("Using new Audio API, EnableDefaultVoice: ", l_VoiceChatService_0.EnableDefaultVoice);
    if l_VoiceChatService_0.EnableDefaultVoice then
        local l_Players_1 = game:GetService("Players");
        l_Players_1.PlayerAdded:Connect(v58);
        l_Players_1.PlayerRemoving:Connect(function(v60)
            local v61 = v11[v60];
            local v62 = v13[v60];
            v10(v60.Name, "removed. Deleting instance", v61);
            if v61 then
                v11[v60] = nil;
            end;
            if v62 then
                v62:Disconnect();
            end;
        end);
        for _, v64 in l_Players_1:GetPlayers() do
            v58(v64);
        end;
    end;
    local l_RemoteEvent_0 = Instance.new("RemoteEvent");
    l_RemoteEvent_0.Name = "SetUserActive";
    l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
    if not v9 then
        game.DescendantAdded:Connect(function(v66)
            if v66:IsA("AudioDeviceInput") then
                if v5 then
                    v66.Active = false;
                end;
                v33(v66);
            end;
        end);
    else
        l_SoundService_0.AudioInstanceAdded:Connect(function(v67)
            if v67:IsA("AudioDeviceInput") then
                if v5 then
                    v67.Active = false;
                end;
                v33(v67);
            end;
        end);
    end;
    for _, v69 in game:GetDescendants() do
        if v69:IsA("AudioDeviceInput") then
            if v5 then
                v69.Active = false;
            end;
            v33(v69);
        end;
    end;
    game.DescendantRemoving:Connect(function(v70)
        if v70:IsA("AudioDeviceInput") then
            if not v6 then
                if v70.Player then
                    v11[v70.Player][v70] = nil;
                end;
                local v71 = v12[v70];
                if v71 then
                    v71.onPlayerChanged:Disconnect();
                    v12[v70] = nil;
                else
                    v10("Attempting to remove connections from untracked AudioDeviceInput");
                    return ;
                end;
            else
                local l_Player_1 = v70.Player;
                if l_Player_1 then
                    local v73 = v11[l_Player_1];
                    if v73 then
                        v73[v70] = nil;
                    end;
                end;
                local v74 = v12[v70];
                if v74 then
                    v74.onPlayerChanged:Disconnect();
                    v12[v70] = nil;
                    return ;
                else
                    v10("Attempting to remove connections from untracked AudioDeviceInput");
                    return ;
                end;
            end;
        end;
    end);
    l_RemoteEvent_0.OnServerEvent:Connect(function(v75, v76)
        local v77 = v11[v75];
        if not v77 then
            v10("Attempting to set Active property for user", v75, "without saved AudioDeviceInput");
            return ;
        else
            v10("Setting", v75, "to", v76);
            for v78, _ in v77, nil, nil do
                v78.Active = v76;
            end;
            return ;
        end;
    end);
end;
if v8 then
    local l_UnreliableRemoteEvent_0 = Instance.new("UnreliableRemoteEvent");
    l_UnreliableRemoteEvent_0.Name = "SendLikelySpeakingUsers";
    l_UnreliableRemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
    local v81 = {};
    v10("Setting up likely speaking users");
    l_Players_0.PlayerAdded:Connect(function(v82)
        local l_status_1, l_result_1 = pcall(function()
            return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(v82.UserId);
        end);
        if not l_status_1 or not l_result_1 then
            if not l_status_1 then
                v10("Error getting voice enabled status: ", l_result_1, " for ", v82.Name);
            end;
            return ;
        else
            v10("Sending likely speaking user for ", v82.Name);
            v81[v82.UserId] = true;
            l_UnreliableRemoteEvent_0:FireAllClients(v81);
            return ;
        end;
    end);
    l_Players_0.PlayerRemoving:Connect(function(v85)
        v81[v85.UserId] = nil;
    end);
end;
