local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_llama_0 = v0.llama;
return l_Rodux_0.createReducer({}, {
    SetUserMembershipType = function(v3, v4)
        return l_llama_0.Dictionary.set(v3, v4.userId, v4.membershipType ~= Enum.MembershipType.None);
    end
});
