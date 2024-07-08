local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = require(l_Parent_0.Promise);
local v6 = {};
local l_default_0 = require(l_Parent_0.Throat).default;
local _ = require(l_Parent_0.JestEnvironment);
local l_createEmptyTestResult_0 = require(l_Parent_0.JestTestResult).createEmptyTestResult;
local _ = require(l_Parent_0.JestTypes);
local v11 = require(l_Parent_0.Expect);
local l_extractExpectedAssertionsErrors_0 = v11.extractExpectedAssertionsErrors;
local l_getState_0 = v11.getState;
local l_setState_0 = v11.setState;
local l_bind_0 = require(l_Parent_0.JestEach).bind;
local v16 = require(l_Parent_0.JestMessageUtil);
local l_formatExecError_0 = v16.formatExecError;
local l_formatResultsErrors_0 = v16.formatResultsErrors;
local v19 = require(l_Parent_0.JestSnapshot);
local l_SnapshotState_0 = v19.SnapshotState;
local l_addSerializer_0 = v19.addSerializer;
local l_buildSnapshotResolver_0 = v19.buildSnapshotResolver;
local l_default_1 = require(script.Parent.Parent).default;
local l_default_2 = require(script.Parent.Parent.run).default;
local v25 = require(script.Parent.Parent.state);
local l_ROOT_DESCRIBE_BLOCK_NAME_0 = v25.ROOT_DESCRIBE_BLOCK_NAME;
local l_addEventHandler_0 = v25.addEventHandler;
local l_dispatch_0 = v25.dispatch;
local l_getState_1 = v25.getState;
local l_default_3 = require(script.Parent.Parent.testCaseReportHandler).default;
local l_getTestID_0 = require(script.Parent.Parent.utils).getTestID;
local l_default_4 = require(script.Parent.jestExpect).default;
local l_getRelativePath_0 = require(l_Parent_0.RobloxShared).getRelativePath;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
v6.initialize = function(v38)
    local l_config_0 = v38.config;
    local l_environment_0 = v38.environment;
    local l_globalConfig_0 = v38.globalConfig;
    local l_localRequire_0 = v38.localRequire;
    local l_parentProcess_0 = v38.parentProcess;
    local l_sendMessageToJest_0 = v38.sendMessageToJest;
    local l_setGlobalsForRuntime_0 = v38.setGlobalsForRuntime;
    local l_testPath_0 = v38.testPath;
    return v5.resolve():andThen(function()
        if l_globalConfig_0.testTimeout ~= nil and l_globalConfig_0.testTimeout > 0 then
            l_getState_1().testTimeout = l_globalConfig_0.testTimeout;
        end;
        local v47 = l_default_0(l_globalConfig_0.maxConcurrency);
        local v48 = l_Object_0.assign({}, l_default_1, {
            fdescribe = l_default_1.describe.only, 
            fit = l_default_1.it.only, 
            xdescribe = l_default_1.describe.skip, 
            xit = l_default_1.it.skip, 
            xtest = l_default_1.it.skip
        });
        v48.test.concurrent = (function(v49)
            local function v54(v50, v51, v52)
                local v53 = v47(function()
                    return v51();
                end);
                v53:catch(function()
                end);
                v48.test(v50, function()
                    return v53;
                end, v52);
            end;
            local v59 = setmetatable({}, {
                __call = function(_, v56, v57, v58)
                    v54(v56, v57, v58);
                end
            });
            local function v64(v60, v61, v62)
                local v63 = v47(function()
                    return v61();
                end);
                v49.only(v60, function()
                    return v63;
                end, v62);
            end;
            local v69 = setmetatable({}, {
                __call = function(_, v66, v67, v68)
                    return v64(v66, v67, v68);
                end
            });
            v59.only = v69;
            v59.skip = v49.skip;
            v59.each = l_bind_0(v49, false);
            v59.skip.each = l_bind_0(v49.skip, false);
            v69.each = l_bind_0(v49.only, false);
            return v59;
        end)(v48.test);
        l_addEventHandler_0(v35);
        if l_environment_0.handleTestEvent ~= nil then
            local l_handleTestEvent_0 = l_environment_0.handleTestEvent;
            local l_l_handleTestEvent_0_0 = l_handleTestEvent_0 --[[ copy: 2 -> 8 ]];
            l_addEventHandler_0(function(...)
                return l_l_handleTestEvent_0_0(l_environment_0, ...);
            end);
        end;
        local v72 = l_Object_0.assign({}, v48, {
            expect = l_default_4(l_globalConfig_0)
        });
        v72.expectExtended = v72.expect;
        l_setGlobalsForRuntime_0(v72);
        if l_config_0.injectGlobals then
            l_Object_0.assign(l_environment_0.global, v72);
        end;
        l_dispatch_0({
            name = "setup", 
            parentProcess = l_parentProcess_0, 
            runtimeGlobals = v72, 
            testNamePattern = l_globalConfig_0.testNamePattern
        }):expect();
        if l_config_0.testLocationInResults then
            l_dispatch_0({
                name = "include_test_location_in_result"
            }):expect();
        end;
        l_Array_0.forEach(l_Array_0.reverse(l_Array_0.concat(l_config_0.snapshotSerializers)), function(v73)
            return l_addSerializer_0(l_localRequire_0(v73));
        end);
        local v74 = l_SnapshotState_0.new(l_buildSnapshotResolver_0(l_config_0, l_localRequire_0):expect():resolveSnapshotPath(l_testPath_0), {
            expand = l_globalConfig_0.expand, 
            snapshotFormat = l_config_0.snapshotFormat, 
            updateSnapshot = l_globalConfig_0.updateSnapshot
        });
        l_setState_0({
            snapshotState = v74, 
            testPath = l_testPath_0
        });
        l_addEventHandler_0(v34(v74));
        if l_sendMessageToJest_0 ~= nil then
            l_addEventHandler_0(l_default_3(l_getRelativePath_0(l_testPath_0), l_sendMessageToJest_0));
        end;
        return {
            globals = v48, 
            snapshotState = v74
        };
    end);
