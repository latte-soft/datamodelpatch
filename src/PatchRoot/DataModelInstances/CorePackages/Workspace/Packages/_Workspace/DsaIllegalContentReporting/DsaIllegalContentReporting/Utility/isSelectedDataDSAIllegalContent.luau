local v0 = require(script:FindFirstAncestor("DsaIllegalContentReporting").Utility.Constants);
return function(v1)
    if v1 == nil then
        return false;
    else
        local v2 = v1[#v1];
        local v3 = false;
        if v2 ~= nil then
            v3 = v2.tagValues[1] == v0.DSA_TAG_VALUE;
        end;
        return v3;
    end;
end;
