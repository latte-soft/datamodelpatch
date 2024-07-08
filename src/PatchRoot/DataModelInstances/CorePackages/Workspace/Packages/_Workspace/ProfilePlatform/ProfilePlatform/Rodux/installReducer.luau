local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local v3 = require(l_script_FirstAncestor_0.Rodux.Users);
local v4 = require(l_script_FirstAncestor_0.Rodux.Groups);
return function()
    return v1.combineReducers({
        NetworkStatus = v2.installReducer(), 
        Users = v3, 
        Groups = v4
    });
end;
