local l_CorePackages_0 = game:GetService("CorePackages");
local l_ShareGame_0 = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame;
local l_Immutable_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Immutable;
local v3 = require(l_ShareGame_0.Actions.ReceivedUserInviteStatus);
return function(v4, v5)
    v4 = v4 or {};
    if v5.type == v3.name then
        v4 = l_Immutable_0.Set(v4, v5.userId, v5.inviteStatus);
    end;
    return v4;
end;
