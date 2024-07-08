local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.JestEnvironment);
local _ = require(l_Parent_0.JestTestResult);
local _ = require(l_Parent_0.JestTypes);
local _ = require(l_Parent_0.JestRuntime);
local l_deepCyclicCopy_0 = require(l_Parent_0.JestUtil).deepCyclicCopy;
local l_jestAdapterInit_0 = script.Parent.jestAdapterInit;
local v11 = nil;
local function v27(v12, v13, v14, v15, v16, v17)
    return v4.resolve():andThen(function()
        local v18 = v15:requireInternalModule(l_jestAdapterInit_0);
        local l_initialize_0 = v18.initialize;
        local l_runAndTransformResultsToJestFormat_0 = v18.runAndTransformResultsToJestFormat;
        local v21 = l_initialize_0({
            config = v13, 
            environment = v14, 
            globalConfig = v12, 
            localRequire = function(...)
                return v15:requireModule(...);
            end, 
            sendMessageToJest = v17, 
            setGlobalsForRuntime = function(...)
                v15:setGlobalsForRuntime(...);
            end, 
            testPath = v16
        }):expect();
        local l_globals_0 = v21.globals;
        local l_snapshotState_0 = v21.snapshotState;
        v14.fakeTimers:useFakeTimers();
        l_globals_0.beforeEach(function()
            if v13.resetModules then
                v15:resetModules();
            end;
            if v13.clearMocks then
                v15:clearAllMocks();
            end;
            if v13.resetMocks then
                v15:resetAllMocks();
                if l_Boolean_0.toJSBoolean(if not l_Boolean_0.toJSBoolean(v13.fakeTimers.enableGlobally) then v13.fakeTimers.enableGlobally else v13.fakeTimers.legacyFakeTimers) then
                    v14.fakeTimers:useFakeTimers();
                end;
            end;
            if v13.restoreMocks then
                v15:restoreAllMocks();
            end;
        end);
        for _, v25 in v13.setupFilesAfterEnv, nil, nil do
            v15:requireModule(v25, nil, nil, nil, true);
        end;
        v15:requireModule(v16, nil, nil, nil, true);
        local v26 = l_runAndTransformResultsToJestFormat_0({
            config = v13, 
            globalConfig = v12, 
            testPath = v16
        }):expect();
        v11(v26, l_snapshotState_0);
        return l_deepCyclicCopy_0(v26, {
            keepPrototype = false
        });
    end);
end;
v11 = function(v28, v29)
    l_Array_0.forEach(v28.testResults, function(v30)
        local l_fullName_0 = v30.fullName;
        local l_status_0 = v30.status;
        if not (l_status_0 ~= "pending") or l_status_0 == "failed" then
            v29:markSnapshotsAsCheckedForTest(l_fullName_0);
        end;
    end);
    local v33 = v29:getUncheckedCount();
    local v34 = v29:getUncheckedKeys();
    if l_Boolean_0.toJSBoolean(v33) then
        v29:removeUncheckedKeys();
    end;
    local v35 = v29:save();
    v28.snapshot.fileDeleted = v35.deleted;
    v28.snapshot.added = v29.added;
    v28.snapshot.matched = v29.matched;
    v28.snapshot.unmatched = v29.unmatched;
    v28.snapshot.updated = v29.updated;
    v28.snapshot.unchecked = v35.deleted and 0 or v33;
    v28.snapshot.uncheckedKeys = l_Array_0.from(v34);
end;
return v27;
