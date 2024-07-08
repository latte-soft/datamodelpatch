game:DefineFastFlag("UseLargerCDLCodeFontForVRV2", false);
return function()
    return game:GetEngineFeature("EnableMaquettesSupport") or game:GetFastFlag("UseLargerCDLCodeFontForVRV2");
end;