end;
v6.runAndTransformResultsToJestFormat = function(v75)
    local l_config_1 = v75.config;
    local l_globalConfig_1 = v75.globalConfig;
    local l_testPath_1 = v75.testPath;
    return v5.resolve():andThen(function()
        local v79 = v5.resolve(l_default_2()):expect();
        local v80 = 0;
        local v81 = 0;
        local v82 = 0;
        local v83 = 0;
        local v89 = l_Array_0.map(v79.testResults, function(v84)
            local v85 = nil;
            if v84.status == "skip" then
                v85 = "pending";
                v82 = v82 + 1;
            elseif v84.status == "todo" then
                v85 = "todo";
                v83 = v83 + 1;
            elseif #v84.errors ~= 0 then
                v85 = "failed";
                v80 = v80 + 1;
            else
                v85 = "passed";
                v81 = v81 + 1;
            end;
            local v87 = l_Array_0.filter(v84.testPath, function(v86)
                return v86 ~= l_ROOT_DESCRIBE_BLOCK_NAME_0;
            end);
            local v88 = table.remove(v87);
            return {
                ancestorTitles = v87, 
                duration = v84.duration, 
                failureDetails = v84.errorsDetailed, 
                failureMessages = v84.errors, 
                fullName = if not l_Boolean_0.toJSBoolean(v88) then l_Array_0.join(v87, " ") else l_Array_0.join(l_Array_0.concat(v87, v88), " "), 
                invocations = v84.invocations, 
                location = v84.location, 
                numPassingAsserts = 0, 
                retryReasons = v84.retryReasons, 
                status = v85, 
                title = v84.testPath[#v84.testPath]
            };
        end);
        local v90 = l_formatResultsErrors_0(v89, l_config_1, l_globalConfig_1, l_testPath_1);
        local v91 = nil;
        if #v79.unhandledErrors ~= 0 then
            v91 = {
                message = "", 
                stack = l_Array_0.join(v79.unhandledErrors, "\n")
            };
            v90 = (not not l_Boolean_0.toJSBoolean(v90) and v90 or "") .. "\n\n" .. l_Array_0.join(l_Array_0.map(v79.unhandledErrors, function(v92)
                return l_formatExecError_0(v92, l_config_1, l_globalConfig_1);
            end), "\n");
        end;
        l_dispatch_0({
            name = "teardown"
        }):expect();
        return l_Object_0.assign({}, l_createEmptyTestResult_0(), {
            console = l_Object_0.None, 
            displayName = l_config_1.displayName, 
            failureMessage = v90, 
            numFailingTests = v80, 
            numPassingTests = v81, 
            numPendingTests = v82, 
            numTodoTests = v83, 
            testExecError = v91, 
            testFilePath = l_testPath_1, 
            testResults = v89
        });
    end);
end;
v34 = function(v93)
    return function(_, v95)
        if v95.name == "test_retry" then
            v93:clear();
        end;
    end;
end;
v35 = function(_, v97)
    return v5.resolve():andThen(function()
        if v97.name == "test_start" then
            l_setState_0({
                currentTestName = l_getTestID_0(v97.test)
            });
            return ;
        elseif v97.name == "test_done" then
            v37(v97.test);
            v36(v97.test);
            return ;
        else
            return ;
        end;
    end);
end;
v36 = function(v98)
    v98.errors = l_Array_0.concat(v98.errors, (l_Array_0.map(l_extractExpectedAssertionsErrors_0(), function(v99)
        return v99.error;
    end)));
end;
v37 = function(v100)
    local l_suppressedErrors_0 = l_getState_0().suppressedErrors;
    l_setState_0({
        suppressedErrors = {}
    });
    if #l_suppressedErrors_0 ~= 0 then
        v100.errors = l_Array_0.concat(v100.errors, l_suppressedErrors_0);
    end;
end;
return v6;
