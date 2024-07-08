local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.DevConsoleDisplayOptions);
local v2 = require(l_Parent_0.MainView);
local v3 = require(l_Parent_0.MemoryData);
local v4 = require(l_Parent_0.NetworkData);
local v5 = require(l_Parent_0.ScriptsData);
local v6 = require(l_Parent_0.DataStoresData);
local v7 = require(l_Parent_0.ServerStatsData);
local v8 = require(l_Parent_0.ServerJobsData);
local v9 = require(l_Parent_0.ActionBindingsData);
local v10 = require(l_Parent_0.MicroProfiler);
local v11 = require(l_Parent_0.DebugVisualizationsData);
local v12 = require(l_Parent_0.ScriptProfiler);
local v13 = require(l_Parent_0.LuauHeap);
return function(v14, v15)
    local v16 = v14 or {};
    return {
        DisplayOptions = v1(v16.DisplayOptions, v15), 
        MainView = v2(v16.MainView, v15), 
        MemoryData = v3(v16.MemoryData, v15), 
        NetworkData = v4(v16.NetworkData, v15), 
        ScriptsData = v5(v16.ScriptsData, v15), 
        DataStoresData = v6(v16.DataStoresData, v15), 
        ServerStatsData = v7(v16.ServerStatsData, v15), 
        ServerJobsData = v8(v16.ServerJobsData, v15), 
        ActionBindingsData = v9(v16.ActionBindingsData, v15), 
        MicroProfiler = v10(v16.MicroProfiler, v15), 
        DebugVisualizationsData = v11(v16.DebugVisualizationsData, v15), 
        ScriptProfiler = v12(v16.ScriptProfiler, v15), 
        LuauHeap = v13(v16.LuauHeap, v15)
    };
end;
