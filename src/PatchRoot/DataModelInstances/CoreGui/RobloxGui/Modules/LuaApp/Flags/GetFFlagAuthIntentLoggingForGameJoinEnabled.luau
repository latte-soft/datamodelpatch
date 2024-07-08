game:DefineFastFlag("AuthIntentLoggingForGameJoinEnabledV2", false);
return function()
    return game:GetEngineFeature("HasReportPendingJoinToLua") and game:GetFastFlag("AuthIntentLoggingForGameJoinEnabledV2");
end;
