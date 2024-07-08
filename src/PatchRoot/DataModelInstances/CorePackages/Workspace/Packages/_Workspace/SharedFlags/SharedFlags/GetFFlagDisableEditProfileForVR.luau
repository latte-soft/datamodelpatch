game:DefineFastFlag("DisableEditProfileForVRV2", false);
return function()
    if not game:GetFastFlag("DisableEditProfileForVRV2") and not game:GetEngineFeature("EnableMaquettesSupport") then
        return false;
    else
        return true;
    end;
end;
