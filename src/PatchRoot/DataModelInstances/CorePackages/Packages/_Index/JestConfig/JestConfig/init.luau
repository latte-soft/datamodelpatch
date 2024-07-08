local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local v7 = require(l_Parent_0.Promise);
local v8 = {};
local v9 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local v11 = require(script.constants);
local l_default_0 = require(script.normalize).default;
local l_default_1 = require(script.readConfigFileAndSetRootDir).default;
local l_default_2 = require(script.resolveConfigPath).default;
local l_isJSONString_0 = require(script.utils).isJSONString;
v8.isJSONString = require(script.utils).isJSONString;
v8.normalize = require(script.normalize).default;
v8.defaults = require(script.Defaults).default;
v8.constants = v11;
local l_JSON_0 = require(l_Parent_0.RobloxShared).nodeUtils.JSON;
local v17 = nil;
local v18 = nil;
local function v34(v19, v20, v21, v22, _, v24, v25)
    if v24 == nil then
        v24 = math.huge;
    end;
    if v25 == nil then
        v25 = false;
    end;
    return v7.resolve():andThen(function()
        local v26 = nil;
        local v27 = nil;
        if typeof(v21) ~= "Instance" and typeof(v21) ~= "string" then
            error(l_Error_0.new("Jest: configuration as an object not supported yet"));
        elseif not l_isJSONString_0(v20.config) then
            if not v22 and typeof(v20.config) == "string" then
                v27 = l_default_2(v20.config, v19, v25);
                v26 = l_default_1(v27):expect();
            else
                v27 = l_default_2(v21, v19, v25);
                v26 = l_default_1(v27):expect();
            end;
        else
            local v28 = nil;
            do
                local l_v28_0 = v28;
                if not pcall(function()
                    l_v28_0 = l_JSON_0.parse(v20.config);
                end) then
                    error(l_Error_0.new("There was an error while parsing the `--config` argument as a JSON string."));
                end;
                l_v28_0.rootDir = not not l_Boolean_0.toJSBoolean(l_v28_0.rootDir) and l_v28_0.rootDir or v21;
                v26 = l_v28_0;
            end;
        end;
        local v30 = l_default_0(v26, v20, v27, v24):expect();
        local l_options_0 = v30.options;
        local l_hasDeprecationWarnings_0 = v30.hasDeprecationWarnings;
        local v33 = v17(l_options_0);
        return {
            configPath = v27, 
            globalConfig = v33.globalConfig, 
            hasDeprecationWarnings = l_hasDeprecationWarnings_0, 
            projectConfig = v33.projectConfig
        };
    end);
end;
v8.readConfig = v34;
v17 = function(v35)
    return {
        globalConfig = l_Object_0.freeze({
            bail = v35.bail, 
            changedSince = v35.changedSince, 
            expand = v35.expand, 
            filter = v35.filter, 
            json = v35.json, 
            listTests = v35.listTests, 
            maxConcurrency = v35.maxConcurrency, 
            maxWorkers = v35.maxWorkers, 
            noStackTrace = v35.noStackTrace, 
            nonFlagArgs = v35.nonFlagArgs, 
            outputFile = v35.outputFile, 
            passWithNoTests = v35.passWithNoTests, 
            projects = v35.projects, 
            rootDir = v35.rootDir, 
            runTestsByPath = v35.runTestsByPath, 
            silent = v35.silent, 
            skipFilter = v35.skipFilter, 
            snapshotFormat = v35.snapshotFormat, 
            testFailureExitCode = v35.testFailureExitCode, 
            testNamePattern = v35.testNamePattern, 
            testPathPattern = v35.testPathPattern, 
            testTimeout = v35.testTimeout, 
            updateSnapshot = v35.updateSnapshot, 
            verbose = v35.verbose
        }), 
        projectConfig = l_Object_0.freeze({
            automock = v35.automock, 
            clearMocks = v35.clearMocks, 
            displayName = v35.displayName, 
            id = v35.id, 
            injectGlobals = v35.injectGlobals, 
            resetMocks = v35.resetMocks, 
            resetModules = v35.resetModules, 
            restoreMocks = v35.restoreMocks, 
            rootDir = v35.rootDir, 
            roots = v35.roots, 
            runner = v35.runner, 
            runtime = v35.runtime, 
            sandboxInjectedGlobals = v35.sandboxInjectedGlobals, 
            setupFiles = v35.setupFiles, 
            setupFilesAfterEnv = v35.setupFilesAfterEnv, 
            slowTestThreshold = v35.slowTestThreshold, 
            snapshotFormat = v35.snapshotFormat, 
            snapshotSerializers = v35.snapshotSerializers, 
            testEnvironment = v35.testEnvironment, 
            testEnvironmentOptions = v35.testEnvironmentOptions, 
            testLocationInResults = v35.testLocationInResults, 
            testMatch = v35.testMatch, 
            testPathIgnorePatterns = v35.testPathIgnorePatterns, 
            testRegex = v35.testRegex, 
            timers = v35.timers
        })
    };
