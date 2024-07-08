local v0 = require(script.Parent.Parent.dependencies);
local l_Rodux_0 = v0.Rodux;
return function()
    return l_Rodux_0.combineReducers({
        Presence = v0.PresenceReducer.installReducer(), 
        NetworkStatus = v0.RoduxNetworking.installReducer()
    });
end;
