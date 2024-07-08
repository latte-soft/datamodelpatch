local l_useAppPolicy_0 = require(script:FindFirstAncestor("EditProfile").Parent.UniversalAppPolicy).useAppPolicy;
local v1 = game:DefineFastFlag("RealNamesInDisplayNameExperimentRunning", false);
return function()
    return l_useAppPolicy_0(function(v2)
        if not v1 then
            return v2.getRealNamesInDisplayNamesEnabled();
        else
            return true;
        end;
    end);
end;
