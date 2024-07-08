local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Settings.getCamMicPermissions);
local v3 = require(l_CoreGui_0.RobloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
if require(l_CoreGui_0.RobloxGui.Modules.Flags.getFFlagMicrophoneDevicePermissionsPromptLogging)() then
    v2(function(v5)
        v3:init(v5.hasMicPermissions);
    end, {
        l_default_0.Permissions.MICROPHONE_ACCESS
    }, true);
end;
