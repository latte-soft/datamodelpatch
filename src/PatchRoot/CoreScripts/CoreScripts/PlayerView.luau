local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_PlayerViewService_0 = game:GetService("PlayerViewService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Flags.GetFFlagPlayerViewRemoteEventTimeoutEnabled);
local v5 = require(l_RobloxGui_0.Modules.Flags.GetFIntPlayerViewRemoteEventTimeout);
if not v4() then
    local l_RequestDeviceCameraCFrame_0 = l_RobloxReplicatedStorage_0:WaitForChild("RequestDeviceCameraCFrame");
    local l_ReplicateDeviceCameraCFrame_0 = l_RobloxReplicatedStorage_0:WaitForChild("ReplicateDeviceCameraCFrame");
    local l_game_EngineFeature_0 = game:GetEngineFeature("PlayerViewRemoteEventSupport");
    l_ReplicateDeviceCameraCFrame_0.OnClientEvent:Connect(function(v9, v10, v11)
        if l_game_EngineFeature_0 then
            l_PlayerViewService_0:UpdateDeviceCFrame(v9, v10, v11);
        end;
    end);
    l_RequestDeviceCameraCFrame_0.OnClientEvent:Connect(function()
        if l_game_EngineFeature_0 then
            l_PlayerViewService_0:OnCameraCFrameReplicationRequest();
        end;
    end);
    return ;
else
    local v12 = v5();
    local v13 = l_RobloxReplicatedStorage_0:WaitForChild("RequestDeviceCameraCFrame", v12);
    local v14 = l_RobloxReplicatedStorage_0:WaitForChild("ReplicateDeviceCameraCFrame", v12);
    local l_game_EngineFeature_1 = game:GetEngineFeature("PlayerViewRemoteEventSupport");
    if not v13 or not v14 then
        warn("PlayerViewService failed to initialize.");
        return ;
    else
        v14.OnClientEvent:Connect(function(v16, v17, v18)
            if l_game_EngineFeature_1 then
                l_PlayerViewService_0:UpdateDeviceCFrame(v16, v17, v18);
            end;
        end);
        v13.OnClientEvent:Connect(function()
            if l_game_EngineFeature_1 then
                l_PlayerViewService_0:OnCameraCFrameReplicationRequest();
            end;
        end);
        return ;
    end;
end;
