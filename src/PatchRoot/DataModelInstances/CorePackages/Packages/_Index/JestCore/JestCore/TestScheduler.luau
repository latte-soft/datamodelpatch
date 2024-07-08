local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local l_WeakMap_0 = v1.WeakMap;
local v8 = require(l_Parent_0.Promise);
local v9 = {};
local v10 = require(l_Parent_0.ChalkLua);
local l_exit_0 = require(l_Parent_0.RobloxShared).nodeUtils.exit;
local v12 = require(l_Parent_0.JestReporters);
local l_DefaultReporter_0 = v12.DefaultReporter;
local l_SummaryReporter_0 = v12.SummaryReporter;
local l_VerboseReporter_0 = v12.VerboseReporter;
local v16 = require(l_Parent_0.JestTestResult);
local l_addResult_0 = v16.addResult;
local l_buildFailureTestResult_0 = v16.buildFailureTestResult;
local l_makeEmptyAggregatedTestResult_0 = v16.makeEmptyAggregatedTestResult;
local _ = require(l_Parent_0.JestTypes);
local l_formatExecError_0 = require(l_Parent_0.JestMessageUtil).formatExecError;
local _ = require(l_Parent_0.JestRunner);
local _ = require(l_Parent_0.JestRuntime);
local l_default_0 = require(script.Parent.ReporterDispatcher).default;
local _ = require(script.Parent.TestWatcher);
local l_shouldRunInBand_0 = require(script.Parent.testSchedulerHelper).shouldRunInBand;
local _ = require(script.Parent.types);
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
v9.createTestScheduler = function(v32, v33)
    return v8.resolve():andThen(function()
        local v34 = v28.new(v32, v33);
        v34:_setupReporters():expect();
        return v34;
    end);
end;
v28 = {};
v28.__index = v28;
v28.new = function(v35, v36)
    local v37 = setmetatable({}, v28);
    v37._context = v36;
    v37._dispatcher = l_default_0.new();
    v37._globalConfig = v35;
    return v37;
end;
v28.addReporter = function(v38, v39)
    v38._dispatcher:register(v39);
end;
v28.removeReporter = function(v40, v41)
    v40._dispatcher:unregister(v41);
