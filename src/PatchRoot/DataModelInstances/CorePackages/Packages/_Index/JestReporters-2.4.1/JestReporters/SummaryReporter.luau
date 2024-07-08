local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Set_0 = v2.Set;
local l_String_0 = v2.String;
local v7 = {};
local v8 = require(l_Parent_1.ChalkLua);
local _ = require(l_Parent_1.JestTestResult);
local _ = require(l_Parent_1.JestTypes);
local l_default_0 = require(l_Parent_0.BaseReporter).default;
local l_default_1 = require(l_Parent_0.getResultHeader).default;
local l_default_2 = require(l_Parent_0.getSnapshotSummary).default;
local _ = require(l_Parent_0.types);
local l_getSummary_0 = require(l_Parent_0.utils).getSummary;
local v16 = l_Set_0.new({
    "prepublish", 
    "publish", 
    "postpublish", 
    "preinstall", 
    "install", 
    "postinstall", 
    "preuninstall", 
    "uninstall", 
    "postuninstall", 
    "preversion", 
    "version", 
    "postversion", 
    "pretest", 
    "test", 
    "posttest", 
    "prestop", 
    "stop", 
    "poststop", 
    "prestart", 
    "start", 
    "poststart", 
    "prerestart", 
    "restart", 
    "postrestart"
});
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = setmetatable({}, {
    __index = l_default_0
});
v20.__index = v20;
v20.filename = "SummaryReporter";
v20.new = function(v21, v22)
    local v23 = setmetatable(l_default_0.new(v22), v20);
    if v22 then
        v19 = v22.env.npm_lifecycle_script;
        v18 = v22.env.npm_lifecycle_event;
        v17 = v22.env.npm_config_user_agent;
    end;
    v23._globalConfig = v21;
    v23._estimatedTime = 0;
    return v23;
end;
v20._write = function(v24, v25)
    local v26 = 1;
    local v27 = utf8.len(v25);
    assert(v27 ~= nil);
    while v26 < v27 do
        v24._process.stderr:write(l_String_0.charCodeAt(v25, v26));
        v26 = v26 + 1;
    end;
end;
v20.onRunStart = function(v28, v29, v30)
    l_default_0.onRunStart(v28, v29, v30);
    v28._estimatedTime = v30.estimatedTime;
end;
v20.onRunComplete = function(v31, v32, v33)
    local l_numTotalTestSuites_0 = v33.numTotalTestSuites;
    local l_testResults_0 = v33.testResults;
    local l_wasInterrupted_0 = v33.wasInterrupted;
    if l_Boolean_0.toJSBoolean(l_numTotalTestSuites_0) then
        local v37 = l_testResults_0[#l_testResults_0];
        if not (((not l_Boolean_0.toJSBoolean(v31._globalConfig.verbose) or not l_Boolean_0.toJSBoolean(v37)) or l_Boolean_0.toJSBoolean(v37.numFailingTests)) or l_Boolean_0.toJSBoolean(v37.testExecError)) then
            v31:log("");
        end;
        v31:_printSummary(v33, v31._globalConfig);
        v31:_printSnapshotSummary(v33.snapshot, v31._globalConfig);
        if l_Boolean_0.toJSBoolean(l_numTotalTestSuites_0) then
            local v38 = l_getSummary_0(v33, {
                estimatedTime = v31._estimatedTime
            });
            if not l_Boolean_0.toJSBoolean(v31._globalConfig.silent) then
                v38 = v38 .. "\n" .. if not l_Boolean_0.toJSBoolean(l_wasInterrupted_0) then v31:_getTestSummary(v32, v31._globalConfig) else v8.bold(v8.red("Test run was interrupted."));
            end;
            v31:log(v38);
        end;
    end;
end;
v20._printSnapshotSummary = function(v39, v40, v41)
    if not (not (((l_Boolean_0.toJSBoolean(v40.added) or l_Boolean_0.toJSBoolean(v40.filesRemoved)) or l_Boolean_0.toJSBoolean(v40.unchecked)) or l_Boolean_0.toJSBoolean(v40.unmatched)) and not l_Boolean_0.toJSBoolean(v40.updated)) then
        local _ = nil;
        local v43 = not not l_Boolean_0.toJSBoolean(v18) and v18 or "";
        local v44 = not l_Boolean_0.toJSBoolean(v16:has(v43)) and "run " or "";
        local v45 = false;
        if typeof(v17) == "string" then
            v45 = string.match(v17 or "", "yarn") ~= nil;
        end;
        local v46 = not l_Boolean_0.toJSBoolean(v45) and "npm" or "yarn";
        local v47 = false;
        if typeof(v19) == "string" then
            v47 = l_Boolean_0.toJSBoolean(string.match(v19 or "", "jest"));
        end;
        l_Array_0.forEach(l_default_2(v40, v41, (v41.watch or v41.watchAll) and "press `u`" or if l_Boolean_0.toJSBoolean(v43) and v47 then ("run `%s -u`"):format(v46 .. " " .. v44 .. v43 .. (not v45 and " --" or "")) else "re-run jest with `-u`"), function(v48)
            v39:log(v48);
        end);
        v39:log("");
    end;
end;
v20._printSummary = function(v49, v50, v51)
    if (v50.numFailedTests or 0) + (v50.numRuntimeErrorTestSuites or 0) > 0 and v50.numTotalTestSuites > 20 then
        v49:log(v8.bold("Summary of all failing tests"));
        l_Array_0.forEach(v50.testResults, function(v52)
            local l_failureMessage_0 = v52.failureMessage;
            if l_Boolean_0.toJSBoolean(l_failureMessage_0) then
                v49:_write(l_default_1(v52, v51) .. "\n" .. l_failureMessage_0 .. "\n");
            end;
        end);
        v49:log("");
    end;
end;
v20._getTestSummary = function(_, v55, v56)
    local function _()
        return v8.dim(not l_Boolean_0.toJSBoolean(v56.findRelatedTests) and " matching " or " related to files matching ");
    end;
    local v58 = "";
    if not v56.runTestsByPath then
        if not l_Boolean_0.toJSBoolean(v56.onlyChanged) then
            if l_Boolean_0.toJSBoolean(v56.testPathPattern) then
                v58 = v8.dim(not l_Boolean_0.toJSBoolean(v56.findRelatedTests) and " matching " or " related to files matching ");
            end;
        else
            v58 = v8.dim(" related to changed files");
        end;
    else
        v58 = v8.dim(" within paths");
    end;
    local v59 = "";
    if not v56.runTestsByPath then
        if v56.testNamePattern ~= nil then
            v59 = v8.dim(" with tests matching ") .. ("\"%s\""):format(v56.testNamePattern);
        end;
    else
        v59 = " " .. l_Array_0.join(l_Array_0.map(v56.nonFlagArgs, function(v60)
            return ("\"%s\""):format(v60);
        end), ", ");
    end;
    return v8.dim("Ran all test suites") .. v58 .. v59 .. if v55.size > 1 then v8.dim(" in ") .. tostring(v55.size) .. v8.dim(" projects") else "" .. v8.dim(".");
end;
v7.default = v20;
return v7;
