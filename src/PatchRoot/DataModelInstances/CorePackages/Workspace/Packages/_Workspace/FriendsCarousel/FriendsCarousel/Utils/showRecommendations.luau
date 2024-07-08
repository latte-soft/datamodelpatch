local l_Parent_0 = script.Parent.Parent;
local l_isSubjectTo10ftPolicies_0 = require(l_Parent_0.dependencies).isSubjectTo10ftPolicies;
local v2 = require(l_Parent_0.Flags.getFIntShowFriendRecommendationsLimit);
return function(v3)
    if not l_isSubjectTo10ftPolicies_0() then
        return v3 <= v2();
    else
        return true;
    end;
end;
