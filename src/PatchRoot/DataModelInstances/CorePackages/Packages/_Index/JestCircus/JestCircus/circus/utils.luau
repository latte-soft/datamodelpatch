local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local v5 = require(l_Parent_0.Promise);
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = require(l_Parent_0.RegExp);
local function v16(v12)
    if v12 then
        local l_v12_0 = v12;
        local v14 = "";
        local v15 = v11("^(\\s*LoadedCode.*:\\d+)?(: )?(.*)$"):exec(v12);
        if v15 then
            l_v12_0 = v15[4];
            v14 = v15[2];
        end;
        return {
            message = l_v12_0, 
            stack = v14
        };
    else
        return {
            message = "", 
            stack = ""
        };
    end;
end;
local v17 = {};
local l_dedent_0 = require(l_Parent_0.RobloxShared).dedent;
local _ = require(l_Parent_0.JestTestResult);
local _ = require(l_Parent_0.JestTypes);
local v21 = require(l_Parent_0.JestUtil);
local l_ErrorWithStack_0 = v21.ErrorWithStack;
local l_convertDescriptorToString_0 = v21.convertDescriptorToString;
local l_formatTime_0 = v21.formatTime;
local l_format_0 = require(l_Parent_0.PrettyFormat).format;
local v26 = require(script.Parent.state_);
local l_ROOT_DESCRIBE_BLOCK_NAME_0 = v26.ROOT_DESCRIBE_BLOCK_NAME;
local l_getState_0 = v26.getState;
local function _(v29)
    return debug.info(v29, "a") > 1;
end;
local _ = function(_)
    return false;
end;
v17.makeDescribe = function(v33, v34, v35)
    local l_v35_0 = v35;
    if not (not (v34 ~= nil) or l_Boolean_0.toJSBoolean(v35)) then
        l_v35_0 = v34.mode;
    end;
    return {
        type = "describeBlock", 
        children = {}, 
        hooks = {}, 
        mode = l_v35_0, 
        name = l_convertDescriptorToString_0(v33), 
        parent = v34, 
        tests = {}
    };
end;
v17.makeTest = function(v37, v38, v39, v40, v41, v42)
    return {
        type = "test", 
        asyncError = v42, 
        duration = nil, 
        errors = {}, 
        fn = v37, 
        invocations = 0, 
        mode = v38, 
        name = l_convertDescriptorToString_0(v39), 
        parent = v40, 
        retryReasons = {}, 
        seenDone = false, 
        startedAt = nil, 
        status = nil, 
        timeout = v41
    };
end;
local function v43(v44)
    local v45 = l_getState_0();
    local l_hasFocusedTests_0 = v45.hasFocusedTests;
    local l_testNamePattern_0 = v45.testNamePattern;
    return l_Array_0.some(v44.children, function(v48)
        if v48.type == "describeBlock" then
            return (v43(v48));
        else
            local v49 = true;
            if v48.mode ~= "skip" then
                if l_hasFocusedTests_0 then
                    v49 = true;
                    if not (v48.mode == "only") then
                        goto label0;
                    end;
                end;
                v49 = l_testNamePattern_0 and not l_testNamePattern_0:test(v7(v48));
            end;
            ::label0::;
            return not v49;
        end;
    end);
end;
v17.getAllHooksForDescribe = function(v50)
    local v51 = {
        afterAll = {}, 
        beforeAll = {}
    };
    local v52 = l_getState_0();
    local l_hasFocusedTests_1 = v52.hasFocusedTests;
    local l_testNamePattern_1 = v52.testNamePattern;
    local l_l_testNamePattern_1_0 = l_testNamePattern_1 --[[ copy: 5 -> 7 ]];
    if l_Array_0.some(v50.children, function(v56)
        if v56.type == "describeBlock" then
            return (v43(v56));
        else
            local v57 = true;
            if v56.mode ~= "skip" then
                if l_hasFocusedTests_1 then
                    v57 = true;
                    if not (v56.mode == "only") then
                        goto label1;
                    end;
                end;
                v57 = l_l_testNamePattern_1_0 and not l_l_testNamePattern_1_0:test(v7(v56));
            end;
            ::label1::;
            return not v57;
        end;
    end) then
        for _, v59 in ipairs(v50.hooks) do
            if v59.type == "beforeAll" then
                table.insert(v51.beforeAll, v59);
            elseif v59.type == "afterAll" then
                table.insert(v51.afterAll, v59);
            end;
        end;
    end;
    return v51;
