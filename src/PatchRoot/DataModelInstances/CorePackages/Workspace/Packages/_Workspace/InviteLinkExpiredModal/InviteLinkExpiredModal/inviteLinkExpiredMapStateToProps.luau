local v0 = require(script:FindFirstAncestor("InviteLinkExpiredModal").dependencies);
local l_NetworkingGames_0 = v0.NetworkingGames;
local l_RoduxNetworking_0 = v0.RoduxNetworking;
local l_SocialLibraries_0 = v0.SocialLibraries;
local l_NetworkStatus_0 = l_RoduxNetworking_0.Enum.NetworkStatus;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
return function(v6, v7)
    local l_universeId_0 = v7.universeId;
    local v9 = l_getDeepValue_0(v6, string.format("InviteLinkExpiredModal.Games.byGameId.%s.name", l_universeId_0));
    local v10 = false;
    if #l_universeId_0 > 0 then
        v10 = l_NetworkingGames_0.GetExperiencesDetails.getStatus(v6, l_universeId_0) == l_NetworkStatus_0.Fetching;
    end;
    return {
        experienceName = v9, 
        isLoading = v10, 
        screenSize = v6.ScreenSize
    };
end;
