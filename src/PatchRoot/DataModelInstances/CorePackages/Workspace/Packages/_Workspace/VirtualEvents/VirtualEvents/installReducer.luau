local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local l_RoduxNetworking_0 = require(l_script_FirstAncestor_0.network).RoduxNetworking;
return function()
    return v1.combineReducers({
        networkStatus = l_RoduxNetworking_0.installReducer(), 
        events = require(l_script_FirstAncestor_0.Reducers.events), 
        media = require(l_script_FirstAncestor_0.Reducers.media), 
        experienceDetails = require(l_script_FirstAncestor_0.Reducers.experienceDetails), 
        rsvps = require(l_script_FirstAncestor_0.Reducers.rsvps)
    });
end;
