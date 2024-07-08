local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.JestTypes);
local v3 = nil;
local v4 = nil;
local _ = nil;
local _ = nil;
local v7 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v7.Array;
local l_Boolean_0 = v7.Boolean;
local l_Error_0 = v7.Error;
local v11 = require(l_Parent_0.RegExp);
local l_TEST_TIMEOUT_SYMBOL_0 = require(script.Parent.types).TEST_TIMEOUT_SYMBOL;
local v13 = require(script.Parent.utils);
local l_addErrorToEachTestUnderDescribe_0 = v13.addErrorToEachTestUnderDescribe;
local l_describeBlockHasTests_0 = v13.describeBlockHasTests;
local l_getTestDuration_0 = v13.getTestDuration;
local l_invariant_0 = v13.invariant;
local l_makeDescribe_0 = v13.makeDescribe;
local l_makeTest_0 = v13.makeTest;
local l_l_Error_0_0 = l_Error_0 --[[ copy: 11 -> 21 ]];
local l_l_invariant_0_0 = l_invariant_0 --[[ copy: 18 -> 22 ]];
local l_l_Boolean_0_0 = l_Boolean_0 --[[ copy: 10 -> 23 ]];
local l_l_describeBlockHasTests_0_0 = l_describeBlockHasTests_0 --[[ copy: 16 -> 24 ]];
local l_l_Array_0_0 = l_Array_0 --[[ copy: 9 -> 25 ]];
local l_l_addErrorToEachTestUnderDescribe_0_0 = l_addErrorToEachTestUnderDescribe_0 --[[ copy: 15 -> 26 ]];
local l_l_TEST_TIMEOUT_SYMBOL_0_0 = l_TEST_TIMEOUT_SYMBOL_0 --[[ copy: 13 -> 27 ]];
local l_v11_0 = v11 --[[ copy: 12 -> 28 ]];
v4 = function(_, v29, v30)
    if v29.name == "include_test_location_in_result" then
        v30.includeTestLocationInResult = true;
        return ;
    elseif v29.name == "hook_start" then
        v29.hook.seenDone = false;
        return ;
    elseif v29.name == "start_describe_definition" then
        local l_blockName_0 = v29.blockName;
        local l_mode_0 = v29.mode;
        local l_currentDescribeBlock_0 = v30.currentDescribeBlock;
        local l_currentlyRunningTest_0 = v30.currentlyRunningTest;
        if l_currentlyRunningTest_0 ~= nil then
            table.insert(l_currentlyRunningTest_0.errors, l_l_Error_0_0.new(("Cannot nest a describe inside a test. Describe block \"%s\" cannot run because it is nested within \"%s\"."):format(l_blockName_0, l_currentlyRunningTest_0.name)));
            return ;
        else
            local v35 = l_makeDescribe_0(l_blockName_0, l_currentDescribeBlock_0, l_mode_0);
            table.insert(l_currentDescribeBlock_0.children, v35);
            v30.currentDescribeBlock = v35;
            return ;
        end;
    else
        if v29.name == "finish_describe_definition" then
            local l_currentDescribeBlock_1 = v30.currentDescribeBlock;
            l_l_invariant_0_0(l_currentDescribeBlock_1, "currentDescribeBlock must be there");
            if not l_l_Boolean_0_0.toJSBoolean(l_l_describeBlockHasTests_0_0(l_currentDescribeBlock_1)) then
                l_l_Array_0_0.forEach(l_currentDescribeBlock_1.hooks, function(v37)
                    v37.asyncError.message = ("Invalid: %s() may not be used in a describe block containing no tests."):format(v37.type);
                    table.insert(v30.unhandledErrors, v37.asyncError);
                end);
            end;
            local v38 = false;
            if l_currentDescribeBlock_1.mode == "only" then
                v38 = l_l_Array_0_0.some(l_currentDescribeBlock_1.children, function(v39)
                    local v40 = false;
                    if v39.type == "test" then
                        v40 = v39.mode == "only";
                    end;
                    return v40;
                end);
            end;
            if not v38 then
                l_l_Array_0_0.forEach(l_currentDescribeBlock_1.children, function(v41)
                    if not (not (v41.type == "test") or l_l_Boolean_0_0.toJSBoolean(v41.mode)) then
                        v41.mode = l_currentDescribeBlock_1.mode;
                    end;
                end);
            end;
            if not (not (not l_l_Boolean_0_0.toJSBoolean(v30.hasFocusedTests) and l_currentDescribeBlock_1.mode ~= "skip") or not l_l_Array_0_0.some(l_currentDescribeBlock_1.children, function(v42)
                local v43 = false;
                if v42.type == "test" then
                    v43 = v42.mode == "only";
                end;
                return v43;
            end)) then
                v30.hasFocusedTests = true;
            end;
            if l_currentDescribeBlock_1.parent ~= nil then
                v30.currentDescribeBlock = l_currentDescribeBlock_1.parent;
                return ;
            end;
        elseif v29.name == "add_hook" then
            local l_currentDescribeBlock_2 = v30.currentDescribeBlock;
            local l_currentlyRunningTest_1 = v30.currentlyRunningTest;
            local l_hasStarted_0 = v30.hasStarted;
            local l_asyncError_0 = v29.asyncError;
            local l_fn_0 = v29.fn;
            local l_hookType_0 = v29.hookType;
            local l_timeout_0 = v29.timeout;
            if l_currentlyRunningTest_1 ~= nil then
                table.insert(l_currentlyRunningTest_1.errors, l_l_Error_0_0.new(("Hooks cannot be defined inside tests. Hook of type \"%s\" is nested within \"%s\"."):format(l_hookType_0, l_currentlyRunningTest_1.name)));
                return ;
            elseif not l_l_Boolean_0_0.toJSBoolean(l_hasStarted_0) then
                table.insert(l_currentDescribeBlock_2.hooks, {
                    asyncError = l_asyncError_0, 
                    fn = l_fn_0, 
                    parent = l_currentDescribeBlock_2, 
                    seenDone = false, 
                    timeout = l_timeout_0, 
                    type = l_hookType_0
                });
                return ;
            else
                table.insert(v30.unhandledErrors, l_l_Error_0_0.new("Cannot add a hook after tests have started running. Hooks must be defined synchronously."));
                return ;
            end;
        elseif v29.name == "add_test" then
            local l_currentDescribeBlock_3 = v30.currentDescribeBlock;
            local l_currentlyRunningTest_2 = v30.currentlyRunningTest;
            local l_hasStarted_1 = v30.hasStarted;
            local l_asyncError_1 = v29.asyncError;
            local l_fn_1 = v29.fn;
            local l_mode_1 = v29.mode;
            local l_testName_0 = v29.testName;
            local l_timeout_1 = v29.timeout;
            if l_currentlyRunningTest_2 ~= nil then
                table.insert(l_currentlyRunningTest_2.errors, l_l_Error_0_0.new(("Tests cannot be nested. Test \"%s\" cannot run because it is nested within \"%s\"."):format(l_testName_0, l_currentlyRunningTest_2.name)));
                return ;
            elseif not l_l_Boolean_0_0.toJSBoolean(l_hasStarted_1) then
                local v59 = l_makeTest_0(l_fn_1, l_mode_1, l_testName_0, l_currentDescribeBlock_3, l_timeout_1, l_asyncError_1);
                if l_currentDescribeBlock_3.mode ~= "skip" and v59.mode == "only" then
                    v30.hasFocusedTests = true;
                end;
                table.insert(l_currentDescribeBlock_3.children, v59);
                table.insert(l_currentDescribeBlock_3.tests, v59);
                return ;
            else
                table.insert(v30.unhandledErrors, l_l_Error_0_0.new("Cannot add a test after tests have started running. Tests must be defined synchronously."));
                return ;
            end;
        elseif v29.name == "hook_failure" then
            local l_test_0 = v29.test;
            local l_describeBlock_0 = v29.describeBlock;
            local l_error_0 = v29.error;
            local l_hook_0 = v29.hook;
            local l_asyncError_2 = l_hook_0.asyncError;
            local l_type_0 = l_hook_0.type;
            if l_type_0 == "beforeAll" then
                l_l_invariant_0_0(l_describeBlock_0, "always present for `*All` hooks");
                l_l_addErrorToEachTestUnderDescribe_0_0(l_describeBlock_0, l_error_0, l_asyncError_2);
                return ;
            elseif l_type_0 == "afterAll" then
                table.insert(v30.unhandledErrors, {
                    l_error_0, 
                    l_asyncError_2
                });
                return ;
            else
                l_l_invariant_0_0(l_test_0, "always present for `*Each` hooks");
                table.insert(l_test_0.errors, {
                    l_error_0, 
                    l_asyncError_2
                });
                return ;
            end;
        elseif v29.name == "test_skip" then
            v29.test.status = "skip";
            return ;
        elseif v29.name == "test_todo" then
            v29.test.status = "todo";
            return ;
        elseif v29.name == "test_done" then
            v29.test.duration = l_getTestDuration_0(v29.test);
            v29.test.status = "done";
            v30.currentlyRunningTest = nil;
            return ;
        elseif v29.name == "test_start" then
            v30.currentlyRunningTest = v29.test;
            v29.test.startedAt = DateTime.now().UnixTimestampMillis;
            local l_test_1 = v29.test;
            l_test_1.invocations = l_test_1.invocations + 1;
            return ;
        elseif v29.name == "test_fn_start" then
            v29.test.seenDone = false;
            return ;
        elseif v29.name == "test_fn_failure" then
            table.insert(v29.test.errors, {
                v29.error, 
                v29.test.asyncError
            });
            return ;
        elseif v29.name == "test_retry" then
            v29.test.errors = {};
            return ;
        elseif v29.name == "run_start" then
            v30.hasStarted = true;
            if l_l_Boolean_0_0.toJSBoolean(_G[l_l_TEST_TIMEOUT_SYMBOL_0_0]) then
                v30.testTimeout = _G[l_l_TEST_TIMEOUT_SYMBOL_0_0];
                return ;
            end;
        elseif v29.name == "run_finish" then
            return ;
        elseif v29.name == "setup" then
            if l_l_Boolean_0_0.toJSBoolean(v29.testNamePattern) then
                v30.testNamePattern = l_v11_0(v29.testNamePattern, "i");
                return ;
            end;
        elseif v29.name == "teardown" then
            return ;
        elseif v29.name == "error" then
            if v30.currentlyRunningTest ~= nil then
                table.insert(v30.currentlyRunningTest.errors, v29.error);
                return ;
            else
                table.insert(v30.unhandledErrors, v29.error);
                return ;
            end;
        end;
        return ;
    end;
