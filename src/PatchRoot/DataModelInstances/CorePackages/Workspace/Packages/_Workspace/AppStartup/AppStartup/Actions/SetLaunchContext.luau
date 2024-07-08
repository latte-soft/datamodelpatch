local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppStartup");
local l_makeActionCreator_0 = require(l_script_FirstAncestor_0.Parent.Rodux).makeActionCreator;
local _ = require(l_script_FirstAncestor_0.Enums);
return l_makeActionCreator_0(script.Name, function(v3)
    return {
        launchContext = v3
    };
end);
