local v0 = require(script.Parent.Parent.Parent.Signal);
local l_SoundService_0 = game:GetService("SoundService");
local l_TextService_0 = game:GetService("TextService");
local l_MeshContentProvider_0 = game:GetService("MeshContentProvider");
local l_KeyframeSequenceProvider_0 = game:GetService("KeyframeSequenceProvider");
local l_Stats_0 = game:GetService("Stats");
local v6 = require(script.Parent.Parent.Parent.Parent.Stats.StatsUtils);
local v7 = require(script.Parent.Parent.Parent.CircularBuffer);
local l_ChartHeaderNames_0 = require(script.Parent.Parent.Parent.Constants).MemoryFormatting.ChartHeaderNames;
local v9 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"));
local v14 = {
    [l_ChartHeaderNames_0[1]] = function(v10, v11)
        return v10.name < v11.name;
    end, 
    [l_ChartHeaderNames_0[2]] = function(v12, v13)
        return v12.dataStats.dataSet:back().data < v13.dataStats.dataSet:back().data;
    end
};
local v15 = {};
v15.__index = v15;
v15.new = function()
    local v16 = {};
    setmetatable(v16, v15);
    v16._pollingId = 0;
    v16._totalMemory = 0;
    v16._memoryData = {};
    v16._memoryDataSorted = {};
    v16._treeViewUpdatedSignal = v0.new();
    v16._totalMemoryUpdated = v0.new();
    v16._sortType = l_ChartHeaderNames_0[1];
    v16._isRunning = false;
    v16._doGranularMemUpdate = {};
    v16._granularMemTable = {};
    return v16;
end;
local function _()
    local v17 = l_Stats_0 and l_Stats_0:FindFirstChild("PerformanceStats");
    if v17 then
        return (v17:FindFirstChild(v6.StatNames[v6.StatType_Memory]));
    else
        return nil;
    end;
end;
local function v25()
    local l_l_SoundService_0_SoundMemoryData_0 = l_SoundService_0:GetSoundMemoryData();
    local v20 = {};
    for v21, v22 in pairs(l_l_SoundService_0_SoundMemoryData_0) do
        table.insert(v20, {
            name = v21, 
            value = v22
        });
    end;
    table.sort(v20, function(v23, v24)
        return v24.value < v23.value;
    end);
    return v20;
end;
local function v36()
    local l_l_Stats_0_PaginatedMemoryByTexture_0 = l_Stats_0:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoid, 0, 100);
    local l_l_Stats_0_PaginatedMemoryByTexture_1 = l_Stats_0:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoidOrphaned, 0, 100);
    local v28 = {};
    local function v33(v29, v30)
        for _, v32 in ipairs(v30.Results) do
            table.insert(v29, {
                name = v32.TextureId, 
                value = v32.MemoryInBytes / 1048576
            });
        end;
    end;
    v33(v28, l_l_Stats_0_PaginatedMemoryByTexture_0);
    v33(v28, l_l_Stats_0_PaginatedMemoryByTexture_1);
    table.sort(v28, function(v34, v35)
        return v35.value < v34.value;
    end);
    return v28;
end;
local function v61()
    local l_l_Stats_0_PaginatedMemoryByTexture_2 = l_Stats_0:GetPaginatedMemoryByTexture(Enum.TextureQueryType.Humanoid, 0, 100);
    local l_l_Stats_0_PaginatedMemoryByTexture_3 = l_Stats_0:GetPaginatedMemoryByTexture(Enum.TextureQueryType.HumanoidOrphaned, 0, 100);
    local v39 = {};
    local function v60(v40, v41)
        for _, v43 in ipairs(v41.Results) do
            local v44 = v43.MemoryInBytes / 1048576;
            local v45 = {};
            local l_TextureId_0 = v43.TextureId;
            local v47 = {};
            for _, v49 in pairs(string.split(l_TextureId_0, " ")) do
                if string.sub(v49, 1, 2) == "T[" then
                    table.insert(v47, v49);
                end;
            end;
            local _ = "";
            local v51 = {};
            for _, v53 in pairs(v47) do
                local v54 = string.split(v53, ".mesh:")[2];
                local v55 = string.find(v54, ":", 12);
                if v55 ~= nil then
                    v55 = v55 - 1;
                end;
                v51[string.sub(v54, 1, v55)] = true;
            end;
            for v56, _ in pairs(v51) do
                table.insert(v45, {
                    name = v56
                });
            end;
            table.sort(v45, function(v58, v59)
                return v58.name < v59.name;
            end);
            table.insert(v40, {
                name = "Composite Texture", 
                value = v44, 
                moreInfo = v45
            });
        end;
    end;
    v60(v39, l_l_Stats_0_PaginatedMemoryByTexture_2);
    v60(v39, l_l_Stats_0_PaginatedMemoryByTexture_3);
    return v39;
