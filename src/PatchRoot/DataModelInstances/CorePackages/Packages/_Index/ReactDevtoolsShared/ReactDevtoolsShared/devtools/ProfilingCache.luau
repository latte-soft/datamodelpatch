local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Map_0 = v0.Map;
local l_Profiler_0 = script.Parent.views.Profiler;
local v4 = require(l_Profiler_0.CommitTreeBuilder);
local l_getCommitTree_0 = v4.getCommitTree;
local l_invalidateCommitTrees_0 = v4.invalidateCommitTrees;
local v7 = require(l_Profiler_0.FlamegraphChartBuilder);
local l_getChartData_0 = v7.getChartData;
local l_invalidateChartData_0 = v7.invalidateChartData;
local v10 = require(l_Profiler_0.InteractionsChartBuilder);
local l_getChartData_1 = v10.getChartData;
local l_invalidateChartData_1 = v10.invalidateChartData;
local v13 = require(l_Profiler_0.RankedChartBuilder);
local l_getChartData_2 = v13.getChartData;
local l_invalidateChartData_2 = v13.invalidateChartData;
local _ = require(l_Profiler_0.types);
local _ = require(script.Parent.types);
local v18 = {};
v18.__index = v18;
v18.new = function(v19)
    local v20 = setmetatable({}, v18);
    v20._fiberCommits = l_Map_0.new();
    v20._profilerStore = v19;
    v20.getCommitTree = function(v21, v22)
        return l_getCommitTree_0({
            commitIndex = v22.commitIndex, 
            profilerStore = v21._profilerStore, 
            rootID = v22.rootID
        });
    end;
    v20.getFiberCommits = function(v23, v24)
        local l_fiberID_0 = v24.fiberID;
        local l_rootID_0 = v24.rootID;
        local v27 = v23._fiberCommits:get(l_fiberID_0);
        if v27 ~= nil then
            return v27;
        else
            local v28 = {};
            l_Array_0.forEach(v23._profilerStore:getDataForRoot(l_rootID_0).commitData, function(v29, v30)
                if v29.fiberActualDurations:has(l_fiberID_0) then
                    table.insert(v28, v30);
                end;
            end);
            v23._fiberCommits:set(l_fiberID_0, v28);
            return v28;
        end;
    end;
    v20.getFlamegraphChartData = function(v31, v32)
        return l_getChartData_0({
            commitIndex = v32.commitIndex, 
            commitTree = v32.commitTree, 
            profilerStore = v31._profilerStore, 
            rootID = v32.rootID
        });
    end;
    v20.getInteractionsChartData = function(v33, v34)
        return l_getChartData_1({
            profilerStore = v33._profilerStore, 
            rootID = v34.rootID
        });
    end;
    v20.getRankedChartData = function(v35, v36)
        return l_getChartData_2({
            commitIndex = v36.commitIndex, 
            commitTree = v36.commitTree, 
            profilerStore = v35._profilerStore, 
            rootID = v36.rootID
        });
    end;
    return v20;
end;
v18.invalidate = function(v37)
    v37._fiberCommits:clear();
    l_invalidateCommitTrees_0();
    l_invalidateChartData_0();
    l_invalidateChartData_1();
    l_invalidateChartData_2();
end;
return v18;
