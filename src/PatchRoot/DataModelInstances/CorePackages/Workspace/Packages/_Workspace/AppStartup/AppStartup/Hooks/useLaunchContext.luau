local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppStartup");
local v1 = require(l_script_FirstAncestor_0.Parent.RoactUtils);
local _ = require(l_script_FirstAncestor_0.Enums);
local l_useSelector_0 = v1.Hooks.RoactRodux.useSelector;
return function()
    return l_useSelector_0(function(v4)
        return v4.LaunchContext;
    end);
end;
