game:DefineFastFlag("UseExperienceService", false);
return function()
    return game:GetFastFlag("UseExperienceService") and game:GetEngineFeature("ExperienceServiceEnabled");
end;
