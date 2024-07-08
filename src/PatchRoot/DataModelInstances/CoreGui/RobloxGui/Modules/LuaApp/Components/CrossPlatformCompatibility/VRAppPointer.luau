local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_Modules_0.Common.Roact);
local _ = require(l_CorePackages_0.Packages.React);
local l_PointerOverlay_0 = v2.Core.VR.PointerOverlay;
local v6 = require(l_Modules_0.VR.VRControllerModel);
local v7 = require(l_Modules_0.VR.LaserPointer);
local l_useIsFPSAtTarget_0 = require(l_CorePackages_0.Workspace.Packages.SplashScreenManager).useIsFPSAtTarget;
return function()
    if not l_useIsFPSAtTarget_0() then
        return nil;
    else
        return (v3.createElement(l_PointerOverlay_0, {
            LaserPointer = v7, 
            VRControllerModel = v6
        }));
    end;
end;
