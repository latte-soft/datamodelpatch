game:DefineFastFlag("AdjustVRFloor", false);
return function()
    return game:GetEngineFeature("EnableMaquettesSupport") or game:GetFastFlag("AdjustVRFloor");
end;
