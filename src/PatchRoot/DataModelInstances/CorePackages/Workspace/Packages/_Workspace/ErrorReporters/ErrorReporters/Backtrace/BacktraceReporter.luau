local l_Parent_0 = script:FindFirstAncestor("ErrorReporters").Parent;
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.BacktraceReport);
local v5 = require(script.Parent.Parent.ErrorQueue);
local v6 = l_RunService_0:IsStudio();
local v7 = game:DefineFastInt("OldestUAVersionToReportErrors", 0);
local v8 = {};
v8.__index = v8;
local v9 = v3.strictInterface({
    httpService = v3.some(v3.instanceOf("HttpService"), v3.interface({
        JSONEncode = v3.callback, 
        JSONDecode = v3.callback, 
        RequestInternal = v3.callback
    })), 
    token = v3.string, 
    processErrorReportMethod = v3.optional(v3.callback), 
    queueOptions = v3.optional(v3.table), 
    generateLogMethod = v3.optional(v3.callback), 
    logIntervalInSeconds = v3.optional(v3.numberPositive)
});
v8.new = function(v10)
    local v11, v12 = v9(v10);
    local v13 = nil;
    if not v11 then
        if not v6 and not _G.__DEV__ then
            v13 = {
                _isEnabled = false
            };
        else
            error("invalid arguments for BacktraceReporter: " .. v12);
        end;
    else
        v13 = {
            _isEnabled = true, 
            _httpService = v10.httpService, 
            _errorQueue = nil, 
            _reportUrl = game:GetFastString("ErrorUploadToBacktraceBaseUrl") .. "token=" .. v10.token, 
            _processErrorReportMethod = v10.processErrorReportMethod, 
            _sharedAttributes = {}, 
            _sharedAnnotations = {}, 
            _generateLogMethod = v10.generateLogMethod, 
            _logIntervalInSeconds = v10.logIntervalInSeconds or 60, 
            _lastLogTime = 0
        };
    end;
    setmetatable(v13, v8);
    if v13._isEnabled then
        v13._errorQueue = v5.new(function(...)
            v13:_reportErrorFromErrorQueue(...);
        end, v10.queueOptions);
        v13._errorQueue:startTimer();
    end;
    return v13;
end;
v8.isTooOldToReportErrors = function(_)
    local v15 = tonumber(string.match(l_RunService_0:GetRobloxVersion(), ".(%d+)."));
    if v15 then
        if v15 < v7 then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v8.sendErrorReport = function(v16, v17, v18)
    if v16._isEnabled then
        if not v16:isTooOldToReportErrors() then
            if not (not v6 and not _G.__DEV__) then
                assert(v17:validate());
            end;
            local l_status_0, l_result_0 = pcall(function()
                return v16._httpService:JSONEncode(v17);
            end);
            if l_status_0 then
                pcall(function()
                    v16._httpService:RequestInternal({
                        Url = v16._reportUrl .. "&format=json", 
                        Method = "POST", 
                        Headers = {
                            ["Content-Type"] = "application/json"
                        }, 
                        Body = l_result_0
                    }):Start(function(_, v22)
                        if v22.StatusCode == 200 and v18 ~= nil then
                            local l_status_1, l_result_1 = pcall(function()
                                return v16._httpService:JSONDecode(v22.Body);
                            end);
                            if l_status_1 and l_result_1._rxid ~= nil then
                                v16:_sendLogToReport(l_result_1._rxid, v18);
                            end;
                        end;
                    end);
                end);
                return ;
            else
                warn("Cannot convert report to Json");
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v8._sendLogToReport = function(v25, v26, v27)
    if not (type(v27) == "string") or #v27 == 0 then
        return ;
    else
        pcall(function()
            v25._httpService:RequestInternal({
                Url = v25._reportUrl .. "&object=" .. v26 .. "&attachment_name=log.txt", 
                Method = "POST", 
                Headers = {
                    ["Content-Type"] = "text/plain"
                }, 
                Body = v27
            }):Start(function(_, _)
            end);
        end);
        return ;
    end;
end;
v8._generateLog = function(v30)
    if v30._generateLogMethod ~= nil and v30._logIntervalInSeconds < tick() - v30._lastLogTime then
        v30._lastLogTime = tick();
        local l_status_2, l_result_2 = pcall(function()
            return v30._generateLogMethod();
        end);
        if (l_status_2 and type(l_result_2) == "string") and #l_result_2 > 0 then
            return l_result_2;
        end;
    end;
    return nil;
end;
v8._generateErrorReport = function(v33, v34, v35, v36)
    local v37 = nil;
    v37 = if type(v36) == "table" then v4.fromDetails(v36) else v4.fromMessageAndStack(v34, v35);
    v37:addAttributes(v33._sharedAttributes);
    v37:addAnnotations(v33._sharedAnnotations);
    if type(v36) == "string" and v36 ~= "" then
        v37:addAnnotations({
            stackDetails = v36
        });
    end;
    return v37;
end;
v8.reportErrorImmediately = function(v38, v39, v40, v41)
    if v38._isEnabled then
        local v42 = v38:_generateErrorReport(v39, v40, v41);
        if v38._processErrorReportMethod ~= nil then
            v42 = v38._processErrorReportMethod(v42);
        end;
        v38:sendErrorReport(v42, (v38:_generateLog()));
        return ;
    else
        return ;
    end;
end;
v8.reportErrorDeferred = function(v43, v44, v45, v46)
    if v43._isEnabled then
        local v47 = string.format("%s | %s", v44, v45);
        local v48 = {};
        if not v43._errorQueue:hasError(v47) then
            local v49 = v43:_generateErrorReport(v44, v45, v46);
            if v43._processErrorReportMethod ~= nil then
                v49 = v43._processErrorReportMethod(v49);
            end;
            v48 = {
                backtraceReport = v49, 
                log = v43:_generateLog()
            };
        end;
        v43._errorQueue:addError(v47, v48);
        return ;
    else
        return ;
    end;
end;
v8._reportErrorFromErrorQueue = function(v50, _, v52, v53)
    local l_backtraceReport_0 = v52.backtraceReport;
    local l_log_0 = v52.log;
    l_backtraceReport_0:addAttributes({
        ErrorCount = v53
    });
    v50:sendErrorReport(l_backtraceReport_0, l_log_0);
end;
local l_IAttributes_0 = v4.IAttributes;
v8.updateSharedAttributes = function(v57, v58)
    local v59 = v2.Dictionary.join(v57._sharedAttributes, v58);
    local v60, v61 = l_IAttributes_0(v59);
    if not v60 then
        if not v6 and not _G.__DEV__ then
            return ;
        else
            assert(v60, v61);
        end;
    end;
    v57._sharedAttributes = v59;
end;
local l_IAnnotations_0 = v4.IAnnotations;
v8.updateSharedAnnotations = function(v63, v64)
    local v65 = v2.Dictionary.join(v63._sharedAnnotations, v64);
    local v66, v67 = l_IAnnotations_0(v65);
    if not v66 then
        if not v6 and not _G.__DEV__ then
            return ;
        else
            assert(v66, v67);
        end;
    end;
    v63._sharedAnnotations = v65;
end;
v8.reportAllErrors = function(v68)
    if v68._errorQueue ~= nil then
        v68._errorQueue:reportAllErrors();
    end;
end;
v8.stop = function(v69)
    v69._isEnabled = false;
    if v69._errorQueue ~= nil then
        v69:reportAllErrors();
        v69._errorQueue:stopTimer();
    end;
end;
return v8;
