game:DefineFastFlag("UpdateCheckOnLogin", false);
game:DefineFastFlag("UpdateCheckOnLogin2", false);
return function()
    return (game:GetFastFlag("UpdateCheckOnLogin") or game:GetFastFlag("UpdateCheckOnLogin2")) and game:GetEngineFeature("AutoUpgradeEngineFeatureOnly");
end;
