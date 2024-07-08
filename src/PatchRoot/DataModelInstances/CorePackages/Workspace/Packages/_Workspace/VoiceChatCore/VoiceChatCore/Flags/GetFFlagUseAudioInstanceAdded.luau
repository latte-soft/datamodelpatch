game:DefineFastFlag("UseAudioInstanceAdded", false);
return function()
    return game:GetFastFlag("UseAudioInstanceAdded") and game:GetEngineFeature("AudioInstanceAddedApiEnabled");
end;
