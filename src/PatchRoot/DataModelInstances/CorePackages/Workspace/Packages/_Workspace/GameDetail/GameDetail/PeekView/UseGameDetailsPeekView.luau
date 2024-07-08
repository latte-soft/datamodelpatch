local l_isSubjectToDesktopPolicies_0 = require(script:FindFirstAncestor("GameDetail").Parent.SharedFlags).isSubjectToDesktopPolicies;
local l_Players_0 = game:GetService("Players");
return function()
    if l_Players_0.LocalPlayer then
        if not l_isSubjectToDesktopPolicies_0() then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
