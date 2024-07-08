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
v0.reportSeries = function(v7, v8, v9, v10)
    v9 = v9 or {};
    assert(type(v8) == "string", "Expected seriesName to be a string");
    assert(type(v9) == "table", "Expected additionalArgs to be a table");
    assert(type(v10) == "number", "Expected throttlingPercent to be a number");
    local v11 = false;
    if v10 >= 0 then
        v11 = v10 <= 10000;
    end;
    assert(v11, "throttlingPercent must be between 0 - 10,000");
    assert(v7._isEnabled, "This reporting service is disabled");
    v7._reporter:ReportInfluxSeries(v8, v9, v10);
end;
return v0;
