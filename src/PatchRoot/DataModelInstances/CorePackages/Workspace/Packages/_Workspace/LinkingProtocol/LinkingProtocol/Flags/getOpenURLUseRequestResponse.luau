game:DefineFastFlag("OpenURLUseRequestResponseLua", false);
return function()
    return game:GetFastFlag("OpenURLUseRequestResponseLua") and game:GetEngineFeature("OpenURLUseRequestResponseEnabled");
end;
