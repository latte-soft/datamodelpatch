local v0 = require(script.Parent.TestPlanner);
local v1 = require(script.Parent.TestRunner);
local v2 = require(script.Parent.Reporters.TextReporter);
local v3 = {};
local function _(v4)
    return (v4:gsub("%.spec$", ""));
end;
local function _(v6)
    return v6:IsA("ModuleScript") and v6.Name:match("%.spec$");
end;
local function v12(v8, v9)
    v9 = v9 or game;
    local v10 = {};
    local l_v8_0 = v8;
    if l_v8_0.Name == "init.spec" then
        l_v8_0 = l_v8_0.Parent;
    end;
    while l_v8_0 ~= nil and l_v8_0 ~= v9 do
        table.insert(v10, (l_v8_0.Name:gsub("%.spec$", "")));
        l_v8_0 = l_v8_0.Parent;
    end;
    table.insert(v10, (v9.Name:gsub("%.spec$", "")));
    return v10;
end;
local _ = function(v13)
    local v14 = "";
    local v15 = true;
    for _, v17 in ipairs(v13) do
        if not v15 then
            v14 = v17 .. " " .. v14;
        else
            v14 = v17;
            v15 = false;
        end;
    end;
    return v14;
end;
v3.getModulesImpl = function(_, v20, v21, v22)
    v21 = v21 or {};
    v22 = v22 or v20;
    local l_v22_0 = v22;
    if l_v22_0:IsA("ModuleScript") and l_v22_0.Name:match("%.spec$") then
        local v24 = require(v22);
        l_v22_0 = v12(v22, v20);
        local v25 = "";
        local v26 = true;
        for _, v28 in ipairs(l_v22_0) do
            if not v26 then
                v25 = v28 .. " " .. v25;
            else
                v25 = v28;
                v26 = false;
            end;
        end;
        table.insert(v21, {
            instance = v22, 
            method = v24, 
            path = l_v22_0, 
            pathStringForSorting = v25:lower()
        });
    end;
end;
v3.getModules = function(v29, v30)
    local v31 = {};
    v29:getModulesImpl(v30, v31);
    for _, v33 in ipairs(v30:GetDescendants()) do
        v29:getModulesImpl(v30, v31, v33);
    end;
    return v31;
end;
v3.run = function(v34, v35, v36, v37)
    v36 = v36 or v2;
    v37 = v37 or {};
    local v38 = v37.showTimingInfo or false;
    local v39 = {};
    local l_TESTEZ_TEST_NAME_PATTERN_0 = _G.TESTEZ_TEST_NAME_PATTERN;
    local l_TESTEZ_TEST_PATH_PATTERN_0 = _G.TESTEZ_TEST_PATH_PATTERN;
    local l_TESTEZ_TEST_PATH_IGNORE_PATTERNS_0 = _G.TESTEZ_TEST_PATH_IGNORE_PATTERNS;
    local v43 = v37.extraEnvironment or {};
    for v44 in string.gmatch(_G.TESTEZ_RUN_TESTS_PATH or "", "([^,]+)") do
        table.insert(v39, v44);
    end;
    if type(v35) ~= "table" then
        error(("Bad argument #1 to TestBootstrap:run. Expected table, got %s"):format((typeof(v35))), 2);
    end;
    local v45 = tick();
    local v46 = {};
    for _, v48 in ipairs(v35) do
        for _, v50 in ipairs((v34:getModules(v48))) do
            table.insert(v46, v50);
        end;
    end;
    local v51 = tick();
    local v52 = v0.createPlan(v46, {
        runTestsByPath = v39, 
        testNamePattern = l_TESTEZ_TEST_NAME_PATTERN_0, 
        testPathPattern = l_TESTEZ_TEST_PATH_PATTERN_0, 
        testPathIgnorePatterns = l_TESTEZ_TEST_PATH_IGNORE_PATTERNS_0, 
        extraEnvironment = v43
    });
    local v53 = tick();
    local v54 = v1.runPlan(v52);
    local v55 = tick();
    v36.report(v54);
    local v56 = tick();
    if v38 then
        print(table.concat({
            ("Took %f seconds to locate test modules"):format(v51 - v45), 
            ("Took %f seconds to create test plan"):format(v53 - v51), 
            ("Took %f seconds to run tests"):format(v55 - v53), 
            ("Took %f seconds to report tests"):format(v56 - v55)
        }, "\n"));
    end;
    return v54;
end;
return v3;
