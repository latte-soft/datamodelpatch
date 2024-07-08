local v0 = require(script:FindFirstAncestor("Squads").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_RoduxGames_0 = v0.RoduxGames;
local l_RoduxNetworking_0 = v0.RoduxNetworking;
local l_RoduxSquads_0 = v0.RoduxSquads;
local l_RoduxPresence_0 = v0.RoduxPresence;
return function()
    return l_Rodux_0.combineReducers({
        Games = l_RoduxGames_0.installReducer(), 
        NetworkStatus = l_RoduxNetworking_0.installReducer(), 
        Presence = l_RoduxPresence_0.installReducer(), 
        Squad = l_RoduxSquads_0.installReducer()
    });
end;
