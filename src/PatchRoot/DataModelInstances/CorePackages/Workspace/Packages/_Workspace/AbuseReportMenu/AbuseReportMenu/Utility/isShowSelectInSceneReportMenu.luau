local l_CorePackages_0 = game:GetService("CorePackages");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local l_GetFFlagSelectInSceneReportMenu_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelectInSceneReportMenu;
return function()
    if l_GetFFlagSelectInSceneReportMenu_0() then
        if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
            if game:GetEngineFeature("CaptureModeEnabled") then
                if not game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") or l_ExperienceStateCaptureService_0:CanEnterCaptureMode() then
                    return true;
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
