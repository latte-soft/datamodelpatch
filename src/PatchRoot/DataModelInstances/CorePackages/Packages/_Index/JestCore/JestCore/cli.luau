local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_console_0 = v1.console;
local v6 = require(l_Parent_0.Promise);
local v7 = {};
local v8 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTestResult);
local _ = require(l_Parent_0.JestTypes);
local l_readConfigs_0 = require(l_Parent_0.JestConfig).readConfigs;
local _ = require(l_Parent_0.JestRuntime);
local l_preRunMessage_0 = require(l_Parent_0.JestUtil).preRunMessage;
local l_default_0 = require(script.Parent.TestWatcher).default;
local l_formatHandleErrors_0 = require(script.Parent.collectHandles).formatHandleErrors;
local l_default_1 = require(script.Parent.getChangedFilesPromise).default;
local l_default_2 = require(script.Parent.getProjectNamesMissingWarning).default;
local l_default_3 = require(script.Parent.getSelectProjectsMessage).default;
local l_default_4 = require(script.Parent.lib.createContext).default;
local l_default_5 = require(script.Parent.lib.logDebugMessages).default;
local l_default_6 = require(script.Parent.pluralize).default;
local l_default_7 = require(script.Parent.runJest).default;
local _ = require(script.Parent.types);
local l_print_0 = l_preRunMessage_0.print;
local l_nodeUtils_0 = require(l_Parent_0.RobloxShared).nodeUtils;
local l_process_0 = l_nodeUtils_0.process;
local l_exit_0 = l_nodeUtils_0.exit;
local v28 = nil;
local v29 = nil;
v7.runCLI = function(v30, v31, v32)
    return v6.resolve():andThen(function()
        local v33 = nil;
        local v34 = if l_Boolean_0.toJSBoolean(v31.json) or l_Boolean_0.toJSBoolean(v31.useStderr) then l_process_0.stderr else l_process_0.stdout;
        local v35 = l_readConfigs_0(v30, v31, v32):expect();
        local l_globalConfig_0 = v35.globalConfig;
        local l_configs_0 = v35.configs;
        local l_hasDeprecationWarnings_0 = v35.hasDeprecationWarnings;
        if v31.debug then
            l_default_5(l_globalConfig_0, l_configs_0, v34);
        end;
        if v31.showConfig then
            l_default_5(l_globalConfig_0, l_configs_0, l_process_0.stdout);
            l_exit_0(0);
        end;
        if l_Boolean_0.toJSBoolean(v31.selectProjects) then
            local v39 = l_default_2(l_configs_0, {
                ignoreProjects = v31.ignoreProjects, 
                selectProjects = v31.selectProjects
            });
            if not (not l_Boolean_0.toJSBoolean(v39) or not v39) then
                v34:write(v39);
            end;
            v34:write(l_default_3(l_configs_0, {
                ignoreProjects = v31.ignoreProjects, 
                selectProjects = v31.selectProjects
            }));
        end;
        v28(l_globalConfig_0, l_configs_0, l_hasDeprecationWarnings_0, v34, function(v40)
            v33 = v40;
        end):expect();
        if not v31.watch and not v31.watchAll then
            if not l_Boolean_0.toJSBoolean(v33) then
                error(l_Error_0.new("AggregatedResult must be present after test run is complete"));
            end;
            local l_openHandles_0 = v33.openHandles;
            if l_openHandles_0 ~= nil and #l_openHandles_0 > 0 then
                local v42 = l_formatHandleErrors_0(l_openHandles_0, l_configs_0[1]);
                l_console_0.error(v8.red(("\nJest has detected the following %s potentially keeping Jest from exiting:\n\n"):format((l_default_6("open handle", #v42, "s")))) .. l_Array_0.join(v42, "\n\n"));
            end;
            return {
                globalConfig = l_globalConfig_0, 
                results = v33
            };
        else
            return v6.new(function()
            end);
        end;
    end);
end;
local _ = function(v43, _, _)
    return v6.resolve():andThen(function()
        return {
            contexts = v6.all(l_Array_0.map(v43, function(v46, _)
                return v6.resolve():andThen(function()
                    return l_default_4(v46, nil);
                end);
            end)):expect()
        };
    end);
end;
v28 = function(v49, v50, _, v52, v53)
    return v6.resolve():andThen(function()
        local v54 = l_default_1(v49, v50);
        local v55 = nil;
        if not (not l_Boolean_0.toJSBoolean(v49.filter) or v49.skipFilter) then
            local v56 = require(v49.filter);
            local v57 = nil;
            if l_Boolean_0.toJSBoolean(v56.setup) then
                v57 = v6.resolve():andThen(function()
                    local l_status_0, l_result_0 = pcall(function()
                        v56:setup():expect();
                    end);
                    if l_status_0 then
                        return nil;
                    else
                        return l_result_0;
                    end;
                end);
            end;
            do
                local l_v57_0 = v57;
                v55 = function(v61)
                    return v6.resolve():andThen(function()
                        if l_v57_0 ~= nil then
                            local v62 = l_v57_0:expect();
                            if l_Boolean_0.toJSBoolean(v62) then
                                error(v62);
                            end;
                        end;
                        return v56(v61);
                    end);
                end;
            end;
        end;
        local l_v50_0 = v50;
        local _ = v49;
        local _ = v52;
        v29(v49, v6.resolve():andThen(function()
            return {
                contexts = v6.all(l_Array_0.map(l_v50_0, function(v66, _)
                    return v6.resolve():andThen(function()
                        return l_default_4(v66, nil);
                    end);
                end)):expect()
            };
        end):expect().contexts, v52, v53, v54, v55):expect();
    end);
end;
v29 = function(v68, v69, v70, v71, v72, v73)
    return v6.resolve():andThen(function()
        local function v74()
            return v6.resolve():andThen(function()
                if not v68.listTests then
                    l_print_0(v70);
                end;
                return l_default_7({
                    changedFilesPromise = v72, 
                    contexts = v69, 
                    failedTestsCache = nil, 
                    filter = v73, 
                    globalConfig = v68, 
                    onComplete = v71, 
                    outputStream = v70, 
                    startRun = v74, 
                    testWatcher = l_default_0.new({
                        isWatchMode = false
                    })
                });
            end);
        end;
        return v74();
    end);
end;
return v7;