end;
v0.eventHandler = v4;
l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
l_Boolean_0 = {
    listeners = function(_, ...)
        return {};
    end
};
l_Error_0 = nil;
l_Error_0 = function(v68)
    v3({
        error = v68, 
        name = "error"
    });
end;
local l_l_Array_0_1 = l_Array_0 --[[ copy: 9 -> 29 ]];
local l_l_Boolean_0_1 = l_Boolean_0 --[[ copy: 10 -> 30 ]];
do
    local l_l_Error_0_1 = l_Error_0;
    v0.injectGlobalErrorHandlers = function(v72)
        local v73 = l_l_Array_0_1.slice(l_l_Boolean_0_1:listeners("uncaughtException"));
        local v74 = l_l_Array_0_1.slice(l_l_Boolean_0_1:listeners("unhandledRejection"));
        v72:removeAllListeners("uncaughtException");
        v72:removeAllListeners("unhandledRejection");
        v72:on("uncaughtException", l_l_Error_0_1);
        v72:on("unhandledRejection", l_l_Error_0_1);
        return {
            uncaughtException = v73, 
            unhandledRejection = v74
        };
    end;
    v0.restoreGlobalErrorHandlers = function(v75, v76)
        v75:removeListener("uncaughtException", l_l_Error_0_1);
        v75:removeListener("unhandledRejection", l_l_Error_0_1);
        for _, v78 in ipairs(v76.uncaughtException) do
            v75:on("uncaughtException", v78);
        end;
        for _, v80 in ipairs(v76.unhandledRejection) do
            v75:on("unhandledRejection", v80);
        end;
    end;
