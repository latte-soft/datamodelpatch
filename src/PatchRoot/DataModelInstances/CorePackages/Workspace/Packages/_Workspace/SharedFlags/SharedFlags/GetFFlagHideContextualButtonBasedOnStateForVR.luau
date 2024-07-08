game:DefineFastFlag("HideContextualButtonBasedOnStateForVR", false);
return function()
    return game:GetFastFlag("HideContextualButtonBasedOnStateForVR") or game:GetEngineFeature("EnableMaquettesSupport");
end;
