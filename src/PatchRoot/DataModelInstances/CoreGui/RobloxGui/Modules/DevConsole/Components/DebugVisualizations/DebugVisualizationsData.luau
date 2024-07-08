local v0 = require(script.Parent.Parent.Parent.Signal);
local l_ChartHeaderNames_0 = require(script.Parent.Parent.Parent.Constants).DebugVisualizationsFormatting.ChartHeaderNames;
local v2 = require(script.Parent.DebugVisualizationsStaticContent);
local v11 = {
    [l_ChartHeaderNames_0[1]] = function(v3, v4)
        return v3.name < v4.name;
    end, 
    [l_ChartHeaderNames_0[2]] = function(v5, v6)
        if v5.settingInfo.Value ~= v6.settingInfo.Value then
            return v5.settingInfo.Value;
        else
            return v5.name < v6.name;
        end;
    end, 
    [l_ChartHeaderNames_0[3]] = function(v7, v8)
        if v7.settingInfo.Type ~= v8.settingInfo.Type then
            return v7.settingInfo.Type < v8.settingInfo.Type;
        else
            return v7.name < v8.name;
        end;
    end, 
    [l_ChartHeaderNames_0[4]] = function(v9, v10)
        return v9.name < v10.name;
    end
};
local v12 = {};
v12.__index = v12;
v12.new = function()
    local v13 = {};
    setmetatable(v13, v12);
    v13._visualizationsUpdated = v0.new();
    v13._visualizationsData = {};
    v13._visualizationCounter = 0;
    v13._sortedVisualizationData = {};
    v13._sortType = l_ChartHeaderNames_0[3];
    v13._isRunning = false;
    return v13;
end;
v12.setSortType = function(v14, v15)
    if not v11[v15] then
        error(string.format("attempted to pass invalid sortType: %s", (tostring(v15))), 2);
        return ;
    else
        v14._sortType = v15;
        table.sort(v14._sortedVisualizationData, v11[v14._sortType]);
        v14._visualizationsUpdated:Fire(v14._sortedVisualizationData);
        return ;
    end;
end;
v12.getSortType = function(v16)
    return v16._sortType;
end;
v12.Signal = function(v17)
    return v17._visualizationsUpdated;
end;
v12.getCurrentData = function(v18)
    return v18._sortedVisualizationData;
end;
v12.updateDebugVisualizationDataEntry = function(v19, v20, v21)
    if v21 == nil then
        v19._visualizationsData[v20] = nil;
        for v22, v23 in pairs(v19._sortedVisualizationData) do
            if v23.name == v20 then
                table.remove(v19._sortedVisualizationData, v22);
                return ;
            end;
        end;
        return ;
    elseif v19._visualizationsData[v20] then
        v19._visualizationsData[v20] = v21;
        return ;
    else
        v19._visualizationCounter = v19._visualizationCounter + 1;
        v19._visualizationsData[v20] = v21;
        table.insert(v19._sortedVisualizationData, {
            name = v20, 
            settingInfo = v19._visualizationsData[v20], 
            valueChangeCallback = function(v24, v25)
                v19:_toggleValue(v24, v25);
            end, 
            counter = v19._visualizationCounter
        });
        return ;
    end;
end;
v12.isRunning = function(v26)
    return v26._isRunning;
end;
v12._toggleValue = function(v27, v28, v29)
    local l_Physics_0 = settings().Physics;
    if l_Physics_0[v28] ~= nil then
        if v29 and v27._visualizationsData[v28].Type == "Box" then
            for _, v32 in pairs(v27._visualizationsData) do
                if v32.Type == "Box" and l_Physics_0[v32.Name] ~= nil then
                    l_Physics_0[v32.Name] = false;
                    v27._visualizationsData[v32.Name].Value = false;
                end;
            end;
        end;
        l_Physics_0[v28] = v29;
        v27._visualizationsData[v28].Value = v29;
        table.sort(v27._sortedVisualizationData, v11[v27._sortType]);
        v27._visualizationsUpdated:Fire(v27._sortedVisualizationData);
    end;
end;
_constructInfo = function(v33, v34)
    local l_Physics_1 = settings().Physics;
    local v36 = false;
    if l_Physics_1[v33] ~= nil then
        v36 = l_Physics_1[v33];
    end;
    local v37 = "";
    for v38, v39 in ipairs(v34.tags) do
        v37 = v37 .. v39 .. (v38 ~= #v34.tags and ", " or "");
    end;
    return {
        Name = v34.name, 
        Value = v36, 
        Type = v34.type, 
        Tags = v34.tags, 
        Tagstring = v37, 
        Description = v34.description
    };
end;
v12.start = function(v40)
    for v41, v42 in pairs(v2) do
        v40:updateDebugVisualizationDataEntry(v41, _constructInfo(v41, v42));
    end;
    table.sort(v40._sortedVisualizationData, v11[v40._sortType]);
    v40._isRunning = true;
end;
v12.stop = function(v43)
    v43._isRunning = false;
end;
return v12;
