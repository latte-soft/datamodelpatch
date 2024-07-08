local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayabilityRodux");
local l_Immutable_0 = require(l_script_FirstAncestor_0.Parent.AppCommonLib).Immutable;
local v2 = require(l_script_FirstAncestor_0.PlayabilityStatus.SetPlayabilityStatus);
return function(v3, v4)
    v3 = v3 or {};
    if v4.type == v2.name then
        v3 = l_Immutable_0.JoinDictionaries(v3, v4.playabilityStatus);
    end;
    return v3;
end;
