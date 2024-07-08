local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppStartup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.SetLaunchContext);
local v3 = require(l_Parent_0.Rodux);
local _ = require(l_script_FirstAncestor_0.Enums);
return v3.createReducer(nil, {
    [v2.name] = function(_, v6)
        return v6.launchContext;
    end
});
