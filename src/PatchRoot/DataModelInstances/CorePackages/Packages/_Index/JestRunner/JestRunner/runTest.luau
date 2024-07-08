local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_console_0 = v1.console;
local l_setTimeout_0 = v1.setTimeout;
local v4 = require(l_Parent_0.Promise);
local l_getRelativePath_0 = require(l_Parent_0.RobloxShared).getRelativePath;
local v6 = {};
local v7 = require(l_Parent_0.ChalkLua);
local v8 = require(l_Parent_0.JestConsole);
local l_BufferedConsole_0 = v8.BufferedConsole;
local l_CustomConsole_0 = v8.CustomConsole;
local l_NullConsole_0 = v8.NullConsole;
local l_getConsoleOutput_0 = v8.getConsoleOutput;
local _ = require(l_Parent_0.JestEnvironment);
local _ = require(l_Parent_0.JestTestResult);
local _ = require(l_Parent_0.JestTypes);
local v16 = require(l_Parent_0.JestUtil);
local l_ErrorWithStack_0 = v16.ErrorWithStack;
local l_setGlobal_0 = v16.setGlobal;
local _ = require(script.Parent.types);
local l_Writeable_0 = require(l_Parent_0.RobloxShared).Writeable;
local _ = function(v21, _)
    local function v23(_, _, v26)
        local _ = l_ErrorWithStack_0.new(("%s\nAttempted to log \"%s\"."):format(v7.red(("%s Did you forget to wait for something async in your test?"):format(v7.bold("Cannot log after tests are done."))), v26), v23);
    end;
    v21._log = v23;
end;
local _ = function(v29, v30, v31, _, _, v34, v35)
    return v4.resolve():andThen(function()
        local l_testEnvironment_0 = v31.testEnvironment;
        local v37 = require(l_testEnvironment_0);
        local l_runner_0 = require(l_Parent_0.JestCircus).runner;
        local v39 = require(l_Parent_0.JestRuntime);
        local v40 = l_Writeable_0.new();
        local function v43(v41, v42)
            return l_getConsoleOutput_0(l_BufferedConsole_0.write({}, v41, v42, 4), v31, v30);
        end;
        local v44 = nil;
        v44 = if not v30.silent then if v30.verbose then l_CustomConsole_0.new(v40, v40, v43) else l_BufferedConsole_0.new() else l_NullConsole_0.new(v40, v40, v43);
        local v45 = v37.new(v31, {
            console = v44, 
            testPath = v29
        });
        if typeof(v45.getVmContext) ~= "function" then
            l_console_0.error(("Test environment found at \"%s\" does not export a \"getVmContext\" method, which is mandatory from Jest 27. This method is a replacement for \"runScript\"."):format((tostring(l_testEnvironment_0))));
            error(1);
        end;
        l_setGlobal_0(v45.global, "console", v44);
        local v46 = v39.new(v35);
        local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
        for _, v49 in v31.setupFiles, nil, nil do
            v46:requireModule(v49);
        end;
        local l_status_1, l_result_1 = pcall(function()
            v45:setup():expect();
            local v50 = nil;
            local l_status_0, l_result_0 = pcall(function()
                v50 = l_runner_0(v30, v31, v45, v46, v29, v34):expect();
            end);
            if not l_status_0 then
                local _ = l_result_0.stack;
            end;
            if not l_status_0 then
                error(l_result_0);
            end;
            local l_v44_0 = v44;
            local l_v31_0 = v31;
            local function v56(_, _, v59)
                local _ = l_ErrorWithStack_0.new(("%s\nAttempted to log \"%s\"."):format(v7.red(("%s Did you forget to wait for something async in your test?"):format(v7.bold("Cannot log after tests are done."))), v59), v56);
            end;
            l_v44_0._log = v56;
            l_v44_0 = ((v50.numPassingTests + v50.numFailingTests) + v50.numPendingTests) + v50.numTodoTests;
            l_v31_0 = DateTime.now().UnixTimestampMillis;
            v56 = l_v31_0 - l_UnixTimestampMillis_0;
            v50.perfStats = {
                ["end"] = l_v31_0, 
                runtime = v56, 
                slow = v31.slowTestThreshold < v56 / 1000, 
                start = l_UnixTimestampMillis_0
            };
            v50.testFilePath = l_getRelativePath_0(v29, v31.rootDir);
            v50.console = v44:getBuffer();
            v50.skipped = l_v44_0 == v50.numPendingTests;
            v50.displayName = v31.displayName;
            return v4.new(function(v61)
                l_setTimeout_0(function()
                    return v61({
                        leakDetector = nil, 
                        result = v50
                    });
                end);
            end);
        end);
        v46:teardown();
        v45:teardown():expect();
        if not l_status_1 then
            error(l_result_1);
        end;
        return l_result_1;
    end);
