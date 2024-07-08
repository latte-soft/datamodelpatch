local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.Lumberyak).Logger.new(nil, "SoundManager");
local v6 = require(script.Parent.Sounds);
local v7 = require(script.Parent.SoundEffects);
local v8 = require(script.Parent.SoundGroups);
local l_GetFFlagSoundManagerVolumeFix_0 = require(l_Parent_0.SharedFlags).GetFFlagSoundManagerVolumeFix;
local v10 = {};
v10.__index = v10;
local v11 = {
    Looped = false, 
    PlaybackSpeed = 1, 
    Volume = 1, 
    FadeInTime = nil, 
    FadeOutTime = nil, 
    SoundEffects = nil
};
local function _(v12, v13, v14, v15)
    if v13 < 0 then
        error(v15 .. " cannot have a negative fadeIn/fadeOut time.");
    end;
    local v16 = (v14 - v12.Volume) / v13;
    local v17 = nil;
    v17 = l_RunService_0.Heartbeat:Connect(function(v18)
        local v19 = v12.Volume + v16 * v18;
        if v19 <= 0 then
            v12.Volume = 0;
            v12:Stop();
            v17:Disconnect();
            return ;
        elseif v14 <= v19 then
            v12.Volume = v14;
            v17:Disconnect();
            return ;
        else
            v12.Volume = v19;
            return ;
        end;
    end);
end;
v10._createSoundEffect = function(_, v22, v23, v24, v25)
    if not v7[v22] then
        error(v22 .. " does not exist in list of SoundEffects");
    end;
    local v26 = Instance.new(v22);
    for v27, v28 in pairs(v24) do
        v26[v27] = v28;
    end;
    v26.Parent = v25;
    v26.Name = v23;
end;
if l_GetFFlagSoundManagerVolumeFix_0() then
    v10.PlaySound = function(v29, v30, v31, v32)
        local l_SoundManager_Sounds_0 = l_RobloxGui_0:FindFirstChild("SoundManager_Sounds");
        if not l_SoundManager_Sounds_0 then
            error("SoundManager's Sounds folder is missing. SoundManager has not been initialized.");
        end;
        local v34 = v6[v30];
        if v34 then
            local v35 = v4.Dictionary.join(v11, v34.DefaultPlaybackProperties or {}, v31 or {});
            local l_l_SoundManager_Sounds_0_FirstChild_0 = l_SoundManager_Sounds_0:FindFirstChild(v34.Name);
            if not l_l_SoundManager_Sounds_0_FirstChild_0 then
                l_l_SoundManager_Sounds_0_FirstChild_0 = Instance.new("Sound");
                l_l_SoundManager_Sounds_0_FirstChild_0.Parent = l_SoundManager_Sounds_0;
                l_l_SoundManager_Sounds_0_FirstChild_0.SoundId = v34.SoundId;
                l_l_SoundManager_Sounds_0_FirstChild_0.Name = v34.Name;
            end;
            for _, v38 in pairs(l_l_SoundManager_Sounds_0_FirstChild_0:GetChildren()) do
                v38:Destroy();
            end;
            if v32 then
                l_l_SoundManager_Sounds_0_FirstChild_0.SoundGroup = l_RobloxGui_0:FindFirstChild("SoundManager_SoundGroups"):FindFirstChild(v32.Name);
            end;
            for v39, v40 in pairs(v35) do
                if (v39 ~= "FadeInTime" and v39 ~= "FadeOutTime") and v39 ~= "Effects" then
                    l_l_SoundManager_Sounds_0_FirstChild_0[v39] = v40;
                end;
            end;
            local l_ipairs_0 = ipairs;
            local v42 = v35.SoundEffects or {};
            for _, v44 in l_ipairs_0(v42) do
                v29:_createSoundEffect(v44.Type, v44.Name, v44.Properties, l_l_SoundManager_Sounds_0_FirstChild_0);
            end;
            if v35.FadeInTime then
                l_l_SoundManager_Sounds_0_FirstChild_0.Volume = 0;
                l_ipairs_0 = l_l_SoundManager_Sounds_0_FirstChild_0;
                v42 = v35.FadeInTime;
                local l_Volume_0 = v35.Volume;
                if v42 < 0 then
                    error(v30 .. " cannot have a negative fadeIn/fadeOut time.");
                end;
                local v46 = (l_Volume_0 - l_ipairs_0.Volume) / v42;
                local v47 = nil;
                do
                    local l_v47_0 = v47;
                    l_v47_0 = l_RunService_0.Heartbeat:Connect(function(v49)
                        local v50 = l_ipairs_0.Volume + v46 * v49;
                        if v50 <= 0 then
                            l_ipairs_0.Volume = 0;
                            l_ipairs_0:Stop();
                            l_v47_0:Disconnect();
                            return ;
                        elseif l_Volume_0 <= v50 then
                            l_ipairs_0.Volume = l_Volume_0;
                            l_v47_0:Disconnect();
                            return ;
                        else
                            l_ipairs_0.Volume = v50;
                            return ;
                        end;
                    end);
                end;
            end;
            l_l_SoundManager_Sounds_0_FirstChild_0:Play();
            return ;
        else
            error(v30 .. " does not exist in library of Sounds");
            return ;
        end;
    end;
