local l_compose_0 = require(script.Parent.Parent.Parent.dependencies).SocialLibraries.RoduxTools.compose;
local _ = require(script.Parent.Parent.Types);
local v2 = require(script.Parent.getEventInfo);
local v3 = require(script.Parent.optionallyLog);
local v4 = require(script.Parent.reportCounter);
local function v6(v5)
    return "Fired diagCounter: " .. v5.name .. ", count: " .. (not not v5.count and tostring(v5.count) or "1");
end;
return function(v7)
    return function(v8)
        return l_compose_0(v4(v7.diagImpl), v3(v7.loggerImpl, v6), v2(v7.eventList))(v8);
    end;
end;
