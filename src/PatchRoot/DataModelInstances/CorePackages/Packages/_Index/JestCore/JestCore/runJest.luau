local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local l_console_0 = v1.console;
local v6 = require(l_Parent_0.Promise);
local v7 = {};
local l_CustomConsole_0 = require(l_Parent_0.JestConsole).CustomConsole;
local v9 = require(l_Parent_0.JestTestResult);
local l_formatTestResults_0 = v9.formatTestResults;
local l_makeEmptyAggregatedTestResult_0 = v9.makeEmptyAggregatedTestResult;
local _ = require(l_Parent_0.JestTypes);
local _ = require(l_Parent_0.JestRuntime);
local l_default_0 = require(script.Parent.SearchSource).default;
local l_createTestScheduler_0 = require(script.Parent.TestScheduler).createTestScheduler;
local _ = require(script.Parent.TestWatcher);
local l_default_1 = require(script.Parent.getNoTestsFoundMessage).default;
local _ = require(script.Parent.types);
local l_nodeUtils_0 = require(l_Parent_0.RobloxShared).nodeUtils;
local l_process_0 = l_nodeUtils_0.process;
local l_exit_0 = l_nodeUtils_0.exit;
local l_JSON_0 = l_nodeUtils_0.JSON;
local _ = function(v23, v24, _, v26, _, v28)
    return v6.resolve():andThen(function()
        local v29 = v24:getTestPaths(v23, v26, v28):expect();
        local v31 = v6.all(l_Array_0.map(v29.tests, function(_)
            return v6.resolve(true);
        end)):expect();
        local v34 = l_Array_0.filter(v29.tests, function(_, v33)
            return v31[v33];
        end);
        return l_Object_0.assign({}, v29, {
            allTests = #v34, 
            tests = v34
        });
    end);
end;
local _ = function(v36, v37)
    return v6.resolve():andThen(function()
        local _ = v37.outputFile;
        local l_json_0 = v37.json;
        local l_onComplete_0 = v37.onComplete;
        v36.openHandles = {};
        if l_json_0 then
            l_process_0.stdout:write(l_JSON_0.stringify(l_formatTestResults_0(v36)));
        end;
        if l_onComplete_0 ~= nil then
            l_onComplete_0(v36);
        end;
    end);
end;
local v42 = {
    firstRun = true, 
    previousSuccess = true
};
v7.default = function(v43)
    local l_contexts_0 = v43.contexts;
    local l_globalConfig_0 = v43.globalConfig;
    local l_outputStream_0 = v43.outputStream;
    local l_testWatcher_0 = v43.testWatcher;
    local _ = nil;
    local l_startRun_0 = v43.startRun;
    local _ = v43.changedFilesPromise;
    local l_onComplete_1 = v43.onComplete;
    local _ = v43.failedTestsCache;
    local l_filter_0 = v43.filter;
    return v6.resolve():andThen(function()
        local v54 = {};
        local v56 = l_Array_0.map(l_contexts_0, function(v55)
            return l_default_0.new(v55);
        end);
        local v72 = v6.all(l_Array_0.map(l_contexts_0, function(v57, v58)
            return v6.resolve():andThen(function()
                local v59 = v56[v58];
                local l_l_globalConfig_0_0 = l_globalConfig_0;
                local _ = l_outputStream_0;
                local l_l_filter_0_0 = l_filter_0;
                local v63 = v6.resolve();
                local v64 = nil;
                local v71 = v63:andThen(function()
                    local v65 = v59:getTestPaths(l_l_globalConfig_0_0, v64, l_l_filter_0_0):expect();
                    local v67 = v6.all(l_Array_0.map(v65.tests, function(_)
                        return v6.resolve(true);
                    end)):expect();
                    local v70 = l_Array_0.filter(v65.tests, function(_, v69)
                        return v67[v69];
                    end);
                    return l_Object_0.assign({}, v65, {
                        allTests = #v70, 
                        tests = v70
                    });
                end):expect();
                v54 = l_Array_0.concat(v54, v71.tests);
                return {
                    context = v57, 
                    matches = v71
                };
            end);
        end)):expect();
        if not l_globalConfig_0.listTests then
            if #v54 > 0 then
                if (#v54 == 1 and l_globalConfig_0.silent ~= true) and l_globalConfig_0.verbose ~= false then
                    l_globalConfig_0 = l_Object_0.freeze((l_Object_0.assign({}, l_globalConfig_0, {
                        verbose = true
                    })));
                end;
            else
                local v73 = l_default_1(v72, l_globalConfig_0);
                if not l_globalConfig_0.passWithNoTests then
                    l_CustomConsole_0.new(l_outputStream_0, l_outputStream_0):error(v73);
                    l_exit_0(1);
                else
                    l_CustomConsole_0.new(l_outputStream_0, l_outputStream_0):log(v73);
                end;
            end;
            local v74 = l_createTestScheduler_0(l_globalConfig_0, l_Object_0.assign({}, {
                startRun = l_startRun_0
            }, v42)):expect():scheduleTests(v54, l_testWatcher_0):expect();
            local v75 = {
                collectHandles = nil, 
                json = l_globalConfig_0.json, 
                onComplete = l_onComplete_1, 
                outputFile = l_globalConfig_0.outputFile, 
                outputStream = l_outputStream_0
            };
            v6.resolve():andThen(function()
                local _ = v75.outputFile;
                local l_json_1 = v75.json;
                local l_onComplete_2 = v75.onComplete;
                v74.openHandles = {};
                if l_json_1 then
                    l_process_0.stdout:write(l_JSON_0.stringify(l_formatTestResults_0(v74)));
                end;
                if l_onComplete_2 ~= nil then
                    l_onComplete_2(v74);
                end;
            end):expect();
            return ;
        else
            local v80 = l_Array_0.from(l_Set_0.new(l_Array_0.map(v54, function(v79)
                return v79.path;
            end)));
            if not l_globalConfig_0.json then
                l_console_0.log(l_Array_0.join(v80, "\n"));
            else
                l_console_0.log(l_JSON_0.stringify(v80));
            end;
            if l_onComplete_1 ~= nil then
                l_onComplete_1(l_makeEmptyAggregatedTestResult_0());
            end;
            return ;
        end;
    end);
end;
return v7;
