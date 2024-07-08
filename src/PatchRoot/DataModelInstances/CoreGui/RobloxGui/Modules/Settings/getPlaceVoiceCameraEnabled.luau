local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_FacialAnimationStreamingServiceV2_0 = game:GetService("FacialAnimationStreamingServiceV2");
return function()
    if not game:IsLoaded() then
        game.Loaded:Wait();
    end;
    return {
        isVoiceEnabledPlaceSettings = l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc and l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc, 
        isCameraEnabledPlaceSettings = l_FacialAnimationStreamingServiceV2_0:IsVideoEnabled(l_FacialAnimationStreamingServiceV2_0.ServiceState)
    };
end;