end;
v6.default = function(v65, v66, v67, v68, v69, v70, v71)
    return v4.resolve():andThen(function()
        local l_v65_0 = v65;
        local l_v66_0 = v66;
        local l_v67_0 = v67;
        local _ = v68;
        local _ = v69;
        local l_v70_0 = v70;
        local l_v71_0 = v71;
        local l_l_v66_0_0 = l_v66_0 --[[ copy: 2 -> 8 ]];
        local l_l_v65_0_0 = l_v65_0 --[[ copy: 1 -> 9 ]];
        local v109 = v4.resolve():andThen(function()
            local l_testEnvironment_1 = l_v67_0.testEnvironment;
            local v82 = require(l_testEnvironment_1);
            local l_runner_1 = require(l_Parent_0.JestCircus).runner;
            local v84 = require(l_Parent_0.JestRuntime);
            local v85 = l_Writeable_0.new();
            local function v88(v86, v87)
                return l_getConsoleOutput_0(l_BufferedConsole_0.write({}, v86, v87, 4), l_v67_0, l_l_v66_0_0);
            end;
            local v89 = nil;
            v89 = if not l_l_v66_0_0.silent then if l_l_v66_0_0.verbose then l_CustomConsole_0.new(v85, v85, v88) else l_BufferedConsole_0.new() else l_NullConsole_0.new(v85, v85, v88);
            local v90 = v82.new(l_v67_0, {
                console = v89, 
                testPath = l_l_v65_0_0
            });
            if typeof(v90.getVmContext) ~= "function" then
                l_console_0.error(("Test environment found at \"%s\" does not export a \"getVmContext\" method, which is mandatory from Jest 27. This method is a replacement for \"runScript\"."):format((tostring(l_testEnvironment_1))));
                error(1);
            end;
            l_setGlobal_0(v90.global, "console", v89);
            local v91 = v84.new(l_v71_0);
            local l_UnixTimestampMillis_1 = DateTime.now().UnixTimestampMillis;
            for _, v94 in l_v67_0.setupFiles, nil, nil do
                v91:requireModule(v94);
            end;
            local l_status_3, l_result_3 = pcall(function()
                v90:setup():expect();
                local v95 = nil;
                local l_status_2, l_result_2 = pcall(function()
                    v95 = l_runner_1(l_l_v66_0_0, l_v67_0, v90, v91, l_l_v65_0_0, l_v70_0):expect();
                end);
                if not l_status_2 then
                    local _ = l_result_2.stack;
                end;
                if not l_status_2 then
                    error(l_result_2);
                end;
                local l_v89_0 = v89;
                local l_l_v67_0_0 = l_v67_0;
                local function v101(_, _, v104)
                    local _ = l_ErrorWithStack_0.new(("%s\nAttempted to log \"%s\"."):format(v7.red(("%s Did you forget to wait for something async in your test?"):format(v7.bold("Cannot log after tests are done."))), v104), v101);
                end;
                l_v89_0._log = v101;
                l_v89_0 = ((v95.numPassingTests + v95.numFailingTests) + v95.numPendingTests) + v95.numTodoTests;
                l_l_v67_0_0 = DateTime.now().UnixTimestampMillis;
                v101 = l_l_v67_0_0 - l_UnixTimestampMillis_1;
                v95.perfStats = {
                    ["end"] = l_l_v67_0_0, 
                    runtime = v101, 
                    slow = l_v67_0.slowTestThreshold < v101 / 1000, 
                    start = l_UnixTimestampMillis_1
                };
                v95.testFilePath = l_getRelativePath_0(l_l_v65_0_0, l_v67_0.rootDir);
                v95.console = v89:getBuffer();
                v95.skipped = l_v89_0 == v95.numPendingTests;
                v95.displayName = l_v67_0.displayName;
                return v4.new(function(v106)
                    l_setTimeout_0(function()
                        return v106({
                            leakDetector = nil, 
                            result = v95
                        });
                    end);
                end);
            end);
            v91:teardown();
            v90:teardown():expect();
            if not l_status_3 then
                error(l_result_3);
            end;
            return l_result_3;
        end):expect();
        l_v65_0 = v109.leakDetector;
        l_v66_0 = v109.result;
        if l_v65_0 ~= nil then
            v4.new(function(v110)
                return l_setTimeout_0(v110, 100);
            end):expect();
            l_v66_0.leaks = l_v65_0:isLeaking():expect();
            return l_v66_0;
        else
            l_v66_0.leaks = false;
            return l_v66_0;
        end;
    end);
end;
return v6;
