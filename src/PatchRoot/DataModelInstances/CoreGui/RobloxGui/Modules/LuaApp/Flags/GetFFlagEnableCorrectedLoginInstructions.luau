game:DefineFastFlag("EnableCorrectedLoginInstructions", false);
return function()
    return game:GetFastFlag("EnableCorrectedLoginInstructions") or game:GetEngineFeature("EnableMaquettesSupport");
end;
