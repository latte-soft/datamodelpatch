local v0 = require(game:GetService("CorePackages").Packages.React);
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v3 = require(script.Parent.Parent.Utils.FaceChatUtils);
local v4 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.SelfView.Analytics).new();
local l_TrackerMode_0 = Enum.TrackerMode;
local v6 = v3.getTrackerMode();
local v7 = true;
if v6 ~= l_TrackerMode_0.Video then
    v7 = v6 == l_TrackerMode_0.AudioVideo;
end;
local v8 = true;
if v6 ~= l_TrackerMode_0.Audio then
    v8 = v6 == l_TrackerMode_0.AudioVideo;
end;
return function()
    local v9, v10 = v0.useState(l_TrackerMode_0.None);
    local v14 = v0.useCallback(function()
        local v11 = v3.getTrackerMode();
        local v12 = true;
        if v11 ~= l_TrackerMode_0.Video then
            v12 = v11 == l_TrackerMode_0.AudioVideo;
        end;
        if v12 ~= v7 then
            v4:reportCamState(v12);
            v7 = v12;
        end;
        local v13 = true;
        if v11 ~= l_TrackerMode_0.Audio then
            v13 = v11 == l_TrackerMode_0.AudioVideo;
        end;
        if v13 ~= v8 then
            v4:reportMicState(v13);
            v8 = v13;
        end;
        v10(v11);
    end);
    v0.useEffect(function()
        if not l_VideoCaptureService_0 then
            return function()
            end;
        else
            v14();
            local v15 = l_VideoCaptureService_0.Started:Connect(v14);
            local v16 = l_VideoCaptureService_0.Stopped:Connect(v14);
            local v17 = l_VideoCaptureService_0.DevicesChanged:Connect(v14);
            local v18 = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(v14);
            local v19 = l_FaceAnimatorService_0:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(v14);
            return function()
                v15:Disconnect();
                v16:Disconnect();
                v17:Disconnect();
                v18:Disconnect();
                v19:Disconnect();
            end;
        end;
    end, {});
    return v9;
end;