end;
local function v68()
    local v62 = l_MeshContentProvider_0:getContentMemoryData();
    local v63 = {};
    for v64, v65 in pairs(v62) do
        table.insert(v63, {
            name = v64, 
            value = v65 / 1048576
        });
    end;
    table.sort(v63, function(v66, v67)
        return v67.value < v66.value;
    end);
    return v63;
end;
local function v75()
    local l_l_KeyframeSequenceProvider_0_MemStats_0 = l_KeyframeSequenceProvider_0:GetMemStats();
    local v70 = {};
    for v71, v72 in pairs(l_l_KeyframeSequenceProvider_0_MemStats_0) do
        table.insert(v70, {
            name = v71, 
            value = v72 / 1048576
        });
    end;
    table.sort(v70, function(v73, v74)
        return v74.value < v73.value;
    end);
    return v70;
end;
local function v82()
    local l_l_TextService_0_FontMemoryData_0 = l_TextService_0:GetFontMemoryData();
    local v77 = {};
    for v78, v79 in pairs(l_l_TextService_0_FontMemoryData_0) do
        table.insert(v77, {
            name = v78, 
            value = v79 / 1048576
        });
    end;
    table.sort(v77, function(v80, v81)
        return v81.value < v80.value;
    end);
    return v77;
end;
v15.updateCachedData = function(v83, v84, v85)
    if v83._doGranularMemUpdate[v84] then
        v83._doGranularMemUpdate[v84] = false;
        v83._granularMemTable[v84] = v85();
    end;
end;
v15.getAdditionalMemoryFunc = function(v86, v87)
    local v88 = nil;
    if v87 == "Sounds" then
        v88 = v25;
    elseif v87 == "GraphicsTexture" then
        v88 = v36;
    elseif v87 == "GraphicsTextureCharacter" then
        v88 = v61;
    elseif v87 == "GraphicsMeshParts" then
        v88 = v68;
    elseif not (v87 == "csgDictionary") then
        if v87 == "Animation" then
            v88 = v75;
        elseif not (not (v87 == "gui/FontData") or not game:GetEngineFeature("TextServiceGetFontMemoryData")) then
            v88 = v82;
        end;
    end;
    if not v88 then
        return nil;
    else
        return function()
            v86:updateCachedData(v87, v88);
            return v86._granularMemTable[v87];
        end;
    end;
