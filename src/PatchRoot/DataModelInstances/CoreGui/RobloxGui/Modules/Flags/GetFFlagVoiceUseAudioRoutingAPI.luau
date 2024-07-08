local l_VoiceChatService_0 = game:GetService("VoiceChatService");
game:DefineFastFlag("VoiceUseAudioRoutingAPIV3", false);
return function()
    return game:GetFastFlag("VoiceUseAudioRoutingAPIV3") and l_VoiceChatService_0.UseNewAudioApi;
end;