end;
v17.getEachHooksForTest = function(v60)
    local v61 = {
        afterEach = {}, 
        beforeEach = {}
    };
    local l_parent_0 = v60.parent;
    while true do
        local v63 = {};
        local v64 = nil;
        for _, v66 in ipairs(l_parent_0.hooks) do
            v64 = v66;
            if v64.type == "beforeEach" then
                table.insert(v63, v64);
            elseif v64.type == "afterEach" then
                table.insert(v61.afterEach, v64);
            end;
        end;
        v61.beforeEach = l_Array_0.concat({}, v63, v61.beforeEach);
        l_parent_0 = l_parent_0.parent;
        if not l_Boolean_0.toJSBoolean(l_parent_0) then
            break;
        end;
    end;
    return v61;
end;
local function v67(v68)
    return l_Array_0.some(v68.children, function(v69)
        local v70 = true;
        if v69.type ~= "test" then
            v70 = v67(v69);
        end;
        return v70;
    end);
end;
v17.describeBlockHasTests = v67;
local function v73(v71, v72)
    return ("Exceeded timeout of %s for a %s.\nUse jest.setTimeout(newTimeout) to increase the timeout value, if this is a long-running test."):format(l_formatTime_0(v71), not v72 and "test" or "hook");
end;
local l_setTimeout_0 = v1.setTimeout;
local l_clearTimeout_0 = v1.clearTimeout;
local function _(v76)
    return (l_Boolean_0.toJSBoolean(v76) and l_Boolean_0.toJSBoolean(v76.message)) and l_Boolean_0.toJSBoolean(v76.stack);
end;
v17.callAsyncCircusFn = function(v78, v79, v80)
    local l_isHook_0 = v80.isHook;
    local l_timeout_0 = v80.timeout;
    local v83 = nil;
    local v84 = false;
    local l_fn_0 = v78.fn;
    local l_asyncError_0 = v78.asyncError;
    return v5.new(function(v87, v88)
        v83 = l_setTimeout_0(function()
            return v88(v73(l_timeout_0, l_isHook_0));
        end, l_timeout_0);
        if not (debug.info(l_fn_0, "a") > 1) then
            local v89 = nil;
            local l_l_fn_0_0 = l_fn_0;
            if not false then
                local v91;
                v91, l_l_fn_0_0 = pcall(l_fn_0, v79);
                if v91 then
                    v89 = l_l_fn_0_0;
                else
                    v88(l_l_fn_0_0);
                    return ;
                end;
            else
                error("Generator functions are not supported in Lua");
            end;
            if (typeof(v89) == "table" and v89 ~= nil) and typeof(v89.andThen) == "function" then
                v89:andThen(function()
                    return v87();
                end, v88);
                return ;
            elseif not l_isHook_0 and v89 ~= nil then
                v88((l_dedent_0(("\ntest functions can only return Promise or undefined.\n      Returned value: %s\n      "):format(l_format_0(v89, {
                    maxDepth = 3
                })))));
                return ;
            else
                v87();
                return ;
            end;
        else
            local v92 = nil;
            local function v93(v94)
                local v95 = l_ErrorWithStack_0.new(nil, v93);
                if v84 or not v78.seenDone then
                    v78.seenDone = true;
                else
                    v95.message = "Expected done to be called once, but it was called multiple times.";
                    if l_Boolean_0.toJSBoolean(v94) then
                        v95.message = v95.message .. " Reason: " .. l_format_0(v94, {
                            maxDepth = 3
                        });
                    end;
                    v88(v95);
                    error(v95);
                end;
                v5.delay(0):andThen(function()
                    if v92 ~= nil then
                        l_asyncError_0.message = l_dedent_0(("\n      Test functions cannot both take a 'done' callback and return something. Either use a 'done' callback, or return a promise.\n      Returned value: %s\n      "):format(l_format_0(v92, {
                            maxDepth = 3
                        })));
                        return v88(l_asyncError_0);
                    else
                        local v96 = nil;
                        local l_v94_0 = v94;
                        if not ((l_Boolean_0.toJSBoolean(l_v94_0) and l_Boolean_0.toJSBoolean(l_v94_0.message)) and l_Boolean_0.toJSBoolean(l_v94_0.stack)) then
                            v96 = v95;
                            v95.message = ("Failed: %s"):format(l_format_0(v94, {
                                maxDepth = 3
                            }));
                        else
                            v96 = v94;
                        end;
                        if not (not v84 or not l_Boolean_0.toJSBoolean(v94)) then
                            v96.message = "Caught error after test environment was torn down\n\n" .. v96.message;
                            error(v96);
                        end;
                        if not l_Boolean_0.toJSBoolean(v94) then
                            return (v87());
                        else
                            return (v88(v96));
                        end;
                    end;
                end);
            end;
            v92 = l_fn_0(v79, v93);
            return ;
        end;
    end):andThen(function()
        v84 = true;
        l_clearTimeout_0(v83);
    end):catch(function(v98)
        v84 = true;
        l_clearTimeout_0(v83);
        if typeof(v98) == "string" then
            local v99 = v16(v98);
            local v100 = l_Error_0.new(v99.message);
            v100.__stack = v99.stack;
            l_Error_0.__recalculateStacktrace(v100);
            error(v100);
        end;
        error(v98);
    end);
