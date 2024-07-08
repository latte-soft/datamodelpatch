local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Roact);
local v2 = require(l_Modules_0.Common.LuaErrorReporter);
local v3 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
local v4 = require(l_Modules_0.LuaApp.LuaAppEvents);
local v5 = require(l_Modules_0.LuaApp.Flags.GetIsClientEnrolledInBacktraceRollout);
local v6 = v1.Component:extend("MutedErrorReporter");
v6.init = function(v7)
    local l_appName_0 = v7.props.appName;
    local v9 = nil;
    if v5() then
        v9 = v3;
    end;
    v7.errorReporter = v2.new(v4.ReportMutedError, nil, v9);
    v7.errorReporter:setCurrentApp(l_appName_0);
    v7.errorReporter:startQueueTimers();
end;
v6.render = function(_)
    return nil;
end;
v6.willUnmount = function(v11)
    v11.errorReporter:stopQueueTimers();
end;
return v6;