else
    v10.PlaySound = function(v51, v52, v53, v54, v55, v56)
        local l_SoundManager_Sounds_1 = l_RobloxGui_0:FindFirstChild("SoundManager_Sounds");
        if not l_SoundManager_Sounds_1 then
            error("SoundManager's Sounds folder is missing. SoundManager has not been initialized.");
        end;
        local v58 = v6[v52];
        if v58 then
            local v59 = v4.Dictionary.join(v11, v53 or {});
            local l_l_SoundManager_Sounds_1_FirstChild_0 = l_SoundManager_Sounds_1:FindFirstChild(v58.Name);
            if not l_l_SoundManager_Sounds_1_FirstChild_0 then
                l_l_SoundManager_Sounds_1_FirstChild_0 = Instance.new("Sound");
                l_l_SoundManager_Sounds_1_FirstChild_0.Parent = l_SoundManager_Sounds_1;
                l_l_SoundManager_Sounds_1_FirstChild_0.SoundId = v58.SoundId;
                l_l_SoundManager_Sounds_1_FirstChild_0.Name = v58.Name;
            end;
            for _, v62 in pairs(l_l_SoundManager_Sounds_1_FirstChild_0:GetChildren()) do
                v62:Destroy();
            end;
            if v54 then
                l_l_SoundManager_Sounds_1_FirstChild_0.SoundGroup = l_RobloxGui_0:FindFirstChild("SoundManager_SoundGroups"):FindFirstChild(v54.Name);
            end;
            for v63, v64 in pairs(v59) do
                l_l_SoundManager_Sounds_1_FirstChild_0[v63] = v64;
            end;
            local l_ipairs_1 = ipairs;
            local v66 = v55 or {};
            for _, v68 in l_ipairs_1(v66) do
                v51:_createSoundEffect(v68.Type, v68.Name, v68.Properties, l_l_SoundManager_Sounds_1_FirstChild_0);
            end;
            if v56 then
                l_l_SoundManager_Sounds_1_FirstChild_0.Volume = 0;
                l_ipairs_1 = l_l_SoundManager_Sounds_1_FirstChild_0;
                v66 = v59.Volume;
                if v56 < 0 then
                    error(v52 .. " cannot have a negative fadeIn/fadeOut time.");
                end;
                local v69 = (v66 - l_ipairs_1.Volume) / v56;
                local v70 = nil;
                do
                    local l_v70_0 = v70;
                    l_v70_0 = l_RunService_0.Heartbeat:Connect(function(v72)
                        local v73 = l_ipairs_1.Volume + v69 * v72;
                        if v73 <= 0 then
                            l_ipairs_1.Volume = 0;
                            l_ipairs_1:Stop();
                            l_v70_0:Disconnect();
                            return ;
                        elseif v66 <= v73 then
                            l_ipairs_1.Volume = v66;
                            l_v70_0:Disconnect();
                            return ;
                        else
                            l_ipairs_1.Volume = v73;
                            return ;
                        end;
                    end);
                end;
            end;
            l_l_SoundManager_Sounds_1_FirstChild_0:Play();
            return ;
        else
            error(v52 .. " does not exist in list of Sounds");
            return ;
        end;
    end;
end;
v10.StopSound = function(_, v75, v76)
    local l_SoundManager_Sounds_2 = l_RobloxGui_0:FindFirstChild("SoundManager_Sounds");
    if not l_SoundManager_Sounds_2 then
        error("SoundManager's Sounds folder is missing. SoundManager has not been initialized.");
    end;
    local v78 = v6[v75];
    if v78 then
        local l_l_SoundManager_Sounds_2_FirstChild_0 = l_SoundManager_Sounds_2:FindFirstChild(v78.Name);
        if l_l_SoundManager_Sounds_2_FirstChild_0 then
            local v80 = nil;
            if not l_GetFFlagSoundManagerVolumeFix_0() then
                v80 = v76;
            else
                local l_DefaultPlaybackProperties_0 = v78.DefaultPlaybackProperties;
                v80 = if not l_DefaultPlaybackProperties_0 then nil else l_DefaultPlaybackProperties_0.FadeOutTime;
            end;
            if not v80 then
                l_l_SoundManager_Sounds_2_FirstChild_0:Stop();
                return ;
            else
                local l_v80_0 = v80;
                if l_v80_0 < 0 then
                    error(v75 .. " cannot have a negative fadeIn/fadeOut time.");
                end;
                local v83 = (0 - l_l_SoundManager_Sounds_2_FirstChild_0.Volume) / l_v80_0;
                local v84 = nil;
                local v85 = 0;
                v84 = l_RunService_0.Heartbeat:Connect(function(v86)
                    local v87 = l_l_SoundManager_Sounds_2_FirstChild_0.Volume + v83 * v86;
                    if v87 <= 0 then
                        l_l_SoundManager_Sounds_2_FirstChild_0.Volume = 0;
                        l_l_SoundManager_Sounds_2_FirstChild_0:Stop();
                        v84:Disconnect();
                        return ;
                    elseif v85 <= v87 then
                        l_l_SoundManager_Sounds_2_FirstChild_0.Volume = v85;
                        v84:Disconnect();
                        return ;
                    else
                        l_l_SoundManager_Sounds_2_FirstChild_0.Volume = v87;
                        return ;
                    end;
                end);
                return ;
            end;
        else
            error(v75 .. " does not exist");
            return ;
        end;
    else
        error(v75 .. " does not exist in list of Sounds");
        return ;
    end;
