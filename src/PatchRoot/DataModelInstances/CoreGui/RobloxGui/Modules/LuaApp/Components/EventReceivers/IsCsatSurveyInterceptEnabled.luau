local l_GuiService_0 = game:GetService("GuiService");
game:DefineFastFlag("UniversalAppCsat3", false);
return function()
    return (game:GetEngineFeature("UniversalAppCsatAppStorageKey") and game:GetFastFlag("UniversalAppCsat3")) and not l_GuiService_0:IsTenFootInterface();
end;
