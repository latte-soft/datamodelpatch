local l_UserInputService_0 = game:GetService("UserInputService");
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    local v3 = type(v2);
    local v4 = true;
    if v3 ~= "table" then
        v4 = v3 == "userdata";
    end;
    assert(v4, "Unexpected value for reportingService");
    local v5 = {
        _reporter = v2, 
        _isEnabled = true
    };
    setmetatable(v5, v1);
    return v5;
end;
v1.setEnabled = function(v6, v7)
    assert(type(v7) == "boolean", "Expected isEnabled to be a boolean");
    v6._isEnabled = v7;
end;
v1.reportCounter = function(v8, v9, v10)
    assert(type(v9) == "string", "Expected counterName to be a string");
    assert(type(v10) == "number", "Expected amount to be a number");
    assert(v8._isEnabled, "This reporting service is disabled");
    local l_None_0 = Enum.Platform.None;
    pcall(function()
        l_None_0 = l_UserInputService_0:GetPlatform();
    end);
    if l_None_0 == Enum.Platform.XBoxOne then
        v9 = "Xbox-" .. tostring(v9);
    end;
    v8._reporter:ReportCounter(v9, v10);
end;
v1.reportCounterSimple = function(v12, v13, v14)
    if v12._isEnabled then
        v12._reporter:ReportCounter(v13, v14);
    end;
end;
v1.reportStats = function(v15, v16, v17)
    assert(type(v16) == "string", "Expected category to be a string");
    assert(type(v17) == "number", "Expected value to be a number");
    assert(v15._isEnabled, "This reporting service is disabled");
    v15._reporter:ReportStats(v16, v17);
end;
return v1;
