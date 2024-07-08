local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_getDeepValue_0 = v0.SocialLibraries.Dictionary.getDeepValue;
local l_RoduxNetworking_0 = v0.RoduxNetworking;
local l_NetworkingGames_0 = v0.NetworkingGames;
local l_NetworkStatus_0 = l_RoduxNetworking_0.Enum.NetworkStatus;
return function(v5, v6)
    local v7 = l_getDeepValue_0(v5, string.format("Profile.Presence.byUserId.%s", tostring(v6.profileUserId) or ""));
    local v8 = (not not v7 and v7.universeId) and tostring(v7.universeId) or "";
    local v9 = (not not v7 and v7.placeId) and tostring(v7.placeId) or "";
    local v10 = nil;
    local v11 = nil;
    v10 = (not not v7 and v7.rootPlaceId) and tostring(v7.rootPlaceId) or "";
    v11 = (not not v7 and v7.gameId) and tostring(v7.gameId) or "";
    local v12 = not (#v8 > 0);
    if not v12 then
        v12 = true;
        if l_NetworkingGames_0.GetExperiencesPlayabilityStatus.getStatus(v5, v8) ~= l_NetworkStatus_0.Fetching then
            v12 = true;
            if l_NetworkingGames_0.GetExperiencesDetails.getStatus(v5, v8) ~= l_NetworkStatus_0.Fetching then
                v12 = l_NetworkingGames_0.GetExperiencesProductInfo.getStatus(v5, v8) == l_NetworkStatus_0.Fetching;
            end;
        end;
    end;
    return {
        universeId = v8, 
        isLoading = v12, 
        placeId = v9, 
        rootPlaceId = v10, 
        gameId = v11
    };
end;
