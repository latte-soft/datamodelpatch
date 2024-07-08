local l_ReducerDependencies_0 = require(game:GetService("CorePackages").Workspace.Packages.NotificationsCommon).ReducerDependencies;
local l_NetworkingShareLinks_0 = l_ReducerDependencies_0.NetworkingShareLinks;
local l_RoduxShareLinks_0 = l_ReducerDependencies_0.RoduxShareLinks;
return function(v3)
    return {
        shareInviteLink = v3.ShareLinks.Invites.ShareInviteLink, 
        fetchShareInviteLinkNetworkStatus = l_NetworkingShareLinks_0.GenerateLink.getStatus(v3, l_RoduxShareLinks_0.Enums.LinkType.ExperienceInvite.rawValue())
    };
end;
