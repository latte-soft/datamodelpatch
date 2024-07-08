local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Settings.getCamMicPermissions);
local l_default_0 = require(game:GetService("CorePackages").Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
if not require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount)() then
    return function(v4)
        v2(function(v5)
            v4(v5.hasCameraPermissions, v5.hasMicPermissions);
        end);
    end;
else
    return function(v6, v7, v8)
        local v9 = nil;
        if v7 then
            if v7 == "camera" then
                v9 = {
                    l_default_0.Permissions.CAMERA_ACCESS
                };
            elseif v7 == "microphone" then
                v9 = {
                    l_default_0.Permissions.MICROPHONE_ACCESS
                };
            end;
        end;
        v2(function(v10)
            v6(v10.hasCameraPermissions, v10.hasMicPermissions);
        end, v9, v8, "ExperienceChat.getPermissions");
    end;
end;
