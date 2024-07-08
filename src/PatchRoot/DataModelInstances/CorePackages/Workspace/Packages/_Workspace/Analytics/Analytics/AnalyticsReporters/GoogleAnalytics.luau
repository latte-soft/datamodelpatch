local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    local v2 = type(v1);
    local v3 = true;
    if v2 ~= "table" then
        v3 = v2 == "userdata";
    end;
    assert(v3, "Unexpected value for reportingService");
    local v4 = {
        _reporter = v1, 
        _isEnabled = true
    };
    setmetatable(v4, v0);
    return v4;
end;
v0.setEnabled = function(v5, v6)
    assert(type(v6) == "boolean", "Expected isEnabled to be a boolean");
    v5._isEnabled = v6;
end;
v0.trackEvent = function(v7, v8, v9, v10, v11)
    assert(type(v8) == "string", "Expected category to be a string");
    assert(type(v9) == "string", "Expected action to be a string");
    if v10 then
        assert(type(v10) == "string", "Expected label to be a string");
    end;
    if v11 then
        assert(type(v11) == "number", "Expected value to be a number");
        assert(v11 >= 0, "Expected value must not be a negative value");
    end;
    assert(v7._isEnabled, "This reporting service is disabled");
    v7._reporter:TrackEvent(v8, v9, v10, v11);
end;
return v0;
