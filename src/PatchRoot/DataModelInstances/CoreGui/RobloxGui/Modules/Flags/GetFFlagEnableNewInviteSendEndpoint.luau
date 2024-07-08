local _ = game:GetService("Players");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.NewInviteMenuExperimentManager);
game:DefineFastFlag("EnableNewInviteSendEndpoint", false);
game:DefineFastFlag("EnableNewInviteSendEndpointIXP", false);
return function()
    return game:GetFastFlag("EnableNewInviteSendEndpoint") or game:GetFastFlag("EnableNewInviteSendEndpointIXP") and v1.default:getCustomizationEnabled();
end;
