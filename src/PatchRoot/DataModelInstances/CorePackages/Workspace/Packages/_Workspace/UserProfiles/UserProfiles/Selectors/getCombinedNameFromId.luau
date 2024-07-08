local v0 = require(script.Parent.getUserProfileFromId);
return function(v1, v2)
    local v3 = v0(v1, v2);
    if not v3.names then
        return nil;
    else
        return v3.names.combinedName;
    end;
end;
