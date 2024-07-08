local l_FacialAnimationStreamingServiceV2_0 = game:GetService("FacialAnimationStreamingServiceV2");
local l_Players_0 = game:GetService("Players");
local v2 = nil;
return function()
    if not v2 then
        if not game:IsLoaded() then
            game.Loaded:Wait();
        end;
        if l_Players_0.LocalPlayer then
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            assert(l_LocalPlayer_0, "");
            local l_status_0, l_result_0 = pcall(l_FacialAnimationStreamingServiceV2_0.ResolveStateForUser, l_FacialAnimationStreamingServiceV2_0, l_LocalPlayer_0.UserId);
            if l_status_0 then
                local l_ServiceState_0 = l_FacialAnimationStreamingServiceV2_0.ServiceState;
                v2 = {
                    isVoiceEnabledUserSettings = l_FacialAnimationStreamingServiceV2_0:IsAudioEnabled(l_result_0) and l_FacialAnimationStreamingServiceV2_0:IsAudioEnabled(l_ServiceState_0), 
                    isCameraEnabledUserSettings = l_FacialAnimationStreamingServiceV2_0:IsVideoEnabled(l_result_0) and l_FacialAnimationStreamingServiceV2_0:IsVideoEnabled(l_ServiceState_0)
                };
                return v2;
            else
                return {
                    isVoiceEnabledUserSettings = false, 
                    isCameraEnabledUserSettings = false
                };
            end;
        else
            return {
                isVoiceEnabledUserSettings = false, 
                isCameraEnabledUserSettings = false
            };
        end;
    else
        return v2;
    end;
end;
