local l_GuiService_0 = game:GetService("GuiService");
game:DefineFastFlag("UniversalAppMenuCsat3", false);
game:DefineFastFlag("EnableV3MenuABTest3", false);
return function()
    return ((game:GetEngineFeature("UniversalAppMenuCsatAppStorageKey") and game:GetFastFlag("UniversalAppMenuCsat3")) and game:GetFastFlag("EnableV3MenuABTest3")) and not l_GuiService_0:IsTenFootInterface();
end;
