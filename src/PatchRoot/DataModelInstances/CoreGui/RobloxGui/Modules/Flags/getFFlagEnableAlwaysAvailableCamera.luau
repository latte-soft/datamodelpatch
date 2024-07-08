local v0 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
game:DefineFastFlag("EnableAlwaysAvailableCamera", false);
return function()
    return game:GetFastFlag("EnableAlwaysAvailableCamera") and v0();
end;
