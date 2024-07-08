game:DefineFastFlag("EnableVRFTUXMorePageEntrypoint", false);
return function()
    return game:GetEngineFeature("EnableMaquettesSupport") or game:GetFastFlag("EnableVRFTUXMorePageEntrypoint");
end;
