local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_String_0 = v2.String;
local l_setTimeout_0 = v2.setTimeout;
local l_setInterval_0 = v2.setInterval;
local l_clearInterval_0 = v2.clearInterval;
local v9 = {};
local v10 = require(l_Parent_1.ChalkLua);
local l_len_0 = utf8.len;
local _ = require(l_Parent_1.JestTestResult);
local _ = require(l_Parent_1.JestTypes);
local _ = require(l_Parent_0.types);
local v15 = require(l_Parent_0.utils);
local l_getSummary_0 = v15.getSummary;
local l_printDisplayName_0 = v15.printDisplayName;
local l_trimAndFormatPath_0 = v15.trimAndFormatPath;
local l_wrapAnsiString_0 = v15.wrapAnsiString;
local v20 = v10.reset(v10.inverse(v10.yellow(v10.bold(" RUNS ")))) .. " ";
local v21 = {};
v21.__index = v21;
v21.new = function()
    local v22 = setmetatable({}, v21);
    v22._array = {};
    return v22;
end;
v21.add = function(v23, v24, v25)
    local v26 = l_Array_0.indexOf(v23._array, nil);
    local v27 = {
        config = v25, 
        testPath = v24
    };
    if v26 ~= -1 then
        v23._array[v26] = v27;
        return ;
    else
        table.insert(v23._array, v27);
        return ;
    end;
end;
v21.delete = function(v28, v29)
    local v32 = l_Array_0.find(v28._array, function(v30)
        local v31 = false;
        if v30 ~= nil then
            v31 = v30.testPath == v29;
        end;
        return v31;
    end);
    v28._array[l_Array_0.indexOf(v28._array, not not l_Boolean_0.toJSBoolean(v32) and v32 or nil)] = nil;
end;
v21.get = function(v33)
    return v33._array;
end;
local v34 = {};
v34.__index = v34;
v34.new = function()
    local v35 = setmetatable({}, v34);
    v35._cache = nil;
    v35._currentTests = v21.new();
    v35._currentTestCases = {};
    v35._done = false;
    v35._emitScheduled = false;
    v35._estimatedTime = 0;
    v35._showStatus = false;
    return v35;
end;
v34.onChange = function(v36, v37)
    v36._callback = v37;
end;
v34.runStarted = function(v38, v39, v40)
    v38._estimatedTime = if not not l_Boolean_0.toJSBoolean(v40) and l_Boolean_0.toJSBoolean(v40.estimatedTime) then v40.estimatedTime else 0;
    v38._showStatus = if not l_Boolean_0.toJSBoolean(v40) then v40 else v40.showStatus;
    v38._interval = l_setInterval_0(function()
        return v38:_tick();
    end, 1000);
    v38._aggregatedResults = v39;
    v38:_debouncedEmit();
end;
v34.runFinished = function(v41)
    v41._done = true;
    if l_Boolean_0.toJSBoolean(v41._interval) then
        l_clearInterval_0(v41._interval);
    end;
    v41:_emit();
end;
v34.addTestCaseResult = function(v42, v43, v44)
    table.insert(v42._currentTestCases, {
        test = v43, 
        testCaseResult = v44
    });
    if l_Boolean_0.toJSBoolean(v42._showStatus) then
        v42:_debouncedEmit();
        return ;
    else
        v42:_emit();
        return ;
    end;
end;
v34.testStarted = function(v45, v46, v47)
    v45._currentTests:add(v46, v47);
    if v45._showStatus then
        v45:_debouncedEmit();
        return ;
    else
        v45:_emit();
        return ;
    end;
end;
v34.testFinished = function(v48, v49, v50, v51)
    local l_testFilePath_0 = v50.testFilePath;
    v48._aggregatedResults = v51;
    v48._currentTests:delete(l_testFilePath_0);
    v48._currentTestCases = l_Array_0.filter(v48._currentTestCases, function(v53)
        local l_test_0 = v53.test;
        if v49 ~= l_test_0.context.config then
            return true;
        else
            return l_test_0.path ~= l_testFilePath_0;
        end;
    end);
    v48:_debouncedEmit();
end;
v34.get = function(v55)
    if not l_Boolean_0.toJSBoolean(v55._cache) then
        if not l_Boolean_0.toJSBoolean(v55._done) then
            local v56 = "\n";
            l_Array_0.forEach(v55._currentTests:get(), function(v57)
                if l_Boolean_0.toJSBoolean(v57) then
                    local l_config_0 = v57.config;
                    local l_testPath_0 = v57.testPath;
                    local v60 = v20 .. (not l_Boolean_0.toJSBoolean(l_config_0.displayName) and "" or ("%s "):format((tostring(l_printDisplayName_0(l_config_0)))));
                    local v61 = l_len_0(v60);
                    assert(v61 ~= nil);
                    v56 = v56 .. l_wrapAnsiString_0(v60 .. l_trimAndFormatPath_0(v61, l_config_0, l_testPath_0, 0), 0) .. "\n";
                end;
            end);
            if not (not v55._showStatus or not l_Boolean_0.toJSBoolean(v55._aggregatedResults)) then
                v56 = v56 .. "\n" .. tostring(l_getSummary_0(v55._aggregatedResults, {
                    currentTestCases = v55._currentTestCases, 
                    estimatedTime = v55._estimatedTime, 
                    roundTime = true, 
                    width = 0
                }));
            end;
            local v62 = 0;
            local v63 = 0;
            local v64 = utf8.len(v56);
            assert(v64 ~= nil);
            while v63 < v64 do
                if l_String_0.charCodeAt(v56, v63) == "\n" then
                    v62 = v62 + 1;
                end;
                v63 = v63 + 1;
            end;
            v55._cache = {
                clear = ("\n"):rep(v62), 
                content = v56
            };
            return v55._cache;
        else
            return {
                clear = "", 
                content = ""
            };
        end;
    else
        return v55._cache;
    end;
end;
v34._emit = function(v65)
    v65._cache = nil;
    if l_Boolean_0.toJSBoolean(v65._callback) then
        v65:_callback();
    end;
end;
v34._debouncedEmit = function(v66)
    if not l_Boolean_0.toJSBoolean(v66._emitScheduled) then
        v66._emitScheduled = true;
        l_setTimeout_0(function()
            v66:_emit();
            v66._emitScheduled = false;
        end, 100);
    end;
end;
v34._tick = function(v67)
    v67:_debouncedEmit();
end;
v9.default = v34;
return v9;
