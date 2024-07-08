game:DefineFastFlag("EnableVoiceSignal", false);
return function()
    return game:GetEngineFeature("AvatarChatServiceEnableVoiceEnabled") and game:GetFastFlag("EnableVoiceSignal");
end;
