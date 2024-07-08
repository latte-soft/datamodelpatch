local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_ModuleMocker_0 = require(l_Parent_0.JestMock).ModuleMocker;
local _ = require(script.types);
local _ = require(script._types);
local _ = require(l_Parent_0.Expect);
local v10 = require(l_Parent_0.JestFakeTimers);
local v11 = {};
v11.__index = v11;
v11.new = function(v12)
    local v13 = setmetatable({}, v11);
    v13.isTornDown = false;
    v13._environment = {
        fakeTimersModern = v10.new()
    };
    v13._explicitShouldMock = l_Map_0.new();
    v13._explicitShouldMockModule = l_Map_0.new();
    v13._internalModuleRegistry = l_Map_0.new();
    v13._mockFactories = l_Map_0.new();
    v13._mockRegistry = l_Map_0.new();
    v13._loadedModuleFns = v12;
    v13._moduleMocker = l_ModuleMocker_0.new();
    v13._isolatedModuleRegistry = nil;
    v13._isolatedMockRegistry = nil;
    v13._moduleRegistry = l_Map_0.new();
    v13._shouldAutoMock = false;
    v13._shouldMockModuleCache = l_Map_0.new();
    v13._fakeTimersImplementation = v13._environment.fakeTimersModern;
    v13._jestObject = v13:_createJestObjectFor(script);
    v13._cleanupFns = {};
    return v13;
end;
v11.requireModule = function(v14, v15, v16, v17, _, v19)
    local v20 = if v16 == nil then v15 else v16;
    if not string.find(v20.Name, ".global$") then
        local v21 = typeof(v17) == "table" and if v17.isInternalModule ~= nil then v17.isInternalModule else false;
        local v22 = nil;
        v22 = if not v21 then if v14._isolatedModuleRegistry ~= nil then v14._isolatedModuleRegistry else v14._moduleRegistry else v14._internalModuleRegistry;
        local v23 = v22:get(v20);
        if not v23 then
            local v24 = {
                exports = {}, 
                filename = v20, 
                id = v20, 
                loaded = false
            };
            v22:set(v20, v24);
            local l_status_0, l_result_0 = pcall(function()
                v14:_loadModule(v24, v15, v20, v20, v17, v22, v19);
            end);
            if not l_status_0 then
                v22:delete(v20);
                error(l_result_0);
            end;
            return v24.exports;
        else
            return v23.exports;
        end;
    else
        return require(v20);
    end;
end;
v11.requireInternalModule = function(v27, v28, v29)
    return v27:requireModule(v28, v29, {
        isInternalModule = true
    });
end;
v11.requireActual = function(v30, v31, v32)
    return v30:requireModule(v31, v32, nil, true);
end;
v11.requireMock = function(v33, _, v35)
    if not (v33._isolatedMockRegistry ~= nil) or not v33._isolatedMockRegistry:has(v35) then
        if not v33._mockRegistry:has(v35) then
            local v36 = v33._isolatedMockRegistry or v33._mockRegistry;
            if not v33._mockFactories:has(v35) then
                error("manual mocks not implemented yet");
                return ;
            else
                local v37 = v33._mockFactories:get(v35)();
                v36:set(v35, v37);
                return v37;
            end;
        else
            return (v33._mockRegistry:get(v35));
        end;
    else
        return (v33._isolatedMockRegistry:get(v35));
    end;
end;
v11._loadModule = function(v38, v39, v40, v41, _, v43, v44, v45)
    v38:_execModule(v39, v43, v44, if not l_Boolean_0.toJSBoolean(v41) then nil else v40, v45);
    v39.loaded = true;
end;
v11.requireModuleOrMock = function(v46, v47)
    if not (v47 ~= script) or v47 == script.Parent then
        return require(v47);
    elseif not string.find(v47.Name, ".global$") then
        if v47.Name == "JestGlobals" then
            return (l_Object_0.assign({}, v46:getGlobalsFromEnvironment(), {
                jest = v46._jestObject
            }));
        else
            local l_status_1, l_result_1 = pcall(function()
                if not v46:_shouldMock(v47, v47, v46._explicitShouldMock, {
                    conditions = nil
                }) then
                    return v46:requireModule(v47, v47);
                else
                    return v46:requireMock(v47, v47);
                end;
            end);
            if not l_status_1 then
                error(l_result_1);
            end;
            return l_result_1;
        end;
    else
        return require(v47);
    end;
