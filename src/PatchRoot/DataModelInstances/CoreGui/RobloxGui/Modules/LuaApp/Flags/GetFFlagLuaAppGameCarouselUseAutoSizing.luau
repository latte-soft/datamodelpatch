game:DefineFastFlag("LuaAppGameCarouselUseAutoSizing", false);
return function()
    return not not game:GetEngineFeature("AutomaticSizing2") and (game:GetFastFlag("LuaAppGameCarouselUseAutoSizing") or false);
end;
