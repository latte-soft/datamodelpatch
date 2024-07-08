game:DefineFastFlag("EnableAsyncAttestationTokenRetrieval", false);
return function()
    return game:GetFastFlag("EnableAsyncAttestationTokenRetrieval") and game:GetEngineFeature("EnableAsyncDeviceIntegrityTokenRetreival");
end;