end;
v11.isolateModules = function(v50, v51)
    if not (v50._isolatedModuleRegistry == nil) or v50._isolatedMockRegistry ~= nil then
        error(l_Error_0.new("isolateModules cannot be nested inside another isolateModules."));
    end;
    v50._isolatedModuleRegistry = l_Map_0.new();
    v50._isolatedMockRegistry = l_Map_0.new();
    local l_status_2, l_result_2 = pcall(function()
        v51();
    end);
    if v50._isolatedModuleRegistry then
        v50._isolatedModuleRegistry:clear();
    end;
    if v50._isolatedMockRegistry then
        v50._isolatedMockRegistry:clear();
    end;
    v50._isolatedModuleRegistry = nil;
    v50._isolatedMockRegistry = nil;
    if not l_status_2 then
        error(l_result_2);
    end;
end;
v11.resetModules = function(v54)
    if v54._isolatedModuleRegistry then
        v54._isolatedModuleRegistry:clear();
    end;
    if v54._isolatedMockRegistry then
        v54._isolatedMockRegistry:clear();
    end;
    v54._isolatedModuleRegistry = nil;
    v54._isolatedMockRegistry = nil;
    v54._mockRegistry:clear();
    v54._moduleRegistry:clear();
end;
v11.setMock = function(v55, _, v57, v58, v59)
    if l_Boolean_0.toJSBoolean(if typeof(v59) == "table" then v59.virtual else nil) then
        error("virtual mocks not supported");
    end;
    v55._explicitShouldMock:set(v57, true);
    v55._mockFactories:set(v57, v58);
end;
v11.restoreAllMocks = function(v60)
    v60._moduleMocker:restoreAllMocks();
end;
v11.resetAllMocks = function(v61)
    v61._moduleMocker:resetAllMocks();
end;
v11.clearAllMocks = function(v62)
    v62._moduleMocker:clearAllMocks();
end;
v11.teardown = function(v63)
    v63:restoreAllMocks();
    v63:resetAllMocks();
    v63:resetModules();
    v63._internalModuleRegistry:clear();
    v63._mockFactories:clear();
    v63._shouldMockModuleCache:clear();
    v63._explicitShouldMock:clear();
    v63._explicitShouldMockModule:clear();
    for _, v65 in ipairs(v63._cleanupFns) do
        v65();
    end;
    v63.isTornDown = true;
end;
v11._execModule = function(v66, v67, v68, _, _, v71)
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    local v75 = nil;
    local l_filename_0 = v67.filename;
    if not v66._loadedModuleFns or not v66._loadedModuleFns:has(l_filename_0) then
        local v77, v78, v79 = debug.loadmodule(l_filename_0);
        v72 = v77;
        v74 = v78;
        v75 = v79;
        if v72 == nil then
            error(l_Error_0.new(v74));
        end;
        v73 = getfenv(v72);
        if not v66._loadedModuleFns then
            if v75 ~= nil then
                table.insert(v66._cleanupFns, v75);
            end;
        else
            v66._loadedModuleFns:set(l_filename_0, {
                v72, 
                v73, 
                v75
            });
        end;
    else
        local v80 = v66._loadedModuleFns:get(l_filename_0);
        v72 = v80[1];
        v73 = v80[2];
    end;
    local v81 = v68 ~= nil and if v68.isInternalModule then v68.isInternalModule else false;
    setfenv(v72, (setmetatable(l_Object_0.assign({
        script = v73.script, 
        require = not v81 and function(v82)
            return v66:requireModuleOrMock(v82);
        end or function(v83)
            return v66:requireInternalModule(v83);
        end
    }, if not v81 then {
        delay = v66._fakeTimersImplementation.delayOverride, 
        tick = v66._fakeTimersImplementation.tickOverride, 
        time = v66._fakeTimersImplementation.timeOverride, 
        DateTime = v66._fakeTimersImplementation.dateTimeOverride, 
        os = v66._fakeTimersImplementation.osOverride, 
        task = v66._fakeTimersImplementation.taskOverride
    } else {}), {
        __index = v73
    })));
    local v84 = table.pack(v72());
    if v84.n ~= 1 and v71 ~= true then
        error(string.format("[Module Error]: %s did not return a valid result\n" .. "\tModuleScripts must return exactly one value", (tostring(l_filename_0))));
    end;
    v67.exports = v84[1];
