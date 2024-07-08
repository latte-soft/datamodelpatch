local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_Components_0 = script.Parent.Parent.Components;
local v4 = require(l_Components_0.Log.LogData);
local v5 = require(l_Components_0.Memory.ClientMemoryData);
local v6 = require(l_Components_0.Memory.ServerMemoryData);
local v7 = require(l_Components_0.Network.NetworkData);
local v8 = require(l_Components_0.Scripts.ServerScriptsData);
local v9 = require(l_Components_0.DataStores.DataStoresData);
local v10 = require(l_Components_0.ServerStats.ServerStatsData);
local v11 = require(l_Components_0.ActionBindings.ActionBindingsData);
local v12 = require(l_Components_0.ServerJobs.ServerJobsData);
local v13 = require(l_Components_0.DebugVisualizations.DebugVisualizationsData);
local v14 = require(l_Components_0.ScriptProfiler.ServerProfilingData);
local v15 = require(l_Components_0.LuauHeap.LuauHeapData);
local v16 = require(l_Components_0.DataContext);
local v17 = v1.Component:extend("DataProvider");
v17.init = function(v18)
    v18:setState({
        DevConsoleData = {
            ClientLogData = v4.new(true), 
            ServerLogData = v4.new(false), 
            ClientMemoryData = v5.new(), 
            ServerMemoryData = v6.new(), 
            ClientNetworkData = v7.new(true), 
            ServerNetworkData = v7.new(false), 
            ServerScriptsData = v8.new(), 
            DataStoresData = v9.new(), 
            ServerStatsData = v10.new(), 
            ActionBindingsData = v11.new(), 
            ServerJobsData = v12.new(), 
            DebugVisualizationsData = v13.new(), 
            ServerProfilingData = v14.new(), 
            LuauHeapData = v15.new()
        }
    });
end;
v17.didMount = function(v19)
    v19.state.DevConsoleData.ClientLogData:start();
    v19.state.DevConsoleData.ClientMemoryData:start();
end;
v17.willUpdate = function(v20, v21, _)
    if not (not v21.isDeveloperView or v20.props.isDeveloperView) then
        for _, v24 in pairs(v20.state.DevConsoleData) do
            if not v24:isRunning() then
                v24:start();
            end;
        end;
    end;
end;
v17.render = function(v25)
    return v1.createElement(v16.Provider, {
        value = v25.state.DevConsoleData
    }, v1.oneChild(v25.props[v1.Children]));
end;
return v2.UNSTABLE_connect2(function(v26, _)
    return {
        isDeveloperView = v26.MainView.isDeveloperView
    };
end, nil)(v17);
