local v0 = require(script:FindFirstAncestor("AppChat").Parent.Cryo);
return function(v1, v2)
    if not v1 or not v1.participants then
        return {};
    else
        return v0.List.filter(v1.participants, function(v3)
            return tostring(v3) ~= tostring(v2);
        end);
    end;
end;
