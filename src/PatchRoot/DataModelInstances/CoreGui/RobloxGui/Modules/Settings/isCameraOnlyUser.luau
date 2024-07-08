local l_AvatarChatService_0 = game:GetService("AvatarChatService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local v3 = require(game:GetService("CorePackages").Cryo);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAvatarChatServiceEnabled);
local v6 = require(l_RobloxGui_0.Modules.Flags.getFFlagUseCameraDevicesListener);
local v7 = require(l_RobloxGui_0.Modules.Settings.cameraDevicesHelper);
return function()
    if v5() then
        local l_status_0, l_result_0 = pcall(l_AvatarChatService_0.GetClientFeaturesAsync, l_AvatarChatService_0);
        if l_status_0 then
            local v10 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.PlaceVideo);
            local v11 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserVideo);
            local v12 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserVideoEligible);
            local v13 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.PlaceAudio);
            local v14 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserAudio);
            local v15 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserAudioEligible);
            local _ = nil;
            if not v3.isEmpty(if not v6() then l_VideoCaptureService_0:GetCameraDevices() else v7.GetDevices()) then
                local v17 = v14 and v15;
                local v18 = v11 and v12;
                if v10 then
                    if not v13 or not v17 then
                        if not v18 then
                            return false;
                        else
                            return true;
                        end;
                    else
                        return false;
                    end;
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            warn("Unable to get Client Features from AvatarChatService");
            return false;
        end;
    else
        return false;
    end;
end;
