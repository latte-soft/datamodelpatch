local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local l_clearInterval_0 = v1.clearInterval;
local l_clearTimeout_0 = v1.clearTimeout;
local l_setInterval_0 = v1.setInterval;
local l_setTimeout_0 = v1.setTimeout;
local v9 = require(l_Parent_0.Promise);
local v10 = require(script.Parent.jsHelpers.isCallable);
local v11 = require(script.Parent.jsHelpers.typeError);
local _ = require(script.Parent.types["wait-for"]);
local v13 = {};
local v14 = require(script.Parent.helpers);
local _ = v14.getWindowFromNode;
local l_getDocument_0 = v14.getDocument;
local l_jestFakeTimersAreEnabled_0 = v14.jestFakeTimersAreEnabled;
local l_checkContainerType_0 = v14.checkContainerType;
local v19 = require(script.Parent.config);
local l_getConfig_0 = v19.getConfig;
local l_runWithExpensiveErrorDiagnosticsDisabled_0 = v19.runWithExpensiveErrorDiagnosticsDisabled;
local function _(v22, v23)
    v22.stack = if not v23.stack then v22.message else v23.stack:gsub(v23.message, v22.message);
end;
local function v91(v25, v26)
    local v27 = if v26.container == nil then l_getDocument_0() else v26.container;
    local v28 = if v26.timeout == nil then l_getConfig_0().asyncUtilTimeout else v26.timeout;
    local v29 = if v26.showOriginalStackTrace == nil then l_getConfig_0().showOriginalStackTrace else v26.showOriginalStackTrace;
    local l_stackTraceError_0 = v26.stackTraceError;
    local v31 = v26.interval == nil and 50 or v26.interval;
    local v33 = v26.onTimeout == nil and function(v32)
        v32.message = l_getConfig_0().getElementError(v32.message, v27).message;
        return v32;
    end or v26.onTimeout;
    local _ = if v26.mutationObserverOptions == nil then {
        subtree = true, 
        childList = true, 
        attributes = true, 
        characterData = true
    } else v26.mutationObserverOptions;
    if not v10(v25) then
        error(v11.new("Received `callback` arg must be a function"));
    end;
    return v9.new(function(v35, v36)
        return v9.resolve():andThen(function()
            local v37 = nil;
            local v38 = nil;
            local _ = nil;
            local v40 = false;
            local v41 = "idle";
            local v42 = l_jestFakeTimersAreEnabled_0();
            local v43 = {};
            local v44 = nil;
            local function v48(v45, v46)
                v40 = true;
                l_clearTimeout_0(v44);
                if not v42 then
                    l_clearInterval_0(v38);
                    for v47 = 1, #v43 do
                        v43[v47]:Disconnect();
                    end;
                    v43 = {};
                end;
                if not l_Boolean_0.toJSBoolean(v45) then
                    v35(v46);
                    return ;
                else
                    v36(v45);
                    return ;
                end;
            end;
            v44 = l_setTimeout_0(function()
                local v49 = nil;
                if not l_Boolean_0.toJSBoolean(v37) then
                    v49 = l_Error_0.new("Timed out in waitFor.");
                    if not v29 then
                        local l_v49_0 = v49;
                        local l_l_stackTraceError_0_0 = l_stackTraceError_0;
                        l_v49_0.stack = if not l_l_stackTraceError_0_0.stack then l_v49_0.message else l_l_stackTraceError_0_0.stack:gsub(l_l_stackTraceError_0_0.message, l_v49_0.message);
                    end;
                else
                    v49 = v37;
                    if not v29 and v49.name == "TestingLibraryElementError" then
                        local l_v49_1 = v49;
                        local l_l_stackTraceError_0_1 = l_stackTraceError_0;
                        l_v49_1.stack = if not l_l_stackTraceError_0_1.stack then l_v49_1.message else l_l_stackTraceError_0_1.stack:gsub(l_l_stackTraceError_0_1.message, l_v49_1.message);
                    end;
                end;
                v48(v33(v49), nil);
            end, v28);
            local function v59()
                if v41 == "pending" then
                    return ;
                else
                    local l_status_0, l_result_0 = pcall(function()
                        local v54 = l_runWithExpensiveErrorDiagnosticsDisabled_0(v25);
                        if not v10(if typeof(v54) == "table" then v54.andThen else nil) then
                            v48(nil, v54);
                            return ;
                        else
                            v41 = "pending";
                            v54:andThen(function(v55)
                                v41 = "resolved";
                                v48(nil, v55);
                            end, function(v56)
                                v41 = "rejected";
                                v37 = v56;
                            end);
                            return ;
                        end;
                    end);
                    if not l_status_0 then
                        v37 = l_result_0;
                    end;
                    return ;
                end;
            end;
            local function v62()
                if not l_jestFakeTimersAreEnabled_0() then
                    return v59();
                else
                    local v60 = l_Error_0.new("Changed from using real timers to fake timers while using waitFor. This is not allowed and will result in very strange behavior. Please ensure you're awaiting all async things your test is doing before changing to fake timers. For more info, please go to https://github.com/testing-library/dom-testing-library/issues/830");
                    if not v29 then
                        local l_l_stackTraceError_0_2 = l_stackTraceError_0;
                        v60.stack = if not l_l_stackTraceError_0_2.stack then v60.message else l_l_stackTraceError_0_2.stack:gsub(l_l_stackTraceError_0_2.message, v60.message);
                    end;
                    return v36(v60);
                end;
            end;
            if not v42 then
                local l_status_1, l_result_1 = pcall(l_checkContainerType_0, v27);
                if l_status_1 then
                    v38 = l_setInterval_0(v62, v31);
                    local function v65(v66, v67)
                        table.insert(v43, v66.ChildAdded:Connect(function(v68)
                            v65(v68, v67);
                            v67();
                        end));
                        table.insert(v43, v66.ChildRemoved:Connect(function(_)
                            v67();
                        end));
                    end;
                    v65(v27, v62);
                    if not (v41 == "pending") then
                        local l_status_2, l_result_2 = pcall(function()
                            local v70 = l_runWithExpensiveErrorDiagnosticsDisabled_0(v25);
                            if not v10(if typeof(v70) == "table" then v70.andThen else nil) then
                                v48(nil, v70);
                                return ;
                            else
                                v41 = "pending";
                                v70:andThen(function(v71)
                                    v41 = "resolved";
                                    v48(nil, v71);
                                end, function(v72)
                                    v41 = "rejected";
                                    v37 = v72;
                                end);
                                return ;
                            end;
                        end);
                        if not l_status_2 then
                            v37 = l_result_2;
                        end;
                    end;
                else
                    v36(l_result_1);
                    return ;
                end;
            else
                local l_jest_0 = require(l_Parent_0.JestGlobals).jest;
                local l_unstable_advanceTimersWrapper_0 = l_getConfig_0().unstable_advanceTimersWrapper;
                if not (v41 == "pending") then
                    local l_status_3, l_result_3 = pcall(function()
                        local v77 = l_runWithExpensiveErrorDiagnosticsDisabled_0(v25);
                        if not v10(if typeof(v77) == "table" then v77.andThen else nil) then
                            v48(nil, v77);
                            return ;
                        else
                            v41 = "pending";
                            v77:andThen(function(v78)
                                v41 = "resolved";
                                v48(nil, v78);
                            end, function(v79)
                                v41 = "rejected";
                                v37 = v79;
                            end);
                            return ;
                        end;
                    end);
                    if not l_status_3 then
                        v37 = l_result_3;
                    end;
                end;
                while true do
                    if v40 then
                        break;
                    elseif l_jestFakeTimersAreEnabled_0() then
                        l_unstable_advanceTimersWrapper_0(function()
                            l_jest_0.advanceTimersByTime(v31);
                            return nil;
                        end);
                        if not (v41 == "pending") then
                            local l_status_4, l_result_4 = pcall(function()
                                local v82 = l_runWithExpensiveErrorDiagnosticsDisabled_0(v25);
                                if not v10(if typeof(v82) == "table" then v82.andThen else nil) then
                                    v48(nil, v82);
                                    return ;
                                else
                                    v41 = "pending";
                                    v82:andThen(function(v83)
                                        v41 = "resolved";
                                        v48(nil, v83);
                                    end, function(v84)
                                        v41 = "rejected";
                                        v37 = v84;
                                    end);
                                    return ;
                                end;
                            end);
                            if not l_status_4 then
                                v37 = l_result_4;
                            end;
                        end;
                        if v40 then
                            break;
                        else
                            local v88 = l_unstable_advanceTimersWrapper_0(function()
                                return v9.resolve():andThen(function()
                                    v9.new(function(v87)
                                        l_setTimeout_0(v87, 0);
                                        l_jest_0.advanceTimersByTime(0);
                                    end):expect();
                                end);
                            end);
                            if typeof(v88.expect) == "function" then
                                v88:expect();
                            else
                                error("advanceTimersWrapper should return a Promise");
                            end;
                        end;
                    else
                        local v89 = l_Error_0.new("Changed from using fake timers to real timers while using waitFor. This is not allowed and will result in very strange behavior. Please ensure you're awaiting all async things your test is doing before changing to real timers. For more info, please go to https://github.com/testing-library/dom-testing-library/issues/830");
                        if not v29 then
                            local l_l_stackTraceError_0_3 = l_stackTraceError_0;
                            v89.stack = if not l_l_stackTraceError_0_3.stack then v89.message else l_l_stackTraceError_0_3.stack:gsub(l_l_stackTraceError_0_3.message, v89.message);
                        end;
                        v36(v89);
                        return ;
                    end;
                end;
            end;
        end);
    end);
end;
v13.waitFor = function(v92, v93)
    local v94 = l_Error_0.new("STACK_TRACE_MESSAGE");
    return l_getConfig_0().asyncWrapper(function()
        return v91(v92, l_Object_0.assign({}, {
            stackTraceError = v94
        }, v93));
    end);
end;
return v13;
