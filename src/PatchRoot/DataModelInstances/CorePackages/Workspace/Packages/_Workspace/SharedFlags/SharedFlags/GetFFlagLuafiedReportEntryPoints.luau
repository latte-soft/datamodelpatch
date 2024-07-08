game:DefineFastFlag("LuafiedReportEntryPoints", false);
return function()
    return game:GetEngineFeature("EnableMaquettesSupport") or game:GetFastFlag("LuafiedReportEntryPoints");
end;
