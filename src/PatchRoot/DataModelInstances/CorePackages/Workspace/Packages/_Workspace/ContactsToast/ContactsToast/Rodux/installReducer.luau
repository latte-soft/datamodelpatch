local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactsToast");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(script.Parent.configuredUsers);
local v3 = require(l_script_FirstAncestor_0.Networking.configuredRoduxNetworking);
return function()
    return v1.combineReducers({
        Users = v2(), 
        NetworkStatus = v3.installReducer()
    });
end;
