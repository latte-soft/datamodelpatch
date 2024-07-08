local v0 = require(script:FindFirstAncestor("AppChat").Parent.Cryo);
return function(v1)
    local v2 = {};
    v0.List.map(v1, function(v3)
        v0.List.map(v3.otherParticipants, function(v4)
            v2[v4] = true;
        end);
    end);
    return v0.Dictionary.keys(v2);
end;
