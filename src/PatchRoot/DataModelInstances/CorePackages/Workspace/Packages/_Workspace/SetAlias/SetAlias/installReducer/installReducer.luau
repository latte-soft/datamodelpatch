local v0 = require(script.Parent.Parent.dependencies);
local l_Rodux_0 = v0.Rodux;
local l_RoduxNetworking_0 = v0.RoduxNetworking;
local l_RoduxAliases_0 = v0.RoduxAliases;
return function()
    return l_Rodux_0.combineReducers({
        Aliases = l_RoduxAliases_0.installReducer(), 
        NetworkStatus = l_RoduxNetworking_0.installReducer()
    });
end;