end;
v10.CreateSoundGroup = function(v88, v89)
    local v90 = v8[v89];
    if v90 then
        local l_SoundManager_SoundGroups_0 = l_RobloxGui_0:FindFirstChild("SoundManager_SoundGroups");
        if l_SoundManager_SoundGroups_0 then
            if not l_SoundManager_SoundGroups_0:FindFirstChild(v89) then
                local l_SoundGroup_0 = Instance.new("SoundGroup");
                l_SoundGroup_0.Name = v90.Name;
                l_SoundGroup_0.Parent = l_SoundManager_SoundGroups_0;
                l_SoundGroup_0.Volume = v90.Volume;
                for _, v94 in ipairs(v90.SoundEffects) do
                    v88:_createSoundEffect(v94.Type, v94.Name, v94.Properties, l_SoundGroup_0);
                end;
                return ;
            else
                warn("SoundGroup already exists");
                return ;
            end;
        else
            error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.");
            return ;
        end;
    else
        error("SoundGroup does not exist in list of SoundGroups");
        return ;
    end;
end;
v10.SoundGroupAddSoundEffect = function(v95, v96, v97)
    if v8[v96] then
        local l_SoundManager_SoundGroups_1 = l_RobloxGui_0:FindFirstChild("SoundManager_SoundGroups");
        if l_SoundManager_SoundGroups_1 then
            local l_l_SoundManager_SoundGroups_1_FirstChild_0 = l_SoundManager_SoundGroups_1:FindFirstChild(v96);
            if l_l_SoundManager_SoundGroups_1_FirstChild_0 then
                if not l_l_SoundManager_SoundGroups_1_FirstChild_0:FindFirstChild(v97.Name) then
                    v95:_createSoundEffect(v97.Type, v97.Name, v97.Properties, l_l_SoundManager_SoundGroups_1_FirstChild_0);
                    return ;
                else
                    error("SoundEffect with name " .. v97.Name .. " already exists for sound group " .. v96);
                    return ;
                end;
            else
                error("SoundGroup Instance not created");
                return ;
            end;
        else
            error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.");
            return ;
        end;
    else
        error("SoundGroup does not exist in list of SoundGroups");
        return ;
    end;
end;
v10.SoundGroupRemoveSoundEffect = function(_, v101, v102)
    local v103 = v8[v101];
    if v103 then
        local l_SoundManager_SoundGroups_2 = l_RobloxGui_0:FindFirstChild("SoundManager_SoundGroups");
        if l_SoundManager_SoundGroups_2 then
            local l_l_SoundManager_SoundGroups_2_FirstChild_0 = l_SoundManager_SoundGroups_2:FindFirstChild(v101);
            if l_l_SoundManager_SoundGroups_2_FirstChild_0 then
                local l_l_l_SoundManager_SoundGroups_2_FirstChild_0_FirstChild_0 = l_l_SoundManager_SoundGroups_2_FirstChild_0:FindFirstChild(v102);
                if not l_l_l_SoundManager_SoundGroups_2_FirstChild_0_FirstChild_0 then
                    error(v102 .. " not found in " .. v103.Name);
                end;
                l_l_l_SoundManager_SoundGroups_2_FirstChild_0_FirstChild_0:Destroy();
                return ;
            else
                error("SoundGroup Instance not created");
                return ;
            end;
        else
            error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.");
            return ;
        end;
    else
        error("SoundGroup does not exist in list of SoundGroups");
        return ;
    end;
end;
v10.init = function()
    local v107 = setmetatable({}, v10);
    if l_RobloxGui_0:FindFirstChild("SoundManager_Sounds") then
        v5:warning("SoundManager already initialized");
        return v107;
    else
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "SoundManager_Sounds";
        l_Folder_0.Parent = l_RobloxGui_0;
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = "SoundManager_SoundGroups";
        l_Folder_1.Parent = l_RobloxGui_0;
        return v107;
    end;
end;
return v10;
