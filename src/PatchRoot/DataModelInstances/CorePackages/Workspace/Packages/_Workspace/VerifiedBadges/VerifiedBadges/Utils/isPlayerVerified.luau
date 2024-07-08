local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedBadges");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagOverridePlayerVerifiedBadge);
local v2 = require(l_script_FirstAncestor_0.Flags.getFStringWhitelistVerifiedUserId);
return function(v3)
    if not v1() then
        if tostring(v3.UserId) == v2() then
            return true;
        elseif v3.HasVerifiedBadge ~= nil then
            return v3.HasVerifiedBadge;
        else
            return false;
        end;
    else
        return true;
    end;
end;