end;
v18 = function(v36, v37)
    if #v37 <= 1 then
        return ;
    else
        local v38 = l_Map_0.new();
        for _, v40 in v36, nil, nil do
            local l_configPath_0 = v40.configPath;
            if v38:has(l_configPath_0) then
                error(l_Error_0.new((("Whoops %s:\n\n  Project 1: %s\n  Project 2: %s\n\nThis usually means that your %s config includes a directory that doesn't have any configuration recognizable by Jest. Please fix it.\n"):format(v9.bold((tostring(l_configPath_0))), v9.bold((tostring(v37[l_Array_0.findIndex(v36, function(v42)
                    return v42 == v40;
                end)]))), tostring(v9.bold((tostring(v37[l_Array_0.findIndex(v36, function(v43)
                    return v43 == v38:get(l_configPath_0);
                end)])))), (tostring(v9.bold("\"projects\"")))))));
            end;
            if l_configPath_0 ~= nil then
                v38:set(l_configPath_0, v40);
            end;
        end;
        return ;
    end;
end;
v8.readConfigs = function(v44, v45, v46)
    return v7.resolve():andThen(function()
        local v47 = nil;
        local v48 = nil;
        local v49 = {};
        local l_v46_0 = v46;
        local v51 = nil;
        if #v46 == 1 then
            local l_v44_0 = v44;
            local l_v45_0 = v45;
            local v54 = l_v46_0[1];
            local v55 = nil;
            local v56 = nil;
            if v55 == nil then
                v55 = math.huge;
            end;
            if v56 == nil then
                v56 = false;
            end;
            local v57 = v7.resolve();
            local v58 = nil;
            local l_l_v45_0_0 = l_v45_0 --[[ copy: 7 -> 15 ]];
            local l_l_v44_0_0 = l_v44_0 --[[ copy: 6 -> 16 ]];
            local v61;
            do
                local l_v55_0, l_v56_0 = v55, v56;
                v61 = v57:andThen(function()
                    local v64 = nil;
                    local v65 = nil;
                    if typeof(v54) ~= "Instance" and typeof(v54) ~= "string" then
                        error(l_Error_0.new("Jest: configuration as an object not supported yet"));
                    elseif not l_isJSONString_0(l_l_v45_0_0.config) then
                        if not v58 and typeof(l_l_v45_0_0.config) == "string" then
                            v65 = l_default_2(l_l_v45_0_0.config, l_l_v44_0_0, l_v56_0);
                            v64 = l_default_1(v65):expect();
                        else
                            v65 = l_default_2(v54, l_l_v44_0_0, l_v56_0);
                            v64 = l_default_1(v65):expect();
                        end;
                    else
                        local v66 = nil;
                        do
                            local l_v66_0 = v66;
                            if not pcall(function()
                                l_v66_0 = l_JSON_0.parse(l_l_v45_0_0.config);
                            end) then
                                error(l_Error_0.new("There was an error while parsing the `--config` argument as a JSON string."));
                            end;
                            l_v66_0.rootDir = not not l_Boolean_0.toJSBoolean(l_v66_0.rootDir) and l_v66_0.rootDir or v54;
                            v64 = l_v66_0;
                        end;
                    end;
                    local v68 = l_default_0(v64, l_l_v45_0_0, v65, l_v55_0):expect();
                    local l_options_1 = v68.options;
                    local l_hasDeprecationWarnings_1 = v68.hasDeprecationWarnings;
                    local v71 = v17(l_options_1);
                    return {
                        configPath = v65, 
                        globalConfig = v71.globalConfig, 
                        hasDeprecationWarnings = l_hasDeprecationWarnings_1, 
                        projectConfig = v71.projectConfig
                    };
                end);
            end;
            v61 = v61:expect();
            v51 = v61.configPath;
            v48 = v61.hasDeprecationWarnings;
            v47 = v61.globalConfig;
            v49 = {
                v61.projectConfig
            };
            if l_Boolean_0.toJSBoolean(if v47.projects ~= nil then #v47.projects else nil) then
                l_v46_0 = v47.projects;
            end;
        end;
        if #l_v46_0 > 0 then
            local l_v44_1 = v44;
            local v73 = l_v46_0[1] == l_v44_1;
            local v78 = v7.all(l_Array_0.map(l_Array_0.filter(l_v46_0, function(v74)
                if not (typeof(v74) == "Instance" and #v74:GetChildren() == 0) or v74:isA("ModuleScript") then
                    return true;
                else
                    return false;
                end;
            end), function(v75, v76)
                local v77 = false;
                if v76 == 1 then
                    v77 = #l_v46_0 == 1;
                end;
                return v34(v44, v45, v75, not if not v77 then v77 else v73, if v51 ~= nil then v51.Parent else l_v44_1, v76, v73);
            end)):expect();
            v18(v78, l_v46_0);
            v49 = l_Array_0.map(v78, function(v79)
                return v79.projectConfig;
            end);
            if not v48 then
                v48 = l_Array_0.some(v78, function(v80)
                    return l_Boolean_0.toJSBoolean(v80.hasDeprecationWarnings);
                end);
            end;
            if not l_Boolean_0.toJSBoolean(v47) then
                v47 = v78[1].globalConfig;
            end;
        end;
        if not (l_Boolean_0.toJSBoolean(v47) and l_Boolean_0.toJSBoolean(#v49)) then
            error(l_Error_0.new("jest: No configuration found for any project."));
        end;
        return {
            configs = v49, 
            globalConfig = v47, 
            hasDeprecationWarnings = l_Boolean_0.toJSBoolean(v48)
        };
    end);
end;
return v8;
