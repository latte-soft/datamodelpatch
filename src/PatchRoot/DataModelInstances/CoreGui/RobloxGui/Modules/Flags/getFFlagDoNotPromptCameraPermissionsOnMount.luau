local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v1 = require(l_RobloxGui_0.Modules.Flags.getFFlagDecoupleHasAndRequestPermissions);
local v2 = require(l_RobloxGui_0.Modules.Flags.getFFlagPermissionsEarlyOutStallsQueue);
local v3 = require(l_RobloxGui_0.Modules.Flags.getFFlagUseCameraDeviceGrantedSignal);
game:DefineFastFlag("DoNotPromptCameraPermissionsOnMount", false);
return function()
    return ((game:GetFastFlag("DoNotPromptCameraPermissionsOnMount") and v1()) and v2()) and v3();
end;