end;
v7 = require(l_Parent_0.LuauPolyfill);
l_Array_0 = require(l_Parent_0.Promise);
l_Boolean_0 = require(script.Parent.formatNodeAssertErrors).default;
l_Error_0 = require(script.Parent.types).STATE_SYM;
v11 = require(script.Parent.utils).makeDescribe;
l_TEST_TIMEOUT_SYMBOL_0 = {
    v4, 
    l_Boolean_0
};
v13 = require(script.Parent.state_);
l_addErrorToEachTestUnderDescribe_0 = v13.ROOT_DESCRIBE_BLOCK_NAME;
v0.ROOT_DESCRIBE_BLOCK_NAME = l_addErrorToEachTestUnderDescribe_0;
l_describeBlockHasTests_0 = function()
    local v81 = v11(l_addErrorToEachTestUnderDescribe_0);
    return {
        currentDescribeBlock = v81, 
        currentlyRunningTest = nil, 
        expand = nil, 
        hasFocusedTests = false, 
        hasStarted = false, 
        includeTestLocationInResult = false, 
        parentProcess = nil, 
        rootDescribeBlock = v81, 
        testNamePattern = nil, 
        testTimeout = 5000, 
        unhandledErrors = {}
    };
end;
v0.resetState = function()
    _G[l_Error_0] = l_describeBlockHasTests_0();
end;
_G[l_Error_0] = l_describeBlockHasTests_0();
l_invariant_0 = v13.getState;
v0.getState = l_invariant_0;
v0.setState = function(v82)
    _G[l_Error_0] = v82;
    return _G[l_Error_0];
end;
v0.dispatch = function(v83)
    return l_Array_0.resolve():andThen(function()
        for _, v85 in ipairs(l_TEST_TIMEOUT_SYMBOL_0) do
            local v86 = v85(nil, v83, l_invariant_0());
            if v86 ~= nil then
                v86:expect();
            end;
        end;
    end);
end;
v3 = function(v87)
    for _, v89 in ipairs(l_TEST_TIMEOUT_SYMBOL_0) do
        v89(nil, v87, l_invariant_0());
    end;
end;
v0.dispatchSync = v3;
v0.addEventHandler = function(v90)
    table.insert(l_TEST_TIMEOUT_SYMBOL_0, v90);
end;
return v0;
