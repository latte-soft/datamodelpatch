local _ = require(script.Parent.Types);
local v1 = require(script.Parent.getEventInfo);
local v2 = require(script.Parent.optionallyLog);
local v3 = require(script.Parent.Parent.Parent.RoduxTools.compose);
local v4 = require(script.Parent.reportCounter);
local function v6(v5)
    return "Fired diagCounter: " .. v5.name .. ", count: " .. (not not v5.count and tostring(v5.count) or "1");
end;
return function(v7)
    return function(v8)
        return v3(v4(v7.diagImpl), v2(v7.loggerImpl, v6), v1(v7.eventList))(v8);
    end;
end;
