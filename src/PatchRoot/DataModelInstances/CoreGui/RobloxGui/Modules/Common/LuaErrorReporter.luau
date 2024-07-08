local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local l_ErrorQueue_0 = require(l_CorePackages_0.Workspace.Packages.ErrorReporters).ErrorQueue;
local v5 = require(script.Parent.removePII);
local v6 = require(script.Parent.Analytics).new();
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v8 = require(script.Parent.RobloxTelemetryConfigs.LuaShellErrors);
local l_FVariable_0 = settings():GetFVariable("LuaAppsDiagErrorCounter");
local v10 = game:DefineFastString("LuaErrorByPlatformCounter", "LuaErrorPlatformOther");
local v11 = tonumber(settings():GetFVariable("LuaAppErrorReporterRateLimitThreshold"));
local v12 = tonumber(settings():GetFVariable("LuaAppErrorReporterRateLimitIntervalInSec"));
local l_FVariable_1 = settings():GetFVariable("LuaAppsDiagRateLimitedErrorsCounter");
local v14 = 2 * v11;
local function _(v15)
    return string.format("%s-%s", v15, (l_RunService_0:GetRobloxVersion()));
end;
local function _(v17)
    local v18 = "";
    local v19 = true;
    for v20 in v17:gmatch("[^\r\n]+") do
        if not v19 then
            v18 = v18 .. " | " .. v20;
        else
            v18 = v20;
            v19 = false;
        end;
    end;
    return v18;
end;
local function _(v22)
    return v5(v22);
