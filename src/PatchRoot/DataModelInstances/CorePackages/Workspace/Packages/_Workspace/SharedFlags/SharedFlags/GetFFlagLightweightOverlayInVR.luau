game:DefineFastFlag("LightweightOverlayInVR", false);
return function()
    return game:GetFastFlag("LightweightOverlayInVR") or game:GetEngineFeature("EnableMaquettesSupport");
end;
