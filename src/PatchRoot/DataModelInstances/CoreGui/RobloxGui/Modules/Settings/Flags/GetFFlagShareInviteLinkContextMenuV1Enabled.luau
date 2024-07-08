local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_ThrottleUserId_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).ThrottleUserId;
local v4 = require(l_Modules_0.ShareInviteLinkABTestManager);
local v5 = require(l_Modules_0.Flags.GetFFlagShareInviteLinkContextMenuV1ABTestEnabled);
game:DefineFastFlag("ShareInviteLinkContextMenuV1Enabled_v3", false);
game:DefineFastInt("ShareInviteLinkContextMenuV1RolloutPercentage", 0);
return function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 and l_LocalPlayer_0.UserId then
        return (game:GetFastFlag("ShareInviteLinkContextMenuV1Enabled_v3") or not not v5() and v4.default:isShareInviteLinkEnabled()) or l_ThrottleUserId_0(game:GetFastInt("ShareInviteLinkContextMenuV1RolloutPercentage"), l_LocalPlayer_0.UserId);
    else
        return false;
    end;
end;
