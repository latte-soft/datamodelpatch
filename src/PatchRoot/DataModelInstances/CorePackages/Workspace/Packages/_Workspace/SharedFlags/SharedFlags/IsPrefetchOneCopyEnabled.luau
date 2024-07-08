game:DefineFastFlag("PrefetchOneCopyEnabledForTesting", false);
return function()
    return game:GetEngineFeature("PrefetchOneCopy") or game:GetFastFlag("PrefetchOneCopyEnabledForTesting");
end;
