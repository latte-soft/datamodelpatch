local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Set_0 = v2.Set;
local v6 = {};
local v7 = require(l_Parent_1.ChalkLua);
local _ = require(l_Parent_1.JestTestResult);
local _ = require(l_Parent_1.JestTypes);
local l_default_0 = require(l_Parent_0.BaseReporter).default;
local l_default_1 = require(l_Parent_0.getResultHeader).default;
local l_default_2 = require(l_Parent_0.getSnapshotSummary).default;
local _ = require(l_Parent_0.types);
local l_getSummary_0 = require(l_Parent_0.utils).getSummary;
local v15 = l_Set_0.new({
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
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = setmetatable({}, {
    __index = l_default_0
});
v19.__index = v19;
v19.filename = "SummaryReporter";
v19.new = function(v20, v21)
    local v22 = setmetatable(l_default_0.new(v21), v19);
    if v21 then
        v18 = v21.env.npm_lifecycle_script;
        v17 = v21.env.npm_lifecycle_event;
        v16 = v21.env.npm_config_user_agent;
    end;
    v22._globalConfig = v20;
    v22._estimatedTime = 0;
    return v22;
end;
v19._write = function(v23, v24)
    v23._process.stderr:write(v24);
end;
v19.onRunStart = function(v25, v26, v27)
    l_default_0.onRunStart(v25, v26, v27);
    v25._estimatedTime = v27.estimatedTime;
end;
v19.onRunComplete = function(v28, v29, v30)
    local l_numTotalTestSuites_0 = v30.numTotalTestSuites;
    local l_testResults_0 = v30.testResults;
    local l_wasInterrupted_0 = v30.wasInterrupted;
    if l_Boolean_0.toJSBoolean(l_numTotalTestSuites_0) then
        local v34 = l_testResults_0[#l_testResults_0];
        if not (((not l_Boolean_0.toJSBoolean(v28._globalConfig.verbose) or not l_Boolean_0.toJSBoolean(v34)) or l_Boolean_0.toJSBoolean(v34.numFailingTests)) or l_Boolean_0.toJSBoolean(v34.testExecError)) then
            v28:log("");
        end;
        v28:_printSummary(v30, v28._globalConfig);
        v28:_printSnapshotSummary(v30.snapshot, v28._globalConfig);
        if l_Boolean_0.toJSBoolean(l_numTotalTestSuites_0) then
            local v35 = l_getSummary_0(v30, {
                estimatedTime = v28._estimatedTime
            });
            if not l_Boolean_0.toJSBoolean(v28._globalConfig.silent) then
                v35 = v35 .. "\n" .. if not l_Boolean_0.toJSBoolean(l_wasInterrupted_0) then v28:_getTestSummary(v29, v28._globalConfig) else v7.bold(v7.red("Test run was interrupted."));
            end;
            v28:log(v35);
        end;
    end;
end;
v19._printSnapshotSummary = function(v36, v37, v38)
    if not (not (((l_Boolean_0.toJSBoolean(v37.added) or l_Boolean_0.toJSBoolean(v37.filesRemoved)) or l_Boolean_0.toJSBoolean(v37.unchecked)) or l_Boolean_0.toJSBoolean(v37.unmatched)) and not l_Boolean_0.toJSBoolean(v37.updated)) then
        local _ = nil;
        local v40 = not not l_Boolean_0.toJSBoolean(v17) and v17 or "";
        local v41 = not l_Boolean_0.toJSBoolean(v15:has(v40)) and "run " or "";
        local v42 = false;
        if typeof(v16) == "string" then
            v42 = string.match(v16 or "", "yarn") ~= nil;
        end;
        local v43 = not l_Boolean_0.toJSBoolean(v42) and "npm" or "yarn";
        local v44 = false;
        if typeof(v18) == "string" then
            v44 = l_Boolean_0.toJSBoolean(string.match(v18 or "", "jest"));
        end;
        l_Array_0.forEach(l_default_2(v37, v38, if not not l_Boolean_0.toJSBoolean(v40) and v44 then ("run `%s -u`"):format(v43 .. " " .. v41 .. v40 .. (not v42 and " --" or "")) else "re-run jest with `-u`"), function(v45)
            v36:log(v45);
        end);
        v36:log("");
    end;
end;
v19._printSummary = function(v46, v47, v48)
    if (v47.numFailedTests or 0) + (v47.numRuntimeErrorTestSuites or 0) > 0 and v47.numTotalTestSuites > 20 then
        v46:log(v7.bold("Summary of all failing tests"));
        l_Array_0.forEach(v47.testResults, function(v49)
            local l_failureMessage_0 = v49.failureMessage;
            if l_Boolean_0.toJSBoolean(l_failureMessage_0) then
                v46:_write(l_default_1(v49, v48) .. "\n" .. l_failureMessage_0 .. "\n");
            end;
        end);
        v46:log("");
    end;
end;
v19._getTestSummary = function(_, v52, v53)
    local function _()
        return v7.dim(" matching");
    end;
    local v55 = "";
    if not v53.runTestsByPath then
        if l_Boolean_0.toJSBoolean(v53.testPathPattern) then
            v55 = v7.dim(" matching");
        end;
    else
        v55 = v7.dim(" within paths");
    end;
    local v56 = "";
    if not v53.runTestsByPath then
        if v53.testNamePattern ~= nil then
            v56 = v7.dim(" with tests matching ") .. ("\"%s\""):format(v53.testNamePattern);
        end;
    else
        v56 = " " .. l_Array_0.join(l_Array_0.map(v53.nonFlagArgs, function(v57)
            return ("\"%s\""):format(v57);
        end), ", ");
    end;
    return v7.dim("Ran all test suites") .. v55 .. v56 .. if v52.size > 1 then v7.dim(" in ") .. tostring(v52.size) .. v7.dim(" projects") else "" .. v7.dim(".");
end;
v6.default = v19;
return v6;