end;
v15.recursiveUpdateEntry = function(v89, v90, v91, v92)
    local v93 = v6.GetMemoryAnalyzerStatName(v92.DisplayName);
    local l_v92_Value_0 = v92:GetValue();
    local l_v92_Children_0 = v92:GetChildren();
    if v90[v93] then
        local l_max_0 = v90[v93].max;
        local l_min_0 = v90[v93].min;
        local v98 = {
            data = l_v92_Value_0, 
            time = v89._lastUpdate
        };
        if v90[v93].additionalInfoFunc and v90[v93].dataSet:back().data ~= v98.data then
            v89._doGranularMemUpdate[v93] = true;
        end;
        local v99 = v90[v93].dataSet:push_back(v98);
        if v99 then
            local v100 = v90[v93].dataSet:iterator();
            local v101 = v100:next();
            if l_max_0 == v99.data then
                l_max_0 = l_min_0;
                while v101 do
                    l_max_0 = v101.data < l_max_0 and l_max_0 or v101.data;
                    v101 = v100:next();
                end;
            end;
            if l_min_0 == v99.data then
                l_min_0 = l_max_0;
                while v101 do
                    l_min_0 = l_min_0 < v101.data and l_min_0 or v101.data;
                    v101 = v100:next();
                end;
            end;
        end;
        v90[v93].max = l_max_0 < l_v92_Value_0 and l_v92_Value_0 or l_max_0;
        v90[v93].min = l_min_0 < l_v92_Value_0 and l_min_0 or l_v92_Value_0;
    else
        local v102 = v7.new(v9);
        v102:push_back({
            data = l_v92_Value_0, 
            time = v89._lastUpdate
        });
        local v103 = {
            min = l_v92_Value_0, 
            max = l_v92_Value_0, 
            dataSet = v102
        };
        local v104 = false;
        if #l_v92_Children_0 > 0 then
            v104 = {};
        end;
        v103.children = v104;
        v104 = false;
        if #l_v92_Children_0 > 0 then
            v104 = {};
        end;
        v103.sortedChildren = v104;
        v90[v93] = v103;
        v103 = v89:getAdditionalMemoryFunc(v93);
        if v103 then
            v90[v93].additionalInfoFunc = v103;
            v89._doGranularMemUpdate[v93] = true;
        end;
        table.insert(v91, {
            name = v93, 
            dataStats = v90[v93]
        });
    end;
    local v105 = v90[v93];
    local v106 = {};
    for _, v108 in ipairs(l_v92_Children_0) do
        v106[v108.DisplayName] = true;
        v89:recursiveUpdateEntry(v105.children, v105.sortedChildren, v108);
    end;
    if v105.children then
        for v109, _ in pairs(v105.children) do
            if v106[v109] == nil then
                v105.children[v109] = nil;
                for v111, v112 in ipairs(v105.sortedChildren) do
                    if v109 == v112.name then
                        table.remove(v105.sortedChildren, v111);
                        break;
                    end;
                end;
            end;
        end;
    end;
end;
v15.totalMemSignal = function(v113)
    return v113._totalMemoryUpdated;
end;
v15.treeUpdatedSignal = function(v114)
    return v114._treeViewUpdatedSignal;
end;
v15.getSortType = function(v115)
    return v115._sortType;
end;
local function v116(v117, v118)
    table.sort(v117, v118);
    for _, v120 in pairs(v117) do
        if v120.dataStats.sortedChildren then
            v116(v120.dataStats.sortedChildren, v118);
        end;
    end;
end;
v15.setSortType = function(v121, v122)
    if not v14[v122] then
        error(string.format("attempted to pass invalid sortType: %s", (tostring(v122))), 2);
        return ;
    else
        v121._sortType = v122;
        v116(v121._memoryDataSorted, v14[v121._sortType]);
        return ;
    end;
end;
v15.getMemoryData = function(v123)
    return v123._memoryDataSorted;
end;
v15.isRunning = function(v124)
    return v124._isRunning;
end;
v15.start = function(v125)
    spawn(function()
        v125._pollingId = v125._pollingId + 1;
        local l__pollingId_0 = v125._pollingId;
        v125._isRunning = true;
        while true do
            if l__pollingId_0 == v125._pollingId then
                local v127 = l_Stats_0 and l_Stats_0:FindFirstChild("PerformanceStats");
                local v128 = if v127 then v127:FindFirstChild(v6.StatNames[v6.StatType_Memory]) else nil;
                if v128 then
                    v125._lastUpdate = os.time();
                    v125:recursiveUpdateEntry(v125._memoryData, v125._memoryDataSorted, v128);
                    if v125._totalMemory ~= v128:getValue() then
                        v125._totalMemory = v128:getValue();
                        v125._totalMemoryUpdated:Fire(v125._totalMemory);
                    end;
                    v125._treeViewUpdatedSignal:Fire(v125._memoryDataSorted);
                    wait(3);
                else
                    return ;
                end;
            else
                v125._isRunning = false;
                return ;
            end;
        end;
    end);
end;
v15.stop = function(v129)
    v129._pollingId = v129._pollingId + 1;
end;
return v15;