end;
local function v28(v24, v25, v26, v27)
    print(table.concat({
        "---- Unhandled Error Handler -----", 
        string.format("Current App<%s, %d> : \n%s\n", type(v24), #v24, v24), 
        string.format("Message<%s,%d> :\n%s\n", type(v25), #v25, v25), 
        string.format("Stack<%s,%d> :\n%s", type(v26), #v26, v26), 
        string.format("Script<%s> :\n%s", type(v27), v27:GetFullName()), 
        "----------------------------------"
    }, "\n"));
end;
local function v32(_, v30, v31)
    v6.GoogleAnalytics:trackEvent(v30.productName, v30.errorMessage, v30.errorStack, v31);
end;
local function _(v33, v34, v35, v36)
    l_default_0:logRobloxTelemetryEvent(v8, nil, {
        app = v33, 
        err = v34, 
        stack = v35, 
        script = v36:GetFullName()
    });
end;
local function _()
    v6.Diag:reportCounter(l_FVariable_0, 1);
end;
local function _()
    v6.Diag:reportCounter(v10, 1);
end;
local function _()
    v6.Diag:reportCounter(l_FVariable_1, 1);
end;
local v41 = {};
v41.__index = v41;
v41.new = function(v42, v43, v44)
    if not v42 then
        v42 = l_ScriptContext_0.Error;
    end;
    v43 = v43 or v12;
    local v45 = {
        _isInstance = true, 
        _verbose = false, 
        _signalConnectionToken = nil, 
        _shouldReportDiag = true, 
        _shouldReportGoogleAnalytics = true, 
        _shouldReportInflux = true, 
        _currentApp = "Unknown", 
        _reportQueueGA = nil, 
        _backtraceReporter = v44, 
        _rateLimitingThreshold = v11, 
        _rateLimitingIntervalSec = v43, 
        _rateLimitCounts = {}, 
        _rateLimitNextTick = tick() + v43
    };
    setmetatable(v45, v41);
    v45._reportQueueGA = l_ErrorQueue_0.new(v32, {
        queueKeyLimit = 10
    });
    v45._signalConnectionToken = v42:connect(function(v46, v47, v48, v49)
        local l_status_0, l_result_0 = pcall(function()
            local v50, v51 = v3.unstable_parseReactError(v46);
            v46 = v50.message;
            v47 = v50.stack or v47;
            v49 = v49 or v51;
            v45:handleError(v46, v47, v48, v49);
        end);
        if not l_status_0 then
            warn(string.format("An error occurred while reporting an error : %s", l_result_0));
        end;
    end);
    if not (l_RunService_0:IsStudio() or _G.__TESTEZ_RUNNING_TEST__) then
        game:BindToClose(function()
            v45:delete();
        end);
    end;
    v45._rateLimitHeartbeatConnectionToken = l_RunService_0.Heartbeat:connect(function()
        local v54 = tick();
        if v45._rateLimitNextTick < v54 then
            v45:_processRateLimitingTick();
            v45._rateLimitNextTick = v54 + v45._rateLimitingIntervalSec;
        end;
    end);
    return v45;
end;
v41._processRateLimitingTick = function(v55)
    local v56 = 0;
    for v57, v58 in pairs(v55._rateLimitCounts) do
        if v55._rateLimitingThreshold <= v58 then
            v56 = v56 + 1;
        end;
        local v59 = v58 - v55._rateLimitingThreshold;
        if v14 < v59 then
            v55._rateLimitCounts[v57] = v14;
        elseif v59 <= 0 then
            v55._rateLimitCounts[v57] = nil;
        else
            v55._rateLimitCounts[v57] = v59;
        end;
    end;
    if v56 > 0 then
        v6.Diag:reportCounter(l_FVariable_1, 1);
    end;
end;
v41._processErrorForRateLimiting = function(v60, v61, v62)
    local v63 = v61 .. v62;
    local v64 = v60._rateLimitCounts[v63] or 0;
    v60._rateLimitCounts[v63] = v64 + 1;
    return v60._rateLimitingThreshold <= v64;
end;
v41.delete = function(v65)
    if v65._rateLimitHeartbeatConnectionToken ~= nil then
        v65._rateLimitHeartbeatConnectionToken:disconnect();
    end;
    v65._signalConnectionToken:disconnect();
    v65._reportQueueGA:reportAllErrors();
    v65._reportQueueGA:stopTimer();
    if v65._backtraceReporter ~= nil then
        v65._backtraceReporter:stop();
    end;
end;
v41.setCurrentApp = function(v66, v67)
    if type(v67) ~= "string" then
        error("appName must be a string");
    end;
    v66._currentApp = v67;
end;
v41.startQueueTimers = function(v68)
    v68._reportQueueGA:startTimer();
end;
v41.stopQueueTimers = function(v69)
    v69._reportQueueGA:stopTimer();
end;
v41.handleError = function(v70, v71, v72, v73, v74)
    local v75 = string.format("%s-%s", v70._currentApp, (l_RunService_0:GetRobloxVersion()));
    if v70._verbose then
        v28(v75, v71, v72, v73);
    end;
    local v76 = v5(v71);
    local v77 = v5(v72);
    local v78 = "";
    local v79 = true;
    for v80 in v77:gmatch("[^\r\n]+") do
        if not v79 then
            v78 = v78 .. " | " .. v80;
        else
            v78 = v80;
            v79 = false;
        end;
    end;
    local l_v78_0 = v78;
    if v74 ~= nil then
        v74 = v5(v74);
    end;
    if not v70:_processErrorForRateLimiting(v76, l_v78_0) then
        v78 = string.format("%s | %s", v76, v77);
        if v70._shouldReportGoogleAnalytics then
            v70._reportQueueGA:addError(v78, {
                productName = v75, 
                errorMessage = v76, 
                errorStack = l_v78_0
            });
        end;
        if v70._backtraceReporter ~= nil then
            v70._backtraceReporter:reportErrorDeferred(v76, v77, v74);
        end;
        if v70._shouldReportInflux then
            l_default_0:logRobloxTelemetryEvent(v8, nil, {
                app = v75, 
                err = v76, 
                stack = l_v78_0, 
                script = v73:GetFullName()
            });
        end;
        if v70._shouldReportDiag then
            v6.Diag:reportCounter(l_FVariable_0, 1);
            v6.Diag:reportCounter(v10, 1);
        end;
        return ;
    else
        return ;
    end;
end;
return v41;
