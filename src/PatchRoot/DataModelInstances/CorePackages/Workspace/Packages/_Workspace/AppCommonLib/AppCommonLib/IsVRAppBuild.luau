local l_VRService_0 = game:GetService("VRService");
game:DefineFastFlag("VRModeInStudio", false);
return function()
    if not UserSettings().GameSettings:InStudioMode() or not game:GetFastFlag("VRModeInStudio") then
        if not game:GetEngineFeature("MaquettesBuildFlagsEnabled") then
            return l_VRService_0.VREnabled;
        else
            return l_VRService_0:IsVRAppBuild();
        end;
    else
        return true;
    end;
end;
