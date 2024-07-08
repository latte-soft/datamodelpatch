game:DefineFastFlag("LuafiedReportFullFlow", false);
return function()
    return game:GetFastFlag("LuafiedReportFullFlow") or game:GetEngineFeature("EnableMaquettesSupport");
end;
