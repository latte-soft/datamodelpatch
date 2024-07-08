local v0 = require(script.Parent.getProfileInsightsByUserIdFromData);
return function(v1, v2)
    local v3 = v0(v1, v2);
    if not v3 then
        return false;
    else
        return v3.isOfflineFrequents or false;
    end;
end;
