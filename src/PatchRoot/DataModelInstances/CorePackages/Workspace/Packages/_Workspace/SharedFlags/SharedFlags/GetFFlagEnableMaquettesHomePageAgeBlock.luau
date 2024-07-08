game:DefineFastFlag("EnableMaquettesHomePageAgeBlockV2", false);
return function()
    return game:GetFastFlag("EnableMaquettesHomePageAgeBlockV2") or game:GetEngineFeature("EnableMaquettesSupport");
end;
