local l_compose_0 = require(script:FindFirstAncestor("SocialLuaAnalytics").dependencies).SocialLibraries.RoduxTools.compose;
local _ = require(script.Parent.Parent.Types);
local v2 = require(script.Parent.getEventInfo);
local v3 = require(script.Parent.optionallyLog);
local v4 = require(script.Parent.reportDiagEvent);
local v5 = require(script.Parent.getFormattedDiagEventInfo);
local function v7(v6)
    return (("Fired Diag %*: %*, %*"):format(v6.type, v6.name, v6.value));
end;
return function(v8)
    return function(v9, v10)
        return l_compose_0(v3(v8.loggerImpl, v7), v4(v8.diagImpl), v5(), v2(v8.eventList))(v9, v10);
    end;
end;