end;
v17.getTestDuration = function(v101)
    local l_startedAt_0 = v101.startedAt;
    if typeof(l_startedAt_0) == "number" then
        return DateTime.now().UnixTimestampMillis - l_startedAt_0;
    else
        return nil;
    end;
end;
v17.makeRunResult = function(v103, v104)
    return {
        testResults = v6(v103), 
        unhandledErrors = l_Array_0.map(l_Array_0.map(v104, v8), v9)
    };
end;
local function v111(v105)
    local _ = l_getState_0().includeTestLocationInResult;
    local v107 = {};
    local l_v105_0 = v105;
    local l_status_0 = v105.status;
    v10(l_status_0, "Status should be present after tests are run.");
    while true do
        table.insert(v107, 1, l_v105_0.name);
        l_v105_0 = l_v105_0.parent;
        if not (l_v105_0 ~= nil) then
            break;
        end;
    end;
    local v110 = l_Array_0.map(v105.errors, v8);
    return {
        duration = v105.duration, 
        errors = l_Array_0.map(v110, v9), 
        errorsDetailed = v110, 
        invocations = v105.invocations, 
        location = nil, 
        retryReasons = l_Array_0.map(l_Array_0.map(v105.retryReasons, v8), v9), 
        status = l_status_0, 
        testPath = l_Array_0.from(v107)
    };
end;
v17.makeSingleTestResult = v111;
v6 = function(v112)
    local v113 = {};
    for _, v115 in ipairs(v112.children) do
        if v115.type == "describeBlock" then
            v113 = l_Array_0.concat(v113, v6(v115));
        elseif v115.type == "test" then
            table.insert(v113, (v111(v115)));
        end;
    end;
    return v113;
end;
v7 = function(v116)
    local v117 = {};
    local l_v116_0 = v116;
    while true do
        table.insert(v117, 1, l_v116_0.name);
        l_v116_0 = l_v116_0.parent;
        if not (l_v116_0 ~= nil) then
            break;
        end;
    end;
    table.remove(v117, 1);
    return l_Array_0.join(v117, " ");
end;
v17.getTestID = v7;
v8 = function(v119)
    local v120 = nil;
    local v121 = nil;
    if not l_Array_0.isArray(v119) then
        v120 = v119;
        v121 = l_Error_0.new();
    else
        v120 = v119[1];
        v121 = v119[2];
    end;
    if not (v120 ~= nil) or typeof(v120.stack) ~= "string" and not l_Boolean_0.toJSBoolean(v120.message) then
        v121.message = ("thrown: %s"):format(l_format_0(v120, {
            maxDepth = 3
        }));
        return v121;
    else
        return v120;
    end;
end;
v9 = function(v122)
    if typeof(v122.stack) == "string" then
        if not string.find(v122.stack, v122.message, nil, true) then
            return v122.message .. "\n" .. v122.stack;
        else
            return v122.stack;
        end;
    else
        return v122.message;
    end;
end;
local function v123(v124, v125, v126)
    for _, v128 in ipairs(v124.children) do
        if v128.type == "describeBlock" then
            v123(v128, v125, v126);
        elseif v128.type == "test" then
            table.insert(v128.errors, {
                v125, 
                v126
            });
        end;
    end;
end;
v17.addErrorToEachTestUnderDescribe = v123;
v10 = function(v129, v130)
    if not l_Boolean_0.toJSBoolean(v129) then
        error(l_Error_0.new(v130));
    end;
end;
v17.invariant = v10;
v17.parseSingleTestResult = function(v131)
    local v132 = nil;
    v132 = v131.status == "skip" and "pending" or (v131.status == "todo" and "todo" or (#v131.errors > 0 and "failed" or "passed"));
    local v134 = l_Array_0.filter(v131.testPath, function(v133)
        return v133 ~= l_ROOT_DESCRIBE_BLOCK_NAME_0;
    end);
    local v135 = table.remove(v134);
    return {
        ancestorTitles = v134, 
        duration = v131.duration, 
        failureDetails = v131.errorsDetailed, 
        failureMessages = l_Array_0.from(v131.errors), 
        fullName = if not l_Boolean_0.toJSBoolean(v135) then l_Array_0.join(v134, " ") else l_Array_0.join(l_Array_0.concat(v134, v135), " "), 
        invocations = v131.invocations, 
        location = v131.location, 
        numPassingAsserts = 0, 
        retryReasons = l_Array_0.from(v131.retryReasons), 
        status = v132, 
        title = v131.testPath[#v131.testPath]
    };
end;
return v17;
