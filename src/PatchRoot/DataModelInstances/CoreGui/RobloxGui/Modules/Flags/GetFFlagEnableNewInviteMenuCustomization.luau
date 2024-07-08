local _ = game:GetService("Players");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.NewInviteMenuExperimentManager);
game:DefineFastFlag("EnableNewInviteMenuCustomization2", false);
game:DefineFastFlag("EnableNewInviteMenuCustomizationIXP2", false);
return function()
    return game:GetFastFlag("EnableNewInviteMenuCustomization2") or game:GetFastFlag("EnableNewInviteMenuCustomizationIXP2") and v1.default:getCustomizationEnabled();
end;
