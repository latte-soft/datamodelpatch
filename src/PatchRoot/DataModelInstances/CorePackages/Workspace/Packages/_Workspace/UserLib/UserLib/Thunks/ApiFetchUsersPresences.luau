local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getFriendsActiveGamesPlaceIdsFromUsersPresence);
local v3 = require(l_script_FirstAncestor_0.Utils.receiveUsersPresence);
local l_ApiFetchGamesDataByPlaceIds_0 = require(l_Parent_0.GameDetailRodux).GamesByPlaceId.ApiFetchGamesDataByPlaceIds;
local v5 = require(l_script_FirstAncestor_0.Requests.UsersGetPresence);
return function(v6, v7)
    return function(v8)
        return v5(v6, v7):andThen(function(v9)
            local l_userPresences_0 = v9.responseBody.userPresences;
            v3(l_userPresences_0, v8);
            v8:dispatch(l_ApiFetchGamesDataByPlaceIds_0(v6, (v2(l_userPresences_0, v8))));
        end);
    end;
end;
