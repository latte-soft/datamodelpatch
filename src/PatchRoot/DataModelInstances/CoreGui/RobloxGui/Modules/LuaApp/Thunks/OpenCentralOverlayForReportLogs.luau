local l_CorePackages_0 = game:GetService("CorePackages");
local l_CentralOverlayType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay;
return function()
    return function(v3)
        v3:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.ReportLogsOverlay, {}));
    end;
end;
