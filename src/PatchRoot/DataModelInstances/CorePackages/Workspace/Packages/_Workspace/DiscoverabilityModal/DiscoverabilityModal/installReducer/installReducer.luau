local v0 = require(script.Parent.Parent.dependencies);
local l_Rodux_0 = v0.Rodux;
local l_RoduxNetworking_0 = v0.RoduxNetworking;
local l_RoduxUserPermissions_0 = v0.RoduxUserPermissions;
return function()
    return l_Rodux_0.combineReducers({
        UserPermissions = l_RoduxUserPermissions_0.installReducer(), 
        NetworkStatus = l_RoduxNetworking_0.installReducer()
    });
end;
