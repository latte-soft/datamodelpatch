local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_getFriendsActiveGamesPlaceIdsFromUsersPresence_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getFriendsActiveGamesPlaceIdsFromUsersPresence;
local _ = l_CoreGui_0.RobloxGui.Modules;
local l_ApiFetchGamesDataByPlaceIds_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GamesByPlaceId.ApiFetchGamesDataByPlaceIds;
return function(v5, v6)
    return function(v7)
        v7:dispatch(l_ApiFetchGamesDataByPlaceIds_0(v5, (l_getFriendsActiveGamesPlaceIdsFromUsersPresence_0(v6, v7))));
    end;
end;
