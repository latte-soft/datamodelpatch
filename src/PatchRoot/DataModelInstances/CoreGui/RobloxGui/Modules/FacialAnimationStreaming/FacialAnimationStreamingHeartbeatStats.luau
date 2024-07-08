local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v7 = require(l_RobloxGui_0.Modules.Flags.GetFIntFacialAnimationStreamingHeartbeatStatsIntervalSec);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v9 = require(script.Parent.RobloxTelemetryConfigs.AvatarChatHeartbeatStats);
local v10 = {};
local v11 = false;
local v12 = {
    None = 0, 
    AudioOnly = 1, 
    VideoOnly = 2, 
    AudioVideo = 3
};
local l_None_0 = v12.None;
local v14 = {};
local v15 = nil;
local v16 = {};
local v17 = {
    VideoAnimationEnabled = "videoAnimationEnabled", 
    AudioAnimationEnabled = "audioAnimationEnabled"
};
local function _()
    local v18 = os.clock();
    local v19 = 0;
    if v15 then
        v19 = v18 - v15;
        local l_v14_0 = v14;
        local l_l_None_0_0 = l_None_0;
        l_v14_0[l_l_None_0_0] = l_v14_0[l_l_None_0_0] + v19;
    end;
    v15 = v18;
end;
local function v30()
    local v23 = {
        pid = tostring(game.PlaceId), 
        sessionid = l_RbxAnalyticsService_0:GetSessionId(), 
        userid = tostring(l_Players_0.LocalPlayer.UserId), 
        universeid = tostring(game.GameId)
    };
    if l_game_EngineFeature_0 then
        v23.playSessionId = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    v23.trackingMode = l_None_0;
    local v24 = os.clock();
    local v25 = 0;
    if v15 then
        v25 = v24 - v15;
        local l_v14_1 = v14;
        local l_l_None_0_1 = l_None_0;
        l_v14_1[l_l_None_0_1] = l_v14_1[l_l_None_0_1] + v25;
    end;
    v15 = v24;
    for v28, v29 in v14, nil, nil do
        v23[tostring(v28)] = v29;
        v14[v28] = 0;
    end;
    l_default_0:logRobloxTelemetryEvent(v9, nil, v23);
end;
local function _()
    local v31 = v7();
    if not (not (v31 > 0) or v11) then
        v11 = true;
        task.spawn(function()
            while v11 do
                v30();
                task.wait(v31);
            end;
            v11 = false;
        end);
    end;
end;
local function _()
    local v33 = os.clock();
    local v34 = 0;
    if v15 then
        v34 = v33 - v15;
        local l_v14_2 = v14;
        local l_l_None_0_2 = l_None_0;
        l_v14_2[l_l_None_0_2] = l_v14_2[l_l_None_0_2] + v34;
    end;
    v15 = v33;
    if not l_FaceAnimatorService_0.VideoAnimationEnabled or not l_FaceAnimatorService_0.AudioAnimationEnabled then
        if not l_FaceAnimatorService_0.VideoAnimationEnabled then
            if not l_FaceAnimatorService_0.AudioAnimationEnabled then
                l_None_0 = v12.None;
                return ;
            else
                l_None_0 = v12.AudioOnly;
                return ;
            end;
        else
            l_None_0 = v12.VideoOnly;
            return ;
        end;
    else
        l_None_0 = v12.AudioVideo;
        return ;
    end;
end;
v10.Initialize = function()
    if v7() <= 0 then
        return ;
    else
        for _, v39 in v12, nil, nil do
            v14[v39] = 0;
        end;
        v16[v17.VideoAnimationEnabled] = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function()
            local v40 = os.clock();
            local v41 = 0;
            if v15 then
                v41 = v40 - v15;
                local l_v14_3 = v14;
                local l_l_None_0_3 = l_None_0;
                l_v14_3[l_l_None_0_3] = l_v14_3[l_l_None_0_3] + v41;
            end;
            v15 = v40;
            if not l_FaceAnimatorService_0.VideoAnimationEnabled or not l_FaceAnimatorService_0.AudioAnimationEnabled then
                if not l_FaceAnimatorService_0.VideoAnimationEnabled then
                    if not l_FaceAnimatorService_0.AudioAnimationEnabled then
                        l_None_0 = v12.None;
                        return ;
                    else
                        l_None_0 = v12.AudioOnly;
                        return ;
                    end;
                else
                    l_None_0 = v12.VideoOnly;
                    return ;
                end;
            else
                l_None_0 = v12.AudioVideo;
                return ;
            end;
        end);
        v16[v17.AudioAnimationEnabled] = l_FaceAnimatorService_0:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function()
            local v44 = os.clock();
            local v45 = 0;
            if v15 then
                v45 = v44 - v15;
                local l_v14_4 = v14;
                local l_l_None_0_4 = l_None_0;
                l_v14_4[l_l_None_0_4] = l_v14_4[l_l_None_0_4] + v45;
            end;
            v15 = v44;
            if not l_FaceAnimatorService_0.VideoAnimationEnabled or not l_FaceAnimatorService_0.AudioAnimationEnabled then
                if not l_FaceAnimatorService_0.VideoAnimationEnabled then
                    if not l_FaceAnimatorService_0.AudioAnimationEnabled then
                        l_None_0 = v12.None;
                        return ;
                    else
                        l_None_0 = v12.AudioOnly;
                        return ;
                    end;
                else
                    l_None_0 = v12.VideoOnly;
                    return ;
                end;
            else
                l_None_0 = v12.AudioVideo;
                return ;
            end;
        end);
        local v48 = os.clock();
        local v49 = 0;
        if v15 then
            v49 = v48 - v15;
            local l_v14_5 = v14;
            local l_l_None_0_5 = l_None_0;
            l_v14_5[l_l_None_0_5] = l_v14_5[l_l_None_0_5] + v49;
        end;
        v15 = v48;
        if not l_FaceAnimatorService_0.VideoAnimationEnabled or not l_FaceAnimatorService_0.AudioAnimationEnabled then
            if not l_FaceAnimatorService_0.VideoAnimationEnabled then
                if not l_FaceAnimatorService_0.AudioAnimationEnabled then
                    l_None_0 = v12.None;
                else
                    l_None_0 = v12.AudioOnly;
                end;
            else
                l_None_0 = v12.VideoOnly;
            end;
        else
            l_None_0 = v12.AudioVideo;
        end;
        v48 = v7();
        if not (not (v48 > 0) or v11) then
            v11 = true;
            task.spawn(function()
                while v11 do
                    v30();
                    task.wait(v48);
                end;
                v11 = false;
            end);
        end;
        return ;
    end;
end;
v10.Cleanup = function()
    if v7() <= 0 then
        return ;
    else
        for _, v53 in pairs(v16) do
            if v53 then
                v53:Disconnect();
            end;
        end;
        table.clear(v16);
        v11 = false;
        return ;
    end;
end;
return v10;
