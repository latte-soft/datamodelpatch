local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoactAppExperiment");
local l_IXPService_0 = game:GetService("IXPService");
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(script.Parent.ExperimentContext);
return function()
    local v4 = v2.useContext(v3);
    if not v4 then
        return l_IXPService_0;
    else
        return v4;
    end;
end;
