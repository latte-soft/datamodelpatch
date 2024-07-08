local l_Stats_0 = game:GetService("Stats");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Stats.BaseMemoryAnalyzer);
local v3 = require(l_CoreGui_0.RobloxGui.Modules.Common.CommonUtil);
local v4 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v5 = require(l_CoreGui_0.RobloxGui.Modules.Stats.TreeViewItem);
local function _()
    local v6 = l_Stats_0 and l_Stats_0:FindFirstChild("PerformanceStats");
    if v6 == nil then
        return nil;
    else
        return (v6:FindFirstChild(v4.StatNames[v4.StatType_Memory]));
    end;
end;
local function v8(v9, v10)
    v9:setLabelAndValue(v4.GetMemoryAnalyzerStatName(v10.Name), (v10:GetValue()));
    for _, v12 in ipairs((v3.SortByName((v10:GetChildren())))) do
        v8(v9:getOrMakeChildById(v12.Name), v12);
    end;
end;
local v13 = {};
setmetatable(v13, v2);
v13.__index = v13;
v13.new = function(v14)
    local v15 = v2.new(v14);
    setmetatable(v15, v13);
    v15._rootTreeViewItem = nil;
    v15._shouldListenForUpdates = false;
    v15._spawnedLoopScheduled = false;
    return v15;
end;
v13.startListeningForUpdates = function(v16)
    v16._shouldListenForUpdates = true;
    if not v16._spawnedLoopScheduled then
        v16._spawnedLoopScheduled = true;
        spawn(function()
            while v16._shouldListenForUpdates do
                v16:refreshMemoryUsageTree();
                v16:renderUpdates();
                wait(1);
            end;
            v16._spawnedLoopScheduled = false;
        end);
        return ;
    else
        return ;
    end;
end;
v13.stopListeningForUpdates = function(v17)
    v17._shouldListenForUpdates = false;
end;
v13.refreshMemoryUsageTree = function(v18)
    if v18._rootTreeViewItem == nil then
        v18._rootTreeViewItem = v5.new("root", nil);
    end;
    local v19 = l_Stats_0 and l_Stats_0:FindFirstChild("PerformanceStats");
    local v20 = if v19 == nil then nil else v19:FindFirstChild(v4.StatNames[v4.StatType_Memory]);
    if v20 == nil then
        return nil;
    else
        v8(v18._rootTreeViewItem, v20);
        return ;
    end;
end;
v13.getMemoryUsageTree = function(v21)
    return v21._rootTreeViewItem;
end;
return v13;
