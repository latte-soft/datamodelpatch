local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local v1 = nil;
l_VideoCaptureService_0.DevicesChanged:Connect(function()
    v1 = l_VideoCaptureService_0:GetCameraDevices();
end);
return {
    GetDevices = function()
        if not v1 then
            v1 = l_VideoCaptureService_0:GetCameraDevices();
        end;
        return v1;
    end
};
