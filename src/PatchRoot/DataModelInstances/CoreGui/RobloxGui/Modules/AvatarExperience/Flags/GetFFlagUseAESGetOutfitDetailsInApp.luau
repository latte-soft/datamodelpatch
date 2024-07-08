game:DefineFastFlag("UseAESGetOutfitDetailsInApp2", false);
return function()
    return game:GetFastFlag("UseAESGetOutfitDetailsInApp2") and game:GetEngineFeature("AESAddGetOutfitDetails");
end;
