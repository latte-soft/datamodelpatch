game:DefineFastFlag("IXPExperimentCache", false);
return function()
    return game:GetFastFlag("IXPExperimentCache") and game:GetEngineFeature("UniversalAppExperimentCacheStorageKey");
end;
