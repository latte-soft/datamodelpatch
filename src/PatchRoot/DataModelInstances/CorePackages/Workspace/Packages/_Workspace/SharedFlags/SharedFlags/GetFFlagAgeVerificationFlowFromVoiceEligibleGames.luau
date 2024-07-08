game:DefineFastFlag("AgeVerificationFlowFromVoiceEligibleGamesV7", false);
return function()
    return game:GetFastFlag("AgeVerificationFlowFromVoiceEligibleGamesV7") and game:GetEngineFeature("VoiceChatSupported");
end;
