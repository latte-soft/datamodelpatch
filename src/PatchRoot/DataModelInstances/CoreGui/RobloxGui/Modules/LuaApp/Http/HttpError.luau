local v0 = {};
v0.__index = v0;
v0.Kind = {
    Unknown = "Unknown", 
    RequestFailure = "Request Failed", 
    RequireExternalRetry = "Require External Retry", 
    LuaTimeout = "Lua Timeout", 
    InvalidJson = "Invalid Json"
};
v0.new = function(v1, v2, v3, v4)
    assert(type(v1) == "string", "Expected targetUrl to be a string");
    assert(type(v2) == "string", "Expected errKind to be a string");
    assert(type(v3) == "string", "Expected errMessage to be a string");
    local v5 = {
        targetUrl = v1, 
        kind = v2, 
        message = v3
    };
    if v4 then
        assert(type(v4) == "number", "Expected statusCode to be a number");
        v5.StatusCode = v4;
    end;
    setmetatable(v5, v0);
    return v5;
end;
v0.__tostring = function(v6)
    local v7 = table.concat({
        "HttpError :", 
        string.format("\tTarget Url - %s", v6.targetUrl), 
        string.format("\tKind - %s", v6.kind), 
        string.format("\tMessage - %s", v6.message)
    }, "\n");
    if v6.StatusCode then
        v7 = table.concat({
            v7, 
            string.format("\tStatus Code - %s", v6.StatusCode)
        }, "\n");
    end;
    return v7;
end;
return v0;
