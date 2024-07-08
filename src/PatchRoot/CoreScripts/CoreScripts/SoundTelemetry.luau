local l_CorePackages_0 = game:GetService("CorePackages");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_SoundService_0 = game:GetService("SoundService");
local l_Modules_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules");
local v5 = require(l_Modules_0.Flags.GetFFlagEnableSoundSessionTelemetry);
local v6 = require(l_Modules_0.Flags.GetFIntSoundSessionTelemetryThrottle);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
game:DefineFastFlag("SoundSessionTelemetryInitialDMTraverse", false);
local v8 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local l_default_0 = v8.default;
local v10 = require(l_Modules_0.AggregatedData);
local v11 = require(l_Modules_0.PlayingSounds);
local v12 = {
    eventName = "SoundSessionPlayback", 
    backends = {
        v8.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v6(), 
    lastUpdated = {
        23, 
        13, 
        6
    }, 
    description = " Aggregated session-end event of all music playback data ", 
    links = "https://roblox.atlassian.net/wiki/spaces/MUS/pages/2065826132/Scaled+Analytics+Tech+Spec"
};
local v13 = {};
local v14 = v10.new();
local v15 = v11.new(v14);
local function v22()
    local v16 = {};
    local v17 = {};
    local v18 = {};
    for v19, v20 in pairs(v14) do
        table.insert(v16, v19);
        table.insert(v17, v20.loopcount);
        table.insert(v18, v20.playtime);
    end;
    local v21 = {
        asset_ids = table.concat(v16, ","), 
        loop_counts = table.concat(v17, ","), 
        playback_seconds = table.concat(v18, ","), 
        placeid = tostring(game.PlaceId), 
        sessionid = l_RbxAnalyticsService_0:GetSessionId(), 
        universeid = tostring(game.GameId)
    };
    if l_game_EngineFeature_0 then
        v21.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    l_default_0:logRobloxTelemetryEvent(v12, nil, v21);
end;
local function v27()
    for v23, v24 in pairs(v15.sounds) do
        for v25, _ in pairs(v24.instances) do
            v15:removeSound(v23, v25);
        end;
    end;
    v22();
end;
local function _(v28)
    return ((l_UserGameSettings_0.MasterVolume * (not v28.SoundGroup and 1 or v28.SoundGroup.Volume)) * v28.Volume) * v28.RollOffGain > 0.01;
end;
local function _(v30)
    if not (not v5() or not (((l_UserGameSettings_0.MasterVolume * (not v30.SoundGroup and 1 or v30.SoundGroup.Volume)) * v30.Volume) * v30.RollOffGain > 0.01)) then
        v15:addSound(v30.SoundId, v30:GetDebugId(10));
    end;
end;
local function _(v32)
    if v5() then
        v15:removeSound(v32.SoundId, v32:GetDebugId(10));
    end;
end;
local function _(v34)
    if v5() then
        v15:removeSound(v34.SoundId, v34:GetDebugId(10));
    end;
end;
local function _(v36)
    if v5() then
        v15:removeSound(v36.SoundId, v36:GetDebugId(10));
    end;
end;
local function _(v38)
    if not (not v5() or not (((l_UserGameSettings_0.MasterVolume * (not v38.SoundGroup and 1 or v38.SoundGroup.Volume)) * v38.Volume) * v38.RollOffGain > 0.01)) then
        v15:addSound(v38.SoundId, v38:GetDebugId(10));
    end;
end;
local _ = function(v40, _)
    if v5() then
        v15:loopSound(v40.SoundId, v40:GetDebugId(10));
    end;
end;
local _ = function(v43)
    local v44 = v13[v43];
    if v44 ~= nil then
        for _, v46 in v44, nil, nil do
            v46:Disconnect();
        end;
    end;
    v13[v43] = nil;
end;
local function v65(v48)
    if not ((not v48.Playing or not v5()) or not (((l_UserGameSettings_0.MasterVolume * (not v48.SoundGroup and 1 or v48.SoundGroup.Volume)) * v48.Volume) * v48.RollOffGain > 0.01)) then
        v15:addSound(v48.SoundId, v48:GetDebugId(10));
    end;
    v13[v48] = {
        v48.Played:Connect(function()
            if v48.TimeLength ~= 0 and v48.IsLoaded then
                local l_v48_0 = v48;
                if not (not v5() or not (((l_UserGameSettings_0.MasterVolume * (not l_v48_0.SoundGroup and 1 or l_v48_0.SoundGroup.Volume)) * l_v48_0.Volume) * l_v48_0.RollOffGain > 0.01)) then
                    v15:addSound(l_v48_0.SoundId, l_v48_0:GetDebugId(10));
                end;
                return ;
            else
                local v50 = nil;
                v50 = v48.Loaded:Connect(function()
                    local l_v48_1 = v48;
                    if not (not v5() or not (((l_UserGameSettings_0.MasterVolume * (not l_v48_1.SoundGroup and 1 or l_v48_1.SoundGroup.Volume)) * l_v48_1.Volume) * l_v48_1.RollOffGain > 0.01)) then
                        v15:addSound(l_v48_1.SoundId, l_v48_1:GetDebugId(10));
                    end;
                    v50:Disconnect();
                end);
                return ;
            end;
        end), 
        v48.Paused:Connect(function()
            local l_v48_2 = v48;
            if v5() then
                v15:removeSound(l_v48_2.SoundId, l_v48_2:GetDebugId(10));
            end;
        end), 
        v48.Stopped:Connect(function()
            local l_v48_3 = v48;
            if v5() then
                v15:removeSound(l_v48_3.SoundId, l_v48_3:GetDebugId(10));
            end;
        end), 
        v48.Ended:Connect(function()
            local l_v48_4 = v48;
            if v5() then
                v15:removeSound(l_v48_4.SoundId, l_v48_4:GetDebugId(10));
            end;
        end), 
        v48.Resumed:Connect(function()
            local l_v48_5 = v48;
            if not (not v5() or not (((l_UserGameSettings_0.MasterVolume * (not l_v48_5.SoundGroup and 1 or l_v48_5.SoundGroup.Volume)) * l_v48_5.Volume) * l_v48_5.RollOffGain > 0.01)) then
                v15:addSound(l_v48_5.SoundId, l_v48_5:GetDebugId(10));
            end;
        end), 
        v48.DidLoop:Connect(function(_, _)
            local l_v48_6 = v48;
            if v5() then
                v15:loopSound(l_v48_6.SoundId, l_v48_6:GetDebugId(10));
            end;
        end), 
        (v48.AncestryChanged:Connect(function(v59, _)
            if v59:FindFirstAncestorOfClass("DataModel") == nil then
                local l_v48_7 = v48;
                local v62 = v13[l_v48_7];
                if v62 ~= nil then
                    for _, v64 in v62, nil, nil do
                        v64:Disconnect();
                    end;
                end;
                v13[l_v48_7] = nil;
            end;
        end))
    };
end;
if v5() then
    if game:GetFastFlag("SoundSessionTelemetryInitialDMTraverse") then
        for _, v67 in ipairs(game:GetDescendants()) do
            if not (not v67:IsA("Sound") or v13[v67]) then
                v65(v67);
            end;
        end;
    end;
    if game:GetEngineFeature("AudioInstanceAddedApiEnabled") then
        l_SoundService_0.AudioInstanceAdded:Connect(function(v68)
            if not (not v68:IsA("Sound") or v13[v68]) then
                v65(v68);
            end;
        end);
    end;
    game.Close:Connect(function()
        v27();
    end);
end;
