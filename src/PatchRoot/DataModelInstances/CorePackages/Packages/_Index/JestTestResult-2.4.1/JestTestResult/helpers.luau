local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Boolean_0 = require(l_Parent_1.LuauPolyfill).Boolean;
local _ = require(l_Parent_1.JestTypes);
local _ = require(l_Parent_0.types);
return {
    makeEmptyAggregatedTestResult = function()
        return {
            numFailedTestSuites = 0, 
            numFailedTests = 0, 
            numPassedTestSuites = 0, 
            numPassedTests = 0, 
            numPendingTestSuites = 0, 
            numPendingTests = 0, 
            numRuntimeErrorTestSuites = 0, 
            numTodoTests = 0, 
            numTotalTestSuites = 0, 
            numTotalTests = 0, 
            openHandles = {}, 
            snapshot = {
                added = 0, 
                didUpdate = false, 
                failure = false, 
                filesAdded = 0, 
                filesRemoved = 0, 
                filesRemovedList = {}, 
                filesUnmatched = 0, 
                filesUpdated = 0, 
                matched = 0, 
                total = 0, 
                unchecked = 0, 
                uncheckedKeysByFile = {}, 
                unmatched = 0, 
                updated = 0
            }, 
            startTime = 0, 
            success = true, 
            testResults = {}, 
            wasInterrupted = false
        };
    end, 
    buildFailureTestResult = function(v5, v6)
        return {
            console = nil, 
            displayName = nil, 
            failureMessage = nil, 
            leaks = false, 
            numFailingTests = 0, 
            numPassingTests = 0, 
            numPendingTests = 0, 
            numTodoTests = 0, 
            openHandles = {}, 
            perfStats = {
                end_ = 0, 
                runtime = 0, 
                slow = false, 
                start = 0
            }, 
            skipped = false, 
            snapshot = {
                added = 0, 
                fileDeleted = false, 
                matched = 0, 
                unchecked = 0, 
                uncheckedKeys = {}, 
                unmatched = 0, 
                updated = 0
            }, 
            testExecError = v6, 
            testFilePath = v5, 
            testResults = {}
        };
    end, 
    addResult = function(v7, v8)
        if not l_Boolean_0.toJSBoolean(v8.numTodoTests) then
            v8.numTodoTests = 0;
        end;
        table.insert(v7.testResults, v8);
        v7.numTotalTests = v7.numTotalTests + (((v8.numPassingTests + v8.numFailingTests) + v8.numPendingTests) + v8.numTodoTests);
        v7.numFailedTests = v7.numFailedTests + v8.numFailingTests;
        v7.numPassedTests = v7.numPassedTests + v8.numPassingTests;
        v7.numPendingTests = v7.numPendingTests + v8.numPendingTests;
        v7.numTodoTests = v7.numTodoTests + v8.numTodoTests;
        if l_Boolean_0.toJSBoolean(v8.testExecError) then
            v7.numRuntimeErrorTestSuites = v7.numRuntimeErrorTestSuites + 1;
        end;
        if not l_Boolean_0.toJSBoolean(v8.skipped) then
            local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
            local v10 = true;
            if v8.numFailingTests <= 0 then
                v10 = v8.testExecError;
            end;
            if not l_toJSBoolean_0(v10) then
                v7.numPassedTestSuites = v7.numPassedTestSuites + 1;
            else
                v7.numFailedTestSuites = v7.numFailedTestSuites + 1;
            end;
        else
            v7.numPendingTestSuites = v7.numPendingTestSuites + 1;
        end;
        if l_Boolean_0.toJSBoolean(v8.snapshot.added) then
            local l_snapshot_0 = v7.snapshot;
            l_snapshot_0.filesAdded = l_snapshot_0.filesAdded + 1;
        end;
        if l_Boolean_0.toJSBoolean(v8.snapshot.fileDeleted) then
            local l_snapshot_1 = v7.snapshot;
            l_snapshot_1.filesRemoved = l_snapshot_1.filesRemoved + 1;
        end;
        if l_Boolean_0.toJSBoolean(v8.snapshot.unmatched) then
            local l_snapshot_2 = v7.snapshot;
            l_snapshot_2.filesUnmatched = l_snapshot_2.filesUnmatched + 1;
        end;
        if l_Boolean_0.toJSBoolean(v8.snapshot.updated) then
            local l_snapshot_3 = v7.snapshot;
            l_snapshot_3.filesUpdated = l_snapshot_3.filesUpdated + 1;
        end;
        local l_snapshot_4 = v7.snapshot;
        l_snapshot_4.added = l_snapshot_4.added + v8.snapshot.added;
        l_snapshot_4 = v7.snapshot;
        l_snapshot_4.matched = l_snapshot_4.matched + v8.snapshot.matched;
        l_snapshot_4 = v7.snapshot;
        l_snapshot_4.unchecked = l_snapshot_4.unchecked + v8.snapshot.unchecked;
        if l_Boolean_0.toJSBoolean(if not l_Boolean_0.toJSBoolean(v8.snapshot.uncheckedKeys) then v8.snapshot.uncheckedKeys else #v8.snapshot.uncheckedKeys > 0) then
            table.insert(v7.snapshot.uncheckedKeysByFile, {
                filePath = v8.testFilePath, 
                keys = v8.snapshot.uncheckedKeys
            });
        end;
        l_snapshot_4 = v7.snapshot;
        l_snapshot_4.unmatched = l_snapshot_4.unmatched + v8.snapshot.unmatched;
        l_snapshot_4 = v7.snapshot;
        l_snapshot_4.updated = l_snapshot_4.updated + v8.snapshot.updated;
        l_snapshot_4 = v7.snapshot;
        l_snapshot_4.total = l_snapshot_4.total + (((v8.snapshot.added + v8.snapshot.matched) + v8.snapshot.unmatched) + v8.snapshot.updated);
    end, 
    createEmptyTestResult = function()
        return {
            leaks = false, 
            numFailingTests = 0, 
            numPassingTests = 0, 
            numPendingTests = 0, 
            numTodoTests = 0, 
            openHandles = {}, 
            perfStats = {
                end_ = 0, 
                runtime = 0, 
                slow = false, 
                start = 0
            }, 
            skipped = false, 
            snapshot = {
                added = 0, 
                fileDeleted = false, 
                matched = 0, 
                unchecked = 0, 
                uncheckedKeys = {}, 
                unmatched = 0, 
                updated = 0
            }, 
            testFilePath = "", 
            testResults = {}
        };
    end
};
