local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_console_0 = v1.console;
local v6 = require(l_Parent_0.Promise);
local v7 = {};
local v8 = nil;
local v9 = require(l_Parent_0.RobloxShared);
local l_process_0 = v9.nodeUtils.process;
local l_getRelativePath_0 = v9.getRelativePath;
local v12 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local function v15(v14)
    return v14;
end;
local l_clearLine_0 = require(l_Parent_0.JestUtil).clearLine;
local function v18(v17)
    return v17;
end;
local l_ValidationError_0 = require(l_Parent_0.JestValidate).ValidationError;
local l_default_0 = require(script.Parent.Defaults).default;
local l_getDisplayNameColor_0 = require(script.Parent.color).getDisplayNameColor;
local l_default_1 = require(script.Parent.getMaxWorkers).default;
local l_default_2 = require(script.Parent.setFromArgv).default;
local v24 = require(script.Parent.utils);
local l_BULLET_0 = v24.BULLET;
local l_DOCUMENTATION_NOTE_0 = v24.DOCUMENTATION_NOTE;
local l_default_3 = require(script.Parent.validatePattern).default;
local v28 = ("%sValidation Error"):format(l_BULLET_0);
local function v30(v29)
    return l_ValidationError_0.new(v28, v29, l_DOCUMENTATION_NOTE_0);
end;
local function _(v31, v32)
    if typeof(v31) ~= "Instance" then
        error(v30(("  Directory %s in the %s option was not found."):format(v12.bold((tostring(v31))), v12.bold(v32))));
    end;
end;
local function _(v34)
    return v34;
end;
local _ = function(v36, _, _)
    if not l_Boolean_0.toJSBoolean(v36.id) then
        v36.id = l_getRelativePath_0(v36.rootDir, nil);
    end;
    if v36.setupFiles == nil then
        v36.setupFiles = {};
    end;
    return v36;
end;
local function v42(v40)
    if not l_Boolean_0.toJSBoolean(v40.rootDir) then
        error(v30(("  Configuration option %s must be specified."):format(v12.bold("rootDir"))));
    end;
    local l_rootDir_0 = v40.rootDir;
    if typeof(l_rootDir_0) ~= "Instance" then
        error(v30(("  Directory %s in the %s option was not found."):format(v12.bold((tostring(l_rootDir_0))), v12.bold("rootDir"))));
    end;
    return l_Object_0.assign({}, v40, {
        rootDir = v40.rootDir
    });
end;
local function _(v43)
    return v43;
end;
local function v49(v45)
    local v46 = {};
    if v45._ ~= nil then
        v46 = l_Array_0.concat(v46, v45._);
    end;
    if v45.testPathPattern ~= nil then
        v46 = l_Array_0.concat(v46, v45.testPathPattern);
    end;
    local v48 = l_Array_0.join(l_Array_0.map(v46, function(v47)
        return (tostring(v47));
    end), "|");
    if not l_default_3(v48) then
        v8(v48);
        return "";
    else
        return v48;
    end;
end;
v8 = function(v50)
    l_clearLine_0(l_process_0.stdout);
    l_console_0.log(v12.red(("  Invalid testPattern %s supplied. "):format((tostring(v50))) .. "Running all tests instead."));
