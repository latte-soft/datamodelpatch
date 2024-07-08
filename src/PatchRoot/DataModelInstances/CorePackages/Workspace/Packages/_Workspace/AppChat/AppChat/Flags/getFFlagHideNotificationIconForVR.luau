game:DefineFastFlag("HideNotificationIconForVR", false);
return function()
    return game:GetFastFlag("HideNotificationIconForVR") or game:GetEngineFeature("EnableMaquettesSupport");
end;
