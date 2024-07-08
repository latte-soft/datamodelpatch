game:DefineFastFlag("EnableMultiPageSignupExperimentRelease2", false);
return function()
    return game:GetFastFlag("EnableMultiPageSignupExperimentRelease2") and game:GetEngineFeature("SignupActionRequiredKeyAvailable");
end;
