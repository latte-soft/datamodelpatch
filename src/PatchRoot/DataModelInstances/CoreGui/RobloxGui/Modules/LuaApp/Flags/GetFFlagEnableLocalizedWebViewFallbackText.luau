game:DefineFastFlag("EnableLocalizedWebViewFallbackText", false);
return function()
    return game:GetEngineFeature("EnableMaquettesSupport") or game:GetFastFlag("EnableLocalizedWebViewFallbackText");
end;