end;
v28.scheduleTests = function(v42, v43, v44)
    return v8.resolve():andThen(function()
        local v45 = nil;
        local v46 = nil;
        local v47 = nil;
        local function v48(...)
            return v42._dispatcher:onTestFileStart(...);
        end;
        local v49 = {};
        local v50 = l_Set_0.new();
        l_Array_0.forEach(v43, function(v51)
            v50:add(v51.context);
            local v52 = v51.duration or 0;
            if v52 > 0 then
                table.insert(v49, v52);
            end;
        end);
        local v53 = v30(#v43);
        local v54 = math.ceil(v31(v49, v42._globalConfig.maxWorkers) / 1000);
        local v55 = l_shouldRunInBand_0(v43, v49, v42._globalConfig);
        v45 = function(v56, v57)
            return v8.resolve():andThen(function()
                if not v44:isInterrupted() then
                    if #v57.testResults == 0 then
                        return v46(v56, {
                            message = "Your test suite must contain at least one test.", 
                            stack = l_Error_0.new("Your test suite must contain at least one test.").stack
                        });
                    elseif not l_Boolean_0.toJSBoolean(v57.leaks) then
                        l_addResult_0(v53, v57);
                        v42._dispatcher:onTestFileResult(v56, v57, v53):expect();
                        return v42:_bailIfNeeded(v50, v53, v44);
                    else
                        local v58 = ("%sYour test suite is leaking memory. Please ensure all references are cleaned.\n"):format((tostring(v10.red:bold("EXPERIMENTAL FEATURE\n" .. "  - Async operations that have not finished (e.g. fs.readFile).\n" .. "  - Timers not properly mocked (e.g. setInterval, setTimeout).\n" .. "  - Keeping references to the global scope.";
                        return v46(v56, {
                            message = v58, 
                            stack = l_Error_0.new(v58).stack
                        });
                    end;
                else
                    return v8.resolve();
                end;
            end);
        end;
        v46 = function(v59, v60)
            return v8.resolve():andThen(function()
                if not v44:isInterrupted() then
                    local v61 = l_buildFailureTestResult_0(v59.path, v60);
                    v61.failureMessage = l_formatExecError_0(v61.testExecError, v59.context.config, v42._globalConfig, v59.path);
                    l_addResult_0(v53, v61);
                    v42._dispatcher:onTestFileResult(v59, v61, v53):expect();
                    return ;
                else
                    return ;
                end;
            end);
        end;
        v47 = function()
            return v8.resolve():andThen(function()
                l_Array_0.forEach(v8.all(l_Array_0.map(l_Array_0.from(v50), function(v62)
                    return v8.resolve():andThen(function()
                        return {
                            v62
                        };
                    end);
                end)):expect(), function(_)
                    local v64 = {
                        filesRemoved = 0, 
                        filesRemovedList = {}
                    };
                    local l_snapshot_0 = v53.snapshot;
                    l_snapshot_0.filesRemoved = l_snapshot_0.filesRemoved + v64.filesRemoved;
                    v53.snapshot.filesRemovedList = l_Array_0.concat(if v53.snapshot.filesRemovedList ~= nil then v53.snapshot.filesRemovedList else {}, v64.filesRemovedList);
                end);
                local v66 = v42._globalConfig.updateSnapshot == "all";
                v53.snapshot.didUpdate = v66;
                local l_snapshot_1 = v53.snapshot;
                local v68 = not v66;
                if v68 then
                    v68 = true;
                    if v53.snapshot.unchecked <= 0 then
                        v68 = true;
                        if v53.snapshot.unmatched <= 0 then
                            v68 = v53.snapshot.filesRemoved > 0;
                        end;
                    end;
                end;
                l_snapshot_1.failure = v68;
            end);
        end;
        v42._dispatcher:onRunStart(v53, {
            estimatedTime = v54, 
            showStatus = not l_Boolean_0.toJSBoolean(v55)
        }):expect();
        local v69 = {};
        local v70 = l_WeakMap_0.new();
        v8.all(l_Array_0.map(l_Array_0.from(v50), function(v71)
            return v8.resolve():andThen(function()
                local l_config_0 = v71.config;
                if not l_Boolean_0.toJSBoolean(v69[l_config_0.runner]) then
                    local v73 = require(l_Parent_0.JestRunner).default.new(v42._globalConfig, {
                        changedFiles = v42._context.changedFiles, 
                        sourcesRelatedToTestsInChangedFiles = v42._context.sourcesRelatedToTestsInChangedFiles
                    });
                    v69[l_config_0.runner] = v73;
                    v70:set(v73, v71);
                end;
            end);
        end)):expect();
        local v74 = v42:_partitionTests(v69, v43);
        if v74 ~= nil then
            local l_status_0, l_result_0 = pcall(function()
                for _, v76 in l_Object_0.keys(v69) do
                    local v77 = v69[v76];
                    local v78 = v70:get(v77);
                    v29(v78);
                    local v79 = v74[v76];
                    local v80 = {
                        serial = v55 or l_Boolean_0.toJSBoolean(v77.isSerial)
                    };
                    if not v77.__PRIVATE_UNSTABLE_API_supportsEventEmitters__ then
                        v77:runTests(v79, v44, v48, v45, v46, v80):expect();
                    else
                        local v91 = {
                            v77:on("test-file-start", function(v81)
                                return v48(v81[1]);
                            end), 
                            v77:on("test-file-success", function(v82)
                                local v83, v84 = table.unpack(v82, 1, 2);
                                return v45(v83, v84);
                            end), 
                            v77:on("test-file-failure", function(v85)
                                local v86, v87 = table.unpack(v85, 1, 2);
                                return v46(v86, v87);
                            end), 
                            v77:on("test-case-result", function(v88)
                                local v89, v90 = table.unpack(v88, 1, 2);
                                v42._dispatcher:onTestCaseResult({
                                    context = v78, 
                                    path = v89.Name, 
                                    script = v89
                                }, v90);
                            end)
                        };
                        v77:runTests(v79, v44, nil, nil, nil, v80):expect();
                        l_Array_0.forEach(v91, function(v92)
                            return v92();
                        end);
                    end;
                    v77:cleanup();
                end;
            end);
            if not (l_status_0 or v44:isInterrupted()) then
                error(l_result_0);
            end;
        end;
        v47():expect();
        v53.wasInterrupted = v44:isInterrupted();
        v42._dispatcher:onRunComplete(v50, v53):expect();
        local v95 = false;
        if v53.numFailedTests == 0 then
            v95 = v53.numRuntimeErrorTestSuites == 0;
        end;
        v53.success = (not v95 or v53.snapshot.failure) or v42._dispatcher:hasErrors();
        return v53;
    end);
end;
v28._partitionTests = function(_, v97, v98)
    if #l_Object_0.keys(v97) > 1 then
        return l_Array_0.reduce(v98, function(v99, v100)
            local l_runner_0 = v100.context.config.runner;
            if not l_Boolean_0.toJSBoolean(v99[l_runner_0]) then
                v99[l_runner_0] = {};
            end;
            table.insert(v99[l_runner_0], v100);
            return v99;
        end, {});
    elseif #v98 > 0 and v98[1] ~= nil then
        return l_Object_0.assign({}, {
            [v98[1].context.config.runner] = v98
        });
    else
        return nil;
    end;
end;
v28._shouldAddDefaultReporters = function(v102, v103)
    local v104 = true;
    if v103 ~= nil then
        v104 = l_Boolean_0.toJSBoolean(l_Array_0.find(v103, function(v105)
            return v102:_getReporterProps(v105).path == "default";
        end));
    end;
    return v104;
end;
v28._setupReporters = function(v106)
    return v8.resolve():andThen(function()
        if v106:_shouldAddDefaultReporters(nil) then
            v106:_setupDefaultReporters(false);
        end;
    end);
end;
v28._setupDefaultReporters = function(v107, _)
    v107:addReporter(if not v107._globalConfig.verbose then l_DefaultReporter_0.new(v107._globalConfig) else l_VerboseReporter_0.new(v107._globalConfig));
    v107:addReporter(l_SummaryReporter_0.new(v107._globalConfig));
end;
v28._getReporterProps = function(v109, v110)
    if typeof(v110) == "string" then
        return {
            options = v109._options, 
            path = v110
        };
    elseif not l_Array_0.isArray(v110) then
        error(l_Error_0.new("Reporter should be either a string or an array"));
        return ;
    else
        return {
            options = v110[2], 
            path = v110[1]
        };
    end;
end;
v28._bailIfNeeded = function(v111, v112, v113, v114)
    return v8.resolve():andThen(function()
        if v111._globalConfig.bail ~= 0 and v111._globalConfig.bail <= v113.numFailedTests then
            if not v114:isWatchMode() then
                local l_status_1, l_result_1 = pcall(function()
                    v111._dispatcher:onRunComplete(v112, v113):expect();
                end);
                l_exit_0(v111._globalConfig.testFailureExitCode);
                if not l_status_1 then
                    error(l_result_1);
                end;
            else
                v114:setState({
                    interrupted = true
                }):expect();
                return ;
            end;
        end;
    end);
end;
v29 = function(v117, v118)
    if not l_Boolean_0.toJSBoolean(v117) then
        error(l_Error_0.new(v118));
    end;
end;
v30 = function(v119)
    local v120 = l_makeEmptyAggregatedTestResult_0();
    v120.numTotalTestSuites = v119;
    v120.startTime = DateTime.now().UnixTimestampMillis;
    v120.success = false;
    return v120;
end;
v31 = function(v121, v122)
    if #v121 == 0 then
        return 0;
    else
        local v123 = math.max(table.unpack(v121));
        if #v121 <= v122 then
            return v123;
        else
            return (math.max(l_Array_0.reduce(v121, function(v124, v125)
                return v124 + v125;
            end) / v122, v123));
        end;
    end;
end;
return v9;
