game:DefineFastFlag("HideConnectPageWebViewItemsForVRV2", false);
return function()
    if not game:GetFastFlag("HideConnectPageWebViewItemsForVRV2") and not game:GetEngineFeature("EnableMaquettesSupport") then
        return false;
    else
        return true;
    end;
end;
