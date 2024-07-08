local v0 = require(script.Parent.getUserProfileFromId);
return function(v1, v2)
    return v0(v1, v2).platformProfileId;
end;
