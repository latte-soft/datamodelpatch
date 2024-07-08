local v0 = {};
v0.__index = v0;
v0.__tostring = function(v1)
    local v2 = {};
    for v3, v4 in pairs(v1) do
        table.insert(v2, string.format("%s = %s", tostring(v3), (tostring(v4))));
    end;
    table.sort(v2);
    return "<HttpResponse: " .. table.concat(v2, ", ") .. ">";
end;
v0.success = function(v5, v6)
    return (setmetatable({
        responseCode = v5, 
        responseBody = v6
    }, v0));
end;
v0.error = function(v7)
    return (setmetatable({
        HttpError = v7
    }, v0));
end;
return v0;
