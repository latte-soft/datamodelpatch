local l_script_FirstAncestor_0 = script:FindFirstAncestor("NextDataExpirationTimeRodux");
local v1 = require(l_script_FirstAncestor_0.SetNextDataExpirationTime);
local l_Immutable_0 = require(l_script_FirstAncestor_0.Parent.AppCommonLib).Immutable;
return function(v3, v4)
    v3 = v3 or {};
    assert(v3, "");
    if v4.type == v1.name then
        v3 = l_Immutable_0.Set(v3, v4.key, v4.nextDataExpirationTime);
    end;
    return v3;
end;