end;
v7.default = function(v51, v52, v53, v54)
    local v55 = if v54 ~= nil then v54 else math.huge;
    return v6.resolve():andThen(function()
        local v56 = v42(l_default_2(v51, v52));
        local _ = v53;
        local _ = v55;
        if not l_Boolean_0.toJSBoolean(v56.id) then
            v56.id = l_getRelativePath_0(v56.rootDir, nil);
        end;
        if v56.setupFiles == nil then
            v56.setupFiles = {};
        end;
        local l_v56_0 = v56;
        l_v56_0.testEnvironment = l_v56_0.testEnvironment or l_default_0.testEnvironment;
        if l_v56_0.roots == nil and l_v56_0.testPathDirs ~= nil then
            l_v56_0.roots = l_v56_0.testPathDirs;
            l_v56_0.testPathDirs = nil;
        end;
        if l_v56_0.roots == nil then
            l_v56_0.roots = {
                l_v56_0.rootDir
            };
        end;
        local v60 = l_Object_0.assign({}, l_default_0);
        l_Array_0.reduce(l_Object_0.keys(l_v56_0), function(v61, v62)
            if v62 == "resolver" then
                return v61;
            else
                local l_l_v56_0_0 = l_v56_0;
                local v64 = nil;
                if not (v62 ~= "setupFiles" and v62 ~= "setupFilesAfterEnv") or v62 == "snapshotSerializers" then
                    local v65 = l_l_v56_0_0[v62];
                    if v65 ~= nil then
                        v64 = l_Array_0.map(v65, function(v66)
                            if v66 == "<rootDir>" then
                                return l_v56_0.rootDir;
                            else
                                return v66;
                            end;
                        end);
                    end;
                elseif not (v62 ~= "modulePaths") or v62 == "roots" then
                    local v67 = l_l_v56_0_0[v62];
                    if v67 ~= nil then
                        v64 = l_Array_0.map(v67, function(v68)
                            if v68 == "<rootDir>" then
                                return l_v56_0.rootDir;
                            else
                                return v68;
                            end;
                        end);
                    end;
                elseif v62 == "testPathIgnorePatterns" then
                    v64 = l_l_v56_0_0[v62];
                elseif v62 == "projects" then
                    v64 = l_Array_0.reduce(l_Array_0.map(not not l_Boolean_0.toJSBoolean(l_l_v56_0_0[v62]) and l_l_v56_0_0[v62] or {}, function(v69)
                        return v69;
                    end), function(v70, v71)
                        local v72 = {};
                        return l_Array_0.concat(v70, if #v72 > 0 then v72 else {
                            v71
                        });
                    end, {});
                elseif not (v62 ~= "moduleDirectories") or v62 == "testMatch" then
                    local v73 = l_l_v56_0_0[v62];
                    v64 = if v73 ~= nil then if l_Array_0.isArray(v73) then l_Array_0.map(v73, v18) else v73 else v73;
                elseif v62 == "testRegex" then
                    local v74 = l_l_v56_0_0[v62];
                    v64 = if v74 ~= nil and l_Boolean_0.toJSBoolean(v74) then l_Array_0.map(if not l_Array_0.isArray(v74) then {
                        v74
                    } else v74, v15) else {};
                elseif v62 == "bail" then
                    local v75 = l_l_v56_0_0[v62];
                    if typeof(v75) == "boolean" then
                        v64 = not v75 and 0 or 1;
                    elseif typeof(v75) == "string" then
                        v64 = 1;
                        table.insert(v52._, v75);
                    else
                        v64 = l_l_v56_0_0[v62];
                    end;
                elseif v62 == "displayName" then
                    local v76 = l_l_v56_0_0[v62];
                    if typeof(v76) == "table" then
                        local l_name_0 = v76.name;
                        local l_color_0 = v76.color;
                        if not (not (not l_Boolean_0.toJSBoolean(l_name_0) or not l_Boolean_0.toJSBoolean(l_color_0)) and typeof(l_name_0) == "string") or typeof(l_color_0) ~= "string" then
                            error(v30(("  Option \"%s\" must be of type:\n\n"):format(v12.bold("displayName")) .. "  {\n" .. "    name: string;\n" .. "    color: string;\n" .. "  }\n"));
                        end;
                        v64 = l_l_v56_0_0[v62];
                    else
                        v64 = {
                            color = l_getDisplayNameColor_0(l_v56_0.runner), 
                            name = v76
                        };
                    end;
                elseif v62 == "testTimeout" then
                    if l_l_v56_0_0[v62] < 0 then
                        error(v30(("  Option \"%s\" must be a natural number."):format(v12.bold("testTimeout"))));
                    end;
                    v64 = l_l_v56_0_0[v62];
                elseif not ((((((((((((((((((((((((((((((((((((((((((((((((((((((v62 ~= "automock" and v62 ~= "cache") and v62 ~= "changedSince") and v62 ~= "changedFilesWithAncestor") and v62 ~= "clearMocks") and v62 ~= "collectCoverage") and v62 ~= "coverageProvider") and v62 ~= "coverageReporters") and v62 ~= "coverageThreshold") and v62 ~= "detectLeaks") and v62 ~= "detectOpenHandles") and v62 ~= "errorOnDeprecated") and v62 ~= "expand") and v62 ~= "extensionsToTreatAsEsm") and v62 ~= "extraGlobals") and v62 ~= "globals") and v62 ~= "findRelatedTests") and v62 ~= "forceCoverageMatch") and v62 ~= "forceExit") and v62 ~= "injectGlobals") and v62 ~= "lastCommit") and v62 ~= "listTests") and v62 ~= "logHeapUsage") and v62 ~= "maxConcurrency") and v62 ~= "id") and v62 ~= "noStackTrace") and v62 ~= "notify") and v62 ~= "notifyMode") and v62 ~= "onlyChanged") and v62 ~= "onlyFailures") and v62 ~= "outputFile") and v62 ~= "passWithNoTests") and v62 ~= "replname") and v62 ~= "reporters") and v62 ~= "resetMocks") and v62 ~= "resetModules") and v62 ~= "restoreMocks") and v62 ~= "rootDir") and v62 ~= "runTestsByPath") and v62 ~= "silent") and v62 ~= "skipFilter") and v62 ~= "skipNodeResolution") and v62 ~= "slowTestThreshold") and v62 ~= "snapshotFormat") and v62 ~= "testEnvironment") and v62 ~= "testEnvironmentOptions") and v62 ~= "testFailureExitCode") and v62 ~= "testLocationInResults") and v62 ~= "testNamePattern") and v62 ~= "testURL") and v62 ~= "timers") and v62 ~= "useStderr") and v62 ~= "verbose") and v62 ~= "watch") and v62 ~= "watchAll") or v62 == "watchman" then
                    v64 = l_l_v56_0_0[v62];
                end;
                v61[v62] = v64;
                return v61;
            end;
        end, v60);
        l_Array_0.forEach(v60.roots, function(v79, v80)
            local v81 = ("roots[%s]"):format((tostring(v80)));
            if typeof(v79) ~= "Instance" then
                error(v30(("  Directory %s in the %s option was not found."):format(v12.bold((tostring(v79))), v12.bold(v81))));
            end;
        end);
        v60.testPathPattern = v49(v52);
        v60.json = l_Boolean_0.toJSBoolean(v52.json);
        v60.testFailureExitCode = tonumber(v60.testFailureExitCode, 10) or 0;
        v60.updateSnapshot = if not l_Boolean_0.toJSBoolean(v52.ci) or v52.updateSnapshot then v52.updateSnapshot and "all" or "new" else "none";
        v60.maxConcurrency = tonumber(v60.maxConcurrency, 10) or 0;
        v60.maxWorkers = l_default_1(v52, l_v56_0);
        if #v60.testRegex > 0 and l_v56_0.testMatch ~= nil then
            error(v30(("  Configuration options %s and"):format(v12.bold("testMatch")) .. (" %s cannot be used together."):format(v12.bold("testRegex"))));
        end;
        if #v60.testRegex > 0 and l_v56_0.testMatch == nil then
            v60.testMatch = {};
        end;
        if not l_Boolean_0.toJSBoolean(v60.projects) then
            v60.projects = {};
        end;
        return {
            hasDeprecationWarnings = false, 
            options = v60
        };
    end);
end;
return v7;
