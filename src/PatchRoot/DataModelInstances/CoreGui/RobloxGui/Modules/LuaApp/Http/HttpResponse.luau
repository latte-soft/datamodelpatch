local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2, v3, v4)
    assert(type(v1) == "string", "Expected url to be a string");
    local v5 = true;
    if type(v2) ~= "string" then
        v5 = type(v2) == "table";
    end;
    assert(v5, "Expected response to be a string or table");
    assert(type(v3) == "number", "Expected responseTimeMs to be a number");
    assert(type(v4) == "number", "Expected statusCode to be a number");
    local v6 = {
        requestUrl = v1, 
        responseTimeMs = v3, 
        responseCode = v4, 
        responseBody = v2
    };
    setmetatable(v6, v0);
    return v6;
end;
v0.__tostring = function(v7)
    return table.concat({
        "HttpResponse :", 
        string.format("\tRequested Url - %s", v7.requestUrl), 
        string.format("\tCode - %s", (tostring(v7.responseCode))), 
        string.format("\tBody - %s", (tostring(v7.responseBody))), 
        string.format("\tTime(ms) - %s", (tostring(v7.responseTimeMs)))
    }, "\n");
end;
return v0;
