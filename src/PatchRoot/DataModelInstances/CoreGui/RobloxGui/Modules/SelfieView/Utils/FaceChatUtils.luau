local l_AvatarChatService_0 = game:GetService("AvatarChatService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local l_default_0 = require(game:GetService("CorePackages").Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v4 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAvatarChatServiceEnabled);
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v6 = nil;
local function v10()
    if v6 ~= nil then
        return v6;
    elseif v4() and not _G.__TESTEZ_RUNNING_TEST__ then
        local l_status_0, l_result_0 = pcall(l_AvatarChatService_0.GetClientFeaturesAsync, l_AvatarChatService_0);
        if l_status_0 then
            local v9 = {
                placeMicEnabled = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.PlaceAudio), 
                userMicEnabled = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserAudio), 
                userMicEligible = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserAudioEligible), 
                placeCamEnabled = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.PlaceVideo), 
                userCamEnabled = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserVideo), 
                userCamEligible = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserVideoEligible)
            };
            v6 = v9;
            return v9;
        else
            warn("Unable to get Client Features from AvatarChatService");
            return {
                placeCamEnabled = false, 
                placeMicEnabled = false, 
                userCamEnabled = false, 
                userCamEligible = false, 
                userMicEnabled = false, 
                userMicEligible = false
            };
        end;
    else
        return {
            placeCamEnabled = false, 
            placeMicEnabled = false, 
            userCamEnabled = false, 
            userCamEligible = false, 
            userMicEnabled = false, 
            userMicEligible = false
        };
    end;
end;
local function v11()
    v2(function()
        if l_FaceAnimatorService_0 and l_FaceAnimatorService_0:IsStarted() then
            l_FaceAnimatorService_0.VideoAnimationEnabled = not l_FaceAnimatorService_0.VideoAnimationEnabled;
            return ;
        else
            return ;
        end;
    end, {
        l_default_0.Permissions.CAMERA_ACCESS
    });
end;
local function v12()
    if not l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled then
        if (l_FaceAnimatorService_0.AudioAnimationEnabled or not l_FaceAnimatorService_0.VideoAnimationEnabled) or not l_FaceAnimatorService_0:IsStarted() then
            if (not l_FaceAnimatorService_0.AudioAnimationEnabled or not l_FaceAnimatorService_0.VideoAnimationEnabled) or not l_FaceAnimatorService_0:IsStarted() then
                return Enum.TrackerMode.None;
            else
                return Enum.TrackerMode.AudioVideo;
            end;
        else
            return Enum.TrackerMode.Video;
        end;
    else
        return Enum.TrackerMode.Audio;
    end;
end;
return {
    getPermissions = v10, 
    toggleVideoAnimation = v11, 
    getTrackerMode = v12, 
    isCameraOn = function()
        local v13 = v12();
        local v14 = true;
        if v13 ~= Enum.TrackerMode.AudioVideo then
            v14 = v13 == Enum.TrackerMode.Video;
        end;
        return v14;
    end
};