end;
v11._shouldMock = function(v85, _, v87, v88, _)
    if not v88:has(v87) then
        if v85._shouldAutoMock then
            if not v85._shouldMockModuleCache:has(v87) then
                return true;
            else
                return (v85._shouldMockModuleCache:get(v87));
            end;
        else
            return false;
        end;
    else
        return (v88:get(v87));
    end;
end;
v11._createJestObjectFor = function(v90, v91)
    local v92 = nil;
    local v93 = nil;
    local function v95(v94)
        v90._explicitShouldMock:set(v94, false);
        return v93;
    end;
    local function v99(v96, v97, v98)
        if v97 ~= nil then
            return v92(v96, v97, v98);
        else
            v90._explicitShouldMock:set(v96, true);
            return v93;
        end;
    end;
    v92 = function(v100, v101, v102)
        v90:setMock(v91, v100, v101, v102);
        return v93;
    end;
    local function v103()
        v90:clearAllMocks();
        return v93;
    end;
    local function v104()
        v90:resetAllMocks();
        return v93;
    end;
    local function v105()
        v90:restoreAllMocks();
        return v93;
    end;
    local function v106()
        return v90._fakeTimersImplementation;
    end;
    v93 = {
        advanceTimersByTime = function(v107)
            return v106():advanceTimersByTime(v107);
        end, 
        advanceTimersToNextTimer = function(v108)
            return v106():advanceTimersToNextTimer(v108);
        end, 
        getEngineFrameTime = function()
            return v106():getEngineFrameTime();
        end, 
        setEngineFrameTime = function(v109)
            return v106():setEngineFrameTime(v109);
        end, 
        clearAllMocks = v103, 
        clearAllTimers = function()
            return v106():clearAllTimers();
        end, 
        doMock = v99, 
        dontMock = v95, 
        fn = function(v110)
            return v90._moduleMocker:fn(v110);
        end, 
        getRealSystemTime = function()
            local v111 = v106();
            if v111 == v90._environment.fakeTimersModern then
                return v111:getRealSystemTime();
            else
                error(l_Error_0.new("getRealSystemTime is not available when not using modern timers"));
                return ;
            end;
        end, 
        getTimerCount = function()
            return v106():getTimerCount();
        end, 
        isMockFunction = v90._moduleMocker.isMockFunction, 
        isolateModules = function(v112)
            v90:isolateModules(v112);
            return v93;
        end, 
        mock = v99, 
        requireActual = function(v113)
            return v90:requireActual(v91, v113);
        end, 
        resetAllMocks = v104, 
        resetModules = function()
            v90:resetModules();
            return v93;
        end, 
        restoreAllMocks = v105, 
        runAllTicks = function()
            return v106():runAllTicks();
        end, 
        runAllTimers = function()
            return v106():runAllTimers();
        end, 
        runOnlyPendingTimers = function()
            return v106():runOnlyPendingTimers();
        end, 
        jestTimers = v106(), 
        setMock = function(v114, v115)
            return v92(v114, function()
                return v115;
            end);
        end, 
        setSystemTime = function(v116)
            local v117 = v106();
            if v117 == v90._environment.fakeTimersModern then
                v117:setSystemTime(v116);
                return ;
            else
                error(l_Error_0.new("setSystemTime is not available when not using modern timers"));
                return ;
            end;
        end, 
        unmock = v95, 
        useFakeTimers = function()
            v90._fakeTimersImplementation:useFakeTimers();
            return v93;
        end, 
        useRealTimers = function()
            v106():useRealTimers();
            return v93;
        end
    };
    return v93;
end;
v11.getGlobalsFromEnvironment = function(v118)
    if not v118.jestGlobals then
        local v119 = v118:requireModuleOrMock(l_Parent_0.JestSnapshot);
        local v120 = v118:requireModuleOrMock(l_Parent_0.Expect);
        return {
            expect = v120, 
            expectExtended = v120, 
            jestSnapshot = {
                toMatchSnapshot = v119.toMatchSnapshot, 
                toThrowErrorMatchingSnapshot = v119.toThrowErrorMatchingSnapshot
            }
        };
    else
        return table.clone(v118.jestGlobals);
    end;
end;
v11.setGlobalsForRuntime = function(v121, v122)
    v121.jestGlobals = v122;
end;
return v11;
