local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Networking.ProfileRoduxNetworking);
return function()
    return v1.combineReducers({
        NetworkStatus = v2.installReducer()
    });
end;
