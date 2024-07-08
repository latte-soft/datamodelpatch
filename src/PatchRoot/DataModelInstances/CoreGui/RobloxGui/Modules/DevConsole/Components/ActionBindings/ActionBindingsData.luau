local l_ContextActionService_0 = game:GetService("ContextActionService");
local v1 = require(script.Parent.Parent.Parent.Signal);
local l_ChartHeaderNames_0 = require(script.Parent.Parent.Parent.Constants).ActionBindingsFormatting.ChartHeaderNames;
local v13 = {
    [l_ChartHeaderNames_0[1]] = function(v3, v4)
        return v3.counter < v4.counter;
    end, 
    [l_ChartHeaderNames_0[2]] = function(v5, v6)
        if v5.actionInfo.priorityLevel == v6.actionInfo.priorityLevel then
            return v5.counter < v6.counter;
        else
            return v5.actionInfo.priorityLevel < v6.actionInfo.priorityLevel;
        end;
    end, 
    [l_ChartHeaderNames_0[3]] = function(v7, v8)
        if v7.actionInfo.isCore == v8.actionInfo.isCore then
            return v7.counter < v8.counter;
        else
            return v7.actionInfo.isCore;
        end;
    end, 
    [l_ChartHeaderNames_0[4]] = function(v9, v10)
        return v9.name:lower() < v10.name:lower();
    end, 
    [l_ChartHeaderNames_0[5]] = function(v11, v12)
        return tostring(v11.actionInfo.inputTypes[1]) < tostring(v12.actionInfo.inputTypes[1]);
    end
};
local v14 = {};
v14.__index = v14;
v14.new = function()
    local v15 = {};
    setmetatable(v15, v14);
    v15._bindingsUpdated = v1.new();
    v15._bindingsData = {};
    v15._bindingCounter = 0;
    v15._sortedBindingData = {};
    v15._sortType = l_ChartHeaderNames_0[1];
    v15._isRunning = false;
    return v15;
end;
v14.setSortType = function(v16, v17)
    if not v13[v17] then
        error(string.format("attempted to pass invalid sortType: %s", (tostring(v17))), 2);
        return ;
    else
        v16._sortType = v17;
        table.sort(v16._sortedBindingData, v13[v16._sortType]);
        v16._bindingsUpdated:Fire(v16._sortedBindingData);
        return ;
    end;
end;
v14.getSortType = function(v18)
    return v18._sortType;
end;
v14.Signal = function(v19)
    return v19._bindingsUpdated;
end;
v14.getCurrentData = function(v20)
    return v20._sortedBindingData;
end;
v14.updateBindingDataEntry = function(v21, v22, v23)
    if v23 == nil then
        v21._bindingsData[v22] = nil;
        for v24, v25 in pairs(v21._sortedBindingData) do
            if v25.name == v22 then
                table.remove(v21._sortedBindingData, v24);
                return ;
            end;
        end;
        return ;
    elseif v21._bindingsData[v22] then
        v21._bindingsData[v22] = v23;
        return ;
    else
        v21._bindingCounter = v21._bindingCounter + 1;
        v21._bindingsData[v22] = v23;
        table.insert(v21._sortedBindingData, {
            name = v22, 
            actionInfo = v21._bindingsData[v22], 
            counter = v21._bindingCounter
        });
        return ;
    end;
end;
v14.isRunning = function(v26)
    return v26._isRunning;
end;
v14.start = function(v27)
    for v28, v29 in pairs((l_ContextActionService_0:GetAllBoundActionInfo())) do
        v29.isCore = false;
        v27:updateBindingDataEntry(v28, v29);
    end;
    for v30, v31 in pairs((l_ContextActionService_0:GetAllBoundCoreActionInfo())) do
        v31.isCore = true;
        v27:updateBindingDataEntry(v30, v31);
    end;
    if not v27._actionChangedConnection then
        v27._actionChangedConnection = l_ContextActionService_0.BoundActionChanged:connect(function(v32, v33, v34)
            v27:updateBindingDataEntry(v32, nil);
            v27:updateBindingDataEntry(v33, v34);
            v27._bindingsUpdated:Fire(v27._sortedBindingData);
        end);
    end;
    if not v27._actionAddedConnection then
        v27._actionAddedConnection = l_ContextActionService_0.BoundActionAdded:connect(function(v35, _, v37, v38)
            v37.isCore = v38;
            v27:updateBindingDataEntry(v35, v37);
            v27._bindingsUpdated:Fire(v27._sortedBindingData);
        end);
    end;
    if not v27._actionRemovedConnection then
        v27._actionRemovedConnection = l_ContextActionService_0.BoundActionRemoved:connect(function(v39, _, _)
            v27:updateBindingDataEntry(v39, nil);
            v27._bindingsUpdated:Fire(v27._sortedBindingData);
        end);
    end;
    v27._isRunning = true;
end;
v14.stop = function(v42)
    if v42.actionChangedConnector then
        v42.actionChangedConnector:Disconnect();
        v42.actionChangedConnector = nil;
    end;
    if v42.actionAddedConnector then
        v42.actionAddedConnector:Disconnect();
        v42.actionAddedConnector = nil;
    end;
    if v42.actionRemovedConnector then
        v42.actionRemovedConnector:Disconnect();
        v42.actionRemovedConnector = nil;
    end;
    v42._isRunning = false;
end;
return v14;
