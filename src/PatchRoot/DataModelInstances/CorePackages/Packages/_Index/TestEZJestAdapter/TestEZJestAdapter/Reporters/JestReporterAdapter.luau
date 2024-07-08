local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.JestTestResult);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Set_0 = v2.Set;
local l_String_0 = v2.String;
local l_TestService_0 = game:GetService("TestService");
local v7 = require(l_Parent_0.ChalkLua);
local function v11(v8)
    local v9 = "";
    local l_planNode_0 = v8.planNode;
    while l_planNode_0 do
        v9 = if v9 == "" then if typeof(l_planNode_0.instance) == "Instance" then l_planNode_0.phrase .. "/" .. l_planNode_0.instance.Name else l_planNode_0.phrase else l_planNode_0.phrase .. "/" .. v9;
        l_planNode_0 = l_planNode_0.parent;
    end;
    return v9;
end;
local function v15(v12)
    local v13 = "";
    local l_planNode_1 = v12.planNode;
    while not (not l_planNode_1 or l_planNode_1.isRoot) do
        v13 = if v13 == "" then if typeof(l_planNode_1.instance) == "Instance" then l_planNode_1.phrase .. " \226\128\186 " .. l_planNode_1.instance.Name else l_planNode_1.phrase else l_planNode_1.phrase .. " \226\128\186 " .. v13;
        l_planNode_1 = l_planNode_1.parent;
    end;
    return v13;
end;
local function v18(v16, v17)
    return {
        ancestorTitles = v17, 
        title = v16.planNode.phrase, 
        fullName = ("%s/%s"):format(l_Array_0.join(v17, "/"), v16.planNode.phrase), 
        status = v16.status == "Success" and "passed" or (v16.status == "Failure" and "failed" or "pending")
    };
end;
local function v19(v20, v21)
    local v22 = v21 or {};
    return l_Array_0.reduce(v20.children, function(v23, v24)
        if v24.planNode.type == "It" then
            table.insert(v23, (v18(v24, v22)));
            return v23;
        else
            return (l_Array_0.concat(v23, v19(v24, (l_Array_0.concat({}, v22, {
                v24.planNode.phrase
            })))));
        end;
    end, {});
end;
local function v25(v26, v27)
    local v28 = v27 or {};
    return l_Array_0.reduce(v26.children, function(v29, v30)
        if not v30.planNode.isRoot then
            return (l_Array_0.concat(v29, v25(v30, (l_Array_0.concat({}, v28, {
                v30.planNode.phrase
            })))));
        else
            table.insert(v29, (v18(v30, v28)));
            return v29;
        end;
    end, {});
end;
local function _(v31, v32)
    return #l_Array_0.filter(v31, function(v33)
        return v33.status == v32;
    end);
end;
local function v36(v35)
    return {
        context = {
            config = {
                rootDir = "/"
            }
        }, 
        duration = 0, 
        path = v11(v35)
    };
end;
local function v37(v38)
    local v39 = {};
    if v38.status == "Failure" then
        v39 = l_Array_0.concat(v39, l_Array_0.map(v38.errors, function(v40)
            return v7.red(v7.bold("  \226\151\143 " .. v15(v38))) .. "\n\n" .. l_String_0.trim(v40);
        end));
        for _, v42 in ipairs(v38.children) do
            v39 = l_Array_0.concat(v39, v37(v42));
        end;
    end;
    return v39;
end;
local function v57(v43)
    local v44 = v19(v43);
    local v45 = v37(v43);
    local v46 = {
        snapshot = {
            added = 0, 
            fileDeleted = false, 
            matched = 0, 
            unchecked = 0, 
            unmatched = 0, 
            updated = 0, 
            total = 0, 
            uncheckedKeys = {}
        }, 
        failureMessage = if #v45 > 0 then "\n" .. l_Array_0.join(v45, "\n\n") .. "\n" else nil, 
        testFilePath = v11(v43)
    };
    local l_filter_0 = l_Array_0.filter;
    local l_v44_0 = v44;
    local v49 = "failed";
    local l_v49_0 = v49 --[[ copy: 8 -> 9 ]];
    v46.numFailingTests = #l_filter_0(l_v44_0, function(v51)
        return v51.status == l_v49_0;
    end);
    l_filter_0 = l_Array_0.filter;
    l_v44_0 = v44;
    v49 = "passed";
    local l_v49_1 = v49 --[[ copy: 8 -> 10 ]];
    v46.numPassingTests = #l_filter_0(l_v44_0, function(v53)
        return v53.status == l_v49_1;
    end);
    l_filter_0 = l_Array_0.filter;
    l_v44_0 = v44;
    v49 = "pending";
    local l_v49_2 = v49 --[[ copy: 8 -> 11 ]];
    v46.numPendingTests = #l_filter_0(l_v44_0, function(v55)
        return v55.status == l_v49_2;
    end);
    l_filter_0 = l_Array_0.filter;
    l_v44_0 = v44;
    v49 = "todo";
    v46.numTodoTests = #l_filter_0(l_v44_0, function(v56)
        return v56.status == v49;
    end);
    v46.testResults = v44;
    v46.skipped = v43.status == "Skipped";
    v46.leaks = false;
    v46.openHandles = {};
    v46.perfStats = nil;
    return v46;
