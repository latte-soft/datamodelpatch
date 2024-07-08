local v0 = require(script.Parent.Parent.dependencies);
local l_Rodux_0 = v0.Rodux;
local l_RoduxNetworking_0 = v0.RoduxNetworking;
local v3 = require(script.Parent.Contacts);
local v4 = require(script.Parent.ShowContactImporterParams);
local l_RoduxUserPermissions_0 = v0.RoduxUserPermissions;
return function()
    return l_Rodux_0.combineReducers({
        Contacts = v3, 
        UserPermissions = l_RoduxUserPermissions_0.installReducer(), 
        NetworkStatus = l_RoduxNetworking_0.installReducer(), 
        ShowContactImporterParams = v4
    });
end;
