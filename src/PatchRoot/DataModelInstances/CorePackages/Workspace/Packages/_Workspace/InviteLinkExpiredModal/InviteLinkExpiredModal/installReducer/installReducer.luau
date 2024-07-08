local v0 = require(script:FindFirstAncestor("InviteLinkExpiredModal").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_RoduxGames_0 = v0.RoduxGames;
local l_RoduxNetworking_0 = v0.RoduxNetworking;
return function()
    return l_Rodux_0.combineReducers({
        Games = l_RoduxGames_0.installReducer(), 
        NetworkStatus = l_RoduxNetworking_0.installReducer()
    });
end;
