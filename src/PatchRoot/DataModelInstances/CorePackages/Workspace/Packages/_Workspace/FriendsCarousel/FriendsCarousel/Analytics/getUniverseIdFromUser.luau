local _ = require(script.Parent.Parent.Common.LocalTypes);
return function(v1)
    local v2 = nil;
    if v1.isFriendWithUser then
        v2 = v1.universeId;
    end;
    return v2;
end;
