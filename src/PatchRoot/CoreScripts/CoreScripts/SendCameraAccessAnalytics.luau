local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("VideoCaptureService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CoreGui_0.RobloxGui.Modules.Settings.getCamMicPermissions);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v7 = not v4.isEmpty((require(l_CoreGui_0.RobloxGui.Modules.Settings.cameraDevicesHelper).GetDevices()));
if not v7 then
    l_RbxAnalyticsService_0:SendEventDeferred("client", "avatarChat", "CameraDevicePermissionResponse", {
        hasAccessToCamera = false, 
        hasEligibleCamera = v7
    });
    return ;
else
    v5(function(v8)
        l_RbxAnalyticsService_0:SendEventDeferred("client", "avatarChat", "CameraDevicePermissionResponse", {
            hasAccessToCamera = v8.hasCameraPermissions, 
            hasEligibleCamera = v7
        });
    end, {
        l_default_0.Permissions.CAMERA_ACCESS
    }, true);
    return ;
end;
