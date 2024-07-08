local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local v5 = {};
local v6 = require(l_Parent_1.ChalkLua);
local _ = require(l_Parent_1.JestTestResult);
local _ = require(l_Parent_1.JestTypes);
local v9 = require(l_Parent_1.JestUtil);
local l_formatTime_0 = v9.formatTime;
local l_ICONS_0 = v9.ICONS;
local l_default_0 = require(l_Parent_0.DefaultReporter).default;
local _ = require(l_Parent_0.types);
local _ = require(l_Parent_1.RobloxShared);
local v15 = setmetatable({}, {
    __index = l_default_0
});
v15.__index = v15;
v15.filename = "VerboseReporter";
local function _(v16)
    return math.floor(v16 * 1 + 0.5) / 1;
end;
v15.new = function(v18)
    local v19 = setmetatable(l_default_0.new(v18), v15);
    v19._globalConfig = v18;
    return v19;
end;
v15.__wrapStdio = function(v20, v21)
    local l_write_0 = v21.write;
    v21.write = function(_, v24)
        v20:__clearStatus();
        l_write_0(v21, v24);
        v20:__printStatus();
        return true;
    end;
end;
v15.filterTestResults = function(v25)
    return l_Array_0.filter(v25, function(v26)
        return v26.status ~= "pending";
    end);
end;
v15.groupTestsBySuites = function(v27)
    local v28 = {
        suites = {}, 
        tests = {}, 
        title = ""
    };
    l_Array_0.forEach(v27, function(v29)
        local l_v28_0 = v28;
        for _, v32 in ipairs(v29.ancestorTitles) do
            local v34 = l_Array_0.find(l_v28_0.suites, function(v33)
                return v33.title == v32;
            end);
            if v34 == nil then
                v34 = {
                    suites = {}, 
                    tests = {}, 
                    title = v32
                };
                table.insert(l_v28_0.suites, v34);
            end;
            l_v28_0 = v34;
        end;
        table.insert(l_v28_0.tests, v29);
    end);
    return v28;
end;
v15.onTestResult = function(v35, v36, v37, v38)
    l_default_0.testFinished(v35, v36.context.config, v37, v38);
    if not l_Boolean_0.toJSBoolean(v37.skipped) then
        v35:printTestFileHeader(v37.testFilePath, v36.context.config, v37);
        if not (l_Boolean_0.toJSBoolean(v37.testExecError) or l_Boolean_0.toJSBoolean(v37.skipped)) then
            v35:_logTestResults(v37.testResults);
        end;
        v35:printTestFileFailureMessage(v37.testFilePath, v36.context.config, v37);
    end;
    l_default_0.forceFlushBufferedOutput(v35);
end;
v15._logTestResults = function(v39, v40)
    v39:_logSuite(v15.groupTestsBySuites(v40), 0);
    v39:_logLine();
end;
v15._logSuite = function(v41, v42, v43)
    if l_Boolean_0.toJSBoolean(v42.title) then
        v41:_logLine(v42.title, v43);
    end;
    v41:_logTests(v42.tests, v43 + 1);
    l_Array_0.forEach(v42.suites, function(v44)
        v41:_logSuite(v44, v43 + 1);
    end);
end;
v15._getIcon = function(_, v46)
    if v46 == "failed" then
        return v6.red(l_ICONS_0.failed);
    elseif v46 == "pending" then
        return v6.yellow(l_ICONS_0.pending);
    elseif v46 == "todo" then
        return v6.magenta(l_ICONS_0.todo);
    else
        return v6.green(l_ICONS_0.success);
    end;
end;
v15._logTest = function(v47, v48, v49)
    v47:_logLine(v47:_getIcon(v48.status) .. " " .. v6.dim(v48.title .. if v48.duration ~= nil then (" (%s)"):format((tostring(l_formatTime_0(math.floor(v48.duration * 1 + 0.5) / 1)))) else ""), v49);
end;
v15._logTests = function(v50, v51, v52)
    if not l_Boolean_0.toJSBoolean(v50._globalConfig.expand) then
        local v55 = l_Array_0.reduce(v51, function(v53, v54)
            if v54.status == "pending" then
                table.insert(v53.pending, v54);
                return v53;
            elseif v54.status == "todo" then
                table.insert(v53.todo, v54);
                return v53;
            else
                v50:_logTest(v54, v52);
                return v53;
            end;
        end, {
            pending = {}, 
            todo = {}
        });
        if #v55.pending > 0 then
            l_Array_0.forEach(v55.pending, v50:_logTodoOrPendingTest(v52));
        end;
        if #v55.todo > 0 then
            l_Array_0.forEach(v55.todo, v50:_logTodoOrPendingTest(v52));
        end;
        return ;
    else
        l_Array_0.forEach(v51, function(v56)
            return v50:_logTest(v56, v52);
        end);
        return ;
    end;
end;
v15._logTodoOrPendingTest = function(v57, v58)
    return function(v59)
        v57:_logLine(("%s %s"):format(v57:_getIcon(v59.status), (v6.dim(("%s %s"):format(v59.status == "pending" and "skipped" or v59.status, v59.title)))), v58);
    end;
end;
v15._logLine = function(v60, v61, v62)
    v60:log(("  "):rep(not not l_Boolean_0.toJSBoolean(v62) and v62 or 0) .. (v61 or ""));
end;
v5.default = v15;
return v5;
