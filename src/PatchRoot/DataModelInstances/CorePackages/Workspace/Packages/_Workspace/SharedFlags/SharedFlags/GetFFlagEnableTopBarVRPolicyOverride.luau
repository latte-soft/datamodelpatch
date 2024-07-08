game:DefineFastFlag("EnableTopBarVRPolicyOverride", false);
return function()
    return game:GetEngineFeature("EnableMaquettesSupport") or game:GetFastFlag("EnableTopBarVRPolicyOverride");
end;
