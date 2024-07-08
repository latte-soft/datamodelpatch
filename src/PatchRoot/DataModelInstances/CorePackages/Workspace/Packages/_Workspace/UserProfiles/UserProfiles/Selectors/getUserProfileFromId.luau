local v0 = require(script:FindFirstAncestor("UserProfiles").Parent.Cryo);
return function(v1, v2)
    return v1.userProfiles[v0.List.findWhere(v1.userProfiles, function(v3, _)
        return v3.id == tostring(v2);
    end)] or {};
end;
