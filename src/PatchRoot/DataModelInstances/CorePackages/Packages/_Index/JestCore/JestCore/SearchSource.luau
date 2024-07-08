local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_Parent_0.RegExp);
local v6 = {};
local _ = require(l_Parent_0.JestTestResult);
local _ = require(l_Parent_0.JestTypes);
local _ = require(l_Parent_0.JestRuntime);
local v10 = require(l_Parent_0.JestUtil);
local l_globsToMatcher_0 = v10.globsToMatcher;
local l_testPathPatternToRegExp_0 = v10.testPathPatternToRegExp;
local _ = require(script.Parent.types);
local _ = require(l_Parent_0.JestTypes);
local l_getRelativePath_0 = require(l_Parent_0.RobloxShared).getRelativePath;
local function v19(v16)
    return l_Array_0.map(l_Array_0.filter(v16.config.rootDir:GetDescendants(), function(v17)
        return v17:isA("ModuleScript");
    end), function(v18)
        return {
            path = l_getRelativePath_0(v18, v16.config.rootDir), 
            script = v18
        };
    end);
end;
local function _(v20)
    local v22 = l_Array_0.map(v20, function(v21)
        return v5(v21);
    end);
    return function(v23)
        return l_Array_0.some(v22, function(v24)
            local v25 = v24:test(v23);
            v24.lastIndex = 0;
            return v25;
        end);
    end;
end;
local function _(v27, v28)
    return l_Array_0.map(v28, function(v29)
        return {
            context = v27, 
            duration = nil, 
            path = v29.path, 
            script = v29.script
        };
    end);
end;
local v31 = {};
v31.__index = v31;
v31.new = function(v32)
    local v33 = setmetatable({}, v31);
    v33._testPathCases = {};
    local l_config_0 = v32.config;
    v33._context = v32;
    v33._dependencyResolver = nil;
    if #l_config_0.testMatch > 0 then
        table.insert(v33._testPathCases, {
            isMatch = l_globsToMatcher_0(l_config_0.testMatch), 
            stat = "testMatch"
        });
    end;
    if #l_config_0.testPathIgnorePatterns > 0 then
        local v35 = v5(l_Array_0.join(l_config_0.testPathIgnorePatterns, "|"));
        table.insert(v33._testPathCases, {
            isMatch = function(v36)
                return not v35:test(v36);
            end, 
            stat = "testPathIgnorePatterns"
        });
    end;
    if #l_config_0.testRegex > 0 then
        local l__testPathCases_0 = v33._testPathCases;
        local v38 = {};
        local v40 = l_Array_0.map(l_config_0.testRegex, function(v39)
            return v5(v39);
        end);
        v38.isMatch = function(v41)
            return l_Array_0.some(v40, function(v42)
                local v43 = v42:test(v41);
                v42.lastIndex = 0;
                return v43;
            end);
        end;
        v38.stat = "testRegex";
        table.insert(l__testPathCases_0, v38);
    end;
    return v33;
end;
v31._filterTestPathsWithStats = function(v44, v45, v46)
    local v47 = {
        stats = {
            roots = 0, 
            testMatch = 0, 
            testPathIgnorePatterns = 0, 
            testRegex = 0
        }, 
        tests = {}, 
        total = #v45
    };
    local v48 = l_Array_0.from(v44._testPathCases);
    if not (not (v46 ~= nil) or not l_Boolean_0.toJSBoolean(v46)) then
        local v49 = l_testPathPatternToRegExp_0(v46);
        table.insert(v48, {
            isMatch = function(v50)
                return v49:test(v50);
            end, 
            stat = "testPathPattern"
        });
        v47.stats.testPathPattern = 0;
    end;
    v47.tests = l_Array_0.filter(v45, function(v51)
        local v52 = true;
        for _, v54 in v48, nil, nil do
            local l_isMatch_0 = v54.isMatch;
            local l_stat_0 = v54.stat;
            if not l_isMatch_0(v51.path) then
                v52 = false;
            else
                v47.stats[l_stat_0] = v47.stats[l_stat_0] or 0;
                local l_stats_0 = v47.stats;
                l_stats_0[l_stat_0] = l_stats_0[l_stat_0] + 1;
            end;
        end;
        return v52;
    end);
    return v47;
end;
v31._getAllTestPaths = function(v58, v59)
    local l__context_0 = v58._context;
    return v58:_filterTestPathsWithStats(l_Array_0.map(v19(v58._context), function(v61)
        return {
            context = l__context_0, 
            duration = nil, 
            path = v61.path, 
            script = v61.script
        };
    end), v59);
end;
v31.isTestFilePath = function(v62, v63)
    return l_Array_0.every(v62._testPathCases, function(v64)
        return v64.isMatch(v63);
    end);
end;
v31.findMatchingTests = function(v65, v66)
    return v65:_getAllTestPaths(v66);
end;
v31._getTestPaths = function(v67, v68, _)
    return v4.resolve():andThen(function()
        if v68.testPathPattern ~= nil then
            return v67:findMatchingTests(v68.testPathPattern);
        else
            return {
                tests = {}
            };
        end;
    end);
end;
v31.getTestPaths = function(v70, v71, v72, _)
    return v4.resolve():andThen(function()
        return (v70:_getTestPaths(v71, v72):expect());
    end);
end;
v6.default = v31;
return v6;
