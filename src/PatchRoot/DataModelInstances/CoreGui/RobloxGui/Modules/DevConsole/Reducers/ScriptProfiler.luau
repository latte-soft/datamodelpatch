local v0 = require(script.Parent.Parent.Immutable);
local v1 = require(script.Parent.Parent.Actions.SetScriptProfilerState);
local v2 = require(script.Parent.Parent.Actions.SetScriptProfilerRoot);
local v3 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetIsProfiling);
local v4 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetData);
local v5 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetThreads);
local v6 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetTimerState);
local v7 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.ClearStateForNewProfilingSession);
local v8 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetAverage);
local v9 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetFrequency);
local v10 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetDataView);
local v11 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetLiveUpdate);
local v12 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetShowPlugins);
local v13 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetShowGC);
local v14 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetSearchData);
local _ = require(script.Parent.Parent.Components.ScriptProfiler.ProfilerDataFormatV2);
local v16 = game:DefineFastFlag("ScriptProfilerSetRootFixSourceInfo", false);
local function _(v17, v18)
    if not v17 then
        return v18.server;
    else
        return v18.client;
    end;
end;
local function v24(v20, v21, v22)
    local v23 = v0.JoinDictionaries(if not v20 then v21.server else v21.client, v22);
    return v0.JoinDictionaries(v21, {
        client = if not v20 then nil else v23, 
        server = if not v20 then v23 else nil
    });
end;
return function(v25, v26)
    local v27 = v25 or {
        isClientView = true, 
        usePercentages = false, 
        isExporting = false, 
        isShowingMobileSettings = false, 
        client = {
            isProfiling = false, 
            data = nil, 
            serializedData = nil, 
            frequency = 1000, 
            timedProfilingThread = nil, 
            timedProfilingTimerThread = nil, 
            timedProfilingDuration = 0, 
            timedProfilingCountdown = 0, 
            isFunctionsView = false, 
            average = 0, 
            searchTerm = "", 
            searchFilterGraph = {}, 
            searchFilterFlat = {}, 
            rootNode = 0, 
            rootFunc = 0, 
            rootNodeName = nil, 
            liveUpdate = false, 
            liveUpdateThread = nil, 
            showPlugins = false, 
            pluginOffsets = {}, 
            showGC = false, 
            gcFunctionOffsets = {}, 
            gcNodeOffsets = {}, 
            pluginGCOffsets = {}, 
            expandedNodes = {}
        }, 
        server = {
            isProfiling = false, 
            data = nil, 
            serializedData = nil, 
            frequency = 1000, 
            timedProfilingThread = nil, 
            timedProfilingTimerThread = nil, 
            timedProfilingDuration = 0, 
            timedProfilingCountdown = 0, 
            isFunctionsView = false, 
            average = 0, 
            searchTerm = "", 
            searchFilterGraph = {}, 
            searchFilterFlat = {}, 
            rootNode = 0, 
            rootFunc = 0, 
            rootNodeName = nil, 
            liveUpdate = false, 
            liveUpdateThread = nil, 
            showPlugins = false, 
            pluginOffsets = {}, 
            showGC = false, 
            gcFunctionOffsets = {}, 
            gcNodeOffsets = {}, 
            pluginGCOffsets = {}, 
            expandedNodes = {}
        }
    };
    if v26.type == v1.name then
        return (v0.JoinDictionaries(v27, {
            isClientView = v26.isClientView, 
            usePercentages = v26.usePercentages, 
            isExporting = v26.isExporting, 
            isShowingMobileSettings = v26.isShowingMobileSettings, 
            client = v26.clientSessionState, 
            server = v26.serverSessionState
        }));
    elseif v26.type == v3.name then
        return v24(v26.isClient, v27, {
            isProfiling = v26.isProfiling
        });
    elseif v26.type == v8.name then
        return v24(v26.isClient, v27, {
            average = v26.average
        });
    elseif v26.type == v9.name then
        return v24(v26.isClient, v27, {
            frequency = v26.frequency
        });
    elseif v26.type == v10.name then
        return v24(v26.isClient, v27, {
            isFunctionsView = v26.isFunctionsView
        });
    elseif v26.type == v11.name then
        return v24(v26.isClient, v27, {
            liveUpdate = v26.liveUpdate
        });
    elseif v26.type == v12.name then
        return v24(v26.isClient, v27, {
            showPlugins = v26.showPlugins
        });
    elseif v26.type == v13.name then
        return v24(v26.isClient, v27, {
            showGC = v26.showGC
        });
    elseif v26.type == v14.name then
        return v24(v26.isClient, v27, {
            searchTerm = v26.state.searchTerm, 
            searchFilterFlat = v26.state.searchFilterFlat, 
            searchFilterGraph = v26.state.searchFilterGraph
        });
    elseif v26.type == v6.name then
        return v24(v26.isClient, v27, {
            timedProfilingDuration = v26.state.timedProfilingDuration, 
            timedProfilingCountdown = v26.state.timedProfilingCountdown
        });
    elseif v26.type == v4.name then
        local v28 = table.clone(if not v26.isClient then v27.server else v27.client);
        v28.data = v26.state.data;
        v28.serializedData = v26.state.serializedData;
        v28.pluginOffsets = v26.state.pluginOffsets or {};
        v28.pluginGCOffsets = v26.state.pluginGCOffsets or {};
        v28.gcFunctionOffsets = v26.state.gcFunctionOffsets or {};
        v28.gcNodeOffsets = v26.state.gcNodeOffsets or {};
        v28.expandedNodes = v26.state.expandedNodes or {};
        local v29 = table.clone(v27);
        if not v26.isClient then
            v29.server = v28;
        else
            v29.client = v28;
        end;
        return v0.JoinDictionaries(v27, v29);
    elseif v26.type == v5.name then
        local v30 = table.clone(if not v26.isClient then v27.server else v27.client);
        v30.timedProfilingThread = v26.state.timedProfilingThread;
        v30.timedProfilingTimerThread = v26.state.timedProfilingTimerThread;
        v30.liveUpdateThread = v26.state.liveUpdateThread;
        local v31 = table.clone(v27);
        if not v26.isClient then
            v31.server = v30;
        else
            v31.client = v30;
        end;
        return v0.JoinDictionaries(v27, v31);
    elseif v26.type == v7.name then
        local v32 = table.clone(if not v26.isClient then v27.server else v27.client);
        v32.rootNode = 0;
        v32.rootFunc = 0;
        v32.rootNodeName = nil;
        v32.searchFilterFlat = {};
        v32.searchFilterGraph = {};
        v32.expandedNodes = {};
        local v33 = table.clone(v27);
        if not v26.isClient then
            v33.server = v32;
        else
            v33.client = v32;
        end;
        return v0.JoinDictionaries(v27, v33);
    elseif v26.type == v2.name then
        local v34 = {};
        local v35 = table.clone(if not v27.isClientView then v27.server else v27.client);
        if v35.rootNode ~= v26.rootNode then
            v35.rootNode = v26.rootNode;
            if v16 then
                v35.rootFunc = v26.rootFunc;
            end;
            v35.rootNodeName = v26.rootNodeName;
        else
            v35.rootNode = 0;
            v35.rootFunc = 0;
            v35.rootNodeName = nil;
        end;
        if not v27.isClientView then
            v34.server = v35;
        else
            v34.client = v35;
        end;
        return v0.JoinDictionaries(v27, v34);
    else
        return v27;
    end;
end;