end;
local function v78(v58)
    local v59 = v19(v58);
    local v60 = v25(v58);
    local v61 = {};
    local l_filter_1 = l_Array_0.filter;
    local l_v59_0 = v59;
    local v64 = "failed";
    local l_v64_0 = v64 --[[ copy: 8 -> 9 ]];
    v61.numFailedTests = #l_filter_1(l_v59_0, function(v66)
        return v66.status == l_v64_0;
    end);
    l_filter_1 = l_Array_0.filter;
    l_v59_0 = v59;
    v64 = "passed";
    local l_v64_1 = v64 --[[ copy: 8 -> 10 ]];
    v61.numPassedTests = #l_filter_1(l_v59_0, function(v68)
        return v68.status == l_v64_1;
    end);
    l_filter_1 = l_Array_0.filter;
    l_v59_0 = v59;
    v64 = "pending";
    local l_v64_2 = v64 --[[ copy: 8 -> 11 ]];
    v61.numPendingTests = #l_filter_1(l_v59_0, function(v70)
        return v70.status == l_v64_2;
    end);
    l_filter_1 = l_Array_0.filter;
    l_v59_0 = v59;
    v64 = "todo";
    local l_v64_3 = v64 --[[ copy: 8 -> 12 ]];
    v61.numTodoTests = #l_filter_1(l_v59_0, function(v72)
        return v72.status == l_v64_3;
    end);
    v61.numTotalTests = #v59;
    l_filter_1 = l_Array_0.filter;
    l_v59_0 = v60;
    v64 = "failed";
    local l_v64_4 = v64 --[[ copy: 8 -> 13 ]];
    v61.numFailedTestSuites = #l_filter_1(l_v59_0, function(v74)
        return v74.status == l_v64_4;
    end);
    l_filter_1 = l_Array_0.filter;
    l_v59_0 = v60;
    v64 = "passed";
    local l_v64_5 = v64 --[[ copy: 8 -> 14 ]];
    v61.numPassedTestSuites = #l_filter_1(l_v59_0, function(v76)
        return v76.status == l_v64_5;
    end);
    l_filter_1 = l_Array_0.filter;
    l_v59_0 = v60;
    v64 = "pending";
    v61.numPendingTestSuites = #l_filter_1(l_v59_0, function(v77)
        return v77.status == v64;
    end);
    v61.numTotalTestSuites = #v60;
    v61.numRuntimeErrorTestSuites = 0;
    v61.openHandles = {};
    v61.snapshot = {
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
    };
    v61.startTime = v58.startTime or DateTime.now().UnixTimestampMillis;
    v61.success = false;
    v61.testResults = {};
    v61.wasInterrupted = false;
    return v61;
end;
return {
    createReporter = function(v79)
        local function v82(v80, v81)
            return v80.planNode.phrase:lower() < v81.planNode.phrase:lower();
        end;
        local function v83(v84)
            if v84.planNode.isRoot then
                v79:onTestResult(v36(v84), v57(v84), (v78(v84)));
            end;
            table.sort(v84.children, v82);
            for _, v86 in ipairs(v84.children) do
                v83(v86);
            end;
        end;
        return {
            report = function(v87)
                table.sort(v87.children, v82);
                for _, v89 in ipairs(v87.children) do
                    v83(v89);
                end;
                local v90 = v78(v87);
                v79:onRunComplete(l_Set_0.new(), v90);
                if v90.numFailedTests > 0 then
                    l_TestService_0:Error(("%s test(s) failed."):format((tostring(v90.numFailedTests))));
                end;
            end
        };
    end
};
