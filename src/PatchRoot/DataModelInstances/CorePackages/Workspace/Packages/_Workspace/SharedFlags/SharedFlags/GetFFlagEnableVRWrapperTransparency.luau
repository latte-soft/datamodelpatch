game:DefineFastFlag("EnableVRWrapperTransparency", false);
return function()
    return game:GetEngineFeature("EnableMaquettesSupport") or game:GetFastFlag("EnableVRWrapperTransparency");
end;
